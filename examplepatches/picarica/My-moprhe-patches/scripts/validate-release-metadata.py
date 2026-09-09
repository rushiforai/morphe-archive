#!/usr/bin/env python3
import json
import re
from datetime import datetime
from pathlib import Path

root = Path(__file__).resolve().parent.parent
properties = (root / "gradle.properties").read_text(encoding="utf-8")
version_match = re.search(r"^version = (.+)$", properties, re.MULTILINE)
if version_match is None:
    raise SystemExit("gradle.properties has no version")
version = version_match.group(1)

bundle = json.loads((root / "patches-bundle.json").read_text(encoding="utf-8"))
patch_list = json.loads((root / "patches-list.json").read_text(encoding="utf-8"))
mpp = root / "patches" / "build" / "libs" / f"patches-{version}.mpp"
changelog = root / "CHANGELOG.md"

expected_url = (
    "https://github.com/picarica/My-moprhe-patches/releases/download/"
    f"v{version}/patches-{version}.mpp"
)

assert bundle["version"] == version, "patches-bundle.json version is stale"
assert bundle["download_url"] == expected_url, "patches-bundle.json URL is stale"
assert patch_list["version"] == version, "patches-list.json version is stale"
assert mpp.is_file() and mpp.stat().st_size > 1_000, f"MPP is missing: {mpp}"
assert changelog.is_file() and f"## [{version}]" in changelog.read_text(encoding="utf-8"), (
    "CHANGELOG.md has no entry for the current version"
)

# Third-party JsonPatchBundle metadata is deserialized by Morphe Manager directly
# into kotlinx.datetime.LocalDateTime. It must not contain Z or a UTC offset.
created_at = bundle["created_at"]
parsed = datetime.fromisoformat(created_at)
assert parsed.tzinfo is None, "created_at must be a timezone-less LocalDateTime"
assert re.fullmatch(r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}", created_at), (
    "created_at must use YYYY-MM-DDTHH:MM:SS"
)

assert len(patch_list["patches"]) == 1, "expected exactly one published patch"
patch = patch_list["patches"][0]
assert patch["name"] == "Remove Google requirements"
compatibility = patch["compatiblePackages"][0]
assert compatibility["packageName"] == "app.affine.pro"
assert compatibility["apkFileType"] == "XAPK_REQUIRED"
assert len(compatibility["signatures"]) == 2
target = compatibility["targets"][0]
assert target["version"] == "0.27.4"
assert target["versionCodes"]["ARM64_V8A"] == 439

print(f"Release metadata is consistent for v{version}.")
