"""Check approved v2.0.5 release metadata and its source provenance."""
from pathlib import Path
import json,re
ROOT=Path(__file__).resolve().parents[3]
version=(ROOT/"gradle.properties").read_text()
notes=(ROOT/".github/release-notes/v2.0.5.md").read_text()
changelog=(ROOT/"CHANGELOG.md").read_text()
main=(ROOT/".github/workflows/verify-main.yml").read_text()
release=(ROOT/".github/workflows/release.yml").read_text()
stage=(ROOT/".github/scripts/stage-v2.0.5-mpp.sh").read_text()
build=(ROOT/"porting/revisions/v2.0.5-release/build_mpp.py").read_text()
config=json.loads((ROOT/".releaserc").read_text())
assert re.search(r"(?m)^version\s*=\s*2\.0\.5$",version)
assert 'VERSION = "2.0.5"' in build
assert "v2.0.5-dev.17" in build and "builder.VERSION=VERSION" in build
assert "NICOID_OFFICIAL_RELEASE_APPROVED" in build and "NICOID_OFFICIAL_RELEASE_APPROVED" in stage
assert "patches-2.0.5.mpp" in stage
assert "stage-v2.0.5-mpp.sh" in release and "stage-v2.0.5-mpp.sh" in main
assert "verify_mpp.py" in stage and "combine_mpp.py" in stage
assert "workflow_dispatch" in release and "inputs.release_confirmation == 'APPROVE'" in release
assert notes.startswith("## 2.0.5\n\n### ✨ New Features\n")
assert changelog.startswith("## 2.0.5 (2026-11-15)")
assert all(x in notes for x in ("### ✨ New Features","### 🐛 Bug Fixes","### 🔧 Improvements"))
assert all(f"issues/{number}" in notes for number in (135,137,138,139,141))
cmd=next(p[1]["prepareCmd"] for p in config["plugins"] if isinstance(p,list) and p[0]=="@semantic-release/exec")
assert "stage-v2.0.5-mpp.sh" in cmd
assert (ROOT/"porting/revisions/v2.0.5-dev.17/tests/DrawerLocaleTest.java").is_file()
print("PASS: approved v2.0.5 release routing and notes")
