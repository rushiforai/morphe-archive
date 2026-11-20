#!/usr/bin/env python3
"""Fail closed if a Morphe .mpp cannot be loaded by Morphe Manager as Android DEX."""
from __future__ import annotations
import sys
from pathlib import Path
from zipfile import BadZipFile, ZipFile

def require(ok: bool, message: str) -> None:
    if not ok:
        raise ValueError(message)

def validate_manager_dex(dex: bytes) -> dict:
    require(len(dex) >= 112, "Morphe Manager patch DEX is truncated")
    require(dex[:4] == b"dex\n" and dex[7] == 0 and dex[4:7].isdigit(),
            "Missing or invalid root classes.dex header")
    require(int.from_bytes(dex[32:36], "little") == len(dex),
            "Root classes.dex size does not match its header")
    count = int.from_bytes(dex[96:100], "little")
    require(count > 0, "Root classes.dex contains no patch classes")
    require(b"NicoidModPatchKt" in dex and b"app/nicoid/patches" in dex,
            "Root classes.dex does not contain nicoid Re patch entry point")
    return {"bytes": len(dex), "class_defs": count}

def validate_mpp(path: Path, version: str) -> dict:
    require(path.is_file(), f"Missing MPP: {path}")
    try:
        with ZipFile(path) as bundle:
            require(bundle.testzip() is None, "Invalid MPP ZIP")
            names = bundle.namelist()
            require(names.count("classes.dex") == 1,
                    "Morphe Manager requires exactly one root classes.dex; do not publish a JVM-only MPP")
            dex = bundle.read("classes.dex")
            info = validate_manager_dex(dex)
            require("nicoid/helpers.mpe" in names, "Missing nicoid runtime helper DEX")
            require("nicoid/method-delta.dex" in names, "Missing native method DEX")
            require("META-INF/MANIFEST.MF" in names, "Missing MPP manifest")
            manifest = bundle.read("META-INF/MANIFEST.MF")
            require(("Version: "+version).encode() in manifest, "Incorrect MPP manifest version")
            return info
    except BadZipFile as e:
        raise ValueError("Invalid MPP ZIP") from e

if __name__ == "__main__":
    try:
        if len(sys.argv) != 3:
            raise ValueError("Usage: verify_android_mpp.py <mpp> <expected-version>")
        data = validate_mpp(Path(sys.argv[1]),sys.argv[2])
        print(f"PASS: Morphe Manager loadable root classes.dex ({data['bytes']} bytes, {data['class_defs']} classes)")
    except (ValueError,OSError,KeyError) as e:
        print("::error::"+str(e),file=sys.stderr)
        raise SystemExit(1)
