#!/usr/bin/env python3
"""Read-only preflight for a signed FairEmail Morphe clone APK update.

Compare the candidate signed APK with an installed clone using Android SDK
`adb`, `aapt` and `apksigner`. NEVER installs or removes apps, reads their
private data, imports credentials, or stores signing keys. Installed *public*
APK bytes are retrieved into a self-deleting temporary directory.

Use BEFORE attempting a device update. A successful result confirms only
package/version/signature compatibility, not Android installability or
post-update OAuth state preservation.
"""
from __future__ import annotations

import argparse
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

PACKAGE = "eu.faircode.email.morphe"
PACKAGE_RE = re.compile(
    r"^package: name='([^']+)' versionCode='(\d+)' versionName='([^']+)'",
    re.MULTILINE,
)
SIGNER_RE = re.compile(
    r"^Signer #\d+ certificate SHA-256 digest:\s*([0-9a-fA-F]{64})\s*$",
    re.MULTILINE,
)
BASE_APK_PREFIX = "package:"


class UpgradePreflightError(Exception):
    pass


def android_tool(name: str, supplied: str | None = None) -> str:
    if supplied:
        path = Path(supplied)
        if not path.is_file():
            raise UpgradePreflightError(f"Specified {name} binary does not exist")
        return str(path)
    found = shutil.which(name)
    if found:
        return found
    sdk = os.environ.get("ANDROID_HOME") or os.environ.get("ANDROID_SDK_ROOT")
    if sdk:
        root = Path(sdk)
        if name == "adb":
            candidate = root / "platform-tools" / ("adb.exe" if os.name == "nt" else "adb")
            if candidate.is_file():
                return str(candidate)
        else:
            matches = sorted((root / "build-tools").glob(f"*/{name}{'.exe' if os.name == 'nt' else ''}"))
            if matches:
                return str(matches[-1])
    raise UpgradePreflightError(f"Could not find Android SDK tool: {name}")


def run(*argv: str, timeout: int = 45) -> str:
    try:
        p = subprocess.run(argv, capture_output=True, text=True,
                           check=True, timeout=timeout)
    except (subprocess.CalledProcessError, subprocess.TimeoutExpired, FileNotFoundError) as exc:
        raise UpgradePreflightError(f"Read-only preflight failed at {Path(argv[0]).name}") from exc
    return p.stdout


def parse_package(badging: str) -> tuple[str, int, str]:
    match = PACKAGE_RE.search(badging)
    if not match:
        raise UpgradePreflightError("No Android package/version metadata in aapt output")
    name, code, version = match.groups()
    return name, int(code), version


def parse_signers(apksigner_output: str) -> tuple[str, ...]:
    result = tuple(sorted(set(x.lower() for x in SIGNER_RE.findall(apksigner_output))))
    if not result:
        raise UpgradePreflightError("No signer SHA-256 certificate digests found")
    return result


def installed_base_apk(pm_path_output: str) -> str:
    paths = [line[len(BASE_APK_PREFIX):].strip() for line in pm_path_output.splitlines()
             if line.startswith(BASE_APK_PREFIX)]
    bases = [path for path in paths if Path(path).name == "base.apk"]
    if len(bases) != 1 or not bases[0].startswith("/data/app/"):
        raise UpgradePreflightError("Cannot identify exactly one installed clone base.apk")
    return bases[0]


def assert_upgrade_identity(
    installed: tuple[str, int, str],
    candidate: tuple[str, int, str],
    installed_signers: tuple[str, ...],
    candidate_signers: tuple[str, ...],
) -> None:
    if installed[0] != PACKAGE or candidate[0] != PACKAGE:
        raise UpgradePreflightError("Installed and candidate APK must both use the exact clone package")
    if candidate[1] < installed[1]:
        raise UpgradePreflightError("Candidate is a versionCode downgrade; update may be rejected")
    if installed_signers != candidate_signers:
        raise UpgradePreflightError("Signing certificate mismatch: DO NOT uninstall the existing app")
    if not installed_signers:
        raise UpgradePreflightError("Signing certificate information missing")


def preflight(candidate: Path, serial: str | None, sdk_tools: dict[str, str]) -> None:
    if not candidate.is_file() or candidate.suffix.lower() != ".apk":
        raise UpgradePreflightError("Candidate must be an existing, fully signed APK")
    adb, aapt, apksigner = (sdk_tools[x] for x in ("adb", "aapt", "apksigner"))
    device = (adb, "-s", serial) if serial else (adb,)
    installed_path = installed_base_apk(run(*device, "shell", "pm", "path", PACKAGE))
    with tempfile.TemporaryDirectory(prefix="fairemail-upgrade-check-") as tmp:
        installed_file = Path(tmp) / "installed-base.apk"
        # Copies the public APK package only. Does not access /data/data or app databases.
        run(*device, "pull", installed_path, str(installed_file), timeout=120)
        if not installed_file.is_file() or installed_file.stat().st_size < 1000:
            raise UpgradePreflightError("Failed to read installed app APK bytes")
        before = parse_package(run(aapt, "dump", "badging", str(installed_file)))
        after = parse_package(run(aapt, "dump", "badging", str(candidate)))
        before_signers = parse_signers(run(apksigner, "verify", "--print-certs", str(installed_file)))
        after_signers = parse_signers(run(apksigner, "verify", "--print-certs", str(candidate)))
        assert_upgrade_identity(before, after, before_signers, after_signers)
        print("FAIREMAIL_CLONE_UPGRADE_READONLY_PREFLIGHT_PASS")
        print("Installed package / versionCode:", before[0], before[1])
        print("Candidate package / versionCode:", after[0], after[1])
        print("Signing certificate match: yes")
        print("No APK installed, deleted or replaced. OAuth and data continuity remain untested.")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--candidate", type=Path, required=True, help="Signed patched FairEmail clone APK")
    parser.add_argument("--serial", help="ADB device serial (required when multiple devices attached)")
    parser.add_argument("--adb", help="Optional explicit path to adb binary")
    parser.add_argument("--aapt", help="Optional explicit path to aapt binary")
    parser.add_argument("--apksigner", help="Optional explicit path to apksigner binary")
    args = parser.parse_args()
    try:
        tools = {name: android_tool(name, getattr(args, name)) for name in ("adb", "aapt", "apksigner")}
        preflight(args.candidate, args.serial, tools)
        return 0
    except UpgradePreflightError as error:
        print(f"FAIREMAIL_CLONE_UPGRADE_PREFLIGHT_BLOCKED: {error}", file=sys.stderr)
        print("Existing clone was NOT changed. Keep its data and backup.", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
