#!/usr/bin/env python3
"""Freeze the staged release MPP before upload and verify the published bytes."""
from __future__ import annotations

import hashlib
import json
import os
import re
import sys
import tempfile
from pathlib import Path
from zipfile import BadZipFile, ZipFile
from verify_android_mpp import validate_manager_dex

ROOT = Path(__file__).resolve().parents[2]
REQUIRED = (
    "classes.dex",
    "META-INF/MANIFEST.MF",
    "nicoid/helpers.mpe",
    "nicoid/method-delta.dex",
    "nicoid/resources.zip",
    "nicoid/input-hashes.txt",
)
V212_MARKERS = (
    b"PlaylistBackup213",
    b"AppResume253",
    b"ResumeModes272",
    b"Media3Diagnostics276",
    b"AmbientCard217",
    b"NativeMylistMove215",
    b"TabFolderNav214",
)
V211_MARKERS = (
    b"NativeMylistMove215",
    b"TabFolderNav214",
    b"AmbientCard217",
    b"MoveConfirm212",
    b"BulkMove211",
)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def sha256(blob: bytes) -> str:
    return hashlib.sha256(blob).hexdigest()


def inspect(bundle: Path, version: str, baseline: Path | None = None) -> dict:
    require(bool(re.fullmatch(r"\d+\.\d+\.\d+", version)), "Invalid stable release version")
    require(bundle.is_file(), f"Missing MPP: {bundle}")
    require(bundle.stat().st_size > 0, f"Empty MPP: {bundle}")
    try:
        with ZipFile(bundle) as archive:
            require(archive.testzip() is None, "Corrupt release MPP ZIP")
            missing = set(REQUIRED) - set(archive.namelist())
            require(not missing, f"Missing MPP entries: {sorted(missing)}")
            manager_dex = archive.read("classes.dex")
            validate_manager_dex(manager_dex)
            manifest = archive.read("META-INF/MANIFEST.MF")
            require(("Version: " + version).encode() in manifest, "Wrong MPP manifest version")
            helpers = archive.read("nicoid/helpers.mpe")
            native = archive.read("nicoid/method-delta.dex")
            require(helpers.startswith(b"dex\n"), "Invalid helper DEX signature")
            require(native.startswith(b"dex\n"), "Invalid native DEX signature")
            if version == "2.1.8":
                require(b"2.1.8" in helpers, "v2.1.8 runtime version missing")
                require(b"2.1.8-dev.2" not in helpers, "Development version leaked into stable helpers")
                require(b"v2.1.8 @chikuwadon" in helpers, "Shorts helper version not promoted")
                require(b"v2.1.7 @chikuwadon" not in helpers, "Previous version remains in helpers")
                extension = archive.read("extensions/extension.mpe")
                require(extension.startswith(b"dex\n"), "Invalid extension DEX")
                require(b"v2.1.8 @chikuwadon" in extension, "Extension version not promoted")
                require(b"v2.1.8-dev.2 @chikuwadon" not in extension, "Development extension metadata leaked")
                for marker in (
                    b"PausedCenter218", b"canUsePausedFrame", b"PlayerStart215",
                    b"LinkIntentPolicy217", b"NormalVideoInsets", b"FullscreenViewport209",
                    b"CommentPresentation", b"Media3Diagnostics276",
                ):
                    require(marker in helpers, f"Missing reviewed v2.1.8 helper: {marker!r}")
                require(b"v1.5.1" in helpers, "Verified scoped runtime version missing")
                require(b"tryWheelieCrush" in helpers and b"pickupStage" in helpers,
                        "Verified scoped runtime behavior missing")
                require(b"CommentPresentation" in native, "Native drawing pipeline lost")
                require(b"PausedCenter218" not in native, "Unexpected native playback changes")
            if version == "2.1.7":
                require(b"2.1.7" in helpers, "v2.1.7 runtime version missing")
                require(b"2.1.7-dev.2" not in helpers, "Development version leaked into released helper")
                require(b"2.1.7-dev.3" not in helpers, "Validated dev.3 version leaked into release")
                require(b"2.1.7-dev.1" not in helpers, "Previous development version leaked")
                require(b"v2.1.7 @chikuwadon" in helpers, "Shorts has wrong public version")
                require(b"v2.1.6 @chikuwadon" not in helpers, "Previous Shorts version remains")
                extension = archive.read("extensions/extension.mpe")
                require(extension.startswith(b"dex\n"), "Invalid extension DEX")
                require(b"v2.1.7 @chikuwadon" in extension, "Extension shows wrong version")
                require(b"v2.1.7-dev.2 @chikuwadon" not in extension, "Development extension version remains")
                require(b"v2.1.7-dev.3 @chikuwadon" not in extension, "Development extension version remains")
                for marker in (
                    b"LinkIntentPolicy217", b"CommentPresentation", b"PopupSwitch216",
                    b"ScreenOffAudio216", b"LayoutRepair216", b"SettingsDisplay216",
                    b"Media3Diagnostics276", b"NormalVideoInsets", b"FullscreenViewport209",
                ):
                    require(marker in helpers, f"Missing reviewed v2.1.7 helper: {marker!r}")
                require(b"CommentPresentation" in native, "Native drawing pipeline lost")
                require(b"LinkIntentPolicy217" not in native, "Unexpected native playback change")
                previous = baseline or ROOT / "patches/src/main/resources/nicoid/helpers.mpe"
                if previous.is_file() and b"2.1.7" not in previous.read_bytes():
                    require(sha256(helpers) != sha256(previous.read_bytes()),
                            "Staging output was replaced with published baseline")
            if version == "2.1.6":
                require(b"2.1.6" in helpers, "v2.1.6 runtime version missing")
                require(b"2.1.6-dev.5" not in helpers, "Development helper version leaked into release")
                require(b"v2.1.6 @chikuwadon" in helpers, "Shorts displays wrong version")
                require(b"v2.1.5 @chikuwadon" not in helpers, "Obsolete Shorts version")
                extension = archive.read("extensions/extension.mpe")
                require(extension.startswith(b"dex\n"), "Invalid extension DEX")
                require(b"v2.1.6 @chikuwadon" in extension, "Extension displays wrong version")
                require(b"v2.1.6-dev.5 @chikuwadon" not in extension, "Development extension version leaked")
                for marker in (
                    b"CommentPresentation", b"PopupSwitch216", b"ScreenOffAudio216",
                    b"LayoutRepair216", b"SettingsDisplay216", b"Media3Diagnostics276",
                    b"CommentFrames",
                ):
                    require(marker in helpers, f"Missing reviewed v2.1.6 helper: {marker!r}")
                require(b"CommentPresentation" in native, "Native comment presentation hooks missing")
                original = baseline or ROOT / "patches/src/main/resources/nicoid/helpers.mpe"
                if original.is_file() and b"2.1.6" not in original.read_bytes():
                    require(sha256(helpers) != sha256(original.read_bytes()),
                            "Unstaged v2.1.6 helper payload")
            if version == "2.1.5":
                require(b"2.1.5" in helpers, "v2.1.5 runtime version missing")
                require(b"2.1.5-dev.17" not in helpers, "Development version leaked into stable MPP")
                require(b"v2.1.5 @chikuwadon" in helpers, "Shorts still shows older patch version")
                require(b"v2.1.4 @chikuwadon" not in helpers, "Obsolete Shorts version")
                extension = archive.read("extensions/extension.mpe")
                require(extension.startswith(b"dex\n"), "Invalid extension DEX")
                require(b"v2.1.5 @chikuwadon" in extension, "Extension still shows older patch version")
                require(b"v2.1.5-dev.17 @chikuwadon" not in extension, "Development extension version leaked")
                for marker in (
                    b"BulkVideoActions215", b"LocalePatch215", b"CommentFrames",
                    b"CommentFpsSummary211", b"ScrollingComments267",
                    b"ScrollingTimeline267", b"Media3Diagnostics276",
                    b"LocalPlaylists", b"VideoHttpSource",
                ):
                    require(marker in helpers, f"Missing reviewed v2.1.5 helper: {marker!r}")
                original = baseline or ROOT / "patches/src/main/resources/nicoid/helpers.mpe"
                if original.is_file() and b"2.1.5" not in original.read_bytes():
                    require(sha256(helpers) != sha256(original.read_bytes()),
                            "Unstaged v2.1.5 MPP used instead of approved payload")
            if version == "2.1.4":
                require(b"2.1.4" in helpers, "v2.1.4 runtime version missing")
                require(b"2.1.4-dev.3" not in helpers, "Development version leaked into stable MPP")
                require(b"v2.1.4 @chikuwadon" in helpers, "Shorts still displays an obsolete patch version")
                require(b"v2.1.3 @chikuwadon" not in helpers, "v2.1.3 Shorts version remains")
                extension = archive.read("extensions/extension.mpe")
                require(extension.startswith(b"dex\n"), "Invalid extension DEX signature")
                require(b"v2.1.4 @chikuwadon" in extension, "Extension still has obsolete patch version")
                require(b"v2.1.3 @chikuwadon" not in extension, "v2.1.3 extension banner leaked")
                for marker in (
                    b"CommentClock", b"CommentSource280", b"ScrollingComments267",
                    b"ScrollingTimeline267", b"PageCache", b"VideoCounts$CountIcon",
                    b"Media3Diagnostics276", b"AmbientCard217", b"NativeMylistMove215",
                ):
                    require(marker in helpers, f"Missing v2.1.4 helper: {marker!r}")
                original = baseline or ROOT / "patches/src/main/resources/nicoid/helpers.mpe"
                if original.is_file() and not b"2.1.4" in original.read_bytes():
                    require(sha256(helpers) != sha256(original.read_bytes()),
                            "Unstaged v2.1.4 MPP was used instead of approved reviewed payload")
            if version == "2.1.3":
                require(b"2.1.3" in helpers, "v2.1.3 runtime version missing")
                require(b"2.1.3-dev.1" not in helpers, "Development version leaked into v2.1.3 MPP")
                require(b"2.1.0-dev.28" not in helpers, "Reviewed Media3 development version remains")
                for marker in V212_MARKERS:
                    require(marker in helpers, f"Missing v2.1.3 helper: {marker!r}")
                original = baseline or ROOT / "patches/src/main/resources/nicoid/helpers.mpe"
                if original.is_file():
                    require(sha256(helpers) != sha256(original.read_bytes()),
                            "Staged v2.1.3 helper DEX was replaced by repository baseline")
            if version == "2.1.2":
                require(b"2.1.2" in helpers, "v2.1.2 runtime version missing")
                require(b"2.1.2-dev.14" not in helpers, "Development version leaked into v2.1.2 MPP")
                require(b"2.1.0-dev.28" not in helpers, "Reviewed Media3 development version remains")
                for marker in V212_MARKERS:
                    require(marker in helpers, f"Missing v2.1.2 helper: {marker!r}")
                original = baseline or ROOT / "patches/src/main/resources/nicoid/helpers.mpe"
                if original.is_file():
                    require(sha256(helpers) != sha256(original.read_bytes()),
                            "Staged v2.1.2 helper DEX was replaced by repository baseline")
            if version == "2.1.1":
                require(b"2.1.1" in helpers, "v2.1.1 runtime version is missing")
                require(b"2.1.0-dev.28" not in helpers, "Reviewed development version remains")
                for marker in V211_MARKERS:
                    require(marker in helpers, f"Missing v2.1.1 helper: {marker!r}")
                original = baseline or ROOT / "patches/src/main/resources/nicoid/helpers.mpe"
                if original.is_file():
                    require(sha256(helpers) != sha256(original.read_bytes()),
                            "Staged v2.1.1 helper DEX was replaced by repository baseline")
    except BadZipFile as exc:
        raise ValueError("Invalid MPP archive") from exc
    return {
        "version": version,
        "sha256": sha256(bundle.read_bytes()),
        "size": bundle.stat().st_size,
        "manager_dex_sha256": sha256(manager_dex),
        "helper_sha256": sha256(helpers),
        "native_sha256": sha256(native),
    }


def lock_path(version: str) -> Path:
    location = Path(os.environ.get("RUNNER_TEMP") or tempfile.gettempdir())
    return location / f"nicoid-approved-mpp-{version}.json"


def main() -> None:
    require(len(sys.argv) in (3, 4),
            "Usage: verify-release-mpp.py <record|check> <version> [mpp-path]")
    phase, version = sys.argv[1:3]
    require(phase in ("record", "check"), "Unsupported verification phase")
    bundle = Path(sys.argv[3]) if len(sys.argv) == 4 else (
        ROOT / f"patches/build/libs/patches-{version}.mpp")
    actual = inspect(bundle, version)
    stamp = lock_path(version)
    if phase == "record":
        require(not stamp.exists(), f"Stale release lock already exists: {stamp}")
        stamp.write_text(json.dumps(actual, sort_keys=True) + "\n", encoding="utf-8")
        print(f"PASS: locked staged v{version} MPP SHA-256 {actual['sha256']}")
    else:
        require(stamp.is_file(), "Missing recorded release MPP fingerprint")
        expected = json.loads(stamp.read_text(encoding="utf-8"))
        require(actual == expected,
                f"MPP changed after approval: expected {expected}, got {actual}")
        print(f"PASS: identical approved v{version} MPP SHA-256 {actual['sha256']}")


if __name__ == "__main__":
    try:
        main()
    except (ValueError, OSError, KeyError) as exc:
        print(f"::error::{exc}", file=sys.stderr)
        raise SystemExit(1)
