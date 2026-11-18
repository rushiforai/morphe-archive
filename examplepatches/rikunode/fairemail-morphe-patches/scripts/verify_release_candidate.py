#!/usr/bin/env python3
"""Fail-closed local preflight for the *unofficial* FairEmail Morphe release.

Checks metadata / patch safety / tracked secret-bearing artifacts and,
when --bundle is supplied, verifies that all advertised patches really exist
in the compiled Android DEX. No network access and no user backups required.
"""
from __future__ import annotations

import argparse
import json
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

PATCHES = {
    "Permanently hide donation banner": ("HideSupportBannerPatchKt", True, ("1.2337", "1.2338")),
    "Enable local settings export (experimental)": ("EnableSettingsExportPatchKt", False, ("1.2337", "1.2338")),
    "Enable local Pro features (experimental)": ("EnableProFeaturesPatchKt", False, ("1.2337", "1.2338")),
    "Enable OAuth setup in re-signed FairEmail (experimental)": ("EnableOAuthForResignedApkPatchKt", False, ("1.2338",)),
    "Suppress automatic changelog popup": ("SuppressAutomaticChangelogPatchKt", True, ("1.2338",)),
}
CLONE = {"Clone FairEmail alongside official app": ("CloneFairEmailPatchKt", True, ("1.2338",))}
DEV3 = "0.2.1-dev.3"
SIX_PATCH_VERSIONS = frozenset({"0.2.1-dev.3", "0.3.0-rc.1", "0.3.0", "0.3.1"})
SOURCE_DIR = ROOT / "patches" / "src" / "main" / "kotlin" / "dev" / "rikunode" / "fairemail"
IGNORED_EXTENSIONS = {".apk", ".backup", ".jks", ".keystore", ".p12", ".pfx", ".pem", ".key"}


def verify_index(index: dict, version: str) -> None:
    if not isinstance(index, dict) or index.get("version") != version:
        raise ValueError("Bundle/index version mismatch")
    expected = PATCHES | CLONE if version in SIX_PATCH_VERSIONS else PATCHES
    patches = index.get("patches")
    if not isinstance(patches, list) or len(patches) != len(expected):
        raise ValueError(f"Expected exactly {len(expected)} patches in release candidate")
    if {x.get("name") for x in patches} != set(expected):
        raise ValueError("Patch names differ from the reviewed release set")

    for entry in patches:
        name = entry["name"]
        classname, expected_default, versions = expected[name]
        if entry.get("default") is not expected_default:
            raise ValueError(f"{name}: unsafe default")
        packages = entry.get("compatiblePackages")
        if not isinstance(packages, list) or len(packages) != 1:
            raise ValueError(f"{name}: unexpected package count")
        package = packages[0]
        if package.get("packageName") != "eu.faircode.email":
            raise ValueError(f"{name}: wrong application package")
        targets = package.get("targets")
        if not isinstance(targets, list) or tuple(t.get("version") for t in targets) != versions:
            raise ValueError(f"{name}: wrong version target")
        for target in targets:
            codes = target.get("versionCodes")
            expected_code = int(target["version"].rsplit(".", 1)[1])
            if not isinstance(codes, dict) or len(codes) != 4 or set(codes.values()) != {expected_code}:
                raise ValueError(f"{name}: invalid versionCode pin")
        source = (SOURCE_DIR / (classname.replace("Kt", ".kt"))).read_text(encoding="utf-8")
        if f'name = "{name}"' not in source:
            raise ValueError(f"{name}: source registration missing")
        if f"default = {'true' if expected_default else 'false'}" not in source:
            raise ValueError(f"{name}: source default mismatch")


def verify_tracked_assets() -> None:
    try:
        tracked = subprocess.check_output(
            ["git", "ls-files", "-z"], cwd=ROOT, stderr=subprocess.DEVNULL
        ).decode("utf-8").split("\0")
    except (subprocess.CalledProcessError, FileNotFoundError) as exc:
        raise ValueError("git ls-files unavailable for release privacy audit") from exc
    unsafe = [
        item for item in tracked if item and (
            Path(item).suffix.lower() in IGNORED_EXTENSIONS or
            Path(item).name.lower() in {".env", "credentials.json", "token.json", "google-services.json"}
        )
    ]
    if unsafe:
        raise ValueError(f"Secret-bearing / personally identifiable artifacts tracked: {unsafe}")


def verify_bundle(path: Path) -> None:
    import zipfile
    import sys
    sys.path.insert(0, str(ROOT / "scripts"))
    from validate_morphe_bundle import validate_morphe_bundle

    validate_morphe_bundle(path)
    with zipfile.ZipFile(path) as archive:
        dexs = b"".join(archive.read(name) for name in archive.namelist() if name.endswith(".dex"))
    expected = PATCHES | CLONE if any(path.stem.endswith(item) for item in SIX_PATCH_VERSIONS) else PATCHES
    for label, (classname, _, _) in expected.items():
        if classname.encode() not in dexs or label.encode() not in dexs:
            raise ValueError(f"Compiled Android bundle lacks advertised patch: {label}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--bundle", type=Path, help="Optional generated Android .mpp to verify")
    args = parser.parse_args()

    asset = json.loads((ROOT / "patches-bundle.json").read_text(encoding="utf-8"))
    index = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
    version = asset.get("version")
    if not isinstance(version, str) or not version.strip():
        raise ValueError("Invalid bundle version")
    verify_index(index, version)
    verify_tracked_assets()
    if args.bundle:
        verify_bundle(args.bundle)
    print("FAIREMAIL_RELEASE_PREFLIGHT_PASS:", version, len(PATCHES | CLONE if version in SIX_PATCH_VERSIONS else PATCHES), "patches", "bundle" if args.bundle else "metadata")


if __name__ == "__main__":
    main()
