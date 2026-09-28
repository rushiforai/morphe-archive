#!/usr/bin/env python3
"""Confirm that a changed Messenger DEX fails before Morphe writes an APK."""

import argparse
import hashlib
import json
import re
import subprocess
import sys
import tempfile
import zlib
from pathlib import Path
from zipfile import BadZipFile, ZipFile

STOCK_SHA256 = {
    "128ec75e836f24328d2b28777091c03b20abba0adc536e7ee911ee5fe52e70bc",
    "e7d3c64227a7d9a26adda4e89321a87a49c85ee9e9f28f2fa7ed7fa79ae15cf6",
}
OLD_LITERAL = b"com.facebook.permission.prod.FB_APP_COMMUNICATION"
CHANGED_LITERAL = b"com.facebook.permission.proX.FB_APP_COMMUNICATION"


def altered_dex(data: bytes) -> bytes:
    changed = bytearray(data.replace(OLD_LITERAL, CHANGED_LITERAL))
    # DEX mandates SHA-1 for this header checksum; it is not APK authentication.
    changed[12:32] = hashlib.sha1(changed[32:], usedforsecurity=False).digest()
    changed[8:12] = (zlib.adler32(changed[12:]) & 0xFFFFFFFF).to_bytes(4, "little")
    return bytes(changed)


def check(args: argparse.Namespace) -> int:
    with args.stock_apk.open("rb") as source:
        actual_hash = hashlib.file_digest(source, "sha256").hexdigest()
    if actual_hash not in STOCK_SHA256:
        raise ValueError(f"stock APK SHA-256 mismatch: {actual_hash}")

    with tempfile.TemporaryDirectory(prefix="hushmessenger-drift-") as scratch:
        root = Path(scratch)
        changed_apk = root / "changed.apk"
        output_apk = root / "unexpected-output.apk"
        report_path = root / "result.json"
        changed_sites = 0
        with ZipFile(args.stock_apk) as source, ZipFile(changed_apk, "w") as target:
            for entry in source.infolist():
                data = source.read(entry.filename)
                if entry.filename.endswith(".dex") and OLD_LITERAL in data:
                    changed_sites += data.count(OLD_LITERAL)
                    data = altered_dex(data)
                target.writestr(entry, data)
        if changed_sites != 2:
            raise RuntimeError(
                f"expected two stock DEX literals, found {changed_sites}"
            )

        command = [
            str(args.java),
            "-jar",
            str(args.desktop_jar),
            "patch",
            f"-p={args.bundle}",
            "--unsigned",
            f"-r={report_path}",
            f"-o={output_apk}",
            str(changed_apk),
        ]
        run = subprocess.run(
            command,
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            timeout=300,
            check=False,
        )
        report = json.loads(report_path.read_text(encoding="utf-8"))
        log = run.stdout + run.stderr
        if not isinstance(report, dict):
            raise TypeError("Desktop did not write a patch result object")
        failed = report.get("failedPatches")
        steps = report.get("patchingSteps")
        if (
            not isinstance(failed, list)
            or any(
                not isinstance(item, dict)
                or not isinstance(item.get("patch"), dict)
                or not isinstance(item.get("reason"), str)
                for item in failed
            )
            or not isinstance(steps, list)
            or any(
                not isinstance(step, dict)
                or not isinstance(step.get("step"), str)
                or not isinstance(step.get("success"), bool)
                for step in steps
            )
        ):
            raise ValueError("Desktop wrote an incomplete or malformed patch result")
        patch_failure = next(
            (
                item
                for item in failed
                if item.get("patch", {}).get("name") == "Install beside Meta apps"
            ),
            None,
        )
        if (
            output_apk.exists()
            or run.returncode == 0
            or patch_failure is None
            or any(step.get("step") in ("REBUILDING", "SIGNING") for step in steps)
        ):
            print(log[-4000:])
            print(json.dumps(report, sort_keys=True))
            raise RuntimeError("changed APK was not rejected by the permission patch")
        reason = next(
            (
                line.strip()
                for line in patch_failure["reason"].splitlines()
                if re.search(
                    r"\bexpected 6 permission loads, found 4\b.*"
                    r"\bversion code 346013387 or 346013440\b",
                    line,
                )
            ),
            None,
        )
        if reason is None:
            print(patch_failure["reason"].partition("\n")[0].rstrip("\r"))
            raise RuntimeError(
                "failure did not identify the changed permission DEX sites"
            )
        print(f"Changed APK rejected before output: {reason}")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stock-apk", type=Path, required=True)
    parser.add_argument("--bundle", type=Path, required=True)
    parser.add_argument("--desktop-jar", type=Path, required=True)
    parser.add_argument("--java", type=Path, default=Path("java"))
    args = parser.parse_args()
    try:
        return check(args)
    except subprocess.TimeoutExpired:
        print("CHECK FAILED: Desktop exceeded the 300-second limit.", file=sys.stderr)
        return 2
    except (OSError, ValueError, TypeError, RuntimeError, BadZipFile) as error:
        print(f"CHECK FAILED: {error}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
