#!/usr/bin/env python3
"""Read-only local audit of Huawei TV360 Bitel 1.6 PiP lifecycle hooks.

Usage:
  python audit_huawei16_pip.py "/storage/emulated/0/Download/TV360 Bitel 1.6.apk"

Run next to audit_huawei16_apk.py and audit_huawei16_calls.py.
This neither modifies nor uploads the APK. Output contains no account tokens.
"""
from __future__ import annotations

import hashlib
import sys
import zipfile
from pathlib import Path

from audit_huawei16_apk import parse_dex, u2, u4
from audit_huawei16_calls import defined_code_items

PLAYER = "Lcom/viettel/tv360/ui/miniplay/AlticastTopPlayerFragmentBase;"
HOME = "Lcom/viettel/tv360/ui/home/HomeBoxActivity;"
WATCH = {
    PLAYER: {
        "onCreateView", "onDestroyView", "onStop", "onPause", "onResume",
        "onDestroy", "onViewCreated", "onPictureInPictureModeChanged",
        "onPlayerStateChanged",
    },
    HOME: {"onCreate", "onResume", "onPause", "onUserLeaveHint", "onStop"},
}


def main() -> int:
    if len(sys.argv) != 2:
        print("Usage: python audit_huawei16_pip.py PATH_TO_APK")
        return 2
    apk = Path(sys.argv[1]).expanduser()
    if not apk.is_file():
        print(f"Not found: {apk}")
        return 2
    sha = hashlib.sha256(apk.read_bytes()).hexdigest()
    print(f"Original APK SHA-256: {sha}")
    expected = "0ba200d9e60d4808d4131cf612118ed5c449728c082600426816a94ab8057fbd"
    if sha != expected:
        print("WARNING: different SHA-256; method conclusions do NOT apply to audited original")

    results = {owner: [] for owner in WATCH}
    with zipfile.ZipFile(apk) as archive:
        for dex_name in ("classes.dex", "classes2.dex", "classes3.dex", "classes4.dex"):
            if dex_name not in archive.namelist():
                continue
            dex = archive.read(dex_name)
            _, _, methods = parse_dex(dex)
            for (owner, name, signature), code_off in defined_code_items(dex, methods):
                if owner not in WATCH or name not in WATCH[owner]:
                    continue
                registers = u2(dex, code_off)
                inputs = u2(dex, code_off + 2)
                units = u4(dex, code_off + 12)
                results[owner].append(
                    (dex_name, name, signature, registers, inputs, units)
                )

    for owner, entries in results.items():
        print(f"\n=== {owner} ===")
        for dex_name, name, signature, registers, inputs, units in entries:
            print(f"  {dex_name}: {name}{signature} "
                  f"registers={registers} inputs={inputs} code_units={units}")
        present = {entry[1] for entry in entries}
        for name in sorted(WATCH[owner] - present):
            print(f"  ABSENT definition: {name}")
    state = [
        entry for entry in results[PLAYER]
        if entry[1] == "onPlayerStateChanged" and
        entry[2] == (
            "(Lcom/google/android/exoplayer2/analytics/"
            "AnalyticsListener$EventTime;ZI)V"
        )
    ]
    print("\\n=== PiP playback-state anchor eligibility ===")
    print(f"  onPlayerStateChanged(EventTime, boolean, int) exactly defined: {len(state) == 1}")
    print("  This confirms a class/method, not whether auto-PiP is supported")
    print("  by the device or playback continues after leaving the app.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
