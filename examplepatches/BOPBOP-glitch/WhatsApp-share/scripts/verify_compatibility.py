#!/usr/bin/env python3
import argparse
import hashlib
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
PATCH_DIR = ROOT / "patches/src/main/kotlin/app/whatsappmorphe/patches/whatsapp"
CONSTANTS = ROOT / "patches/src/main/kotlin/app/whatsappmorphe/patches/shared/Constants.kt"

parser = argparse.ArgumentParser()
parser.add_argument(
    "--source-only",
    action="store_true",
    help="Validate frozen sources and compatibility declarations before patches-list.json is regenerated.",
)
args = parser.parse_args()

def fail(message):
    raise SystemExit(f"ERROR: {message}")

def load(path):
    with open(ROOT / path, encoding="utf-8") as f:
        return json.load(f)

baseline = load("compatibility/patch-baseline.json")
matrix = load("compatibility/matrix.json")
patches = load("patches-list.json")
toolchain = load("compatibility/toolchain-lock.json")
metadata_baseline = load("compatibility/patch-metadata-baseline.json")

# 1. Freeze every behavior-bearing WhatsApp patch source file.
expected_files = baseline["files"]
actual_files = sorted(
    str(p.relative_to(ROOT)).replace("\\", "/")
    for p in PATCH_DIR.glob("*.kt")
)
if actual_files != sorted(expected_files):
    fail(f"Patch source set changed. expected={sorted(expected_files)} actual={actual_files}")

for rel, expected_hash in expected_files.items():
    actual_hash = hashlib.sha256((ROOT / rel).read_bytes()).hexdigest()
    if actual_hash != expected_hash:
        fail(f"Patch source changed: {rel}")

# 2. Freeze build/toolchain inputs that are outside compatibility scope.
for rel, expected_hash in toolchain["lockedFiles"].items():
    actual_hash = hashlib.sha256((ROOT / rel).read_bytes()).hexdigest()
    if actual_hash != expected_hash:
        fail(f"Toolchain/build file changed outside compatibility policy: {rel}")

# 3. Freeze user-visible patch metadata and defaults.
baseline_by_name = {p["name"]: p for p in metadata_baseline["patches"]}
names = {p["name"] for p in patches["patches"]}
if names != set(baseline_by_name):
    fail(f"Patch metadata set changed. expected={sorted(baseline_by_name)} actual={sorted(names)}")

for patch in patches["patches"]:
    base = baseline_by_name[patch["name"]]
    current = {
        "name": patch.get("name"),
        "description": patch.get("description"),
        "default": patch.get("default"),
        "category": patch.get("category"),
        "dependencies": patch.get("dependencies") or [],
        "options": patch.get("options") or [],
    }
    if current != base:
        fail(f"Patch metadata changed: {patch['name']}")

# 4. Validate matrix and every per-version record.
if matrix.get("packageName") != "com.whatsapp":
    fail("matrix packageName must be com.whatsapp")
if matrix.get("policy") != "compatibility-only":
    fail("matrix policy must remain compatibility-only")

entries = matrix.get("versions") or []
versions = [item.get("version") for item in entries]
if not versions or len(versions) != len(set(versions)):
    fail("matrix versions must be non-empty and unique")

candidate = matrix.get("candidateVersion")
if candidate not in versions:
    fail(f"Candidate {candidate} missing from compatibility/matrix.json")

requirements = {
    "untested": (),
    "build-validated": ("bundleBuild", "dexPresent", "patchMetadata"),
    "patch-validated": ("bundleBuild", "dexPresent", "patchMetadata", "patchTime"),
    "device-validated": (
        "bundleBuild", "dexPresent", "patchMetadata", "patchTime",
        "launch", "loginSession", "sendReceive", "restart",
    ),
    "stable": (
        "bundleBuild", "dexPresent", "patchMetadata", "patchTime",
        "launch", "loginSession", "sendReceive", "restart",
    ),
    "unsupported": (),
}
matrix_by_version = {item["version"]: item for item in entries}

for version, entry in matrix_by_version.items():
    record_path = ROOT / f"compatibility/{version}.json"
    if not record_path.exists():
        fail(f"Missing per-version record: compatibility/{version}.json")
    record = json.loads(record_path.read_text(encoding="utf-8"))

    if record.get("version") != version:
        fail(f"{version}: record version mismatch")
    if record.get("packageName") != "com.whatsapp":
        fail(f"{version}: packageName must be com.whatsapp")
    if record.get("scope") != "compatibility-only":
        fail(f"{version}: scope must remain compatibility-only")
    if record.get("patchBehaviorChanged") is not False:
        fail(f"{version}: patchBehaviorChanged must remain false")
    if record.get("patchCount") != len(baseline_by_name):
        fail(f"{version}: patchCount must remain {len(baseline_by_name)}")
    if record.get("status") != entry.get("status"):
        fail(f"{version}: matrix status and record status differ")

    tests = record.get("tests") or {}
    for key in requirements.get(record.get("status"), ()):
        if tests.get(key) is not True:
            fail(f"{version}: status {record.get('status')} requires tests.{key}=true")

stable_version = matrix.get("stableVersion")
if stable_version is not None:
    if stable_version not in matrix_by_version:
        fail(f"stableVersion {stable_version} missing from matrix versions")
    if matrix_by_version[stable_version].get("status") != "stable":
        fail(f"stableVersion {stable_version} is not marked stable")

# 5. Constants.kt may change only as a compatibility target declaration.
constants = CONSTANTS.read_text(encoding="utf-8")
if 'packageName = "com.whatsapp"' not in constants:
    fail("Constants.kt package identity changed")
if 'apkFileType = ApkFileType.APK' not in constants:
    fail("Constants.kt APK file type changed")

declared_versions = re.findall(r'version\s*=\s*"(\d+\.\d+\.\d+\.\d+)"', constants)
if set(declared_versions) != set(versions) or len(declared_versions) != len(versions):
    fail(
        "Constants.kt target versions must exactly match matrix versions. "
        f"constants={declared_versions} matrix={versions}"
    )

# 6. After metadata generation, require every patch to expose exactly the matrix targets.
if not args.source_only:
    for patch in patches["patches"]:
        packages = patch.get("compatiblePackages") or []
        whatsapp = [x for x in packages if x.get("packageName") == "com.whatsapp"]
        if len(whatsapp) != 1:
            fail(f"{patch['name']}: expected exactly one com.whatsapp compatibility declaration")
        target_versions = [x.get("version") for x in (whatsapp[0].get("targets") or [])]
        if set(target_versions) != set(versions) or len(target_versions) != len(versions):
            fail(
                f"{patch['name']}: generated targets do not match matrix. "
                f"targets={target_versions} matrix={versions}"
            )

mode = "source-only" if args.source_only else "full"
print(
    f"Compatibility validation passed ({mode}): "
    f"{len(names)} frozen patches, {len(versions)} declared WhatsApp version(s), "
    f"candidate={candidate}."
)


# 7. Version policy: every development update uses a SemVer prerelease counter.
version_policy = load("compatibility/version-policy.json")
gradle_text = (ROOT / "gradle.properties").read_text(encoding="utf-8")
version_match = re.search(r"(?m)^version\s*=\s*([^\s]+)\s*$", gradle_text)
if not version_match:
    fail("gradle.properties version is missing")
project_version = version_match.group(1)

if project_version != version_policy.get("current"):
    fail(
        f"Version policy mismatch: gradle={project_version} "
        f"policy={version_policy.get('current')}"
    )

if not re.fullmatch(r"\d+\.\d+\.\d+(?:-dev\.\d+)?", project_version):
    fail(f"Unsupported patch version format: {project_version}")

if "-dev." in project_version:
    stable = re.sub(r"-dev\.\d+$", "", project_version)
    if version_policy.get("nextStable") != stable:
        fail(
            f"nextStable must be {stable} for development version {project_version}"
        )
