#!/usr/bin/env python3
"""Stage real production screens + pinned API, then run the Android framework tests.
Requires JDK 21, Maven 3.9+, network access, and about 2 GB for framework jars.
"""

from pathlib import Path
import os, shutil, subprocess, urllib.request, zipfile, io, hashlib

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
SOURCES = HERE / "src/test/java"
for name in (
    "TelegramActivity.java",
    "TelegramStyle.java",
    "TelegramSwitch.java",
    "ApplicationCredentials.java",
    "CachePolicy.java",
    "InternalAddon.java",
    "NativeAudio.java",
    "TelegramDataSource.java",
    "NativeDownloads.java",
    "TrackMetadata.java",
    "TrackNames.java",
    "TrackDetails.java",
    "FormatProbe.java",
    "AudioHeader.java",
    "Artwork.java",
    "IndexStore.java",
    "SqliteIndexStore.java",
    "TelegramIndex.java",
    "MainChannel.java",
    "LiveSearch.java",
    "ZipAlbums.java",
    "ZipDirectory.java",
    "DolbyHeader.java",
    "DolbySupport.java",
    "AlbumList.java",
    "FlacDecoder.java",
    "CueSheet.java",
    "CueAlbums.java",
    "CueAudio.java",
    "IndexTransfer.java",
    "MediaPolicy.java",
    "ChannelSponsorship.java",
    "ChannelContent.java",
    "ChannelView.java",
    "PlaybackPolicy.java",
    "Strings.java",
    "Translations.java",
    "LosslessCheck.java",
    "FileChecks.java",
    "Chromaprint.java",
    "AcoustId.java",
    "Fingerprint.java",
):
    dest = SOURCES / "app/bitchord/telegram" / name
    dest.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(
        ROOT / "extensions/telegram/src/main/java/app/bitchord/telegram" / name, dest
    )
api = ROOT / "vendor/tdlib-api/TdApi.java"
if not api.exists():
    td = Path(os.environ.get("TDLIB_ANDROID", ROOT / ".deps/tdlib"))
    api = td / "src/main/java/org/drinkless/tdlib/TdApi.java"
if not api.exists():
    raise SystemExit(
        "Missing pinned TdApi.java; run bootstrap.py or supply TDLIB_ANDROID."
    )
dest = SOURCES / "org/drinkless/tdlib/TdApi.java"
dest.parent.mkdir(parents=True, exist_ok=True)
shutil.copy2(api, dest)
# Maven does not unpack classes.jar from AAR dependencies onto the JVM classpath.
libs = HERE / "aar-libs"
libs.mkdir(exist_ok=True)
for name, path, version in [
    ("monitor", "androidx/test/monitor", "1.8.0"),
    (
        "espresso-idling-resource",
        "androidx/test/espresso/espresso-idling-resource",
        "3.7.0",
    ),
]:
    data = urllib.request.urlopen(
        f"https://dl.google.com/dl/android/maven2/{path}/{version}/{name}-{version}.aar",
        timeout=120,
    ).read()
    (libs / f"{name}.jar").write_bytes(
        zipfile.ZipFile(io.BytesIO(data)).read("classes.jar")
    )
for item in __import__("json").loads(
    (HERE / "media3-test-dependencies.json").read_text()
):
    data = urllib.request.urlopen(item["url"], timeout=120).read()
    if hashlib.sha256(data).hexdigest() != item["aar_sha256"]:
        raise RuntimeError("Media3 test artifact hash mismatch")
    (libs / (item["artifact"] + ".jar")).write_bytes(
        zipfile.ZipFile(io.BytesIO(data)).read("classes.jar")
    )
subprocess.run(["mvn", "-B", "-f", str(HERE / "pom.xml"), "test"], check=True)
