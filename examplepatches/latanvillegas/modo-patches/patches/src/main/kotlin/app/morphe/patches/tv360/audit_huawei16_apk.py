#!/usr/bin/env python3
"""Read-only audit of TV360 Bitel Huawei 1.6 DEX/manifest using Python stdlib.

Usage:
    python audit_huawei16_apk.py "/storage/emulated/0/Download/TV360 Bitel 1.6.apk"

Only reports class definitions, method signatures and DEX method references.
A method reference is NOT proof of an executed callsite. No APK bytes are changed.
"""
from __future__ import annotations

import hashlib
import struct
import subprocess
import sys
import zipfile
from collections import defaultdict
from pathlib import Path


TARGETS = {
    "HomeBoxActivity": (
        "Lcom/viettel/tv360/ui/home/HomeBoxActivity;",
        {"onCreate", "setScreenOriention", "getDataFields"},
    ),
    "SplashActivity": (
        "Lcom/viettel/tv360/ui/login/SplashActivity;",
        {"onCreate", "initWelcome"},
    ),
    "ContentItemClickListener": (
        "Lcom/viettel/tv360/ui/home/ContentItemClickListener;",
        {"onClick"},
    ),
    "Alticast player controller": (
        "Lcom/viettel/tv360/media/alticast/U;",
        {"h"},
    ),
    "Film bottom banner": (
        "Lcom/viettel/tv360/ui/miniplay/AlticastBottomPlayerFragmentFilm;",
        {"showDisplayBanner"},
    ),
    "Film right banner": (
        "Lcom/viettel/tv360/ui/miniplay/AlticastRightPlayerFragmentFilm;",
        {"showDisplayBanner"},
    ),
    "Sport banner": (
        "Lcom/viettel/tv360/ui/sport/SportAdapter;",
        {"showDisplayBanner"},
    ),
    "Player overlay": (
        "Lcom/viettel/tv360/ui/miniplay/AlticastTopPlayerFragmentBase;",
        {"onPlayerStateChanged"},
    ),
    "Short video": (
        "Lcom/viettel/tv360/ui/miniplay/AlticastPlayerVideoShortFragment;",
        {"addAds"},
    ),
    "ExoPlayer AspectRatioFrameLayout": (
        "Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;",
        {"setResizeMode"},
    ),
    "Wiinvent display": (
        "Ltv/wiinvent/wiinventsdk/DisplayBannerManager;",
        {"requestAds"},
    ),
    "Wiinvent overlay": (
        "Ltv/wiinvent/wiinventsdk/OverlayBannerManager;",
        {"requestAds"},
    ),
    "Wiinvent instream": (
        "Ltv/wiinvent/wiinventsdk/InStreamManager;",
        {"requestAds"},
    ),
    "Wiinvent welcome": (
        "Ltv/wiinvent/wiinventsdk/AdsWelcomeManager;",
        {"requestAds"},
    ),
}

CANDIDATES = (
    "HomeBox", "Splash", "Alticast", "ContentItemClick",
    "SportAdapter", "AspectRatioFrameLayout", "BannerManager", "InStreamManager",
)


def uleb(data: bytes, offset: int) -> tuple[int, int]:
    value = 0
    for shift in range(0, 35, 7):
        byte = data[offset]
        offset += 1
        value |= (byte & 0x7f) << shift
        if not byte & 0x80:
            return value, offset
    raise ValueError("invalid DEX ULEB128")


def u2(data: bytes, offset: int) -> int:
    return struct.unpack_from("<H", data, offset)[0]


def u4(data: bytes, offset: int) -> int:
    return struct.unpack_from("<I", data, offset)[0]


def parse_dex(data: bytes):
    if data[:4] != b"dex\n":
        raise ValueError("unsupported DEX format or invalid DEX header")
    string_count, string_off = u4(data, 56), u4(data, 60)
    type_count, type_off = u4(data, 64), u4(data, 68)
    proto_count, proto_off = u4(data, 72), u4(data, 76)
    method_count, method_off = u4(data, 88), u4(data, 92)
    class_count, class_off = u4(data, 96), u4(data, 100)

    strings = []
    for i in range(string_count):
        start = u4(data, string_off + 4 * i)
        _, pos = uleb(data, start)
        end = data.index(b"\x00", pos)
        strings.append(data[pos:end].decode("utf-8", "replace"))
    types = [strings[u4(data, type_off + 4 * i)] for i in range(type_count)]
    protos = []
    for i in range(proto_count):
        off = proto_off + 12 * i
        result_type, args_off = u4(data, off + 4), u4(data, off + 8)
        arguments = ""
        if args_off:
            size = u4(data, args_off)
            arguments = "".join(types[u2(data, args_off + 4 + 2 * j)] for j in range(size))
        protos.append(f"({arguments}){types[result_type]}")

    methods = []
    for i in range(method_count):
        off = method_off + 8 * i
        owner_idx, proto_idx, name_idx = struct.unpack_from("<HHI", data, off)
        methods.append((types[owner_idx], strings[name_idx], protos[proto_idx]))

    defined = defaultdict(list)
    classes = []
    for i in range(class_count):
        off = class_off + 32 * i
        owner = types[u4(data, off)]
        classes.append(owner)
        class_data_off = u4(data, off + 24)
        if not class_data_off:
            continue
        pos = class_data_off
        counts = []
        for _ in range(4):
            count, pos = uleb(data, pos)
            counts.append(count)
        for _ in range(counts[0] + counts[1]):
            _, pos = uleb(data, pos)  # field_idx_diff
            _, pos = uleb(data, pos)  # access_flags
        for count in counts[2:]:
            method_idx = 0
            for _ in range(count):
                diff, pos = uleb(data, pos)
                method_idx += diff
                _, pos = uleb(data, pos)  # access_flags
                code_off, pos = uleb(data, pos)
                method_owner, name, signature = methods[method_idx]
                defined[owner].append((name, signature, bool(code_off)))
                if method_owner != owner:
                    raise ValueError(f"DEX class/method index mismatch: {owner}")
    return classes, defined, methods


def output(lines, s=""):
    lines.append(s)


def main() -> int:
    if len(sys.argv) != 2:
        print(__doc__.strip())
        return 2
    apk = Path(sys.argv[1]).expanduser()
    if not apk.is_file():
        print(f"ERROR: APK not found: {apk}", file=sys.stderr)
        return 1

    lines = [
        "TV360 Huawei 1.6 - READ ONLY DEX audit",
        f"APK: {apk}",
        f"Size: {apk.stat().st_size} bytes",
        f"SHA-256: {hashlib.sha256(apk.read_bytes()).hexdigest()}",
        "Method references below are NOT confirmed invocation sites.",
        "",
    ]
    definitions = defaultdict(list)
    references = defaultdict(list)
    all_classes = []
    with zipfile.ZipFile(apk) as archive:
        dex_entries = sorted(
            (n for n in archive.namelist() if n.startswith("classes") and n.endswith(".dex")),
            key=lambda name: (name != "classes.dex", name),
        )
        output(lines, f"DEX files: {', '.join(dex_entries)}")
        for entry in dex_entries:
            data = archive.read(entry)
            try:
                classes, defined, methods = parse_dex(data)
            except (ValueError, IndexError, struct.error) as exc:
                output(lines, f"ERROR parsing {entry}: {exc}")
                return 1
            output(lines, f"  {entry}: {len(classes)} defined classes; {len(methods)} method IDs")
            all_classes.extend(classes)
            for owner, methodlist in defined.items():
                definitions[owner].extend((entry, *m) for m in methodlist)
            for owner, methodname, signature in methods:
                references[owner].append((entry, methodname, signature))

    output(lines, "\n=== Exact 3.5 patch anchors against 1.6 ===")
    for label, (owner, expected_names) in TARGETS.items():
        is_defined = owner in all_classes
        defs = definitions.get(owner, [])
        method_refs = references.get(owner, [])
        output(lines, f"\n[{label}] {owner}")
        output(lines, f"  CLASS DEFINED: {is_defined}")
        for name in sorted(expected_names):
            matched_defs = [(dex, sig, code) for dex, meth, sig, code in defs if meth == name]
            matched_refs = [(dex, sig) for dex, meth, sig in method_refs if meth == name]
            output(lines, f"  {name}: definitions={len(matched_defs)} references={len(matched_refs)}")
            for dex, sig, code in matched_defs[:15]:
                output(lines, f"    DEFINITION {dex}: {name}{sig} code={code}")
            if not matched_defs:
                for dex, sig in sorted(set(matched_refs))[:8]:
                    output(lines, f"    REF ONLY {dex}: {name}{sig}")

    output(lines, "\n=== Name-based class candidates (NOT patch matches) ===")
    for keyword in CANDIDATES:
        matches = sorted({c for c in all_classes if keyword.casefold() in c.casefold()})
        output(lines, f"{keyword}: {len(matches)} defined candidate classes")
        for name in matches[:12]:
            output(lines, f"  {name}")
        if len(matches) > 12:
            output(lines, "  ... (remaining omitted)")

    output(lines, "\n=== Manifest references (aapt read-only) ===")
    try:
        p = subprocess.run(
            ["aapt", "dump", "badging", str(apk)],
            text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=False,
        )
        for line in p.stdout.splitlines():
            if line.startswith(("package:", "sdkVersion:", "targetSdkVersion:", "launchable-activity:")):
                output(lines, line)
        if p.returncode:
            output(lines, f"aapt dump badging returned {p.returncode}: {p.stderr.strip()[:500]}")
        p2 = subprocess.run(
            ["aapt", "dump", "xmltree", str(apk), "AndroidManifest.xml"],
            text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=False,
        )
        manifest_lines = p2.stdout.splitlines()
        for i, line in enumerate(manifest_lines):
            if any(needle in line for needle in (
                "HomeBoxActivity", "SplashActivity", "screenOrientation",
            )):
                for context in manifest_lines[max(0, i-2):i+3]:
                    output(lines, context.strip())
                output(lines, "---")
        if p2.returncode:
            output(lines, f"aapt xmltree returned {p2.returncode}: {p2.stderr.strip()[:500]}")
    except FileNotFoundError:
        output(lines, "aapt not installed; skipping manifest inspection")

    output(lines, "\nSUMMARY: signature/method existence only. Inspect individual bytecode")
    output(lines, "invoke instructions and surrounding control flow BEFORE porting 3.5 hooks.")
    print("\n".join(lines))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
