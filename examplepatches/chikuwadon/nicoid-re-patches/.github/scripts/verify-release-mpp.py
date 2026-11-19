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

ROOT = Path(__file__).resolve().parents[2]
REQUIRED = (
    "META-INF/MANIFEST.MF",
    "nicoid/helpers.mpe",
    "nicoid/method-delta.dex",
    "nicoid/resources.zip",
    "nicoid/input-hashes.txt",
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
            manifest = archive.read("META-INF/MANIFEST.MF")
            require(("Version: " + version).encode() in manifest, "Wrong MPP manifest version")
            helpers = archive.read("nicoid/helpers.mpe")
            native = archive.read("nicoid/method-delta.dex")
            require(helpers.startswith(b"dex\n"), "Invalid helper DEX signature")
            require(native.startswith(b"dex\n"), "Invalid native DEX signature")
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
