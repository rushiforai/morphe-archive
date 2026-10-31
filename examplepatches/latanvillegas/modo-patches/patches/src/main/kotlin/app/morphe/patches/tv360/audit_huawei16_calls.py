#!/usr/bin/env python3
"""Read-only scan for specific Dalvik invoke instructions in Huawei TV360 1.6.

Requires audit_huawei16_apk.py in the same directory. Uses only Python stdlib.
This is a targeted raw opcode scan; candidate hits require later smali
verification of method boundaries, registers and control flow.
"""
from __future__ import annotations

import struct
import sys
import zipfile
from collections import defaultdict
from pathlib import Path

from audit_huawei16_apk import parse_dex, uleb, u2, u4

TARGETS = {
    ("Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;", "setResizeMode", "(I)V"):
        "VIDEO RESIZE",
    ("Landroid/app/Activity;", "setRequestedOrientation", "(I)V"):
        "ACTIVITY ORIENTATION",
    ("Landroidx/core/view/ViewCompat;", "setOnApplyWindowInsetsListener",
     "(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V"):
        "WINDOW INSETS",
}
# 35c: invoke-kind, 3rc: invoke-kind/range. Only plain method calls here.
INVOKE_OPS = {0x6e, 0x6f, 0x70, 0x71, 0x72, 0x74, 0x75, 0x76, 0x77, 0x78}
MAX_HITS_PER_TARGET = 50


def defined_code_items(data, methods):
    """Yield (owner method ref, code_off) from class_data_items."""
    class_count, class_off = u4(data, 96), u4(data, 100)
    for class_index in range(class_count):
        item = class_off + 32 * class_index
        data_off = u4(data, item + 24)
        if not data_off:
            continue
        pos = data_off
        counts = []
        for _ in range(4):
            count, pos = uleb(data, pos)
            counts.append(count)
        for _ in range(counts[0] + counts[1]):
            _, pos = uleb(data, pos)
            _, pos = uleb(data, pos)
        for count in counts[2:]:
            index = 0
            for _ in range(count):
                diff, pos = uleb(data, pos)
                index += diff
                _, pos = uleb(data, pos)  # access_flags
                code_off, pos = uleb(data, pos)
                if code_off:
                    yield methods[index], code_off


def find_candidate_calls(data, methods, code_off, desired):
    if code_off + 16 > len(data):
        return
    units = u4(data, code_off + 12)
    begin = code_off + 16
    end = begin + units * 2
    if end > len(data):
        return
    for pos in range(begin, end - 3, 2):
        first = u2(data, pos)
        opcode = first & 0xff
        if opcode not in INVOKE_OPS:
            continue
        idx = u2(data, pos + 2)
        if idx not in desired:
            continue
        # The targets accept two registers (receiver, int) except insets,
        # which is static with View and Listener, also two registers.
        count = (first >> 8) & 0xff if opcode >= 0x74 else (first >> 12) & 0xf
        if count != 2:
            continue
        preceding = [f"{u2(data, j):04x}" for j in
                     range(max(begin, pos - 12), pos, 2)]
        yield idx, opcode, (pos - begin) // 2, " ".join(preceding)


def main():
    if len(sys.argv) != 2:
        raise SystemExit("usage: python audit_huawei16_calls.py TV360_Bitel_1.6.apk")
    apk = Path(sys.argv[1]).expanduser()
    if not apk.is_file():
        raise SystemExit(f"file not found: {apk}")
    found = defaultdict(list)
    dex_names = ("classes.dex", "classes2.dex", "classes3.dex", "classes4.dex")
    with zipfile.ZipFile(apk) as z:
        for dex_name in dex_names:
            if dex_name not in z.namelist():
                continue
            data = z.read(dex_name)
            _, _, methods = parse_dex(data)
            desired = {idx: TARGETS[method] for idx, method in enumerate(methods)
                       if method in TARGETS}
            print(f"[{dex_name}] matching method IDs: {len(desired)}")
            if not desired:
                continue
            for caller, code_off in defined_code_items(data, methods):
                for idx, opcode, pc, preceding in find_candidate_calls(
                    data, methods, code_off, desired
                ):
                    category = desired[idx]
                    found[category].append((dex_name, caller, methods[idx],
                                            opcode, pc, preceding))
    for category in TARGETS.values():
        hits = found.get(category, [])
        print(f"\n=== {category}: {len(hits)} raw candidates ===")
        for dex, caller, callee, opcode, pc, preceding in hits[:MAX_HITS_PER_TARGET]:
            print(f"DEX: {dex}")
            print(f"  Caller: {caller[0]}->{caller[1]}{caller[2]}")
            print(f"  Target: {callee[0]}->{callee[1]}{callee[2]}")
            print(f"  Invoke opcode: 0x{opcode:02x}; code-unit offset: {pc}")
            print(f"  Preceding code units (hex): {preceding}")
        if len(hits) > MAX_HITS_PER_TARGET:
            print(f"  ... limited to first {MAX_HITS_PER_TARGET} candidates")
    print("\nThese are targeted raw-code candidates, NOT independently")
    print("validated patch locations. Smali instruction decoding is required.")


if __name__ == "__main__":
    main()
