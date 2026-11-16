"""Guard against Morphe 2.3 RAW_ONLY on-demand extraction regressions."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[4]
SOURCE = (ROOT / "patches/src/main/kotlin/app/nicoid/patches/NicoidModPatch.kt").read_text()
GRADLE = (ROOT / "gradle.properties").read_text()
BUILDER = (ROOT / "porting/revisions/v2.0.4-dev.1/build_mpp.py").read_text()
VERIFY = (ROOT / "porting/revisions/v2.0.4-dev.1/verify_ci_candidate.py").read_text()
WORKFLOW = (ROOT / ".github/workflows/private-build.yml").read_text()
BUILD = (ROOT / "patches/build.gradle.kts").read_text()

assert "val originalDex = get(\"classes.dex\")" in SOURCE
assert "val originalTable = get(\"resources.arsc\")" in SOURCE
assert 'binaryManifest.takeIf { it.isFile }' in SOURCE
assert 'check(path == "AndroidManifest.xml")' in SOURCE
assert "return@forEach" in SOURCE
assert "get(\"AndroidManifest.xml\")" not in SOURCE.split('private val nicoidResources = rawResourcePatch {',1)[1].split('@Suppress("unused")',1)[0].replace("// Do not request AndroidManifest.xml via get():", "")
assert 'check(inputFile.isFile)' in SOURCE
assert "check(actual == expected)" in SOURCE
assert 'root.resolve(path)' in SOURCE
assert 'path == "AndroidManifest.xml" || path == "resources.arsc" || path.startsWith("res/")' in SOURCE
# Retain historical RAW_ONLY checks after the development version becomes stable.
active_version = re.search(r'^version\s*=\s*(\d+\.\d+\.\d+(?:-dev\.[1-9]\d*)?)\s*$', GRADLE, flags=re.MULTILINE)
assert active_version, "Missing or malformed Gradle version"
version = active_version.group(1)
release_tuple = tuple(int(part) for part in version.split("-", 1)[0].split("."))
assert version == "2.0.4-dev.1" or release_tuple >= (2, 0, 5), version
assert '"2.0.4-dev.1"' in BUILD and '"2.0.5-dev.1"' in BUILD and '"2.0.5-dev.2"' in BUILD and '"2.0.5-dev.3"' in BUILD and '"2.0.5-dev.4"' in BUILD and '"2.0.5-dev.5"' in BUILD and '"2.0.5-dev.6"' in BUILD and '"2.0.5-dev.7"' in BUILD and '"2.0.5-dev.8"' in BUILD and '"2.0.5-dev.9"' in BUILD and '"2.0.5-dev.10"' in BUILD and '"2.0.5-dev.11"' in BUILD
assert 'DEVELOPMENT = ROOT.parent / "v2.0.3-dev.18"' in BUILDER
assert 'builder.VERSION = VERSION' in BUILDER
assert "2.0.4-dev.1" in VERIFY and "2.0.4-dev.1" in WORKFLOW
assert "v2.0.3-dev.18/tests/verify.py" in WORKFLOW
COMBINE = (ROOT / "porting/revisions/v2.0.4-dev.1/combine_mpp.py").read_text()
assert 'FIX_MARKER = b"Missing original nicoid 6.49 APK entry"' in COMBINE
assert "compiled.read(entry.filename)" in COMBINE
assert 'python3 "$builder/combine_mpp.py"' in WORKFLOW
hashes = (ROOT / "patches/src/main/resources/nicoid/input-hashes.txt").read_text().splitlines()
assert {line.split(maxsplit=1)[1] for line in hashes} == {"classes.dex", "resources.arsc", "AndroidManifest.xml"}
print("PASS: lazy RAW_ONLY hashes mandatory DEX/ARSC, safely omits unstaged manifest only")
print("PASS: archived v2.0.4-dev.1 wrapper and release-aware version guard")
print("NOT TESTED: actual Morphe 2.3.0 execution against original nicoid 6.49 APK")
