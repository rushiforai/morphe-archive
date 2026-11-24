#!/usr/bin/env python3
"""Validate the approved release sources and user-facing notes."""
from pathlib import Path
import importlib.util
import re
ROOT = Path(__file__).resolve().parents[3]
def load(path):
    return (ROOT / path).read_text(encoding="utf-8")
assert re.search(r"(?m)^version\s*=\s*2\.1\.9\s*$", load("gradle.properties"))
notes = load(".github/release-notes/v2.1.9.md")
assert notes.startswith("## 2.1.9\n")
assert notes.count("* **nicoid:** ") == 20
assert notes.index("### ✨ New Features") < notes.index("### 🐛 Bug Fixes") < notes.index("### 🔧 Improvements")
for marker in ("temporary app caches", "playlist sorting", "unintended storage location",
               "scrolling-comment rendering", "Update bundled libraries"):
    assert marker in notes, marker
for marker in ("Morphe Patcher", "Gradle", "Guava", "failureaccess", "ExifInterface",
               "Easter Egg", "easter egg", "BikeRun", "Bicycle Run", "自転車ラン"):
    assert marker not in notes, marker
path = ROOT / "porting/revisions/v2.1.9-release/stage_candidate.py"
spec = importlib.util.spec_from_file_location("stable219", path)
assert spec and spec.loader
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)
mod.verify_inputs()
assert sum(sum(v.values()) for v in mod.CHANGES.values()) == 5
assert sum(v[0] for v in mod.STABLE_SMALI.values()) == 9863
for name in (".github/workflows/release.yml", ".github/workflows/verify-main.yml", ".releaserc"):
    assert "stage-v2.1.9-mpp.sh" in load(name), name
assert 'if version == "2.1.9":' in load(".github/scripts/verify-release-mpp.py")
assert 'project.version.toString() != "2.1.9"' in load("patches/build.gradle.kts")
print("PASS: approved v2.1.9 release notes, locked reviewed source and stable class contract")
