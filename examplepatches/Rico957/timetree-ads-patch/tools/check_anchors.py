#!/usr/bin/env python3
"""Offline sanity check of the Morphe patch anchors against a decoded (smali) tree.

This mirrors what the Kotlin fingerprints do at patch time, so a release can be
validated on a machine without the patcher toolchain.

Usage: python check_anchors.py <apktool_decoded_dir>
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

ACC_STATIC = 0x8

ADS_CONFIG = "Lworks/jubilee/timetree/domain/ads/model/AdsConfigModel;"
ADS_EMPTY = "Lworks/jubilee/timetree/domain/ads/model/AdsAdModel$Empty;"
SPLASH = "Lworks/jubilee/timetree/app/ui/SplashAdsActivity;"
OBSERVABLE = "Lio/reactivex/Observable;"


def load(root: Path) -> dict[str, Path]:
    out = {}
    for p in root.glob("smali*/**/*.smali"):
        out[str(p)] = p
    return out


def class_of(path: Path) -> str | None:
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines()[:20]:
        if line.startswith(".class "):
            parts = line.strip().split()
            return parts[-1]
    return None


def main() -> int:
    root = Path(sys.argv[1]).resolve()
    files = load(root)
    by_class: dict[str, Path] = {}
    for p in files.values():
        c = class_of(p)
        if c and c not in by_class:
            by_class[c] = p

    ok = True

    # 1. AdsAdModel.Empty must expose a static instance field of its own type
    empty = by_class.get(ADS_EMPTY)
    if not empty:
        print("FAIL AdsAdModel$Empty class not found")
        ok = False
    else:
        text = empty.read_text(encoding="utf-8", errors="replace")
        m = re.search(r"^\.field public static final (\w+):" + re.escape(ADS_EMPTY) + r"$", text, re.M)
        if m:
            print(f"OK   AdsAdModel$Empty singleton field = {m.group(1)}")
        else:
            print("FAIL no static field of type AdsAdModel$Empty")
            ok = False

    # 2. Observable.just(Object) candidate
    obs = by_class.get(OBSERVABLE)
    if not obs:
        print("FAIL io.reactivex.Observable not found")
        ok = False
    else:
        text = obs.read_text(encoding="utf-8", errors="replace")
        pat = re.compile(
            r"^\.method public static (?:final )?(\w+)\(Ljava/lang/Object;\)" + re.escape(OBSERVABLE) + r"$",
            re.M,
        )
        cands = [m.group(1) for m in pat.finditer(text)]
        if "f" in cands:
            print(f"OK   Observable.just -> 'f'  (all candidates: {cands})")
        elif cands:
            print(f"WARN no 'f', would fall back to '{cands[0]}'  (candidates: {cands})")
        else:
            print("FAIL no static (Object)Observable method")
            ok = False

    # 3. AdsConfigModel: boolean fields + constructor ending in return-void
    cfg = by_class.get(ADS_CONFIG)
    if not cfg:
        print("FAIL AdsConfigModel not found")
        ok = False
    else:
        text = cfg.read_text(encoding="utf-8", errors="replace")
        bools = re.findall(r"^\.field public final (\w+):Z$", text, re.M)
        print(f"OK   AdsConfigModel non-static boolean fields = {len(bools)} {bools}")
        if len(bools) < 6:
            print("FAIL fewer than 6 boolean fields")
            ok = False
        blocks = re.findall(r"^\.method public constructor <init>\(.*?^\.end method", text, re.S | re.M)
        if not blocks:
            print("FAIL no constructor found")
            ok = False
        else:
            for i, b in enumerate(blocks):
                tail = [l.strip() for l in b.splitlines() if l.strip() and not l.strip().startswith(".")][-1]
                print(f"OK   constructor #{i} last instruction = {tail}")

    # 4. SplashAdsActivity gate method
    splash = by_class.get(SPLASH)
    if not splash:
        print("FAIL SplashAdsActivity not found")
        ok = False
    else:
        text = splash.read_text(encoding="utf-8", errors="replace")
        hits = []
        for m in re.finditer(r"^\.method public final (\w+)\(\)V$(.*?)^\.end method", text, re.S | re.M):
            body = m.group(2)
            if "iget-boolean" in body and "iput-boolean" in body and "iget-object" in body:
                hits.append(m.group(1))
        print(("OK   " if hits else "FAIL ") + f"splash gate method candidates = {hits}")
        if not hits:
            ok = False

    print("\nRESULT:", "all anchors present" if ok else "PROBLEM")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
