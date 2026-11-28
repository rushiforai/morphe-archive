#!/usr/bin/env python3
"""Verify a signed split bundle: one signer, every required split type, no leftovers.

A split bundle is only installable if all its pieces carry the *same* signing
certificate and if it provides every split type the base declares. Those two
properties are invisible in a per-APK check, which is why they get their own script.

Checks:

1. every APK of the bundle verifies, and all of them report one identical signer;
2. the required split types of the base are all present among the splits;
3. the base still declares the expected package and no expected piece is missing.

Usage:
  python3 scripts/verify_bundle.py --dir build/bundle --apksigner tools/android/build-tools/apksigner
"""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
import zipfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

from preflight import PreflightError, classify, required_split_types, split_types  # noqa: E402

PACKAGE = "com.wispr.flowapp"


class BundleError(Exception):
    """Raised when the bundle would not install."""


def signer(apksigner: Path, apk: Path) -> str:
    """The signing certificate digest reported by apksigner."""
    cmd = ["bash", str(apksigner), "verify", "--print-certs", str(apk)]
    proc = subprocess.run(cmd, capture_output=True, text=True)
    if proc.returncode != 0:
        raise BundleError(f"{apk.name}: signature does not verify\n{proc.stdout}{proc.stderr}")
    match = re.search(r"SHA-256 digest: ([0-9a-f]+)", proc.stdout)
    if not match:
        raise BundleError(f"{apk.name}: apksigner reported no certificate")
    return match.group(1)


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("--dir", type=Path, required=True, help="directory of signed APKs")
    ap.add_argument("--apksigner", type=Path, required=True)
    a = ap.parse_args()

    problems: list[str] = []
    apks = sorted(a.dir.glob("*.apk"))
    try:
        base, splits = classify(apks)
    except PreflightError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 1

    # 1. one signer for all pieces
    digests = {}
    for apk in apks:
        try:
            digests[apk.name] = signer(a.apksigner, apk)
        except BundleError as exc:
            problems.append(str(exc))
    if len(set(digests.values())) > 1:
        problems.append(f"pieces are signed by different certificates: {digests}")

    # 2. required split types covered
    required = required_split_types(base)
    present = sorted({t for split in splits for t in split_types(split)})
    for kind in required:
        if kind not in present:
            problems.append(f"required split type {kind} is missing from the bundle")

    # 3. expected package, and the base is the one that was patched
    with zipfile.ZipFile(base) as z:
        names = z.namelist()
    if not any(name.startswith("classes") and name.endswith(".dex") for name in names):
        problems.append(f"{base.name}: no dex in the base")
    with zipfile.ZipFile(base) as z:
        manifest = z.read("AndroidManifest.xml").decode("utf-16-le", "ignore")
    if PACKAGE not in manifest:
        problems.append(f"{base.name}: package {PACKAGE} not found in the manifest")

    print(f"bundle: {a.dir}")
    for name, digest in sorted(digests.items()):
        print(f"  signer {digest[:16]}…  {name}")
    print(f"  split types: required={required} present={present}")
    for problem in problems:
        print(f"  !! {problem}")
    print("VERIFIED" if not problems else f"{len(problems)} PROBLEM(S)")
    return 0 if not problems else 1


if __name__ == "__main__":
    sys.exit(main())
