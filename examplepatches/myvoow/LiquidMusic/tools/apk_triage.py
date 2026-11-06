#!/usr/bin/env python3
"""
LiquidMusic - triage of an APK / APKM / XAPK / APKS (standard library only).

Answers the first questions about an app without apktool or jadx:
  * version, minSdk / targetSdk, launcher activity;
  * does the app ship Jetpack Compose, and which versions?
  * which resource names look like the tab bar or the mini player?
  * which sensitive classes and APIs are referenced (BottomNavigationView,
    ComposeView, RenderEffect, RuntimeShader, signature checks,
    Play Integrity...)?
  * which native libraries are present?

Usage:
    python3 -I tools/apk_triage.py path/to/AppleMusic.apkm [--json out.json]
"""

from __future__ import annotations

import argparse
import io
import json
import re
import struct
import sys
import zipfile
from collections import defaultdict

# --------------------------------------------------------------------------- #
# Search patterns
# --------------------------------------------------------------------------- #

# Resource names (layouts, ids, dimens...) that look like the targeted views.
RES_NAME_PATTERNS = re.compile(
    r"(tab_?bar|bottom_?nav|navigation_?bar|nav_?bar|bottom_?bar|"
    r"mini_?player|miniplayer|now_?playing|playback_?bar|player_?bar|"
    r"floating|_pill|pill_|glass|blur|translucen)",
    re.IGNORECASE,
)

# DEX strings of interest: (label, regex on the whole string).
DEX_MARKERS = [
    # Trace sections of the Compose runtime: they survive R8 obfuscation.
    ("Compose: runtime traces (reliable when obfuscated)", r"^Compose:(recompose|applyChanges)$"),
    ("Compose: AndroidComposeView (error message)", r"^Cannot locate windowRecomposer"),
    ("Compose: ComposeView", r"^Landroidx/compose/ui/platform/ComposeView;$"),
    ("Compose: AbstractComposeView", r"^Landroidx/compose/ui/platform/AbstractComposeView;$"),
    ("Compose: runtime Composer", r"^Landroidx/compose/runtime/Composer;$"),
    ("Compose: NavigationBar (M3)", r"androidx/compose/material3/NavigationBar"),
    ("Views: BottomNavigationView", r"^Lcom/google/android/material/bottomnavigation/BottomNavigationView;$"),
    ("Views: NavigationBarView", r"^Lcom/google/android/material/navigation/NavigationBarView;$"),
    ("Views: TabLayout", r"^Lcom/google/android/material/tabs/TabLayout;$"),
    ("Views: CoordinatorLayout", r"^Landroidx/coordinatorlayout/widget/CoordinatorLayout;$"),
    ("Views: RecyclerView", r"^Landroidx/recyclerview/widget/RecyclerView;$"),
    ("Views: DataBinding", r"^Landroidx/databinding/ViewDataBinding;$"),
    ("Epoxy", r"^Lcom/airbnb/epoxy/"),
    ("Rendering: RenderEffect", r"^Landroid/graphics/RenderEffect;$"),
    ("Rendering: RuntimeShader (AGSL)", r"^Landroid/graphics/RuntimeShader;$"),
    ("Rendering: RenderNode", r"^Landroid/graphics/RenderNode;$"),
    ("Rendering: BlurMaskFilter", r"^Landroid/graphics/BlurMaskFilter;$"),
    ("Rendering: setRenderEffect", r"^setRenderEffect$"),
    ("Rendering: Backdrop (Kyant)", r"^Lcom/kyant/backdrop/"),
    ("Security: signingInfo", r"^signingInfo$|^getSigningInfo$|^getApkContentsSigners$"),
    ("Security: Play Integrity", r"com/google/android/play/core/integrity"),
    ("Security: SafetyNet", r"com/google/android/gms/safetynet"),
    ("Security: PairIP / Play licensing", r"com/pairip/|com/android/vending/licensing"),
    ("Security: root/Xposed detection", r"(?i)de/robv/android/xposed|xposedbridge|lsposed|magisk|/system/xbin/su"),
]

# App class names (not obfuscated) that look like the targeted views.
APP_CLASS_PATTERN = re.compile(
    r"^L(com/apple/[A-Za-z0-9_/$]*(Tab|BottomNav|Navigation|MiniPlayer|Miniplayer|"
    r"NowPlaying|PlaybackBar|PlayerBar|MainContent|MainActivity)[A-Za-z0-9_$]*);$"
)

# --------------------------------------------------------------------------- #
# Reading the containers (apk, apkm, xapk, apks)
# --------------------------------------------------------------------------- #


def open_apks(path: str) -> dict[str, zipfile.ZipFile]:
    """Returns {name: ZipFile} for each APK inside (or the APK itself)."""
    try:
        outer = zipfile.ZipFile(path)
    except zipfile.BadZipFile:
        sys.exit(f"{path} is not a readable zip archive (encrypted APKM? export it again with SAI / APKMirror Installer).")
    names = outer.namelist()
    if "AndroidManifest.xml" in names:
        return {"base.apk": outer}
    apks = {}
    for name in names:
        if name.lower().endswith(".apk"):
            apks[name] = zipfile.ZipFile(io.BytesIO(outer.read(name)))
    if not apks:
        sys.exit(f"No APK found in {path}")
    return apks


def pick_base(apks: dict[str, zipfile.ZipFile]) -> tuple[str, zipfile.ZipFile]:
    for name, z in apks.items():
        if name.endswith("base.apk") or "classes.dex" in z.namelist():
            return name, z
    return next(iter(apks.items()))


# --------------------------------------------------------------------------- #
# Minimal binary XML (AXML) reader: enough for AndroidManifest.xml
# --------------------------------------------------------------------------- #

ANDROID_ATTR_IDS = {
    0x01010003: "name",
    0x0101020C: "minSdkVersion",
    0x01010270: "targetSdkVersion",
    0x0101021B: "versionCode",
    0x0101021C: "versionName",
    0x01010010: "exported",
    0x01010001: "label",
}


def _read_string_pool(data: bytes, off: int) -> list[str]:
    _type, header_size, _size, count, _style_count, flags, strings_start, _styles_start = struct.unpack_from(
        "<HHIIIIII", data, off
    )
    utf8 = bool(flags & 0x100)
    offsets = struct.unpack_from(f"<{count}I", data, off + header_size)
    base = off + strings_start
    out = []
    for o in offsets:
        p = base + o
        if utf8:
            # length in characters, then in bytes (1 or 2 bytes each)
            n = data[p]
            p += 2 if n & 0x80 else 1
            n = data[p]
            if n & 0x80:
                n = ((n & 0x7F) << 8) | data[p + 1]
                p += 2
            else:
                p += 1
            out.append(data[p : p + n].decode("utf-8", "replace"))
        else:
            n = struct.unpack_from("<H", data, p)[0]
            p += 2
            if n & 0x8000:
                n = ((n & 0x7FFF) << 16) | struct.unpack_from("<H", data, p)[0]
                p += 2
            out.append(data[p : p + 2 * n].decode("utf-16-le", "replace"))
    return out


def parse_axml(data: bytes) -> list[tuple[str, dict[str, object]]]:
    """Returns the elements (tag, {attr: value}) in document order."""
    strings: list[str] = []
    res_ids: list[int] = []
    elements = []
    off = 8  # file header
    while off < len(data):
        ctype, hsize, csize = struct.unpack_from("<HHI", data, off)
        if csize == 0:
            break
        if ctype == 0x0001:
            strings = _read_string_pool(data, off)
        elif ctype == 0x0180:
            res_ids = list(struct.unpack_from(f"<{(csize - hsize) // 4}I", data, off + hsize))
        elif ctype == 0x0102:
            _ns, name_idx, attr_start, attr_size, attr_count = struct.unpack_from("<iiHHH", data, off + 16)
            tag = strings[name_idx] if 0 <= name_idx < len(strings) else "?"
            attrs: dict[str, object] = {}
            a = off + 16 + attr_start
            for i in range(attr_count):
                _ans, aname, araw, _vsize, _res0, vtype, vdata = struct.unpack_from("<iiiHBBI", data, a + i * attr_size)
                key = strings[aname] if 0 <= aname < len(strings) else ""
                if aname < len(res_ids) and res_ids[aname] in ANDROID_ATTR_IDS:
                    key = ANDROID_ATTR_IDS[res_ids[aname]]
                if vtype == 0x03 and 0 <= vdata < len(strings):
                    val: object = strings[vdata]
                elif araw >= 0 and araw < len(strings):
                    val = strings[araw]
                elif vtype == 0x12:
                    val = vdata != 0
                elif vtype == 0x01:
                    val = f"@0x{vdata:08x}"
                else:
                    val = vdata
                attrs[key] = val
            elements.append((tag, attrs))
        off += csize
    return elements


def manifest_summary(base: zipfile.ZipFile) -> dict[str, object]:
    elements = parse_axml(base.read("AndroidManifest.xml"))
    info: dict[str, object] = {"activities": [], "launcher": None}
    current_activity = None
    in_launcher_filter = False
    for tag, attrs in elements:
        if tag == "manifest":
            info["package"] = attrs.get("package")
            info["versionName"] = attrs.get("versionName")
            info["versionCode"] = attrs.get("versionCode")
        elif tag == "uses-sdk":
            info["minSdk"] = attrs.get("minSdkVersion")
            info["targetSdk"] = attrs.get("targetSdkVersion")
        elif tag in ("activity", "activity-alias"):
            current_activity = attrs.get("name")
            info["activities"].append(current_activity)
            in_launcher_filter = False
        elif tag == "category" and attrs.get("name") == "android.intent.category.LAUNCHER":
            in_launcher_filter = True
            if current_activity and not info["launcher"]:
                info["launcher"] = current_activity
    return info


# --------------------------------------------------------------------------- #
# DEX: string table
# --------------------------------------------------------------------------- #


def _uleb128(data: bytes, p: int) -> tuple[int, int]:
    result = shift = 0
    while True:
        b = data[p]
        p += 1
        result |= (b & 0x7F) << shift
        if not b & 0x80:
            return result, p
        shift += 7


def dex_strings(data: bytes):
    if not data.startswith(b"dex\n"):
        return
    size, off = struct.unpack_from("<II", data, 0x38)
    for i in range(size):
        sdo = struct.unpack_from("<I", data, off + 4 * i)[0]
        _n, p = _uleb128(data, sdo)
        end = data.index(b"\x00", p)
        yield data[p:end].decode("utf-8", "replace")


# --------------------------------------------------------------------------- #
# Analyse
# --------------------------------------------------------------------------- #


def analyse(path: str) -> dict[str, object]:
    apks = open_apks(path)
    base_name, base = pick_base(apks)
    report: dict[str, object] = {"file": path, "apks": sorted(apks), "base": base_name}

    report["manifest"] = manifest_summary(base)

    # Versions of the AndroidX / Compose libraries (META-INF/*.version)
    versions = {}
    for name in base.namelist():
        if name.startswith("META-INF/") and name.endswith(".version"):
            lib = name[len("META-INF/") : -len(".version")]
            versions[lib] = base.read(name).decode("utf-8", "replace").strip()
    report["compose_libs"] = {k: v for k, v in sorted(versions.items()) if "compose" in k}
    report["notable_libs"] = {
        k: v
        for k, v in sorted(versions.items())
        if any(s in k for s in ("material", "recyclerview", "coordinatorlayout", "databinding", "fragment", "navigation"))
    }

    # DEX
    dex_names = sorted(n for n in base.namelist() if re.fullmatch(r"classes\d*\.dex", n))
    report["dex_count"] = len(dex_names)
    markers = {label: 0 for label, _ in DEX_MARKERS}
    compiled = [(label, re.compile(rx)) for label, rx in DEX_MARKERS]
    app_classes = set()
    compose_class_count = 0
    for dn in dex_names:
        for s in dex_strings(base.read(dn)):
            if s.startswith("Landroidx/compose/"):
                compose_class_count += 1
            for label, rx in compiled:
                if rx.search(s):
                    markers[label] += 1
            m = APP_CLASS_PATTERN.match(s)
            if m:
                app_classes.add(m.group(1).replace("/", "."))
    report["compose_type_descriptors"] = compose_class_count
    report["dex_markers"] = markers
    report["app_classes_of_interest"] = sorted(app_classes)[:300]

    # Resource names (resources.arsc table, without the Material/AppCompat libraries)
    res_hits = set()
    if "resources.arsc" in base.namelist():
        from pathlib import Path

        sys.path.insert(0, str(Path(__file__).resolve().parent))
        from apk_res import ResTable  # late import: apk_res imports this module

        table = ResTable(base.read("resources.arsc"))
        lib_prefixes = ("m3_", "mtrl_", "abc_", "design_", "material_", "exo_")
        for name in table.names.values():
            entry = name.split("/", 1)[1]
            if RES_NAME_PATTERNS.search(entry) and not entry.startswith(lib_prefixes + ("$",)) \
                    and "ActionButton" not in entry and "magnifyingglass" not in entry \
                    and name.split("/", 1)[0] in ("id", "layout", "drawable", "color", "dimen", "attr"):
                res_hits.add(name)
    layouts = [n for n in base.namelist() if n.startswith("res/") and n.endswith(".xml")]
    layout_hits = sorted(n for n in layouts if RES_NAME_PATTERNS.search(n.rsplit("/", 1)[-1]))
    report["resource_names_of_interest"] = sorted(res_hits)[:400]
    report["layout_files_of_interest"] = layout_hits[:200]

    # Layouts with key widgets (compiled layouts keep the class names)
    widget_usage = defaultdict(list)
    for n in layouts:
        try:
            raw = base.read(n)
        except KeyError:
            continue
        if not raw.startswith(b"\x03\x00\x08\x00"):
            continue
        try:
            tags = {tag for tag, _ in parse_axml(raw)}
        except Exception:
            continue
        for t in tags:
            if any(k in t for k in ("ComposeView", "BottomNavigationView", "NavigationBarView", "TabLayout",
                                    "CoordinatorLayout", "FragmentContainerView", "BlurView")):
                widget_usage[t].append(n)
    report["layouts_with_key_widgets"] = {k: sorted(v)[:30] for k, v in sorted(widget_usage.items())}

    # Native libraries (all splits)
    natives = set()
    for z in apks.values():
        for n in z.namelist():
            if n.startswith("lib/") and n.endswith(".so"):
                natives.add(n.split("/", 2)[-1] + "  [" + n.split("/")[1] + "]")
    report["native_libs"] = sorted(natives)

    report["verdict_hints"] = verdict_hints(report)
    return report


def verdict_hints(r: dict[str, object]) -> list[str]:
    hints = []
    m = r["dex_markers"]
    compose = bool(r["compose_libs"]) or bool(m["Compose: runtime traces (reliable when obfuscated)"])
    views_nav = m["Views: BottomNavigationView"] or m["Views: NavigationBarView"]
    if compose and not views_nav:
        hints.append("Compose present and no BottomNavigationView: the tab bar is probably drawn by Compose, which is harder to patch.")
    elif compose and views_nav:
        hints.append("Hybrid Views + Compose app: check on the device (dumpsys activity top) which one draws the tab bar.")
    else:
        hints.append("No Compose: the UI is built with Views, the simplest case to patch.")
    if m["Security: Play Integrity"] or m["Security: PairIP / Play licensing"]:
        hints.append("Play Integrity / Play licensing referenced: a re-signed APK (Morphe, LSPatch) may be refused.")
    if m["Security: signingInfo"]:
        hints.append("The app reads package signatures: test a re-signed APK early (it may only check other apps).")
    if m["Security: root/Xposed detection"]:
        hints.append("Root/Xposed detection strings found: plan to hide root (Shamiko/HMA) when using LSPosed.")
    mn = r["manifest"].get("minSdk")
    if isinstance(mn, int) and mn < 33:
        hints.append(f"minSdk={mn}: refraction (AGSL) only on Android 13+, blur only on 12, original look below.")
    return hints


def print_report(r: dict[str, object]) -> None:
    man = r["manifest"]
    print(f"File         : {r['file']}")
    print(f"APKs         : {', '.join(r['apks'])}")
    print(f"Package      : {man.get('package')}  v{man.get('versionName')} ({man.get('versionCode')})")
    print(f"SDK          : min {man.get('minSdk')} / target {man.get('targetSdk')}")
    print(f"Launcher     : {man.get('launcher')}")
    print(f"Activities   : {len(man['activities'])}")
    print(f"DEX          : {r['dex_count']}")
    print()
    print("== Compose ==")
    print(f"  androidx.compose.* descriptors: {r['compose_type_descriptors']}")
    for k, v in r["compose_libs"].items():
        print(f"  {k} = {v}")
    print("\n== Notable libraries ==")
    for k, v in r["notable_libs"].items():
        print(f"  {k} = {v}")
    print("\n== DEX markers ==")
    for k, v in r["dex_markers"].items():
        print(f"  {'✔' if v else '·'} {k}: {v}")
    print("\n== App classes (not obfuscated) related to navigation / the player ==")
    for c in r["app_classes_of_interest"][:80]:
        print(f"  {c}")
    print("\n== Layouts with key widgets ==")
    for k, v in r["layouts_with_key_widgets"].items():
        print(f"  {k}: {', '.join(v[:8])}{' …' if len(v) > 8 else ''}")
    print("\n== Layout files with a matching name ==")
    for n in r["layout_files_of_interest"][:60]:
        print(f"  {n}")
    print("\n== Matching resource names ==")
    print("  " + ", ".join(r["resource_names_of_interest"][:150]))
    print("\n== Native libraries ==")
    for n in r["native_libs"]:
        print(f"  {n}")
    print("\n== Hints ==")
    for h in r["verdict_hints"]:
        print(f"  -> {h}")


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("package", help=".apk, .apkm, .xapk or .apks")
    ap.add_argument("--json", help="also writes the full report as JSON")
    args = ap.parse_args()
    report = analyse(args.package)
    print_report(report)
    if args.json:
        with open(args.json, "w", encoding="utf-8") as f:
            json.dump(report, f, ensure_ascii=False, indent=2)
        print(f"\nJSON report: {args.json}")


if __name__ == "__main__":
    main()
