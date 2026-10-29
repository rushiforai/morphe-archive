#!/usr/bin/env python3
"""Disposable, loopback-only Jellyfin subset for Finamp 1.0.1 APK tests.

No dependencies, upstream requests, real accounts, or media files are needed.
See README-fixture.md for the source contract, controls, and endpoint limits.
"""

import argparse
import copy
import hashlib
import hmac
import io
import ipaddress
import json
import math
from pathlib import Path
import re
import secrets
import socket
import struct
import threading
import time
from collections import deque
from datetime import datetime, timezone
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import parse_qs, unquote, urlsplit
import uuid
import unicodedata
import wave
import zlib


def stable_id(name):
    return uuid.uuid5(uuid.NAMESPACE_URL, "finamp-morphe-fixture:v1:" + name).hex


SERVER_ID = stable_id("server")
USER_ID = stable_id("user")
LIBRARY_ID = stable_id("library")
ALBUM_ID = stable_id("album")
ARTIST_NAMES = ("B Guest", "Z Lead", "A Guest")
ARTIST_IDS = {name: stable_id("artist:" + name) for name in ARTIST_NAMES}
GENRE_IDS = {name: stable_id("genre:" + name) for name in ("Fixture Pop", "Fixture Jazz")}
TRACK_IDS = tuple(stable_id("track:" + str(i)) for i in range(1, 9))
ACCESS_TOKEN = stable_id("synthetic-access-token")
SESSION_ID = stable_id("session")
STAMP = "2026-01-01T12:00:00.0000000Z"
SAMPLE_RATE = 44100
DURATION_SECONDS = 4
RUNTIME_TICKS = DURATION_SECONDS * 10_000_000


def now():
    return datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")


def make_wav(number, duration_seconds=DURATION_SECONDS):
    """Four-second mono PCM sine, with a fade to avoid clicks."""
    frames = bytearray()
    count = SAMPLE_RATE * duration_seconds
    frequency = 220 + number * 33
    for i in range(count):
        fade = min(1, i / 441, (count - i - 1) / 441)
        frames.extend(struct.pack("<h", int(3500 * fade * math.sin(2 * math.pi * frequency * i / SAMPLE_RATE))))
    output = io.BytesIO()
    with wave.open(output, "wb") as wav:
        wav.setparams((1, 2, SAMPLE_RATE, 0, "NONE", "not compressed"))
        wav.writeframes(frames)
    return output.getvalue()


def make_png():
    def chunk(kind, data):
        return struct.pack("!I", len(data)) + kind + data + struct.pack("!I", zlib.crc32(kind + data) & 0xffffffff)
    pixels = b"".join(b"\0" + b"".join(bytes((30 + x, 50 + y, 150)) for x in range(128)) for y in range(128))
    return (b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack("!2I5B", 128, 128, 8, 2, 0, 0, 0))
            + chunk(b"IDAT", zlib.compress(pixels)) + chunk(b"IEND", b""))


def user_data(item_id, index=0):
    plays = max(0, 9 - index) if index else 0
    result = {"PlaybackPositionTicks": 0, "PlayCount": plays, "IsFavorite": index in (1, 3),
              "Played": plays > 0, "Key": item_id, "ItemId": item_id,
              "UnplayedItemCount": 0, "PlayedPercentage": 100 if plays else 0}
    if plays:
        result["LastPlayedDate"] = "2026-01-%02dT12:00:00.0000000Z" % index
    return result


def media_source(item_id, size):
    stream = {"Codec": "pcm_s16le", "CodecTag": "[1][0][0][0]", "Type": "Audio", "Index": 0,
              "IsInterlaced": False, "IsDefault": True, "IsForced": False, "IsExternal": False,
              "IsTextSubtitleStream": False, "SupportsExternalStream": False, "Channels": 1,
              "ChannelLayout": "mono", "SampleRate": SAMPLE_RATE, "BitDepth": 16,
              "BitRate": SAMPLE_RATE * 16, "DisplayTitle": "PCM 16-bit mono", "TimeBase": "1/44100"}
    return {"Protocol": "File", "Id": item_id, "Path": "/synthetic/" + item_id + ".wav",
            "Type": "Default", "Container": "wav", "Name": "Synthetic PCM", "Size": size,
            "IsRemote": False, "RunTimeTicks": RUNTIME_TICKS, "SupportsTranscoding": False,
            "SupportsDirectStream": True, "SupportsDirectPlay": True, "IsInfiniteStream": False,
            "RequiresOpening": False, "RequiresClosing": False, "RequiresLooping": False,
            "SupportsProbing": True, "ReadAtNativeFramerate": False, "IgnoreDts": False,
            "IgnoreIndex": False, "GenPtsInput": False, "MediaStreams": [stream],
            "Formats": ["wav"], "Bitrate": SAMPLE_RATE * 16, "RequiredHttpHeaders": {},
            "DefaultAudioStreamIndex": 0, "MediaAttachments": [], "Etag": stable_id("wav:" + item_id),
            "DirectStreamUrl": "/Audio/" + item_id + "/stream.wav"}


def fixture_user():
    config = {"PlayDefaultAudioTrack": True, "DisplayMissingEpisodes": False, "SubtitleMode": "Default",
              "DisplayCollectionsView": False, "EnableLocalPassword": False, "HidePlayedInLatest": False,
              "RememberAudioSelections": True, "RememberSubtitleSelections": True, "EnableNextEpisodeAutoPlay": True,
              "GroupedFolders": [], "OrderedViews": [LIBRARY_ID], "LatestItemsExcludes": [], "MyMediaExcludes": []}
    policy = {key: False for key in (
        "IsAdministrator", "IsHidden", "IsDisabled", "EnableRemoteControlOfOtherUsers", "EnableSharedDeviceControl",
        "EnableLiveTvManagement", "EnableLiveTvAccess", "EnableAudioPlaybackTranscoding", "EnableVideoPlaybackTranscoding",
        "EnablePlaybackRemuxing", "ForceRemoteSourceTranscoding", "EnableContentDeletion", "EnableSyncTranscoding",
        "EnableMediaConversion", "EnablePublicSharing")}
    policy.update({key: True for key in ("EnableUserPreferenceAccess", "EnableRemoteAccess", "EnableMediaPlayback",
                                        "EnableContentDownloading", "EnableAllDevices", "EnableAllChannels", "EnableAllFolders")})
    policy.update({key: [] for key in ("BlockedTags", "AccessSchedules", "BlockUnratedItems", "EnableContentDeletionFromFolders",
                                     "EnabledDevices", "EnabledChannels", "BlockedMediaFolders", "BlockedChannels")})
    policy.update({"EnabledFolders": [LIBRARY_ID], "InvalidLoginAttemptCount": 0, "LoginAttemptsBeforeLockout": 0,
                   "MaxActiveSessions": 0, "RemoteClientBitrateLimit": 0, "SyncPlayAccess": "None",
                   "AuthenticationProviderId": "Synthetic", "PasswordResetProviderId": "Synthetic"})
    return {"Name": "fixture", "Id": USER_ID, "ServerId": SERVER_ID, "ServerName": "Finamp Synthetic Fixture",
            "HasPassword": False, "HasConfiguredPassword": False, "HasConfiguredEasyPassword": False,
            "EnableAutoLogin": False, "LastLoginDate": STAMP, "LastActivityDate": STAMP,
            "Configuration": config, "Policy": policy}


def fixture_session():
    return {"Id": SESSION_ID, "ServerId": SERVER_ID, "UserId": USER_ID, "UserName": "fixture",
            "Client": "Finamp fixture", "ApplicationVersion": "1.0.1", "DeviceId": stable_id("device"),
            "DeviceName": "Synthetic device", "LastActivityDate": STAMP, "LastPlaybackCheckIn": STAMP,
            "IsActive": True, "SupportsRemoteControl": False, "SupportsMediaControl": True,
            "HasCustomDeviceName": False, "AdditionalUsers": [], "PlayableMediaTypes": ["Audio"],
            "SupportedCommands": [], "NowPlayingQueue": [],
            "Capabilities": {"PlayableMediaTypes": ["Audio"], "SupportedCommands": [],
                             "SupportsMediaControl": True, "SupportsPersistentIdentifier": True},
            "PlayState": {"CanSeek": True, "IsPaused": True, "IsMuted": False, "PositionTicks": 0,
                          "VolumeLevel": 100, "RepeatMode": "RepeatNone", "PlayMethod": "DirectPlay"}}


class Query:
    """Jellyfin parameter names are case insensitive; repeated/comma values work."""
    def __init__(self, raw=""):
        self.values = {}
        for key, values in parse_qs(raw, keep_blank_values=True).items():
            self.values.setdefault(key.lower(), []).extend(values)

    def get(self, key, default=None):
        return self.values.get(key.lower(), [default])[-1]

    def csv(self, key):
        return [v.strip() for value in self.values.get(key.lower(), []) for v in value.split(",") if v.strip()]

    def integer(self, key, default=None):
        value = self.get(key)
        if value is None:
            return default
        if not re.fullmatch(r"\d+", value):
            raise ValueError(key + " must be a nonnegative integer")
        return int(value)

    def boolean(self, key, default=None):
        value = self.get(key)
        if value is None:
            return default
        if value.lower() not in ("true", "false"):
            raise ValueError(key + " must be true or false")
        return value.lower() == "true"

    def redacted(self):
        return {key: (["[redacted]"] if any(word in key for word in ("key", "token", "secret", "password", "pw", "code")) else values)
                for key, values in self.values.items()}


class Fixture:
    def __init__(self, *, mode="off", scope="artist", hold_timeout=120, data_dir=None, profile="credits"):
        if profile not in ("credits", "navigation", "player"):
            raise ValueError("Unknown synthetic fixture profile")
        self.profile = profile
        self.lock = threading.RLock()
        self.records = deque(maxlen=5000)
        self.sequence = 0
        self.mode, self.scope, self.hold_timeout = mode, scope, hold_timeout
        self.release = threading.Event()
        self.pending = 0
        self.control_token = secrets.token_hex(24)
        self.data_dir = Path(data_dir).expanduser().resolve() if data_dir else None
        self.log_file = None
        self.audio = {item_id: make_wav(index) for index, item_id in enumerate(TRACK_IDS, 1)}
        self.png = make_png()
        self.items = self.build_items()
        if self.data_dir:
            self.data_dir.mkdir(parents=True, exist_ok=True)
            # Explicit output only; never read media or accounts from this directory.
            for item_id, data in self.audio.items():
                (self.data_dir / (item_id + ".wav")).write_bytes(data)
            self.log_file = (self.data_dir / "requests.jsonl").open("a", encoding="utf-8")

    def build_items(self):
        def base(item_id, name, kind, parent=LIBRARY_ID):
            return {"Id": item_id, "Name": name, "SortName": name.casefold(), "ServerId": SERVER_ID,
                    "Type": kind, "ParentId": parent, "IsFolder": kind != "Audio", "LocationType": "FileSystem",
                    "DateCreated": STAMP, "DateLastMediaAdded": STAMP, "PremiereDate": STAMP, "ProductionYear": 2026,
                    "Etag": stable_id("etag:" + item_id), "UserData": user_data(item_id),
                    "ImageTags": {"Primary": stable_id("image:" + item_id)}, "BackdropImageTags": [],
                    "PrimaryImageAspectRatio": 1.0, "Genres": list(GENRE_IDS),
                    "GenreItems": [{"Name": n, "Id": i} for n, i in GENRE_IDS.items()],
                    "ProviderIds": {}, "Tags": ["synthetic", "finamp-fixture"], "ExternalUrls": [], "People": [],
                    "CanDownload": kind == "Audio", "CanDelete": False, "PlayAccess": "Full",
                    "Overview": "Locally generated synthetic fixture. No real music or account data.",
                    "ChildCount": 0, "RecursiveItemCount": 0}
        credits = [{"Name": name, "Id": ARTIST_IDS[name]} for name in ARTIST_NAMES]
        album_credits = [credits[1]]
        library = base(LIBRARY_ID, "Fixture Music", "CollectionFolder", stable_id("root"))
        library.update({"CollectionType": "music", "ChildCount": 1, "RecursiveItemCount": 9})
        album = base(ALBUM_ID, "Fixture Credits", "MusicAlbum")
        album.update({"AlbumArtist": "Z Lead", "AlbumArtists": album_credits, "Artists": list(ARTIST_NAMES),
                      "ArtistItems": credits, "Album": "Fixture Credits", "ChildCount": 8, "RecursiveItemCount": 8,
                      "RunTimeTicks": 8 * RUNTIME_TICKS, "UserData": user_data(ALBUM_ID, 1)})
        items = [library, album]
        for name, item_id in ARTIST_IDS.items():
            artist = base(item_id, name, "MusicArtist")
            artist.update({"AlbumCount": 1, "SongCount": 8 if name == "Z Lead" else 6 + (name == "A Guest"),
                           "ChildCount": 1, "RecursiveItemCount": 8, "MusicVideoCount": 0})
            if name == "Z Lead":
                artist["UserData"]["IsFavorite"] = True
            items.append(artist)
        for name, item_id in GENRE_IDS.items():
            genre = base(item_id, name, "MusicGenre")
            genre.update({"Genres": [name], "GenreItems": [{"Name": name, "Id": item_id}], "SongCount": 4,
                          "AlbumCount": 1, "ChildCount": 1})
            items.append(genre)
        for index, item_id in enumerate(TRACK_IDS, 1):
            name = "%02d - Credit Order" % index if index <= 6 else ("07 - Lead Solo" if index == 7 else "08 - Album Credit Only")
            track_credits = credits if index <= 6 else ([credits[1]] if index == 7 else [credits[2]])
            genre = list(GENRE_IDS)[(index - 1) % 2]
            source = media_source(item_id, len(self.audio[item_id]))
            track = base(item_id, name, "Audio", ALBUM_ID)
            track.update({"Artists": [c["Name"] for c in track_credits], "ArtistItems": track_credits,
                          "AlbumArtist": "Z Lead", "AlbumArtists": album_credits, "Album": album["Name"],
                          "AlbumId": ALBUM_ID, "AlbumPrimaryImageTag": album["ImageTags"]["Primary"],
                          "ParentPrimaryImageItemId": ALBUM_ID, "ParentPrimaryImageTag": album["ImageTags"]["Primary"],
                          "IndexNumber": index, "ParentIndexNumber": 1, "RunTimeTicks": RUNTIME_TICKS,
                          "MediaType": "Audio", "Container": "wav", "Path": source["Path"],
                          "MediaSources": [source], "MediaStreams": source["MediaStreams"], "MediaSourceCount": 1,
                          "HasLyrics": False, "Chapters": [], "HasSubtitles": False,
                          "Genres": [genre], "GenreItems": [{"Name": genre, "Id": GENRE_IDS[genre]}],
                          "DateCreated": "2026-01-%02dT12:00:00.0000000Z" % index,
                          "UserData": user_data(item_id, index)})
            items.append(track)
        if self.profile == "navigation":
            # A second album leaves the existing credit/download fixture intact.
            # 105 extra tracks cross the app's 100-item page boundary. Every
            # extra stream reuses our generated PCM bytes; no music is imported.
            navigation_album = copy.deepcopy(album)
            navigation_id = stable_id("navigation-album")
            navigation_album.update({"Id": navigation_id, "Name": "Alphabet Library",
                                     "SortName": "alphabet library", "ChildCount": 105,
                                     "RecursiveItemCount": 105, "RunTimeTicks": 105 * RUNTIME_TICKS})
            items.append(navigation_album)
            names = ["01 Numbers"]
            for letter in "ABCDEFGHIJKLMNOPQRSTUVWXYZ":
                title = {"E": "Écho", "M": "Midnight", "Z": "Zebra"}.get(letter, letter + " Song")
                names.extend(title + " %02d" % index for index in range(1, 5))
            template = next(item for item in items if item["Id"] == TRACK_IDS[0])
            for index, name in enumerate(names, 1):
                item_id = stable_id("navigation-track:" + str(index))
                self.audio[item_id] = self.audio[TRACK_IDS[0]]
                track = copy.deepcopy(template)
                source = media_source(item_id, len(self.audio[item_id]))
                sort_name = "".join(c for c in unicodedata.normalize("NFKD", name.casefold())
                                    if not unicodedata.combining(c))
                track.update({"Id": item_id, "Name": name, "SortName": sort_name,
                              "ParentId": navigation_id, "AlbumId": navigation_id, "Album": "Alphabet Library",
                              "IndexNumber": index, "Artists": ["Z Lead"], "ArtistItems": album_credits,
                              "MediaSources": [source], "MediaStreams": source["MediaStreams"], "Path": source["Path"],
                              "ParentPrimaryImageItemId": navigation_id, "UserData": user_data(item_id)})
                items.append(track)
            library.update({"ChildCount": 2, "RecursiveItemCount": 115})
        if self.profile == "player":
            # Keep the original downloaded tracks unchanged. A separate two-minute
            # synthetic stream gives UI acceptance time to open and pause Player.
            player_id = stable_id("player-output-track")
            self.audio[player_id] = make_wav(9, 120)
            source = media_source(player_id, len(self.audio[player_id]))
            source["RunTimeTicks"] = 120 * 10_000_000
            track = copy.deepcopy(next(item for item in items if item["Id"] == TRACK_IDS[0]))
            track.update({"Id": player_id, "Name": "Output Controls", "SortName": "output controls",
                          "RunTimeTicks": 120 * 10_000_000, "IndexNumber": 9,
                          "MediaSources": [source], "MediaStreams": source["MediaStreams"],
                          "Path": source["Path"], "UserData": user_data(player_id)})
            items.append(track)
            album.update({"ChildCount": 9, "RecursiveItemCount": 9,
                          "RunTimeTicks": 8 * RUNTIME_TICKS + 120 * 10_000_000})
        return {item["Id"]: item for item in items}

    def manifest(self, port, host="127.0.0.1"):
        host = "[%s]" % host if ":" in host else host
        return {"fixture": "finamp-morphe-v1", "baseUrl": "http://%s:%d" % (host, port),
                "username": "fixture", "password": "", "serverId": SERVER_ID, "userId": USER_ID,
                "libraryId": LIBRARY_ID, "albumId": ALBUM_ID, "artistIds": ARTIST_IDS,
                "genreIds": GENRE_IDS, "trackIds": tuple(self.audio), "durationSeconds": DURATION_SECONDS,
                "profile": self.profile,
                "controlHeader": "X-Fixture-Control", "controlToken": self.control_token,
                "dataDir": str(self.data_dir) if self.data_dir else None,
                "unboundedMode": self.mode, "unboundedScope": self.scope}

    def record(self, method, path, query):
        with self.lock:
            self.sequence += 1
            record = {"id": self.sequence, "time": now(), "method": method, "path": path,
                      "query": query.redacted(), "state": "started"}
            self.records.append(record)
            self.event(record)
            return record

    def event(self, record):
        # Call with lock held. Bodies and request headers (including auth) are never logged.
        if self.log_file:
            self.log_file.write(json.dumps(record, ensure_ascii=False) + "\n")
            self.log_file.flush()

    def update_record(self, record, **values):
        with self.lock:
            record.update(values)
            self.event(record)

    def configure(self, body):
        mode, scope = body.get("mode", self.mode), body.get("scope", self.scope)
        timeout = body.get("holdTimeoutSeconds", self.hold_timeout)
        if mode not in ("off", "hold", "reject") or scope not in ("artist", "all"):
            raise ValueError("mode must be off/hold/reject; scope must be artist/all")
        if isinstance(timeout, bool) or not isinstance(timeout, (int, float)) or not 0.1 <= timeout <= 300:
            raise ValueError("holdTimeoutSeconds must be between 0.1 and 300")
        with self.lock:
            self.release.set()  # Reconfiguration also releases existing waiters.
            self.release = threading.Event()
            self.mode, self.scope, self.hold_timeout = mode, scope, timeout

    def gate(self, query, record):
        types = {s.casefold() for s in query.csv("IncludeItemTypes")}
        track_query = "audio" in types or "isnotfolder" in {s.casefold() for s in query.csv("Filters")}
        artist_query = any(query.csv(key) for key in ("ArtistIds", "AlbumArtistIds", "ContributingArtistIds"))
        # Limit=0 is a bounded count request; an empty/invalid Limit is rejected by Query.
        unbounded = query.integer("Limit") is None and track_query
        self.update_record(record, unboundedTrackQuery=unbounded, artistTrackQuery=artist_query and track_query)
        with self.lock:
            if not unbounded or self.mode == "off" or (self.scope == "artist" and not artist_query):
                return True
            if self.mode == "reject" or self.pending >= 32:
                self.update_record(record, gateOutcome="rejected")
                return False
            event, timeout = self.release, self.hold_timeout
            self.pending += 1
            self.update_record(record, state="held", gateOutcome="waiting")
        released = event.wait(timeout)
        with self.lock:
            self.pending -= 1
            self.update_record(record, state="started", gateOutcome="released" if released else "timeout")
        return released

    def snapshot(self, query, kind=None):
        with self.lock:
            all_items = copy.deepcopy(list(self.items.values()))
        by_id = {i["Id"]: i for i in all_items}
        candidates = [i for i in all_items if i["Type"] != "CollectionFolder"]
        if kind:
            candidates = [i for i in candidates if i["Type"] == kind]

        def under(item, parent, recursive):
            ancestor = item.get("ParentId")
            while ancestor:
                if ancestor == parent:
                    return True
                if not recursive:
                    return False
                ancestor = by_id.get(ancestor, {}).get("ParentId")
            return False

        parent = query.get("ParentId", query.get("LibraryId"))
        if parent and not kind:
            candidates = [i for i in candidates if under(i, parent, query.boolean("Recursive", True))]
        types = {s.casefold() for s in query.csv("IncludeItemTypes")}
        if types and not kind:
            candidates = [i for i in candidates if i["Type"].casefold() in types]
        wanted = set(query.csv("Ids"))
        excluded = set(query.csv("ExcludeItemIds"))
        if wanted:
            candidates = [i for i in candidates if i["Id"] in wanted]
        candidates = [i for i in candidates if i["Id"] not in excluded]

        def credits(item, album_only=False, performing_only=False):
            ids = set()
            if not performing_only:
                ids.update(c["Id"] for c in item.get("AlbumArtists", []))
            if not album_only:
                ids.update(c["Id"] for c in item.get("ArtistItems", []))
                # Album artist matching is a union with artists of its songs.
                if item["Type"] == "MusicAlbum":
                    for song in all_items:
                        if song.get("AlbumId") == item["Id"]:
                            ids.update(c["Id"] for c in song.get("ArtistItems", []))
            return ids

        for key, album_only, performing_only in (("ArtistIds", False, False), ("AlbumArtistIds", True, False),
                                                 ("ContributingArtistIds", False, True)):
            ids = set(query.csv(key))
            if ids:
                candidates = [i for i in candidates if ids & credits(i, album_only, performing_only)]
        albums = set(query.csv("AlbumIds"))
        if albums:
            candidates = [i for i in candidates if i.get("AlbumId", i["Id"]) in albums]
        genre_ids = set(query.csv("GenreIds"))
        genres = {g.casefold() for g in query.csv("Genres")}
        if genre_ids:
            candidates = [i for i in candidates if genre_ids & {g["Id"] for g in i.get("GenreItems", [])}]
        if genres:
            candidates = [i for i in candidates if genres & {g.casefold() for g in i.get("Genres", [])}]
        if kind == "MusicArtist" and query.get("_AlbumArtists") == "true":
            candidates = [i for i in candidates if i["Id"] == ARTIST_IDS["Z Lead"]]
        # Artist/genre endpoints scope by their matching songs, not physical folders.
        if kind in ("MusicArtist", "MusicGenre"):
            songs = [i for i in all_items if i["Type"] == "Audio"
                     and (not parent or under(i, parent, True))
                     and (not genre_ids or genre_ids & {g["Id"] for g in i["GenreItems"]})
                     and (not genres or genres & {g.casefold() for g in i["Genres"]})]
            relevant = set()
            for song in songs:
                relevant.update(credits(song) if kind == "MusicArtist" else (g["Id"] for g in song["GenreItems"]))
            candidates = [i for i in candidates if i["Id"] in relevant]
        search = query.get("SearchTerm", "").casefold()
        if search:
            candidates = [i for i in candidates if search in i["Name"].casefold()]
        for key, predicate in (("NameStartsWith", lambda n, v: n.startswith(v)),
                               ("NameStartsWithOrGreater", lambda n, v: n >= v),
                               ("NameLessThan", lambda n, v: n < v)):
            value = query.get(key)
            if value is not None:
                candidates = [i for i in candidates if predicate(i["SortName"].casefold(), value.casefold())]
        favorite = query.boolean("IsFavorite")
        if favorite is not None:
            candidates = [i for i in candidates if i["UserData"]["IsFavorite"] == favorite]
        predicates = {"isfavorite": lambda i: i["UserData"]["IsFavorite"],
                      "isfavoriteorlikes": lambda i: i["UserData"]["IsFavorite"] or i["UserData"].get("Likes", False),
                      "isfolder": lambda i: i["IsFolder"], "isnotfolder": lambda i: not i["IsFolder"],
                      "isplayed": lambda i: i["UserData"]["Played"], "isunplayed": lambda i: not i["UserData"]["Played"],
                      "isresumable": lambda i: i["UserData"]["PlaybackPositionTicks"] > 0,
                      "likes": lambda i: i["UserData"].get("Likes") is True,
                      "dislikes": lambda i: i["UserData"].get("Likes") is False}
        for value in query.csv("Filters"):
            if value.casefold() not in predicates:
                raise ValueError("Unsupported Filters value: " + value)
            candidates = [i for i in candidates if predicates[value.casefold()](i)]
        sorters = {"name": lambda i: i["Name"].casefold(), "sortname": lambda i: i["SortName"].casefold(),
                   "album": lambda i: i.get("Album", "").casefold(), "albumartist": lambda i: i.get("AlbumArtist", "").casefold(),
                   "artist": lambda i: ",".join(i.get("Artists", [])).casefold(),
                   "playcount": lambda i: i["UserData"]["PlayCount"], "dateplayed": lambda i: i["UserData"].get("LastPlayedDate", ""),
                   "runtime": lambda i: i.get("RunTimeTicks", 0), "random": lambda i: stable_id("random:" + i["Id"])}
        for key in ("DateCreated", "PremiereDate", "ProductionYear", "ParentIndexNumber", "IndexNumber", "CommunityRating",
                    "CriticRating", "Budget", "Revenue", "DateLastMediaAdded"):
            sorters[key.lower()] = lambda i, k=key: i.get(k, "" if "Date" in k else 0)
        sorts = query.csv("SortBy")
        orders = query.csv("SortOrder") or ["Ascending"]
        if any(o.casefold() not in ("ascending", "descending") for o in orders):
            raise ValueError("SortOrder must be Ascending or Descending")
        for index in reversed(range(len(sorts))):
            key = sorts[index].lower()
            if key not in sorters:
                raise ValueError("Unsupported SortBy: " + sorts[index])
            order = orders[min(index, len(orders) - 1)].casefold()
            candidates.sort(key=sorters[key], reverse=order == "descending")
        total = len(candidates)
        start, limit = query.integer("StartIndex", 0), query.integer("Limit")
        return {"Items": candidates[start:] if limit is None else candidates[start:start + limit],
                "TotalRecordCount": total, "StartIndex": start}

    def close(self):
        self.release.set()
        with self.lock:
            if self.log_file:
                self.log_file.close()
                self.log_file = None


class FixtureServer(ThreadingHTTPServer):
    daemon_threads = True
    allow_reuse_address = True

    def __init__(self, address, fixture):
        host = address[0]
        if host == "localhost":
            address = ("127.0.0.1", address[1])
        elif not ipaddress.ip_address(host).is_loopback:
            raise ValueError("Fixture binds only to loopback addresses")
        if ":" in address[0]:
            self.address_family = socket.AF_INET6
        self.fixture = fixture
        super().__init__(address, Handler)

    def server_close(self):
        self.fixture.release.set()
        super().server_close()
        self.fixture.close()


class Handler(BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.1"
    server_version = "SyntheticJellyfin/1"
    sys_version = ""

    def log_message(self, *args):
        pass  # Avoid logging authentication query parameters through BaseHTTPRequestHandler.

    @property
    def fixture(self):
        return self.server.fixture

    def reply(self, status, value=None, content_type="application/json", headers=None):
        data = value if isinstance(value, bytes) else (b"" if value is None else json.dumps(value, ensure_ascii=False).encode())
        self.response_status = status
        self.send_response(status)
        self.send_header("Content-Type", content_type)
        self.send_header("Content-Length", str(len(data)))
        self.send_header("Cache-Control", "no-store")
        self.send_header("X-Synthetic-Fixture", "finamp-morphe-v1")
        self.send_header("X-Content-Type-Options", "nosniff")
        for key, value in (headers or {}).items():
            self.send_header(key, value)
        self.end_headers()
        if self.command != "HEAD" and status != 304:
            self.wfile.write(data)

    def body(self):
        if self.headers.get("Transfer-Encoding"):
            raise ValueError("Chunked request bodies are unsupported")
        length = int(self.headers.get("Content-Length", "0"))
        if not 0 <= length <= 1_048_576:
            raise ValueError("Request body exceeds 1 MiB")
        value = json.loads(self.rfile.read(length)) if length else {}
        if not isinstance(value, dict):
            raise ValueError("Expected a JSON object")
        return value

    def local_control(self):
        host = self.headers.get("Host", "")
        try:
            hostname = urlsplit("http://" + host).hostname
            valid_host = hostname == "localhost" or ipaddress.ip_address(hostname or "0.0.0.0").is_loopback
        except ValueError:
            valid_host = False
        return (ipaddress.ip_address(self.client_address[0]).is_loopback and valid_host
                and not self.headers.get("Origin")
                and hmac.compare_digest(self.headers.get("X-Fixture-Control", ""), self.fixture.control_token))

    def control(self, path, query):
        if not self.local_control():
            return self.reply(403, {"error": "Loopback Host, no Origin, and X-Fixture-Control token required"})
        if self.command == "GET" and path == "/_fixture":
            return self.reply(200, self.fixture.manifest(self.server.server_port, self.server.server_address[0]))
        if self.command == "GET" and path == "/_fixture/requests":
            since = query.integer("Since", 0)
            with self.fixture.lock:
                result = {"requests": copy.deepcopy([r for r in self.fixture.records if r["id"] > since]),
                          "lastId": self.fixture.sequence, "pending": self.fixture.pending,
                          "mode": self.fixture.mode, "scope": self.fixture.scope,
                          "retained": len(self.fixture.records), "capacity": 5000}
            return self.reply(200, result)
        if self.command == "POST" and path == "/_fixture/control":
            self.fixture.configure(self.body())
            return self.reply(200, {"mode": self.fixture.mode, "scope": self.fixture.scope,
                                    "holdTimeoutSeconds": self.fixture.hold_timeout})
        if self.command == "POST" and path == "/_fixture/release":
            self.body()
            self.fixture.configure({"mode": "off"})
            return self.reply(200, {"mode": "off", "released": True})
        if self.command == "DELETE" and path == "/_fixture/requests":
            with self.fixture.lock:
                self.fixture.records.clear()
            return self.reply(204)
        return self.reply(404, {"error": "Unknown fixture control route"})

    def stream(self, item_id):
        data = self.fixture.audio.get(item_id)
        if data is None:
            return self.reply(404, {"error": "Unknown synthetic audio"})
        etag = '"' + stable_id("wav:" + item_id) + '"'
        headers = {"Accept-Ranges": "bytes", "ETag": etag}
        if self.headers.get("If-None-Match") == etag:
            return self.reply(304, headers=headers)
        requested = self.headers.get("Range")
        if requested and self.headers.get("If-Range", etag) == etag:
            match = re.fullmatch(r"bytes=(\d*)-(\d*)", requested)
            if not match or not any(match.groups()):
                return self.reply(416, headers={"Content-Range": "bytes */%d" % len(data)})
            first, last = match.groups()
            start = int(first) if first else max(0, len(data) - int(last))
            end = min(int(last), len(data) - 1) if first and last else len(data) - 1
            if start >= len(data) or end < start:
                return self.reply(416, headers={"Content-Range": "bytes */%d" % len(data)})
            headers["Content-Range"] = "bytes %d-%d/%d" % (start, end, len(data))
            return self.reply(206, data[start:end + 1], "audio/wav", headers)
        return self.reply(200, data, "audio/wav", headers)

    def item(self, item_id):
        with self.fixture.lock:
            return copy.deepcopy(self.fixture.items.get(item_id))

    def route(self, path, query, record):
        read = self.command in ("GET", "HEAD")
        parts = path.strip("/").split("/")
        if read and path in ("/system/info/public", "/system/info"):
            address = self.fixture.manifest(self.server.server_port, self.server.server_address[0])["baseUrl"]
            return self.reply(200, {"LocalAddress": address,
                                    "ServerName": "Finamp Synthetic Fixture", "Version": "10.10.7",
                                    "ProductName": "Jellyfin Server", "OperatingSystem": "Synthetic",
                                    "Id": SERVER_ID, "StartupWizardCompleted": True})
        if read and path == "/system/endpoint":
            return self.reply(200, {"IsLocal": True, "IsInNetwork": True})
        if read and path == "/quickconnect/enabled":
            return self.reply(200, False)
        if read and path == "/users/public":
            return self.reply(200, [fixture_user()])
        if self.command == "POST" and path == "/users/authenticatebyname":
            body = self.body()
            normalized = {k.casefold(): v for k, v in body.items()}
            if normalized.get("username", "") != "fixture" or normalized.get("pw", "") not in ("", None):
                return self.reply(401, {"error": "Use synthetic username fixture with an empty password"})
            return self.reply(200, {"User": fixture_user(), "SessionInfo": fixture_session(),
                                    "AccessToken": ACCESS_TOKEN, "ServerId": SERVER_ID})
        if read and path in ("/users/me", "/users/" + USER_ID):
            return self.reply(200, fixture_user())
        if read and (path == "/users/" + USER_ID + "/views" or path == "/library/virtualfolders"):
            library = self.item(LIBRARY_ID)
            if path == "/library/virtualfolders":
                return self.reply(200, [{"Name": library["Name"], "ItemId": LIBRARY_ID, "CollectionType": "music", "Locations": []}])
            return self.reply(200, {"Items": [library], "TotalRecordCount": 1, "StartIndex": 0})
        if read and path in ("/items", "/users/" + USER_ID + "/items"):
            if not self.fixture.gate(query, record):
                return self.reply(503, {"error": "Synthetic unbounded-track gate", "requestId": record["id"]}, headers={"Retry-After": "1"})
            return self.reply(200, self.fixture.snapshot(query))
        if read and path in ("/artists", "/artists/albumartists", "/albumartists", "/genres", "/musicgenres"):
            kind = "MusicGenre" if "genres" in path else "MusicArtist"
            if path in ("/artists/albumartists", "/albumartists"):
                query.values["_albumartists"] = ["true"]
            return self.reply(200, self.fixture.snapshot(query, kind))
        if read and path in ("/items/latest", "/users/" + USER_ID + "/items/latest"):
            query.values.setdefault("includeitemtypes", ["MusicAlbum"])
            query.values.setdefault("sortby", ["DateCreated"])
            query.values.setdefault("sortorder", ["Descending"])
            query.values.setdefault("limit", ["20"])
            return self.reply(200, self.fixture.snapshot(query)["Items"])
        if read and path == "/items/counts":
            # Counts describe all matches even when a caller sends pagination.
            query.values.pop("limit", None)
            query.values.pop("startindex", None)
            items = self.fixture.snapshot(query)["Items"]
            return self.reply(200, {"SongCount": sum(i["Type"] == "Audio" for i in items),
                                    "AlbumCount": sum(i["Type"] == "MusicAlbum" for i in items),
                                    "ArtistCount": sum(i["Type"] == "MusicArtist" for i in items),
                                    "MusicVideoCount": 0, "MovieCount": 0, "SeriesCount": 0, "EpisodeCount": 0,
                                    "TrailerCount": 0, "ProgramCount": 0})
        if len(parts) == 4 and parts[:2] == ["users", USER_ID] and parts[2] == "items" and read:
            item = self.item(parts[3])
            return self.reply(200, item) if item else self.reply(404, {"error": "Unknown synthetic item"})
        if len(parts) >= 2 and parts[0] == "items":
            item_id = parts[1]
            item = self.item(item_id)
            if item is None:
                return self.reply(404, {"error": "Unknown synthetic item"})
            if len(parts) == 2 and read:
                return self.reply(200, item)
            if len(parts) == 3 and parts[2] == "file" and read:
                return self.stream(item_id)
            if len(parts) == 4 and parts[2:] == ["images", "primary"] and read:
                return self.reply(200, self.fixture.png, "image/png")
            if len(parts) == 3 and parts[2] == "playbackinfo" and (read or self.command == "POST"):
                if self.command == "POST":
                    self.body()
                if item["Type"] != "Audio":
                    return self.reply(400, {"error": "PlaybackInfo requires synthetic Audio"})
                return self.reply(200, {"MediaSources": item["MediaSources"], "PlaySessionId": SESSION_ID})
            if len(parts) == 3 and parts[2] == "instantmix" and read:
                query.values["includeitemtypes"] = ["Audio"]
                query.values.setdefault("limit", ["8"])
                return self.reply(200, self.fixture.snapshot(query))
        if len(parts) == 3 and parts[0] == "audio" and read:
            if parts[2] in ("stream", "stream.wav", "universal"):
                return self.stream(parts[1])
            if parts[2] == "lyrics" and parts[1] in TRACK_IDS:
                return self.reply(200, {"Metadata": {"IsSynced": False}, "Lyrics": []})
            if parts[2] == "main.m3u8":
                return self.reply(501, {"error": "HLS/transcoding unsupported; select original streaming in Finamp"})
        if len(parts) == 3 and parts[0] == "albums" and parts[1] == ALBUM_ID and parts[2] == "similar" and read:
            return self.reply(200, {"Items": [], "TotalRecordCount": 0, "StartIndex": 0})
        if len(parts) == 4 and parts[:2] == ["users", USER_ID] and parts[2] == "favoriteitems":
            if self.command in ("POST", "DELETE"):
                self.body()
                with self.fixture.lock:
                    item = self.fixture.items.get(parts[3])
                    if item:
                        item["UserData"]["IsFavorite"] = self.command == "POST"
                        result = copy.deepcopy(item["UserData"])
                return self.reply(200, result) if item else self.reply(404, {"error": "Unknown synthetic item"})
        if read and path == "/sessions":
            return self.reply(200, [fixture_session()])
        if self.command == "POST" and path in ("/sessions/capabilities", "/sessions/capabilities/full", "/sessions/playing",
                                               "/sessions/playing/progress", "/sessions/playing/stopped", "/sessions/logout"):
            body = self.body()
            if path.startswith("/sessions/playing"):
                with self.fixture.lock:
                    item = self.fixture.items.get(body.get("ItemId"))
                    if item and item["Type"] == "Audio":
                        data = item["UserData"]
                        position = body.get("PositionTicks", 0)
                        if isinstance(position, bool) or not isinstance(position, int) or position < 0:
                            raise ValueError("PositionTicks must be a nonnegative integer")
                        data["PlaybackPositionTicks"] = min(position, RUNTIME_TICKS)
                        data["LastPlayedDate"] = now()
                        if path == "/sessions/playing":
                            data["PlayCount"] += 1
                        if position >= RUNTIME_TICKS * 0.9:
                            data.update(Played=True, PlayedPercentage=100, PlaybackPositionTicks=0)
            return self.reply(204)
        return self.reply(404, {"error": "Unsupported synthetic route", "path": path, "method": self.command})

    def handle_request(self):
        start = time.monotonic()
        record = None
        self.response_status = 500
        try:
            parsed = urlsplit(self.path)
            path = unquote(parsed.path).rstrip("/").lower() or "/"
            query = Query(parsed.query)
            if path == "/_fixture" or path.startswith("/_fixture/"):
                self.control(path, query)
                return
            for prefix in ("/jellyfin", "/emby"):
                if path.startswith(prefix + "/"):
                    path = path[len(prefix):]
                    break
            record = self.fixture.record(self.command, path, query)
            self.route(path, query, record)
        except (ValueError, UnicodeError) as error:
            self.close_connection = True
            self.reply(400, {"error": str(error) if not isinstance(error, json.JSONDecodeError) else "Invalid JSON"})
        except (BrokenPipeError, ConnectionResetError, TimeoutError):
            if record:
                self.fixture.update_record(record, disconnected=True)
        finally:
            if record:
                self.fixture.update_record(record, state="completed", status=self.response_status,
                                           elapsedMs=round((time.monotonic() - start) * 1000, 3))

    do_GET = handle_request
    do_HEAD = handle_request
    do_POST = handle_request
    do_DELETE = handle_request


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--host", default="127.0.0.1", help="loopback address only (default: 127.0.0.1)")
    parser.add_argument("--port", type=int, default=18961, help="HTTP port; 0 chooses a free port (default: 18961)")
    parser.add_argument("--data-dir", type=Path, help="explicit output directory for manifest.json, WAVs, requests.jsonl; default: memory only")
    parser.add_argument("--unbounded-mode", choices=("off", "hold", "reject"), default="off")
    parser.add_argument("--profile", choices=("credits", "navigation", "player"), default="credits")
    parser.add_argument("--unbounded-scope", choices=("artist", "all"), default="artist")
    parser.add_argument("--hold-timeout", type=float, default=120, help="hold ceiling in seconds, 0.1..300 (default: 120)")
    args = parser.parse_args(argv)
    if not 0 <= args.port <= 65535 or not 0.1 <= args.hold_timeout <= 300:
        parser.error("Invalid port or hold timeout")
    fixture = Fixture(mode=args.unbounded_mode, scope=args.unbounded_scope, hold_timeout=args.hold_timeout,
                      data_dir=args.data_dir, profile=args.profile)
    try:
        server = FixtureServer((args.host, args.port), fixture)
    except (ValueError, OSError):
        fixture.close()
        raise
    manifest = fixture.manifest(server.server_port, server.server_address[0])
    if fixture.data_dir:
        manifest_path = fixture.data_dir / "manifest.json"
        manifest_path.touch(mode=0o600, exist_ok=True)
        manifest_path.chmod(0o600)
        manifest_path.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(manifest, indent=2), flush=True)
    print("Use adb reverse tcp:%d tcp:%d; log in as fixture with an empty password." % (server.server_port, server.server_port), flush=True)
    try:
        server.serve_forever(poll_interval=0.2)
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()


if __name__ == "__main__":
    main()
