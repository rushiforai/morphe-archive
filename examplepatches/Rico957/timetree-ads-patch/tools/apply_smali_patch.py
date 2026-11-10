#!/usr/bin/env python3
"""Apply the TimeTree ad-removal smali edits to an apktool decoded tree.

Usage:
    python apply_smali_patch.py <decoded_dir>

Three independent edits, each idempotent (its own marker comment is checked):

1. Ads stream      - the Function1 lambda that builds Observable<AdsAdModel>
                     returns Observable.just(AdsAdModel.Empty) instead.
2. Splash ad gate  - the no-arg void gate method of SplashAdsActivity finishes
                     the activity instead of loading an ad.
3. AdsConfigModel  - the constructor zeroes its ad slot boolean parameters.

Exit code is 0 only when all three edits are present afterwards.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

MARK_ADS = "# === MORPHE PATCH: RemoveAds"
MARK_SPLASH = "# === MORPHE PATCH: RemoveSplashAds"
MARK_CONFIG = "# === MORPHE PATCH: DisableAdSlots"

ADS_REQUEST_PARAM = "Lworks/jubilee/timetree/domain/ads/model/timetree/AdsTimeTreeRequestParam;"
ADS_EMPTY = "Lworks/jubilee/timetree/domain/ads/model/AdsAdModel$Empty;"
SPLASH_CLASS = "Lworks/jubilee/timetree/app/ui/SplashAdsActivity;"
SPLASH_FILE = "SplashAdsActivity.smali"
CONFIG_FILE = "AdsConfigModel.smali"

METHOD_RE = re.compile(r"^\.method .*$", re.M)


def report(name: str, path, status: str) -> None:
    label = path if isinstance(path, str) else path.name
    print(f"[{status:5}] {name:14} {label}")


def methods(text: str):
    """Yield (header, block_start, block_end) for every method in a smali file."""
    for m in METHOD_RE.finditer(text):
        start = m.start()
        end = text.find("\n.end method", start)
        if end == -1:
            continue
        yield text[start:text.find("\n", start)], start, end


def insert_after_locals(block: str, payload: str) -> str:
    m = re.search(r"^\s*\.(locals|registers)\s+\d+\s*$", block, re.M)
    if not m:
        raise RuntimeError("method without .locals/.registers")
    cut = block.find("\n", m.end() - 1) + 1
    return block[:cut] + "\n" + payload + "\n" + block[cut:]


def find_empty_singleton(root: Path) -> str:
    """R8 renames the AdsAdModel.Empty singleton field, so read its real name."""
    for path in root.glob("smali*/**/*.smali"):
        if path.name != "AdsAdModel$Empty.smali":
            continue
        text = path.read_text(encoding="utf-8", errors="surrogateescape")
        m = re.search(
            r"^\.field public static final (\w+):" + re.escape(ADS_EMPTY) + r"\s*$",
            text,
            re.M,
        )
        if m:
            return m.group(1)
    raise RuntimeError("AdsAdModel$Empty singleton field not found")


def find_observable_just(body: str) -> str:
    """Reuse the exact method id the app itself calls.

    R8 turns Observable.just into `f` and narrows the return type to ObservableJust.
    Hand-writing `Observable;->f(Ljava/lang/Object;)Lio/reactivex/Observable;` yields a
    method id no class defines, and ART resolves on name+descriptor, so the app would
    throw NoSuchMethodError at runtime.
    """
    m = re.search(r"Lio/reactivex/Observable;->(\w+)\(Ljava/lang/Object;\)(L[\w/$]+;)", body)
    if not m:
        raise RuntimeError("no static Observable factory call in the ad stream lambda")
    return f"Lio/reactivex/Observable;->{m.group(1)}(Ljava/lang/Object;){m.group(2)}"


def patch_ads_stream(root: Path) -> bool:
    for path in sorted(root.glob("smali*/**/*.smali")):
        try:
            text = path.read_text(encoding="utf-8", errors="surrogateescape")
        except OSError:
            continue
        if ADS_REQUEST_PARAM not in text:
            continue
        if "Lkotlin/jvm/functions/Function1;" not in text:
            continue
        if "invoke(Ljava/lang/Object;)Ljava/lang/Object;" not in text:
            continue
        if MARK_ADS in text:
            report("ads-stream", path, "skip")
            return True

        singleton = find_empty_singleton(root)
        just_call = find_observable_just(text)

        payload = (
            f"    {MARK_ADS} (ad stream -> AdsAdModel.Empty) ===\n"
            f"    sget-object v0, {ADS_EMPTY}->{singleton}:{ADS_EMPTY}\n"
            f"    invoke-static {{v0}}, {just_call}\n"
            f"    move-result-object v0\n"
            f"    return-object v0"
        )

        for header, start, end in methods(text):
            if "invoke(Ljava/lang/Object;)Ljava/lang/Object;" not in header:
                continue
            block = text[start:end]
            if ".locals" not in block and ".registers" not in block:
                continue
            new_block = insert_after_locals(block, payload)
            path.write_text(
                text[:start] + new_block + text[end:],
                encoding="utf-8",
                errors="surrogateescape",
            )
            report("ads-stream", path, "patch")
            return True

    report("ads-stream", "not found", "MISS")
    return False


def patch_splash(root: Path) -> bool:
    candidates = [p for p in root.glob("smali*/**/*.smali") if p.name == SPLASH_FILE]
    for path in candidates:
        text = path.read_text(encoding="utf-8", errors="surrogateescape")
        if MARK_SPLASH in text:
            report("splash-ads", path, "skip")
            return True

        payload = (
            f'    {MARK_SPLASH} (always take the "no ad" path) ===\n'
            f"    invoke-virtual {{p0}}, {SPLASH_CLASS}->finish()V\n"
            f"    return-void"
        )

        for header, start, end in methods(text):
            head = header.split("(")[0]
            if "static" in head or not header.endswith("()V"):
                continue
            block = text[start:end]
            if not (
                "iget-boolean" in block
                and "iput-boolean" in block
                and "iget-object" in block
            ):
                continue
            new_block = insert_after_locals(block, payload)
            path.write_text(
                text[:start] + new_block + text[end:],
                encoding="utf-8",
                errors="surrogateescape",
            )
            report("splash-ads", path, "patch")
            return True

    report("splash-ads", "not found", "MISS")
    return False


def patch_config(root: Path) -> bool:
    candidates = [p for p in root.glob("smali*/**/*.smali") if p.name == CONFIG_FILE]
    if not candidates:
        report("ad-config", "not found", "MISS")
        return False

    path = candidates[0]
    text = path.read_text(encoding="utf-8", errors="surrogateescape")
    if MARK_CONFIG in text:
        report("ad-config", path, "skip")
        return True

    payload = (
        f"    {MARK_CONFIG} (zero every ad slot flag) ===\n"
        "    const/4 p4, 0x0\n"
        "    const/4 p5, 0x0\n"
        "    const/4 p6, 0x0\n"
        "    const/4 p7, 0x0\n"
        "    const/4 p8, 0x0\n"
        "    const/4 p9, 0x0"
    )

    for header, start, end in methods(text):
        if not header.startswith(
            ".method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;Z"
        ):
            continue
        new_block = insert_after_locals(text[start:end], payload)
        path.write_text(
            text[:start] + new_block + text[end:],
            encoding="utf-8",
            errors="surrogateescape",
        )
        report("ad-config", path, "patch")
        return True

    report("ad-config", path, "MISS")
    return False


def main() -> int:
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    root = Path(sys.argv[1]).resolve()
    if not root.is_dir():
        print(f"not a directory: {root}")
        return 2

    results = [patch_ads_stream(root), patch_splash(root), patch_config(root)]
    print(f"\napplied {sum(results)}/3 edits")
    return 0 if all(results) else 1


if __name__ == "__main__":
    raise SystemExit(main())
