#!/usr/bin/env python3
"""Binary triage for ORIGINAL, re-signed-only, and localized Taobao APKs.

Content-based inspection: archive byte differences caused by ZIP metadata or
APK v2/v3 signing blocks do not count as DEX/native/resource modification.
No private APK or credentials are uploaded by this tool.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import struct
import subprocess
import sys
from zipfile import ZipFile, BadZipFile

DEX = re.compile(r"classes(?:[0-9]+)?\.dex$")
SIGNATURE = re.compile(r"^META-INF/[^/]+\.(?:RSA|DSA|EC|SF|MF)$", re.I)
EXPECTED_ORIGINAL_SHA256 = "3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd"


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for part in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(part)
    return digest.hexdigest()


def category(name: str) -> str:
    if SIGNATURE.fullmatch(name):
        return "v1_signature_metadata"
    if DEX.fullmatch(name):
        return "dex"
    if name.startswith("lib/") and name.endswith(".so"):
        return "native_library"
    if name == "AndroidManifest.xml":
        return "manifest"
    if name == "resources.arsc" or name.startswith("res/"):
        return "android_resource"
    if name.startswith("assets/"):
        return "asset"
    return "other"


def elf_info(header: bytes) -> dict:
    if not header.startswith(b"\x7fELF") or len(header) < 20:
        return {"valid_elf_header": False}
    machine = struct.unpack("<H" if header[5] == 1 else ">H", header[18:20])[0]
    return {
        "valid_elf_header": True,
        "class": {1: "ELF32", 2: "ELF64"}.get(header[4], "unknown"),
        "machine": {183: "AArch64", 40: "ARM", 62: "x86_64", 3: "x86"}.get(machine, str(machine)),
    }


def scan(path: Path) -> dict:
    records = {}
    with ZipFile(path) as apk:
        names = apk.namelist()
        if len(names) != len(set(names)):
            raise ValueError(f"{path}: duplicate ZIP member names")
        bad = apk.testzip()
        if bad:
            raise ValueError(f"{path}: ZIP CRC invalid: {bad}")
        for info in apk.infolist():
            if info.is_dir():
                continue
            digest = hashlib.sha256()
            with apk.open(info) as stream:
                prefix = stream.read(64)
                digest.update(prefix)
                for part in iter(lambda: stream.read(1024 * 1024), b""):
                    digest.update(part)
            record = {
                "category": category(info.filename),
                "sha256": digest.hexdigest(),
                "size": info.file_size,
            }
            if record["category"] == "native_library":
                record["elf"] = elf_info(prefix)
            records[info.filename] = record
    result = {
        "path": str(path),
        "apk_sha256": sha256_file(path),
        "size": path.stat().st_size,
        "file_count": len(records),
        "entries": records,
    }
    apksigner = shutil.which("apksigner")
    if apksigner:
        done = subprocess.run(
            [apksigner, "verify", "--verbose", "--print-certs", str(path)],
            capture_output=True, text=True, timeout=90, check=False,
        )
        result["signature_check"] = {
            "available": True, "valid": done.returncode == 0,
            "output": (done.stdout + done.stderr)[-12000:],
        }
    else:
        result["signature_check"] = {"available": False, "valid": None}
    return result


def diff(source: dict, target: dict) -> dict:
    a, b = source["entries"], target["entries"]
    added = sorted(b.keys() - a.keys())
    removed = sorted(a.keys() - b.keys())
    changed = sorted(name for name in a.keys() & b.keys()
                     if a[name]["sha256"] != b[name]["sha256"])
    names = changed + added + removed
    counts = {}
    for name in names:
        kind = (b.get(name) or a[name])["category"]
        counts[kind] = counts.get(kind, 0) + 1
    return {
        "changed": changed, "added": added, "removed": removed,
        "counts": dict(sorted(counts.items())),
        "non_signature_changes": [
            name for name in names if (b.get(name) or a[name])["category"]
            != "v1_signature_metadata"
        ],
        "native_library_changes": [
            name for name in names if (b.get(name) or a[name])["category"]
            == "native_library"
        ],
    }


def compact(scan_result: dict) -> dict:
    return {k: v for k, v in scan_result.items() if k != "entries"}


def render_markdown(report: dict) -> str:
    lines = ["# Taobao APK three-variant binary triage", ""]
    lines.append("Content hashes refer to decompressed ZIP members; APK file hashes "
                 "also include signature blocks and ZIP metadata.")
    lines.append("")
    lines.append("| Variant | APK SHA-256 | ZIP members | Signature verified |")
    lines.append("| --- | --- | ---: | --- |")
    for name, value in report["variants"].items():
        sig = value["signature_check"]
        state = ("not checked" if not sig["available"] else
                 "PASS" if sig["valid"] else "FAIL")
        lines.append(f"| {name} | `{value['apk_sha256']}` | {value['file_count']} | {state} |")
    for label, value in report["comparisons"].items():
        lines.extend(["", f"## {label}", "",
                      f"Changed: {len(value['changed'])}; added: {len(value['added'])}; "
                      f"removed: {len(value['removed'])}",
                      "",
                      "| Category | Entries |", "| --- | ---: |"])
        for kind, count in value["counts"].items():
            lines.append(f"| {kind} | {count} |")
        lines += ["", "### Non-signature member differences", ""]
        if value["non_signature_changes"]:
            lines += [f"- `{x}`" for x in value["non_signature_changes"]]
        else:
            lines.append("None.")
    lines += ["", "## Interpretation limits", "",
              "- Identical native library bytes exclude direct library mutation, "
              "not signature verification by native code.",
              "- An unchanged DEX blob is stronger than matching method counts; "
              "a changed DEX still needs a method-level verifier.",
              "- ZIP integrity and valid re-signing do not establish successful "
              "login, Account navigation, or live UI localization.",
              "- No runtime behavior was tested by this script.", ""]
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("original", type=Path)
    parser.add_argument("resigned", type=Path)
    parser.add_argument("patched", type=Path, nargs="?")
    parser.add_argument("--strict-original-hash", action="store_true")
    parser.add_argument("--strict-control", action="store_true",
                        help="Fail if re-signed-only ZIP members besides v1 signatures changed.")
    parser.add_argument("--strict-native", action="store_true",
                        help="Fail if patched APK changes any .so content or membership.")
    parser.add_argument("--json-out", type=Path)
    parser.add_argument("--markdown-out", type=Path)
    args = parser.parse_args()

    original, resigned = scan(args.original), scan(args.resigned)
    variants = {"original": original, "resigned_only": resigned}
    comparisons = {"original -> resigned_only": diff(original, resigned)}
    if args.patched:
        patched = scan(args.patched)
        variants["patched"] = patched
        comparisons["original -> patched"] = diff(original, patched)
        comparisons["resigned_only -> patched"] = diff(resigned, patched)
    result = {
        "expected_original_sha256": EXPECTED_ORIGINAL_SHA256,
        "original_hash_matches_studied_version":
            original["apk_sha256"] == EXPECTED_ORIGINAL_SHA256,
        "variants": {k: compact(v) for k, v in variants.items()},
        "comparisons": comparisons,
    }
    text = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(text, encoding="utf-8")
    else:
        print(text)
    if args.markdown_out:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(render_markdown(result), encoding="utf-8")
    failed = []
    if args.strict_original_hash and not result["original_hash_matches_studied_version"]:
        failed.append("Original APK hash does not match Taobao 10.66.30 reference")
    if args.strict_control and comparisons["original -> resigned_only"]["non_signature_changes"]:
        failed.append("Re-signed-only control changed non-signature ZIP members")
    if args.strict_native and args.patched and comparisons["original -> patched"]["native_library_changes"]:
        failed.append("Patched APK altered native shared libraries")
    if failed:
        for reason in failed:
            print("FAIL:", reason, file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (OSError, ValueError, BadZipFile, subprocess.TimeoutExpired) as error:
        print(f"ERROR: {error}", file=sys.stderr)
        sys.exit(2)
