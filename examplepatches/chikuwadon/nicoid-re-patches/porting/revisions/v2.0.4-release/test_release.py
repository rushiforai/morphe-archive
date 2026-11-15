"""Static quality gates for the approved v2.0.4 Morphe 2.3 hotfix."""
from pathlib import Path
import json
import re

ROOT=Path(__file__).resolve().parents[3]
GRADLE=(ROOT/"gradle.properties").read_text()
STAGE=(ROOT/".github/scripts/stage-v2.0.4-mpp.sh").read_text()
BUILD=(ROOT/"porting/revisions/v2.0.4-release/build_mpp.py").read_text()
COMBINE=(ROOT/"porting/revisions/v2.0.4-release/combine_mpp.py").read_text()
VERIFY=(ROOT/"porting/revisions/v2.0.4-release/verify_mpp.py").read_text()
RELEASE=(ROOT/".github/workflows/release.yml").read_text()
MAIN_CI=(ROOT/".github/workflows/verify-main.yml").read_text()
CONFIG=json.loads((ROOT/".releaserc").read_text())
NOTES=(ROOT/".github/release-notes/v2.0.4.md").read_text()
KOTLIN=(ROOT/"patches/src/main/kotlin/app/nicoid/patches/NicoidModPatch.kt").read_text()
BUILDS=(ROOT/"patches/build.gradle.kts").read_text()
assert re.search(r"^version\s*=\s*2\.0\.4$",GRADLE,re.MULTILINE)
assert 'VERSION = "2.0.4"' in BUILD and "builder.VERSION = VERSION" in BUILD
assert "NICOID_OFFICIAL_RELEASE_APPROVED" in BUILD
assert 'DEVELOPMENT = ROOT.parent / "v2.0.3-dev.18"' in BUILD
assert '"2.0.4"' in BUILDS and "prepareNicoidHelpers" in BUILDS
assert "stage-v2.0.4-mpp.sh" in RELEASE and "stage-v2.0.4-mpp.sh" in MAIN_CI
assert "patches-2.0.4.mpp" in STAGE
assert 'python3 "$official/combine_mpp.py" "$compiled" "$payload" "$bundle"' in STAGE
assert 'python3 "$official/verify_mpp.py"' in STAGE
assert 'FIX_MARKER = b"Missing original nicoid 6.49 APK entry"' in COMBINE
assert "compiled.read(entry.filename)" in COMBINE
assert 'expected == "2.0.4"' in VERIFY
assert "Version: 2.0.4-dev.1" in VERIFY  # Reject development manifests
assert 'get("resources.arsc")' in KOTLIN
assert "binaryManifest.takeIf { it.isFile }" in KOTLIN
assert "check(actual == expected)" in KOTLIN
assert NOTES.startswith("## 2.0.4\n\n### 🐛 Bug Fixes")
assert "Morphe Patcher 2.3.0" in NOTES
assert "### ✨" not in NOTES and "### 🔧" not in NOTES
assert "workflow_dispatch" in RELEASE and "inputs.release_confirmation == 'APPROVE'" in RELEASE
assert "git archive" not in RELEASE
for plugin in CONFIG["plugins"]:
    if isinstance(plugin,list) and plugin[0]=="@semantic-release/exec":
        assert "stage-v2.0.4-mpp.sh" in plugin[1]["prepareCmd"]
    if isinstance(plugin,list) and plugin[0]=="@semantic-release/github":
        assert len(plugin[1]["assets"]) == 1, "Do not duplicate GitHub source archives"
print("PASS: v2.0.4 hotfix version, fixed Kotlin patch code, artifact composition")
