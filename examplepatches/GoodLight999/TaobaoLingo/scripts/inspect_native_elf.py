#!/usr/bin/env python3
"""Read-only native ELF inventory and JNI linkage hints for a Taobao APK.

This is NOT a native execution trace or proof of an integrity check. It records
dynamic ELF dependencies, exported JNI symbols and selected literal markers.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
from zipfile import ZipFile

NEEDED = re.compile(r"\(NEEDED\).*?\[(.*?)\]")
JNI = re.compile(r"\b(?:JNI_OnLoad|JNI_OnUnload|Java_[A-Za-z0-9_$]+)\b")
# Presence of these literals is a navigation clue, never an anti-tamper finding.
MARKERS = (
    b"DinamicX", b"DXWidgetNode", b"getApkPublicKeyDigest",
    b"PackageManager", b"Signature", b"X-UMID", b"X-Sign",
    b"RegisterNatives", b"com/taobao", b"com/ali/user",
)


def command_readelf(path: Path, *args: str) -> str:
    proc = subprocess.run(["readelf", "--wide", *args, str(path)],
                          text=True, capture_output=True, timeout=45)
    if proc.returncode:
        raise RuntimeError(f"readelf failed ({proc.returncode}): {proc.stderr[:600]}")
    return proc.stdout


def analyze_library(data: bytes, *, symbols: bool = True) -> dict:
    sha256 = hashlib.sha256(data).hexdigest()
    result = {"sha256": sha256, "size": len(data),
              "markers": [v.decode("ascii") for v in MARKERS if v in data]}
    if not data.startswith(b"\x7fELF"):
        result["error"] = "No ELF magic"
        return result
    with tempfile.TemporaryDirectory(prefix="taobaolingo-elf-") as temp:
        so = Path(temp) / "library.so"
        so.write_bytes(data)
        try:
            dynamic = command_readelf(so, "-d")
            result["needed"] = sorted(set(NEEDED.findall(dynamic)))
            result["soname"] = sorted(set(re.findall(
                r"\(SONAME\).*?\[(.*?)\]", dynamic)))
            if symbols:
                table = command_readelf(so, "--dyn-syms")
                result["jni_exports"] = sorted(set(JNI.findall(table)))
        except (RuntimeError, subprocess.TimeoutExpired) as e:
            result["error"] = str(e)
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apk", type=Path)
    parser.add_argument("--filter", default="",
                        help="Regex for .so entry names, e.g. 'security|sg|dx'")
    parser.add_argument("--json-out", type=Path)
    parser.add_argument("--no-symbols", action="store_true")
    args = parser.parse_args()
    if not shutil.which("readelf"):
        parser.error("readelf is required (binutils)")
    selected = re.compile(args.filter, re.I)
    results = {}
    with ZipFile(args.apk) as apk:
        for name in sorted(apk.namelist()):
            if not (name.startswith("lib/") and name.endswith(".so") and
                    selected.search(name)):
                continue
            results[name] = analyze_library(apk.read(name),
                                            symbols=not args.no_symbols)
    doc = {
        "apk": str(args.apk), "library_count": len(results),
        "libraries": results,
        "evidence_limits": [
            "An ELF import or literal marker does not establish a Java caller.",
            "RegisterNatives, dlopen, stripped code, and runtime server behavior "
            "are not reconstructed by this inventory.",
            "An unchanged library may still inspect the certificate of a re-signed APK.",
        ],
    }
    data = json.dumps(doc, ensure_ascii=False, indent=2) + "\n"
    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(data, encoding="utf-8")
    else:
        print(data)
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (OSError, ValueError, subprocess.TimeoutExpired) as error:
        print("ERROR:", error, file=sys.stderr)
        sys.exit(2)
