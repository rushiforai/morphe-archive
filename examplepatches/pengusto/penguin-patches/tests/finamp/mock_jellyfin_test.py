#!/usr/bin/env python3
"""Real loopback HTTP tests; no dependencies or files written. Run with python3 -B."""

from concurrent.futures import ThreadPoolExecutor
import http.client
import io
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import threading
import time
import unittest
from urllib.parse import urlencode
import wave

sys.dont_write_bytecode = True
import mock_jellyfin as mock


class FixtureHTTPTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.fixture = mock.Fixture()
        cls.server = mock.FixtureServer(("127.0.0.1", 0), cls.fixture)
        cls.thread = threading.Thread(target=cls.server.serve_forever, daemon=True)
        cls.thread.start()

    @classmethod
    def tearDownClass(cls):
        cls.fixture.release.set()
        cls.server.shutdown()
        cls.server.server_close()
        cls.thread.join(2)

    def setUp(self):
        self.fixture.configure({"mode": "off", "scope": "artist", "holdTimeoutSeconds": 120})
        with self.fixture.lock:
            self.fixture.items = self.fixture.build_items()
            self.fixture.records.clear()

    def request(self, path, *, method="GET", query=None, body=None, headers=None):
        if query:
            path += "?" + urlencode(query, doseq=True)
        connection = http.client.HTTPConnection("127.0.0.1", self.server.server_port, timeout=5)
        request_headers = {"X-Emby-Token": mock.ACCESS_TOKEN}
        request_headers.update(headers or {})
        payload = None if body is None else json.dumps(body).encode()
        if payload is not None:
            request_headers["Content-Type"] = "application/json"
        try:
            connection.request(method, path, body=payload, headers=request_headers)
            response = connection.getresponse()
            data = response.read()
            result = json.loads(data) if data and response.getheader("Content-Type", "").startswith("application/json") else data
            return response.status, dict(response.getheaders()), result
        finally:
            connection.close()

    def get(self, path, **query):
        status, _, result = self.request(path, query=query)
        self.assertEqual(status, 200, result)
        return result

    def control(self, path="/_fixture/requests", *, method="GET", body=None, **query):
        status, _, result = self.request(path, method=method, body=body, query=query,
                                        headers={"X-Fixture-Control": self.fixture.control_token})
        self.assertIn(status, (200, 204), result)
        return result

    def items(self, **query):
        return self.get("/Users/" + mock.USER_ID + "/Items", **query)

    def test_login_user_views_and_library_navigation(self):
        info = self.get("/System/Info/Public")
        self.assertTrue(info["StartupWizardCompleted"])
        self.assertEqual(info["Id"], mock.SERVER_ID)
        self.assertEqual(self.get("/System/Endpoint"), {"IsLocal": True, "IsInNetwork": True})
        self.assertIs(self.get("/QuickConnect/Enabled"), False)
        public = self.get("/Users/Public")
        self.assertEqual(public[0]["Id"], mock.USER_ID)
        status, _, auth = self.request("/Users/AuthenticateByName", method="POST", body={"Username": "fixture", "Pw": ""})
        self.assertEqual(status, 200)
        self.assertEqual(auth["User"]["Id"], mock.USER_ID)
        self.assertEqual(auth["AccessToken"], mock.ACCESS_TOKEN)
        self.assertEqual(auth["SessionInfo"]["UserId"], mock.USER_ID)
        self.assertEqual(self.get("/Users/Me"), self.get("/Users/" + mock.USER_ID))
        views = self.get("/Users/" + mock.USER_ID + "/Views")
        self.assertEqual((views["TotalRecordCount"], views["StartIndex"]), (1, 0))
        self.assertEqual(views["Items"][0]["CollectionType"], "music")
        albums = self.items(ParentId=views["Items"][0]["Id"], IncludeItemTypes="MusicAlbum", Recursive="true")
        self.assertEqual(albums["Items"][0]["Id"], mock.ALBUM_ID)
        songs = self.items(ParentId=albums["Items"][0]["Id"], IncludeItemTypes="Audio", SortBy="ParentIndexNumber,IndexNumber")
        self.assertEqual([s["IndexNumber"] for s in songs["Items"]], list(range(1, 9)))
        for item in albums["Items"] + songs["Items"] + public:
            self.assertRegex(item["Id"], r"^[0-9a-f]{32}$")
        for song in songs["Items"][:6]:
            self.assertEqual(song["Artists"], ["B Guest", "Z Lead", "A Guest"])
            self.assertEqual(song["AlbumArtist"], "Z Lead")
            self.assertEqual([a["Name"] for a in song["AlbumArtists"]], ["Z Lead"])
        details = self.get("/Users/" + mock.USER_ID + "/Items/" + mock.TRACK_IDS[0])
        self.assertEqual(details["AlbumId"], mock.ALBUM_ID)
        self.assertEqual(self.get("/Items/" + mock.ALBUM_ID)["ChildCount"], 8)

    def test_synthetic_auth_only_and_no_passwords_logged(self):
        marker = "never-record-this-password"
        status, _, _ = self.request("/Users/AuthenticateByName", method="POST", body={"Username": "real-person", "Pw": marker})
        self.assertEqual(status, 401)
        self.get("/Items", IncludeItemTypes="Audio", Limit=1, ApiKey="do-not-log-token")
        records = self.control()["requests"]
        self.assertNotIn(marker, json.dumps(records))
        self.assertNotIn("do-not-log-token", json.dumps(records))
        self.assertNotIn(mock.ACCESS_TOKEN, json.dumps(records))
        self.assertEqual(records[-1]["query"]["apikey"], ["[redacted]"])

    def test_artist_album_artist_union_and_appears_on(self):
        artists = self.get("/Artists", ParentId=mock.LIBRARY_ID, SortBy="SortName")
        self.assertEqual([a["Name"] for a in artists["Items"]], ["A Guest", "B Guest", "Z Lead"])
        album_artists = self.get("/Artists/AlbumArtists", ParentId=mock.LIBRARY_ID)
        self.assertEqual([a["Name"] for a in album_artists["Items"]], ["Z Lead"])
        self.assertEqual(self.get("/Artists", ParentId=mock.ALBUM_ID)["TotalRecordCount"], 3)
        self.assertEqual(self.get("/Artists", ParentId="f" * 32)["TotalRecordCount"], 0)
        lead = mock.ARTIST_IDS["Z Lead"]
        guest_b, guest_a = mock.ARTIST_IDS["B Guest"], mock.ARTIST_IDS["A Guest"]
        # Last track has only A Guest as song artist and Z Lead as album artist.
        union = self.items(IncludeItemTypes="Audio", ArtistIds=lead)
        performing = self.items(IncludeItemTypes="Audio", ContributingArtistIds=lead)
        self.assertEqual(union["TotalRecordCount"], 8)
        self.assertEqual(performing["TotalRecordCount"], 7)
        self.assertIn(mock.TRACK_IDS[-1], [i["Id"] for i in union["Items"]])
        self.assertNotIn(mock.TRACK_IDS[-1], [i["Id"] for i in performing["Items"]])
        self.assertEqual(self.items(IncludeItemTypes="Audio", AlbumArtistIds=lead)["TotalRecordCount"], 8)
        self.assertEqual(self.items(IncludeItemTypes="Audio", AlbumArtistIds=guest_a)["TotalRecordCount"], 0)
        self.assertEqual(self.items(IncludeItemTypes="Audio", ArtistIds=guest_b)["TotalRecordCount"], 6)
        self.assertEqual(self.items(IncludeItemTypes="Audio", ArtistIds=[guest_a, guest_b])["TotalRecordCount"], 7)
        self.assertEqual(self.items(IncludeItemTypes="MusicAlbum", ArtistIds=guest_b)["Items"][0]["Id"], mock.ALBUM_ID)
        self.assertEqual(self.items(IncludeItemTypes="MusicAlbum", AlbumArtistIds=guest_b)["TotalRecordCount"], 0)

    def test_filters_library_genre_ids_types_and_pagination(self):
        genre = mock.GENRE_IDS["Fixture Pop"]
        self.assertEqual(self.get("/Genres", ParentId=mock.LIBRARY_ID)["TotalRecordCount"], 2)
        filtered = self.items(ParentId=mock.LIBRARY_ID, Recursive="true", IncludeItemTypes="Audio", GenreIds=genre,
                              ArtistIds=mock.ARTIST_IDS["Z Lead"], SortBy="IndexNumber", Limit=2, StartIndex=1)
        self.assertEqual((filtered["TotalRecordCount"], filtered["StartIndex"]), (4, 1))
        self.assertEqual([i["IndexNumber"] for i in filtered["Items"]], [3, 5])
        self.assertEqual(self.items(ParentId=mock.LIBRARY_ID, Recursive="false", IncludeItemTypes="Audio")["TotalRecordCount"], 0)
        self.assertEqual(self.items(ParentId=mock.ALBUM_ID, Recursive="false", IncludeItemTypes="Audio")["TotalRecordCount"], 8)
        self.assertEqual(self.items(LibraryId=mock.LIBRARY_ID, IncludeItemTypes="Audio", Genres="fixture pop")["TotalRecordCount"], 4)
        self.assertEqual(self.items(ParentId="f" * 32, IncludeItemTypes="Audio")["TotalRecordCount"], 0)
        self.assertEqual(self.items(IncludeItemTypes="Audio", GenreIds="f" * 32)["TotalRecordCount"], 0)
        result = self.items(IncludeItemTypes="Audio", Ids=",".join(mock.TRACK_IDS[:3]), ExcludeItemIds=mock.TRACK_IDS[1])
        self.assertEqual({i["Id"] for i in result["Items"]}, {mock.TRACK_IDS[0], mock.TRACK_IDS[2]})
        self.assertEqual(self.items(IncludeItemTypes="MusicAlbum,Audio")["TotalRecordCount"], 9)
        self.assertEqual(self.items(IncludeItemTypes="Playlist")["TotalRecordCount"], 0)
        self.assertEqual(self.items(IncludeItemTypes="Audio", AlbumIds=mock.ALBUM_ID)["TotalRecordCount"], 8)
        self.assertEqual(self.items(IncludeItemTypes="Audio", SearchTerm="lead solo")["TotalRecordCount"], 1)
        self.assertEqual(self.items(IncludeItemTypes="Audio", Limit=1)["TotalRecordCount"], 8)
        self.assertEqual(self.items(IncludeItemTypes="Audio", Limit=0), {"Items": [], "TotalRecordCount": 8, "StartIndex": 0})
        self.assertEqual(self.items(IncludeItemTypes="Audio", StartIndex=99)["Items"], [])

    def test_sorting_counts_latest_and_case_insensitive_prefix(self):
        most = self.items(IncludeItemTypes="Audio", SortBy="PlayCount,SortName", SortOrder="Descending,Ascending", Limit=5)
        self.assertEqual([i["IndexNumber"] for i in most["Items"]], [1, 2, 3, 4, 5])
        latest = self.get("/Users/" + mock.USER_ID + "/Items/Latest", ParentId=mock.LIBRARY_ID, IncludeItemTypes="Audio", Limit=2)
        self.assertIsInstance(latest, list)
        self.assertEqual([i["IndexNumber"] for i in latest], [8, 7])
        counts = self.get("/Items/Counts")
        self.assertEqual((counts["SongCount"], counts["AlbumCount"], counts["ArtistCount"]), (8, 1, 3))
        self.assertEqual(self.get("/Items/Counts", IncludeItemTypes="Audio", Limit=1)["SongCount"], 8)
        self.assertEqual(self.get("/Items/Counts", IncludeItemTypes="Audio", GenreIds=mock.GENRE_IDS["Fixture Pop"])["SongCount"], 4)
        result = self.get("/jellyfin/uSeRs/" + mock.USER_ID + "/iTeMs", includeitemtypes="Audio", limit=2, startindex=3)
        self.assertEqual((len(result["Items"]), result["TotalRecordCount"], result["StartIndex"]), (2, 8, 3))
        self.assertEqual(self.get("/emby/System/Info/Public")["Id"], mock.SERVER_ID)
        before = self.items(IncludeItemTypes="Audio", SortBy="Random")["Items"]
        after = self.items(IncludeItemTypes="Audio", SortBy="Random")["Items"]
        self.assertEqual([i["Id"] for i in before], [i["Id"] for i in after])

    def test_favorite_and_session_reports_persist_in_process(self):
        item_id = mock.TRACK_IDS[1]
        favorite_path = "/Users/" + mock.USER_ID + "/FavoriteItems/" + item_id
        status, _, result = self.request(favorite_path, method="POST")
        self.assertEqual(status, 200)
        self.assertTrue(result["IsFavorite"])
        ids = {i["Id"] for i in self.items(IncludeItemTypes="Audio", Filters="IsFavorite")["Items"]}
        self.assertEqual(ids, {mock.TRACK_IDS[0], mock.TRACK_IDS[1], mock.TRACK_IDS[2]})
        self.assertTrue(self.get("/Items/" + item_id)["UserData"]["IsFavorite"])
        self.request(favorite_path, method="DELETE")
        self.assertFalse(self.get("/Items/" + item_id)["UserData"]["IsFavorite"])
        previous = self.get("/Items/" + item_id)["UserData"]["PlayCount"]
        for path, ticks in (("/Sessions/Playing", 0), ("/Sessions/Playing/Progress", 10_000_000),
                            ("/Sessions/Playing/Stopped", mock.RUNTIME_TICKS)):
            status, _, _ = self.request(path, method="POST", body={"ItemId": item_id, "PositionTicks": ticks})
            self.assertEqual(status, 204)
        data = self.get("/Items/" + item_id)["UserData"]
        self.assertEqual(data["PlayCount"], previous + 1)
        self.assertTrue(data["Played"])
        self.assertEqual(data["PlaybackPositionTicks"], 0)
        self.assertNotEqual(data["LastPlayedDate"], mock.STAMP)
        for path in ("/Sessions/Capabilities", "/Sessions/Capabilities/Full", "/Sessions/Logout"):
            self.assertEqual(self.request(path, method="POST", body={})[0], 204)

    def test_all_tracks_playable_metadata_head_and_byte_ranges(self):
        for item_id in mock.TRACK_IDS:
            info = self.get("/Items/" + item_id + "/PlaybackInfo", UserId=mock.USER_ID)
            source = info["MediaSources"][0]
            self.assertTrue(source["SupportsDirectPlay"])
            self.assertFalse(source["SupportsTranscoding"])
            self.assertEqual(source["MediaStreams"][0]["Codec"], "pcm_s16le")
            status, headers, audio = self.request("/Items/" + item_id + "/File")
            self.assertEqual(status, 200)
            self.assertEqual(headers["Content-Type"], "audio/wav")
            self.assertEqual(len(audio), source["Size"])
            with wave.open(io.BytesIO(audio), "rb") as wav:
                self.assertEqual((wav.getnchannels(), wav.getsampwidth(), wav.getframerate()), (1, 2, mock.SAMPLE_RATE))
                self.assertEqual(wav.getnframes(), mock.SAMPLE_RATE * mock.DURATION_SECONDS)
                self.assertTrue(any(wav.readframes(1000)))
        item_id = mock.TRACK_IDS[0]
        status, _, posted = self.request("/Items/" + item_id + "/PlaybackInfo", method="POST", body={"UserId": mock.USER_ID})
        self.assertEqual(status, 200)
        self.assertEqual(posted["MediaSources"][0]["Id"], item_id)
        path = "/Audio/" + item_id + "/Universal"
        status, headers, audio = self.request(path)
        self.assertEqual(status, 200)
        status, head_headers, body = self.request(path, method="HEAD")
        self.assertEqual((status, int(head_headers["Content-Length"]), body), (200, len(audio), b""))
        for value, expected in (("bytes=0-43", audio[:44]), ("bytes=44-", audio[44:]), ("bytes=-10", audio[-10:])):
            status, part_headers, body = self.request(path, headers={"Range": value})
            self.assertEqual(status, 206)
            self.assertIn("Content-Range", part_headers)
            self.assertEqual(body, expected)
        for value in ("bytes=999999999-", "bytes=9-2", "bytes=0-1,4-5", "bytes=-0", "invalid"):
            self.assertEqual(self.request(path, headers={"Range": value})[0], 416)
        self.assertEqual(self.request(path, headers={"If-None-Match": headers["ETag"]})[0], 304)
        self.assertEqual(self.request("/Audio/" + item_id + "/stream.wav")[2], audio)
        self.assertEqual(self.request("/Audio/" + item_id + "/main.m3u8")[0], 501)
        for image_id in (mock.ALBUM_ID, mock.ARTIST_IDS["Z Lead"]):
            status, headers, data = self.request("/Items/" + image_id + "/Images/Primary", query={"format": "webp"})
            self.assertEqual(status, 200)
            self.assertEqual(headers["Content-Type"], "image/png")
            self.assertTrue(data.startswith(b"\x89PNG\r\n\x1a\n"))
        self.assertEqual(self.get("/Audio/" + item_id + "/Lyrics")["Lyrics"], [])

    def wait_for_pending(self, count):
        deadline = time.monotonic() + 3
        while time.monotonic() < deadline:
            result = self.control()
            if result["pending"] == count:
                return result
            time.sleep(0.01)
        self.fail("Expected %d held request(s), got %r" % (count, result))

    def test_hold_unbounded_artist_requests_while_bounded_requests_complete(self):
        self.control("/_fixture/control", method="POST", body={"mode": "hold", "scope": "artist"})
        lead = mock.ARTIST_IDS["Z Lead"]
        with ThreadPoolExecutor(max_workers=2) as pool:
            held = [pool.submit(self.items, IncludeItemTypes="Audio", **{key: lead})
                    for key in ("ArtistIds", "AlbumArtistIds")]
            try:
                logged = self.wait_for_pending(2)
                self.assertTrue(all(not future.done() for future in held))
                self.assertEqual(sum(r["state"] == "held" for r in logged["requests"]), 2)
                top = self.items(IncludeItemTypes="Audio", ArtistIds=lead, Limit=5, SortBy="PlayCount", SortOrder="Descending")
                self.assertEqual((len(top["Items"]), top["TotalRecordCount"]), (5, 8))
                self.assertEqual(self.items(IncludeItemTypes="Audio", AlbumArtistIds=lead, Limit=0)["TotalRecordCount"], 8)
                self.assertEqual(self.items(IncludeItemTypes="Audio")["TotalRecordCount"], 8)
                self.assertEqual(self.items(IncludeItemTypes="MusicAlbum", ArtistIds=lead)["TotalRecordCount"], 1)
            finally:
                self.control("/_fixture/release", method="POST")
            self.assertEqual([future.result(timeout=3)["TotalRecordCount"] for future in held], [8, 8])
        deadline = time.monotonic() + 3
        while True:
            final = self.wait_for_pending(0)
            released = [r for r in final["requests"] if r.get("gateOutcome") == "released"]
            if all(r["state"] == "completed" for r in released) or time.monotonic() >= deadline:
                break
            time.sleep(0.01)
        self.assertEqual(len(released), 2)
        self.assertTrue(all(r["state"] == "completed" and r["status"] == 200 for r in released))

    def test_reject_all_scope_timeout_and_invalid_queries(self):
        self.control("/_fixture/control", method="POST", body={"mode": "reject", "scope": "all"})
        path = "/Users/" + mock.USER_ID + "/Items"
        self.assertEqual(self.request(path, query={"IncludeItemTypes": "Audio"})[0], 503)
        self.assertEqual(self.items(IncludeItemTypes="Audio", Limit=1)["TotalRecordCount"], 8)
        self.assertEqual(self.request(path, query={"Filters": "IsNotFolder"})[0], 503)
        self.control("/_fixture/control", method="POST", body={"mode": "hold", "holdTimeoutSeconds": 0.1})
        self.assertEqual(self.request(path, query={"IncludeItemTypes": "Audio"})[0], 503)
        self.assertEqual(self.control()["requests"][-1]["gateOutcome"], "timeout")
        for query in ({"Limit": -1}, {"Limit": ""}, {"StartIndex": "bad"}, {"Limit": 1, "SortBy": "bogus"},
                      {"Limit": 1, "IsFavorite": "yes"}):
            self.assertEqual(self.request(path, query=query)[0], 400)
        self.assertEqual(self.request("/Items/" + "f" * 32)[0], 404)
        self.assertEqual(self.request("/Unknown/Route")[0], 404)

    def test_control_security_and_manifest(self):
        self.assertEqual(self.request("/_fixture")[0], 403)
        token_header = {"X-Fixture-Control": self.fixture.control_token}
        self.assertEqual(self.request("/_fixture", headers={"X-Fixture-Control": "wrong"})[0], 403)
        self.assertEqual(self.request("/_fixture", headers={**token_header, "Origin": "http://localhost"})[0], 403)
        self.assertEqual(self.request("/_fixture", headers={**token_header, "Host": "attacker.invalid"})[0], 403)
        manifest = self.control("/_fixture")
        self.assertEqual(manifest["trackIds"], list(mock.TRACK_IDS))
        self.assertIsNone(manifest["dataDir"])
        status, _, _ = self.request("/_fixture/control", method="POST", headers=token_header, body={"mode": "invalid"})
        self.assertEqual(status, 400)
        with self.assertRaises(ValueError):
            mock.FixtureServer(("0.0.0.0", 0), self.fixture)
        self.assertEqual(self.fixture.manifest(8096, "::1")["baseUrl"], "http://[::1]:8096")

    def test_cli_can_start_on_ephemeral_port_without_writing_data(self):
        script = Path(__file__).with_name("mock_jellyfin.py")
        process = subprocess.Popen([sys.executable, "-B", str(script), "--port", "0"], stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE, text=True)
        try:
            lines = []
            while True:
                line = process.stdout.readline()
                if not line or line.startswith("Use adb reverse"):
                    break
                lines.append(line)
            self.assertIsNone(process.poll(), "Fixture exited during startup")
            manifest = json.loads("".join(lines))
            self.assertIsNone(manifest["dataDir"])
            port = int(manifest["baseUrl"].rsplit(":", 1)[1])
            connection = http.client.HTTPConnection("127.0.0.1", port, timeout=3)
            try:
                connection.request("GET", "/System/Info/Public")
                response = connection.getresponse()
                self.assertEqual(response.status, 200)
                self.assertEqual(json.loads(response.read())["Id"], mock.SERVER_ID)
            finally:
                connection.close()
        finally:
            process.terminate()
            process.communicate(timeout=5)

    def test_payloads_satisfy_actual_local_finamp_decoder_required_fields(self):
        roots = [Path(os.environ["FINAMP_SOURCE"]).expanduser()] if os.environ.get("FINAMP_SOURCE") else []
        auth = self.request("/Users/AuthenticateByName", method="POST", body={"Username": "fixture"})[2]
        item = self.get("/Items/" + mock.TRACK_IDS[0])
        query = self.items(IncludeItemTypes="Audio", Limit=1)
        payloads = {"UserDto": auth["User"], "UserConfiguration": auth["User"]["Configuration"],
                    "UserPolicy": auth["User"]["Policy"], "SessionInfo": auth["SessionInfo"],
                    "PlayerStateInfo": auth["SessionInfo"]["PlayState"], "ClientCapabilities": auth["SessionInfo"]["Capabilities"],
                    "BaseItemDto": item, "UserItemDataDto": item["UserData"],
                    "MediaSourceInfo": item["MediaSources"][0], "MediaStream": item["MediaStreams"][0],
                    "QueryResult_BaseItemDto": query}
        checked = 0
        for root in roots:
            source = root / "lib/models/jellyfin_models.g.dart"
            if not source.exists():
                continue
            text = source.read_text()
            for name, payload in payloads.items():
                with self.subTest(source=str(source), dto=name):
                    start = text.index(name + " _$" + name + "FromJson(Map json)")
                    end = text.index("\nMap<String, dynamic>", start)
                    decoder = text[start:end]
                    # Actual nonnullable decoder casts, not a duplicated DTO field list.
                    for field, dtype in re.findall(r"json\['([^']+)'\] as (String|bool|num|List<dynamic>)(?![\w?])", decoder):
                        if re.search(r"json\['" + re.escape(field) + r"'\] as " + re.escape(dtype) + r"\?", decoder):
                            continue
                        self.assertIn(field, payload, "Required decoder field absent")
                        expected = {"String": str, "bool": bool, "num": (int, float), "List<dynamic>": list}[dtype]
                        self.assertIsInstance(payload[field], expected, field)
                    checked += 1
        if not checked:
            self.skipTest("Local Finamp sources unavailable; HTTP tests remain standalone")


class NavigationProfileTests(unittest.TestCase):
    def test_extra_album_preserves_credits_and_crosses_the_page_boundary(self):
        fixture = mock.Fixture(profile="navigation")
        try:
            album_id = mock.stable_id("navigation-album")
            tracks = [item for item in fixture.items.values() if item.get("AlbumId") == album_id]
            self.assertEqual(len(tracks), 105)
            self.assertEqual(fixture.items[album_id]["ChildCount"], 105)
            self.assertEqual(len([item for item in fixture.items.values() if item.get("AlbumId") == mock.ALBUM_ID]), 8)
            self.assertTrue(any(item["Name"] == "Midnight 01" for item in tracks))
            self.assertTrue(any(item["Name"] == "Écho 01" and item["SortName"] == "echo 01" for item in tracks))
            for item in tracks:
                self.assertEqual(item["ArtistItems"][0]["Id"], mock.ARTIST_IDS["Z Lead"])
                self.assertIn(item["Id"], fixture.audio)
                self.assertEqual(item["MediaSources"][0]["Id"], item["Id"])
            self.assertEqual(len(fixture.manifest(18961)["trackIds"]), 113)
        finally:
            fixture.close()


if __name__ == "__main__":
    unittest.main(verbosity=2)
