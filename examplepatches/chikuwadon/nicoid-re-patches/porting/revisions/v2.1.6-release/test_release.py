#!/usr/bin/env python3
"""Check reviewed v2.1.6 sources, release notes and publication safeguards."""
from pathlib import Path
import hashlib
import re
ROOT = Path(__file__).resolve().parents[3]
def read(path):
    return (ROOT / path).read_text(encoding="utf-8")
assert re.search(r"(?m)^version\s*=\s*2\.1\.6\s*$", read("gradle.properties"))
notes = read(".github/release-notes/v2.1.6.md")
assert notes.startswith("## 2.1.6")
for section in ("### 🐛 Bug Fixes", "### 🔧 Improvements"):
    assert section in notes
for rejected in ("Add detailed comment presentation diagnostics", "Record comment Canvas lock", "Simplify the Prevent comments from overlapping"):
    assert rejected not in notes
for required in ("Surface.lockHardwareCanvas()", "[#181]", "[#122]", "Default playback speed", "Media3 network failures"):
    assert required in notes
for line in notes.splitlines():
    if line.startswith("* **nicoid:** "):
        assert "**" not in line[len("* **nicoid:** "):]
target = ROOT / "porting/revisions/v2.1.6-dev.5/stage_candidate.py"
blob = target.read_bytes()
sha = hashlib.sha1(b"blob " + str(len(blob)).encode() + b"\0" + blob).hexdigest()
assert sha == "8121c476d3e9c83f43441114f238f2444ec6aa67", sha
stage = read(".github/scripts/stage-v2.1.6-mpp.sh")
assert "8121c476d3e9c83f43441114f238f2444ec6aa67" in stage
assert "51a52358d568eb530075644e65ec7b3b2346c793bdf91a6ae3e93ba3fcfb700b" in stage
assert 'script.count("2.1.6-dev.5") != 1' in stage
assert "2[.]1[.]6[[:space:]]*$" in stage
assert "2[.]1[.]5[[:space:]]*$" not in stage
assert 'script.replace("2.1.6-dev.5", "2.1.6")' in stage
for path in (".github/workflows/release.yml", ".github/workflows/verify-main.yml", ".releaserc"):
    assert "stage-v2.1.6-mpp.sh" in read(path)
assert 'if version == "2.1.6":' in read(".github/scripts/verify-release-mpp.py")
assert 'project.version.toString() != "2.1.6"' in read("patches/build.gradle.kts")
print("PASS: reviewed v2.1.6-dev.5 implementation locked for stable release")
