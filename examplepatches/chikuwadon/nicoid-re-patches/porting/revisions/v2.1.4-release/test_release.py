#!/usr/bin/env python3
"""Verify reviewed v2.1.4-dev.3 sources and approved release configuration."""
from pathlib import Path
import hashlib
import json
import re

ROOT = Path(__file__).resolve().parents[3]
def contents(path):
    return (ROOT / path).read_text(encoding="utf-8")

assert re.search(r"(?m)^version\s*=\s*2\.1\.4\s*$", contents("gradle.properties"))
notes = contents(".github/release-notes/v2.1.4.md")
assert notes.startswith("## 2.1.4")
assert "### 🐛 Bug Fixes" in notes and "### 🔧 Improvements" in notes
assert "### ✨ New Features" not in notes
assert "scrolling comments" in notes and "across successive frames" in notes

# Git blob identities recorded in the reviewed handoff's final cumulative patch.
approved = {
    "v2.1.4-dev.1/stage_candidate.py": "7ae85e4",
    "v2.1.4-dev.2/stage_candidate.py": "3b858f2",
    "v2.1.4-dev.3/stage_candidate.py": "6cbfc94",
    "v2.1.4-dev.3/java/e/e/a/CommentSource280.java": "4b8eef8",
    "v2.1.4-dev.3/java/e/e/a/ScrollingComments267.java": "6bb4442",
    "v2.1.4-dev.3/java/e/e/a/ScrollingTimeline267.java": "17c6496",
    "v2.1.4-dev.3/tests/CommentBudgetRegression.java": "8f33076",
}
for name, expected in approved.items():
    blob = (ROOT / "porting/revisions" / name).read_bytes()
    actual = hashlib.sha1(b"blob " + str(len(blob)).encode() + b"\0" + blob).hexdigest()
    assert actual.startswith(expected), (name, actual, expected)

script = contents(".github/scripts/stage-v2.1.4-mpp.sh")
assert script.count("sha256sum -c -") >= 1
assert "reconstruct_dev3.py" in script
reconstructor = contents("porting/revisions/v2.1.4-release/reconstruct_dev3.py")
assert "reconstructed v2.1.4-dev.3 byte-identical" in reconstructor
assert "37d04536d8bbc4ee94f1a2909ea58b50a3f30c441929373df19e73f0a48f6e76" in reconstructor
approved_binary_deltas = {
    "reviewed-dev3-helpers.zst": "587da0eea65401ea654377685c53cdc8c6360f91aee460a4c34b5574571b87f0",
    "reviewed-dev3-native.zst": "cfa626733ac8d83993acf05fc7ef1a4fd7c51d715681646ff6bca8c6cb4713d4",
}
for filename, expected_sha in approved_binary_deltas.items():
    source = ROOT / "porting/revisions/v2.1.4-release" / filename
    assert hashlib.sha256(source.read_bytes()).hexdigest() == expected_sha, filename
assert "patches-2.1.3.mpp" in script
assert "37d04536d8bbc4ee94f1a2909ea58b50a3f30c441929373df19e73f0a48f6e76" in reconstructor
assert "verify_android_mpp.py" in script

stage = contents("porting/revisions/v2.1.4-release/stage_candidate.py")
assert "VERSION_OWNERS" in stage and "ModernShorts.smali" in stage
assert "REVIEWED_SHA256" in stage and "Unapproved output entry difference" in stage
assert "extensions/extension.mpe" in stage and "Non-version extension Smali change detected" in stage
assert """Path("e/e/a/ModernShorts.smali"): ('"v2.1.3 @chikuwadon"', '"v2.1.4 @chikuwadon"', 2)""" in stage
assert "require(value.count(old) == count" in stage
assert "require(ext_text.count(from_banner) == 2" in stage
builder = contents("patches/build.gradle.kts")
assert 'val jvmPatchJar = tasks.register<Jar>("jvmPatchJar")' in builder
assert 'dependsOn(jvmPatchJar)' in builder
assert 'tasks.named<Jar>("jar") {' not in builder
assert 'project.version.toString() != "2.1.4"' in builder
for name in (".github/workflows/release.yml", ".github/workflows/verify-main.yml", ".releaserc"):
    assert "stage-v2.1.4-mpp.sh" in contents(name), name
assert 'if version == "2.1.4":' in contents(".github/scripts/verify-release-mpp.py")
assert json.loads(contents("patches-bundle.json"))["version"] in ("2.1.3", "2.1.4")
print("PASS: reviewed v2.1.4-dev.3 source, safe version-only staging and release gates")
