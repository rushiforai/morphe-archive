#!/usr/bin/env python3
"""Read-only method code-unit windows for verified Huawei 1.6 TV360 hook candidates.

Usage: python audit_huawei16_windows.py "/storage/emulated/0/Download/TV360 Bitel 1.6.apk"
Requires audit_huawei16_apk.py and audit_huawei16_calls.py alongside this file.
Raw code units are NOT a full smali disassembly; candidates require verification.
"""
from __future__ import annotations

import sys
import zipfile
from pathlib import Path

from audit_huawei16_apk import parse_dex, u2, u4
from audit_huawei16_calls import defined_code_items

FOCUS = {
    ("Ln2/y;", "a", "(Z)V"): "VIDEO RESIZE / class Ln2/y",
    ("Lcom/viettel/tv360/ui/home/HomeBoxActivity;", "v2", "(Z)V"): "HOME RUNTIME ROTATION",
    ("Lcom/viettel/tv360/ui/home/HomeBoxActivity;", "onCreate", "(Landroid/os/Bundle;)V"): "HOME STARTUP ROTATION",
}

TARGET_SUFFIXES = (
    "->setResizeMode(I)V",
    "->setRequestedOrientation(I)V",
)

INVOKES = {0x6e: "invoke-virtual", 0x74: "invoke-virtual/range"}
BEFORE_UNITS = 24
AFTER_UNITS = 10


def window(units, pc):
    a = max(0, pc - BEFORE_UNITS)
    b = min(len(units), pc + AFTER_UNITS)
    for i in range(a, b):
        flag = "-->" if i == pc else "   "
        word = units[i]
        explanation = ""
        if word & 255 == 0x12:
            register = (word >> 8) & 15
            literal = (word >> 12) & 15
            if literal >= 8:
                literal -= 16
            explanation = f" possibly const/4 v{register}, {literal}"
        elif word & 255 == 0x13 and i + 1 < len(units):
            literal = units[i+1]
            if literal >= 32768:
                literal -= 65536
            explanation = f" possibly const/16 v{word>>8}, {literal}"
        if i == pc:
            opcode = word & 255
            if opcode == 0x6e:
                count = (word >> 12) & 15
                regs = units[i+2] if i+2 < len(units) else 0
                explanation = (f" {INVOKES[opcode]}, n={count}, "
                               f"C={regs&15}, D={(regs>>4)&15}, "
                               f"E={(regs>>8)&15}, F={(regs>>12)&15}")
            elif opcode == 0x74:
                count = word >> 8
                start = units[i+2] if i+2 < len(units) else 0
                explanation = f" {INVOKES[opcode]}, words={count}, first=v{start}"
        print(f"  {flag} [{i:4d}] {word:04x}{explanation}")


def main():
    if len(sys.argv) != 2:
        raise SystemExit("usage: python audit_huawei16_windows.py APK")
    apk = Path(sys.argv[1]).expanduser()
    if not apk.is_file():
        raise SystemExit(f"missing APK: {apk}")

    results = 0
    with zipfile.ZipFile(apk) as archive:
        for dex_name in ("classes.dex", "classes2.dex", "classes3.dex", "classes4.dex"):
            if dex_name not in archive.namelist():
                continue
            data = archive.read(dex_name)
            _, _, methods = parse_dex(data)
            for caller, code_off in defined_code_items(data, methods):
                if caller not in FOCUS:
                    continue
                results += 1
                registers = u2(data, code_off)
                ins_size = u2(data, code_off+2)
                size = u4(data, code_off + 12)
                start = code_off + 16
                units = [u2(data, start + i*2) for i in range(size)]
                print(f"\n=== {FOCUS[caller]} ===")
                print(f"DEX {dex_name}; {caller[0]}->{caller[1]}{caller[2]}")
                print(f"registers={registers}, ins={ins_size}, code_units={size}")
                count = 0
                for pc in range(size - 2):
                    opcode = units[pc] & 255
                    if opcode not in INVOKES:
                        continue
                    idx = units[pc + 1]
                    if idx >= len(methods):
                        continue
                    target = methods[idx]
                    if not any(f"->{target[1]}{target[2]}" == item for item in TARGET_SUFFIXES):
                        continue
                    if target[0] not in ("Landroid/app/Activity;",
                                         "Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;"):
                        continue
                    count += 1
                    print(f"\nCALLSITE {count}: code_unit={pc} "
                          f"-> {target[0]}->{target[1]}{target[2]}")
                    window(units, pc)
                print(f"Total candidate calls in this method: {count}")
    print(f"\nFocused methods examined: {results}")
    print("This is a raw-byte audit, not a control-flow validated disassembly.")


if __name__ == "__main__":
    main()
