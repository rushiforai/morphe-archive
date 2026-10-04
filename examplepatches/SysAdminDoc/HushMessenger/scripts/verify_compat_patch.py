#!/usr/bin/env python3
"""Require a complete Desktop patch run before recording a compatibility profile."""

import argparse
import hashlib
import json
import subprocess
import sys
import tempfile
from pathlib import Path
from zipfile import BadZipFile, ZipFile


def digest(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def verify(apk, bundle, desktop, java, names, apk_sha256):
    if not names or len(names) != len(set(names)):
        raise ValueError("expected patch names must be nonempty and distinct")
    hashes = {path: digest(path) for path in (apk, bundle, desktop)}
    if hashes[apk] != apk_sha256:
        raise ValueError("stock APK changed after compatibility discovery")
    with tempfile.TemporaryDirectory(prefix="hush-profile-") as scratch:
        root = Path(scratch)
        output, result = root / "patched.apk", root / "result.json"
        run = subprocess.run(
            [
                str(java),
                "-Xmx1024m",
                "-XX:ActiveProcessorCount=2",
                "-jar",
                str(desktop),
                "patch",
                f"--patches={bundle}",
                "--unsigned",
                f"--out={output}",
                f"--result-file={result}",
                f"--temporary-files-path={root / 'tmp'}",
                *[f"--enable={name}" for name in names],
                str(apk),
            ],
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            timeout=1800,
            check=False,
        )
        if run.returncode or not result.is_file() or not output.is_file():
            raise ValueError(
                f"Desktop failed (exit {run.returncode})\n"
                + (run.stdout + run.stderr)[-4000:]
            )
        report = json.loads(result.read_text(encoding="utf-8"))
        applied = [patch["name"] for patch in report["appliedPatches"]]
        steps = report["patchingSteps"]
        if (
            len(applied) != len(names)
            or set(applied) != set(names)
            or report["failedPatches"] != []
            or not steps
            or any(step["success"] is not True for step in steps)
            or not {"PATCHING", "REBUILDING"} <= {step["step"] for step in steps}
        ):
            raise ValueError("Desktop did not apply and rebuild every expected patch")
        try:
            with ZipFile(output) as archive:
                if archive.testzip() is not None or not {
                    "AndroidManifest.xml",
                    "resources.arsc",
                    "classes.dex",
                } <= set(archive.namelist()):
                    raise ValueError("Desktop output is not a complete APK")
        except BadZipFile as error:
            raise ValueError("Desktop output is not a valid ZIP") from error
        if digest(output) == hashes[apk]:
            raise ValueError("Desktop output is unchanged stock")
        if any(digest(path) != sha for path, sha in hashes.items()):
            raise ValueError("a patching input changed during verification")
    return f"Desktop applied and rebuilt all {len(names)} patches"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ("apk", "bundle", "desktop", "java"):
        parser.add_argument(f"--{name}", required=True, type=Path)
    parser.add_argument("--enable", action="append", required=True)
    parser.add_argument("--apk-sha256", required=True)
    args = parser.parse_args()
    try:
        print(
            verify(
                args.apk,
                args.bundle,
                args.desktop,
                args.java,
                args.enable,
                args.apk_sha256,
            )
        )
        return 0
    except (
        OSError,
        ValueError,
        KeyError,
        TypeError,
        subprocess.SubprocessError,
    ) as error:
        print(f"PROFILE PATCH CHECK FAILED: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
