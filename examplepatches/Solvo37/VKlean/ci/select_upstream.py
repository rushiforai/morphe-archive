#!/usr/bin/env python3
"""Select the newest verified VK Video base APK from downloaded upstream sources."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
from typing import Any

PACKAGE_RE = re.compile(r"name='([^']+)'")
VERSION_RE = re.compile(r"versionName='([^']+)'")
VERSION_CODE_RE = re.compile(r"versionCode='([^']+)'")
SPLIT_RE = re.compile(r"\ssplit='")
CERT_PREFIX = "Signer #1 certificate SHA-256 digest: "

SOURCE_PRIORITY = {
    "rustore": 0,
    "google-play": 1,
    "apkpure": 2,
}


def run(*args: str) -> str:
    proc = subprocess.run(args, check=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return proc.stdout


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as fh:
        for chunk in iter(lambda: fh.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def inspect_apk(path: Path, expected_package: str, expected_cert: str) -> dict[str, Any] | None:
    try:
        badging = run("aapt", "dump", "badging", str(path)).splitlines()[0]
    except Exception as exc:
        print(f"skip {path}: aapt failed: {exc}", file=sys.stderr)
        return None

    package_match = PACKAGE_RE.search(badging)
    version_match = VERSION_RE.search(badging)
    code_match = VERSION_CODE_RE.search(badging)
    if not package_match or not version_match or not code_match:
        return None

    if package_match.group(1) != expected_package:
        return None

    # Configuration APKs are not valid base candidates.
    if SPLIT_RE.search(badging):
        return None

    try:
        version_code = int(code_match.group(1))
    except ValueError:
        return None

    try:
        cert_out = run("apksigner", "verify", "--print-certs", str(path))
    except Exception as exc:
        print(f"skip {path}: signature verification failed: {exc}", file=sys.stderr)
        return None

    cert = ""
    for line in cert_out.splitlines():
        if line.startswith(CERT_PREFIX):
            cert = line[len(CERT_PREFIX):].strip().lower()
            break

    if cert != expected_cert.lower():
        print(f"skip {path}: unexpected signing certificate {cert or '<missing>'}", file=sys.stderr)
        return None

    source = path.parts[1] if len(path.parts) > 1 and path.parts[0] == "upstream" else path.parent.name
    return {
        "source": source,
        "path": str(path),
        "source_dir": str(path.parent),
        "package": package_match.group(1),
        "version_name": version_match.group(1),
        "version_code": version_code,
        "certificate_sha256": cert,
        "base_apk_sha256": sha256(path),
        "size_bytes": path.stat().st_size,
    }


def write_github_output(path: Path, selected: dict[str, Any]) -> None:
    with path.open("a", encoding="utf-8") as fh:
        for key, value in {
            "source": selected["source"],
            "dir": selected["source_dir"],
            "base": selected["path"],
            "version": selected["version_name"],
            "version_code": selected["version_code"],
        }.items():
            fh.write(f"{key}={value}\n")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", default="upstream")
    parser.add_argument("--package", required=True)
    parser.add_argument("--certificate", required=True)
    parser.add_argument("--output", default="upstream.json")
    parser.add_argument("--github-output", default=os.environ.get("GITHUB_OUTPUT"))
    args = parser.parse_args()

    root = Path(args.root)
    candidates: list[dict[str, Any]] = []

    for apk in sorted(root.glob("*/*.apk")):
        candidate = inspect_apk(apk, args.package, args.certificate)
        if candidate is not None:
            candidates.append(candidate)

    if not candidates:
        print("No verified VK Video base APK candidates found.", file=sys.stderr)
        return 1

    candidates.sort(
        key=lambda c: (
            int(c["version_code"]),
            -SOURCE_PRIORITY.get(str(c["source"]), 99),
        ),
        reverse=True,
    )
    selected = candidates[0]

    report = {
        "selected": selected,
        "candidates": candidates,
    }
    Path(args.output).write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    print("Verified upstream candidates:")
    for candidate in candidates:
        marker = " <-- selected" if candidate is selected else ""
        print(
            f"  {candidate['source']}: {candidate['version_name']} "
            f"({candidate['version_code']}) {candidate['base_apk_sha256'][:12]}{marker}"
        )

    if args.github_output:
        write_github_output(Path(args.github_output), selected)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
