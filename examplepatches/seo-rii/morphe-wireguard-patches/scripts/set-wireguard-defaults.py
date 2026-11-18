#!/usr/bin/env python3
"""Repair the Android default flags in the published v2.1.1 WireGuard bundle.

The input is pinned by SHA-256. Only two DEX instructions, the DEX header
hashes, and the bundle manifest version/timestamp may change. This is an
artifact repair, not a Gradle rebuild. The JVM flags are already correct.
Requires a JDK (javap) and Android SDK Build-Tools (dexdump).
"""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path
import re
import struct
import subprocess
import tempfile
import zipfile
import zlib


INPUT_SHA256 = "9905a6a9a57d281532c94a9b53215a5414ccc4185b880031c0f67d0361fd69ca"
VERSION = "2.1.2"
APPS = ("music", "youtube")
MANIFEST = "META-INF/MANIFEST.MF"


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def dex_defaults(disassembly: str) -> dict[str, tuple[int, bool]]:
    """Read the Boolean argument passed to PatchKt.patch in each initializer."""
    found = {}
    for block in re.split(r"(?m)^Class #", disassembly):
        descriptor = re.search(r"Class descriptor\s+: '([^']+)'", block)
        if descriptor is None:
            continue
        for app in APPS:
            expected = f"Lapp/morphe/patches/{app}/misc/wireguard/WireGuardPatchKt;"
            if descriptor[1] != expected:
                continue
            require(app not in found, f"Duplicate Android patch: {app}")
            initializer = re.search(
                r"name\s+: '<clinit>'(.*?)(?=\n    #|\Z)", block, re.DOTALL)
            require(initializer is not None, f"Missing Android initializer: {app}")
            # Guard the actual Boolean argument and the immediately following
            # constructor call, rather than matching unrelated true constants.
            sites = re.findall(
                r"(?m)^([0-9a-f]+):[^\n]*\|0009: const/4 v3, #int ([01]) //[^\n]*\n"
                r"[0-9a-f]+:[^\n]*\|000a: invoke-static \{v1, v2, v3, v0\}, "
                r"Lapp/morphe/patcher/patch/PatchKt;\.patch:"
                r"\(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;\)",
                initializer[1])
            require(len(sites) == 1, f"Unexpected Android initializer: {app}")
            offset, value = sites[0]
            found[app] = (int(offset, 16), value == "1")
    require(set(found) == set(APPS), "Both Android WireGuard patches must be present")
    return found


def inspect(bundle: Path, dexdump: Path, android_default: bool = True
            ) -> dict[str, tuple[int, bool]]:
    with zipfile.ZipFile(bundle) as archive, tempfile.TemporaryDirectory() as tmp:
        require(archive.testzip() is None, "ZIP CRC check failed")
        require(len(archive.namelist()) == len(set(archive.namelist())), "Duplicate ZIP entries")
        dex = archive.read("classes.dex")
        require(dex[:8] == b"dex\n038\x00", "Unexpected DEX version")
        require(dex[12:32] == hashlib.sha1(dex[32:]).digest(), "DEX SHA-1 mismatch")
        require(struct.unpack_from("<I", dex, 8)[0] == zlib.adler32(dex[12:]),
                "DEX Adler32 mismatch")
        dex_path = Path(tmp) / "classes.dex"
        dex_path.write_bytes(dex)
        subprocess.run([str(dexdump), "-c", str(dex_path)], check=True,
                       stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        disassembly = subprocess.run(
            [str(dexdump), "-d", str(dex_path)], check=True,
            stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout.decode(errors="replace")
        defaults = dex_defaults(disassembly)
        for app in APPS:
            patch_class = f"app.morphe.patches.{app}.misc.wireguard.WireGuardPatchKt"
            javap = subprocess.run(
                ["javap", "-classpath", str(bundle.resolve()), "-c", "-p", patch_class],
                check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout.decode()
            initializer = javap.split("static {};", 1)
            require(len(initializer) == 2, f"Missing JVM initializer: {app}")
            require(re.search(
                r"4: iconst_1\s+5: invokedynamic[^\n]*\n\s*10: invokestatic[^\n]*"
                r"app/morphe/patcher/patch/PatchKt.patch:", initializer[1]) is not None,
                f"JVM patch must be selected by default: {app}")
            require(defaults[app][1] == android_default,
                    f"Android {app} default={defaults[app][1]}, expected {android_default}")
            print(f"PASS {app}: JVM default=True; Android default={android_default}")
        return defaults


def repair(original: Path, output: Path, dexdump: Path, timestamp_ms: int) -> None:
    require(hashlib.sha256(original.read_bytes()).hexdigest() == INPUT_SHA256,
            "Input must be the exact published v2.1.1 bundle; refusing unrecognized input")
    require(not output.exists(), "Output already exists; choose a new path")
    require(original.resolve() != output.resolve(), "Input and output must differ")
    require(timestamp_ms > 0, "Timestamp must be positive")
    defaults = inspect(original, dexdump, android_default=False)
    output.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="wireguard-repair-", dir=output.parent) as tmp:
        candidate = Path(tmp) / "repaired.mpp"
        with zipfile.ZipFile(original) as src, zipfile.ZipFile(candidate, "w") as dst:
            dst.comment = src.comment
            for info in src.infolist():
                payload = src.read(info)
                if info.filename == "classes.dex":
                    dex = bytearray(payload)
                    for offset, _ in defaults.values():
                        require(dex[offset:offset + 2] == b"\x12\x03", "Unexpected DEX opcode")
                        dex[offset + 1] = 0x13  # const/4 v3, #int 1
                    changed = {i for i, (a, b) in enumerate(zip(payload, dex)) if a != b}
                    require(changed == {offset + 1 for offset, _ in defaults.values()},
                            "Unexpected DEX instruction change")
                    dex[12:32] = hashlib.sha1(dex[32:]).digest()
                    struct.pack_into("<I", dex, 8, zlib.adler32(dex[12:]))
                    payload = bytes(dex)
                elif info.filename == MANIFEST:
                    require(payload.count(b"Version: 2.1.1\r\n") == 1, "Unexpected bundle version")
                    payload = payload.replace(b"Version: 2.1.1\r\n",
                                              f"Version: {VERSION}\r\n".encode())
                    payload, count = re.subn(
                        rb"(?m)^Timestamp: [0-9]+\r$",
                        f"Timestamp: {timestamp_ms}\r".encode(), payload)
                    require(count == 1, "Unexpected manifest timestamp")
                dst.writestr(info, payload)
        inspect(candidate, dexdump)
        with zipfile.ZipFile(original) as src, zipfile.ZipFile(candidate) as dst:
            require(src.namelist() == dst.namelist(), "Archive members/order changed")
            changed = {name for name in src.namelist() if src.read(name) != dst.read(name)}
            require(changed == {"classes.dex", MANIFEST}, "Unexpected bundle payload change")
        candidate.rename(output)
    print("PASS only two DEX Boolean literals, DEX hashes and manifest changed")
    print(f"SHA-256 {hashlib.sha256(output.read_bytes()).hexdigest()}  {output}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest="command", required=True)
    verify = commands.add_parser("verify", help="Require both JVM and Android defaults to be true")
    verify.add_argument("bundle", type=Path)
    verify.add_argument("--dexdump", type=Path, required=True)
    transform = commands.add_parser("repair", help="Create v2.1.2 from the pinned v2.1.1 bundle")
    transform.add_argument("original", type=Path)
    transform.add_argument("output", type=Path)
    transform.add_argument("--dexdump", type=Path, required=True)
    transform.add_argument("--timestamp-ms", type=int, required=True)
    args = parser.parse_args()
    if args.command == "verify":
        inspect(args.bundle, args.dexdump)
    else:
        repair(args.original, args.output, args.dexdump, args.timestamp_ms)


if __name__ == "__main__":
    main()
