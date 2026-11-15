"""Static release gate checks independent of binary APK/build environment."""
from pathlib import Path
import json

ROOT=Path(__file__).resolve().parents[3]
GRADLE=(ROOT/"gradle.properties").read_text()
BUILD=(ROOT/"porting/revisions/v2.0.3-release/build_mpp.py").read_text()
STAGE=(ROOT/".github/scripts/stage-v2.0.3-mpp.sh").read_text()
CONFIG=json.loads((ROOT/".releaserc").read_text())
RELEASE=(ROOT/".github/workflows/release.yml").read_text()
VERIFY=(ROOT/".github/workflows/verify-main.yml").read_text()
NOTES=(ROOT/".github/release-notes/v2.0.3.md").read_text()
OLD=(ROOT/".github/release-notes/v2.0.0.md").read_text()
assert "version = 2.0.3" in GRADLE
assert 'VERSION = "2.0.3"' in BUILD
assert 'builder.VERSION = VERSION' in BUILD
assert 'args.official_release = True' in BUILD
assert 'GITHUB_REF' in BUILD and 'NICOID_OFFICIAL_RELEASE_APPROVED' in BUILD
assert 'v2.0.3-dev.18' in BUILD and 'v2.0.3-dev.18' in (ROOT/"porting/revisions/v2.0.3-dev.18/tests/verify.py").read_text()
assert "patches-2.0.3.mpp" in STAGE
assert "method-delta.dex" in STAGE
assert "verify_mpp.py" in STAGE
assert "stage-v2.0.3-mpp.sh" in RELEASE and "stage-v2.0.3-mpp.sh" in VERIFY
assert "when manually approved" not in RELEASE or "workflow_dispatch" in RELEASE
assert "workflow_dispatch" in RELEASE and "inputs.release_confirmation == 'APPROVE'" in RELEASE
assert all(s in NOTES for s in ("### ✨ New Features","### 🐛 Bug Fixes","### 🔧 Improvements"))
assert "MP3 audio downloads" in NOTES and "external links" in NOTES
assert "#132" in NOTES and "#133" in NOTES
assert "issues/117" in (ROOT/".github/release-notes/v2.0.1.md").read_text()
assert "issues/115" in OLD
for plugin in CONFIG["plugins"]:
    if isinstance(plugin,list) and plugin[0]=="@semantic-release/exec":
        assert 'stage-v2.0.3-mpp.sh' in plugin[1]["prepareCmd"]
print("PASS: v2.0.3 release routing, approved source and issue-link contracts")
