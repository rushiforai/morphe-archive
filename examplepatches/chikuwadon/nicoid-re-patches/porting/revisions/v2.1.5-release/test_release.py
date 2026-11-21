#!/usr/bin/env python3
"""Verify approved reviewed v2.1.5 source and stable publication gates."""
from pathlib import Path
import hashlib
import json
import re
ROOT = Path(__file__).resolve().parents[3]
def read(path):
    return (ROOT / path).read_text(encoding="utf-8")
assert re.search(r"(?m)^version\s*=\s*2\.1\.5\s*$", read("gradle.properties"))
notes = read(".github/release-notes/v2.1.5.md")
assert notes.startswith("## 2.1.5")
for section in ("### ✨ New Features", "### 🐛 Bug Fixes", "### 🔧 Improvements"):
    assert section in notes
for forbidden in ("directly below Playback queue", "30dp icons", "Strengthen development MPP packaging"):
    assert forbidden not in notes
for required in ("Select multiple", "Select all", "NicoReport", "Choreographer.FrameCallback"):
    assert required in notes
for line in notes.splitlines():
    if line.startswith("* **nicoid:** "):
        assert "**" not in line[len("* **nicoid:** "):], "Unnecessary bold in release description"
approved = {
    "porting/revisions/v2.1.5-dev.17/stage_candidate.py": "279e924b826960f71190587a8044ad3ecd98fcb8",
    "porting/revisions/v2.1.5-dev.17/BulkVideoActions215.java": "bb3f78273893dc384cafeed1321f8a3f653952f6",
    "porting/revisions/v2.1.5-dev.17/LocalePatch215.java": "a5744f8ac03f5a7fed36a24474a09c2b2793a42b",
    "porting/revisions/v2.1.5-dev.11/CommentFrames.java": "9b4c8b081e0184bde5f7cd91a8dc0bf61ca80aec",
    "porting/revisions/v2.1.5-dev.11/Media3Diagnostics276.java": "1e90e4ae9bf3790ce357811493e0253373b03c36",
}
for name, expected in approved.items():
    contents = (ROOT / name).read_bytes()
    actual = hashlib.sha1(b"blob " + str(len(contents)).encode() + b"\0" + contents).hexdigest()
    assert actual == expected, (name, actual)
stage = read(".github/scripts/stage-v2.1.5-mpp.sh")
assert "279e924b826960f71190587a8044ad3ecd98fcb8" in stage
assert "58c9d990d36d9f05e58e29bcb4ad45da8a435a16c8f4a649d82d02a538995df4" in stage
assert 'script.count("2.1.5-dev.17") != 4' in stage
assert 'script.replace("2.1.5-dev.17", "2.1.5")' in stage
for name in (".github/workflows/release.yml", ".github/workflows/verify-main.yml", ".releaserc"):
    assert "stage-v2.1.5-mpp.sh" in read(name)
assert 'if version == "2.1.5":' in read(".github/scripts/verify-release-mpp.py")
assert 'project.version.toString() != "2.1.5"' in read("patches/build.gradle.kts")
assert json.loads(read("patches-bundle.json"))["version"] in ("2.1.4", "2.1.5")
print("PASS: approved v2.1.5 source, release note and guarded staging")
