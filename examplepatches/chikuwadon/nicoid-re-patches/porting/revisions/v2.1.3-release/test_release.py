#!/usr/bin/env python3
"""v2.1.3 hotfix release contract, including the Morphe Android DEX guard."""
from pathlib import Path
import json
import re
import sys
ROOT = Path(__file__).resolve().parents[3]
assert re.search(r"(?m)^version\s*=\s*2\.1\.3\s*$", (ROOT/"gradle.properties").read_text())
notes = (ROOT/".github/release-notes/v2.1.3.md").read_text()
assert notes.startswith("## 2.1.3")
assert notes.count("### 🐛 Bug Fixes") == 1
assert "### ✨ New Features" not in notes and "### 🔧 Improvements" not in notes
assert sum(line.startswith("* **nicoid:**") for line in notes.splitlines()) == 1
assert "0 available patches" in notes
stage = (ROOT/"porting/revisions/v2.1.3-release/stage_candidate.py").read_text()
assert 'stage.CANDIDATE_VERSION = VERSION' in stage
assert 'validate_mpp(compiled, VERSION)' in stage
assert 'validate_mpp(output, VERSION)' in stage
builder = (ROOT/"patches/build.gradle.kts").read_text()
assert 'dependsOn(jvmPatchJar)' in builder
assert 'val jvmPatchJar = tasks.register<Jar>("jvmPatchJar")' in builder
assert 'tasks.named<Jar>("jar") {' not in builder
assert 'destinationDirectory.set(layout.buildDirectory.dir("jvm-libs"))' in builder
assert 'project.version.toString() != "2.1.3"' in builder
for name in (".github/workflows/release.yml", ".github/workflows/verify-main.yml", ".releaserc"):
    assert "stage-v2.1.3-mpp.sh" in (ROOT/name).read_text(), name
for name in ("patches-list.json", "patches-bundle.json"):
    assert json.loads((ROOT/name).read_text())["version"] in ("2.1.2", "2.1.3")
sys.path.insert(0, str(ROOT/".github/scripts"))
from verify_android_mpp import validate_manager_dex
try:
    validate_manager_dex(b"PK\\x03\\x04jvm jar")
except ValueError:
    pass
else:
    raise AssertionError("JVM archive was accepted as Android DEX")
print("PASS: v2.1.3 hotfix notes, staged Android DEX, isolated JVM jar, and release gates")
