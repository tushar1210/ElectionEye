//
//  Model.swift
//  ElectionEye
//
//  Created by Pranav Karnani on 06/04/19.
//  Copyright © 2019 Pranav Karnani. All rights reserved.
//

import Foundation
import Starscream

struct UserRoles: Decodable {
    var ac_no : String?
    var zone_no : String?
    var role : Bool?
    var phone_no: String?
    var token : String?
}

struct Zones : Decodable {
    var ac_no : String?
    var zone_no : String?
    var sec_officer_names : String?
    var conduct_number : String?
    var poll_stn_count : Int?
    var location_count : Int?
    var poll_stn_no : String?
    var zone_name : String?
}

struct UserLogin : Codable {
    var phone_no : String?
}

struct Constituency: Decodable {
    var name: String?
    var ac_no: String?
    var location_count: Int?
    var booth_count: Int?
}

struct PollStation: Decodable {
    var stn_no: Int?
    var location_name: String?
    var location_name_native: String?
    var stn_address: String?
    var latitude: Double?
    var longitude: Double?
    var zone_no: String?
    var booths: String?
    var polling_location_incharge_number: String?
    var ac_no: String?
}

struct StationMaster: Decodable {
    var stations: [Station]?
}


struct Station: Decodable {
    var ac_no : String?
    var location_no: Int?
    var location_name: String?
    var location_name_native: String?
    var latitude: Float?
    var longitude: Float?
    var zone_no: String?
    var booths: String?
    var is_vulnerable: Bool?
    var police_officer_name: String?
    var polling_location_incharge_number: String?
    var officer_contact_number: String?
    var officer_rank: String?
    var police_station: String?
    var stn_address: String?
    var sec_officer_names: String?
    var conduct_number: String? //
    var name: String?
    var vulnerable_booth_detail: [BoothDetails]?
}

struct BoothDetails: Decodable {
    var stn_name: String?
    var vul_habitats: String?
    var vul_types: String?
    var undersirable_elements: String?
    var stn_no: Int?
    var polling_location_no: Int?
}

struct Location : Codable {
    var lat: Float?
    var lng: Float?
}

struct AdminLocation {
    var lat: Float?
    var ac_no: String?
    var is_connection_lost: Bool?
    var time: Double?
    var zone_no: String?
    var lng : Float?
}

let baseURL = "http://elections.vit.ac.in:3000/api/v1/"
let locationStreamURL = URL(string: "ws://elections.vit.ac.in:3000/api/v1/stream/locations")
let locationFetchURL = URL(string: "ws://elections.vit.ac.in:3000/api/v1/stream/")
let fetchZonesURL = URL(string: baseURL+"zones")
let loginURL = URL(string: baseURL+"role")
let pollURL = URL(string: baseURL+"poll")
let constituencyURL = URL(string:  baseURL + "constituencies")
var streamLocationSocket : WebSocket?
var fetchLocationSocket : WebSocket?
let stationURL = URL(string: baseURL + "stations")
var socket : WebSocket?
var locations : [AdminLocation] = []
