#!/usr/bin/env python3
"""Promote the SHA-locked user-tested dev.3 MPP to v2.1.4.

All patch code is retained byte-for-byte except two version-only helper classes
and the manifest. Never substitute a JVM-only archive for the Android MPP.
"""
from __future__ import annotations
import argparse
from copy import copy
import hashlib
import sys
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT / "porting/revisions/v2.1.0-release"))
sys.path.insert(0, str(ROOT / ".github/scripts"))
from stage_verified import assemble, disassemble, require
from verify_android_mpp import validate_mpp

STABLE = "2.1.4"
REVIEWED = "2.1.4-dev.3"
REVIEWED_SHA256 = "37d04536d8bbc4ee94f1a2909ea58b50a3f30c441929373df19e73f0a48f6e76"
MANIFEST = "META-INF/MANIFEST.MF"
HELPERS = "nicoid/helpers.mpe"
NATIVE = "nicoid/method-delta.dex"
EXTENSION = "extensions/extension.mpe"
VERSION_OWNERS = {
    Path("e/e/a/PatchVersion237.smali"): ('"2.1.4-dev.3"', '"2.1.4"', 1),
    Path("e/e/a/ModernShorts.smali"): ('"v2.1.3 @chikuwadon"', '"v2.1.4 @chikuwadon"', 2),
}


def stage(compiled: Path, reviewed: Path, output: Path, tools: Path) -> None:
    require(compiled.resolve() != output.resolve(), "Keep compiled MPP separate")
    require(reviewed.resolve() != output.resolve(), "Never overwrite approved dev.3")
    require(hashlib.sha256(reviewed.read_bytes()).hexdigest() == REVIEWED_SHA256,
            "Approved dev.3 MPP SHA-256 differs from the tested artifact")
    validate_mpp(compiled, STABLE)
    validate_mpp(reviewed, REVIEWED)
    with TemporaryDirectory(prefix="nicoid-v214-stable-") as temp, ZipFile(compiled) as candidate, ZipFile(reviewed) as approved:
        tmp = Path(temp)
        require(candidate.namelist() == approved.namelist(),
                "Compiled/approved MPP archive layout differs")
        for key in ("nicoid/resources.zip", "nicoid/ui-strings.txt", "nicoid/input-hashes.txt"):
            require(candidate.read(key) == approved.read(key), f"Unreviewed change in {key}")
        helper = tmp / "reviewed.dex"
        helper.write_bytes(approved.read(HELPERS))
        sources = tmp / "smali"
        original = disassemble(helper, sources, tools)
        for path, (old, new, count) in VERSION_OWNERS.items():
            require(path in original, f"Missing approved version owner {path}")
            value = (sources / path).read_text(encoding="utf-8")
            require(value.count(old) == count, f"Unexpected version ownership in {path}: expected {count}, got {value.count(old)}")
            (sources / path).write_text(value.replace(old, new), encoding="utf-8")
        stable = tmp / "stable.dex"
        assemble(sources, stable, tools)
        rebuilt = disassemble(stable, tmp / "rebuilt", tools)
        require(rebuilt.keys() == original.keys(), "Unexpected helper class changes")
        modified = {p for p in original if original[p] != rebuilt[p]}
        require(modified == set(VERSION_OWNERS), f"Unexpected behavioral helper diff: {modified}")
        for path, (old, new, count) in VERSION_OWNERS.items():
            require(rebuilt[path].replace(new.encode(), old.encode()) == original[path],
                    f"Non-version Smali change in {path}")
        stable_bytes = stable.read_bytes()
        require(b"2.1.4-dev.3" not in stable_bytes, "Development patch version leaked")
        require(b"v2.1.3 @chikuwadon" not in stable_bytes, "Old Shorts version leaked")
        require(b"v2.1.4 @chikuwadon" in stable_bytes, "New Shorts version missing")
        # The extension DEX also retains the old Shorts patch banner. Update
        # only that version literal; no application behavior can be altered.
        ext_src = tmp / "extension-reviewed.dex"
        ext_src.write_bytes(approved.read(EXTENSION))
        ext_smali = tmp / "extension-smali"
        ext_original = disassemble(ext_src, ext_smali, tools)
        shorts = Path("e/e/a/ModernShorts.smali")
        require(shorts in ext_original, "Missing extension Shorts version owner")
        ext_text = (ext_smali / shorts).read_text(encoding="utf-8")
        from_banner = '"v2.1.3 @chikuwadon"'
        to_banner = '"v2.1.4 @chikuwadon"'
        require(ext_text.count(from_banner) == 2, f"Unexpected extension Shorts banner count: {ext_text.count(from_banner)}")
        (ext_smali / shorts).write_text(ext_text.replace(from_banner, to_banner), encoding="utf-8")
        stable_extension = tmp / "extension-stable.dex"
        assemble(ext_smali, stable_extension, tools)
        ext_rebuilt = disassemble(stable_extension, tmp / "extension-checked", tools)
        require(ext_original.keys() == ext_rebuilt.keys(), "Extension class set changed")
        require({p for p in ext_original if ext_original[p] != ext_rebuilt[p]} == {shorts},
                "Unreviewed extension behavior changed")
        require(ext_rebuilt[shorts].replace(to_banner.encode(), from_banner.encode()) == ext_original[shorts],
                "Non-version extension Smali change detected")
        extension_bytes = stable_extension.read_bytes()
        require(b"v2.1.4 @chikuwadon" in extension_bytes and b"v2.1.3 @chikuwadon" not in extension_bytes,
                "Extension banner was not safely updated")
        previous = approved.read(MANIFEST)
        old_version = f"Version: {REVIEWED}\r\n".encode()
        require(previous.count(old_version) == 1, "Unexpected manifest version")
        new_manifest = previous.replace(old_version, f"Version: {STABLE}\r\n".encode())
        overrides = {HELPERS: stable_bytes, EXTENSION: extension_bytes, MANIFEST: new_manifest}
        output.parent.mkdir(parents=True, exist_ok=True)
        with ZipFile(output, "w") as result:
            for entry in approved.infolist():
                result.writestr(copy(entry), overrides.get(entry.filename, approved.read(entry.filename)))
        with ZipFile(output) as result:
            require(result.namelist() == approved.namelist(), "Archive layout changed")
            require(result.testzip() is None, "Corrupt staged ZIP")
            for key in approved.namelist():
                require(result.read(key) == overrides.get(key, approved.read(key)),
                        f"Unapproved output entry difference: {key}")
        require(output.read_bytes() != reviewed.read_bytes(), "Version-only output not generated")
        # Include the exact stable runtime in source archives committed on the release tag.
        resources = ROOT / "patches/src/main/resources/nicoid"
        (resources / "helpers.mpe").write_bytes(stable_bytes)
        (resources / "method-delta.dex").write_bytes(approved.read(NATIVE))
    validate_mpp(output, STABLE)
    print("PASS: v2.1.4 stable MPP preserves SHA-locked dev.3 behavior with version-only changes")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiled", required=True, type=Path)
    parser.add_argument("--reviewed", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--tools", required=True, type=Path)
    args = parser.parse_args()
    stage(args.compiled, args.reviewed, args.output, args.tools)


if __name__ == "__main__":
    main()
