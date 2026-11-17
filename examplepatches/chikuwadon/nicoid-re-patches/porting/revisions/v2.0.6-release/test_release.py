"""Check approved v2.0.6 release metadata and its source provenance."""
from pathlib import Path
import json,re
ROOT=Path(__file__).resolve().parents[3]
version=(ROOT/"gradle.properties").read_text()
notes=(ROOT/".github/release-notes/v2.0.6.md").read_text()
changelog=(ROOT/"CHANGELOG.md").read_text()
main=(ROOT/".github/workflows/verify-main.yml").read_text()
release=(ROOT/".github/workflows/release.yml").read_text()
stage=(ROOT/".github/scripts/stage-v2.0.6-mpp.sh").read_text()
build=(ROOT/"porting/revisions/v2.0.6-release/build_mpp.py").read_text()
config=json.loads((ROOT/".releaserc").read_text())
assert re.search(r"(?m)^version\s*=\s*2\.0\.6$",version)
assert 'VERSION = "2.0.6"' in build
assert "v2.0.6-dev.13" in build and "builder.VERSION=VERSION" in build
assert "NICOID_OFFICIAL_RELEASE_APPROVED" in build and "NICOID_OFFICIAL_RELEASE_APPROVED" in stage
assert "patches-2.0.6.mpp" in stage
assert "stage-v2.0.6-mpp.sh" in release and "stage-v2.0.6-mpp.sh" in main
assert "verify_mpp.py" in stage and "combine_mpp.py" in stage
assert "workflow_dispatch" in release and "inputs.release_confirmation == 'APPROVE'" in release
assert notes.startswith("## 2.0.6 (2026-11-16)\n\n### ✨ New Features\n")
assert changelog.startswith("## 2.0.6 (2026-11-16)")
assert all(x in notes for x in ("### ✨ New Features","### 🐛 Bug Fixes","### 🔧 Improvements"))
assert "Improve video menu customization, including playlist removal actions" not in notes
assert "Fix ambient lighting appearing inside the video during dark scenes" in notes
assert "Fix video menu items not following the configured visibility and order" in notes
cmd=next(p[1]["prepareCmd"] for p in config["plugins"] if isinstance(p,list) and p[0]=="@semantic-release/exec")
assert "stage-v2.0.6-mpp.sh" in cmd
assert (ROOT/"porting/revisions/v2.0.6-dev.13/tests/menu_test.py").is_file()
assert (ROOT/"porting/revisions/v2.0.6-dev.11/tests/run_resume_test.py").is_file()
assert (ROOT/"porting/revisions/v2.0.6-dev.12/verify_settings_links.py").is_file()
assert "v2.0.6-dev.13" in build
assert 'verify_native.py' in stage
assert (ROOT/"porting/revisions/v2.0.6-release/verify_native.py").is_file()
print("PASS: approved v2.0.6 release routing and notes")
