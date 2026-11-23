#!/usr/bin/env python3
"""Validate public release notes and exact reviewed v2.1.8 release inputs."""
from pathlib import Path
import hashlib
import re

ROOT = Path(__file__).resolve().parents[3]
def load(path: str) -> str:
    return (ROOT / path).read_text(encoding="utf-8")
def blob_sha(path: Path) -> str:
    data = path.read_bytes()
    return hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()

assert re.search(r"(?m)^version\s*=\s*2\.1\.8\s*$", load("gradle.properties"))
notes = load(".github/release-notes/v2.1.8.md")
assert notes.startswith("## 2.1.8\n")
assert notes.count("* **nicoid:** ") == 2, "Unapproved public release notes"
assert notes.index("### 🐛 Bug Fixes") < notes.index("### 🔧 Improvements")
for required in ("central play/pause", "normal and fullscreen", "paused",
                 "another decoded video frame"):
    assert required in notes, required
for private in ("easter egg", "Easter Egg", "自転車ラン", "BikeRun", "Bicycle Run",
                "v1.5.1", "wheelie", "stomp"):
    assert private not in notes, "Private feature disclosed in release notes"
stage = ROOT / "porting/revisions/v2.1.8-dev.2/stage_candidate.py"
sync = ROOT / "porting/revisions/v2.1.8-dev.2/sync_payload.py"
snapshot = ROOT / "porting/revisions/v2.1.8-dev.2/runtime-overlay.dex.gz"
assert blob_sha(stage) == "8b10ba1255c74bebe47c121199a2a4cf0b04e920"
assert blob_sha(sync) == "a7199e106e5e56a9459df1e5495948d437ca8335"
assert hashlib.sha256(snapshot.read_bytes()).hexdigest() == "eaa769e14bb5e29f86d83f58a19bb7d2a7b1b4b5184f5cdc839d5eea846c184f"
assert stage.read_text().count("2.1.8-dev.2") == 4
assert sync.read_text().count("2.1.8-dev.2") == 1
assert "->canUsePausedFrame" in stage.read_text()
assert "SNAPSHOT_DEX_SHA" in sync.read_text()
shell = load(".github/scripts/stage-v2.1.8-mpp.sh")
for marker in ("refs/heads/main", "NICOID_OFFICIAL_RELEASE_APPROVED",
               "stage_candidate.py", "sync_payload.py", "runtime-overlay.dex.gz",
               "d7220da8b7a7b8d630160b1b17234dd471ee6a96c7da6363b912516c53177081",
               "8b10ba1255c74bebe47c121199a2a4cf0b04e920",
               "a7199e106e5e56a9459df1e5495948d437ca8335",
               "eaa769e14bb5e29f86d83f58a19bb7d2a7b1b4b5184f5cdc839d5eea846c184f",
               "stage_code = stage_code.replace(DEV, STABLE)",
               "sync_code = sync_code.replace(DEV, STABLE)"):
    assert marker in shell, marker
for item in (".github/workflows/release.yml",
             ".github/workflows/verify-main.yml", ".releaserc"):
    assert "stage-v2.1.8-mpp.sh" in load(item), item
assert 'if version == "2.1.8":' in load(".github/scripts/verify-release-mpp.py")
assert 'project.version.toString() != "2.1.8"' in load("patches/build.gradle.kts")
print("PASS: approved public v2.1.8 inputs, reviewed runtime locked")
