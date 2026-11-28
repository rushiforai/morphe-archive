#!/usr/bin/env python3
"""Collects the files the Waze Mod adds to (or changes in) Waze's assets for the Morphe patch.

  python tools/waze_assets_gen.py <stock_decode> <modded_decode> <out_dir>

Both are APKEditor decodes of the APK: a `root` directory with `assets` below it, and a path-map.json that gives the
real name of the files APKEditor renamed to alias_XXXX. Every file under assets/ that the Mod adds
or changes is copied to <out_dir>/<path below assets/>, and <out_dir>/index.txt lists them. The International edition
leaves out what is for Vietnam only (the Vietnamese highway-distance pictures), what is bulk the Mod never loads (the unused JetBrains Mono styles and archive) and the build-info files,
which the patch writes itself.
"""
import filecmp
import json
import os
import shutil
import sys

SKIP_PREFIXES = (
    "wz_mood_khoangcach_caotoc/",
    "gw_fonts/JetBrains_Mono.zip",
    "gw_fonts/JetBrains_Mono/JetBrainsMono-",
    "gw_fonts/JetBrains_Mono/static/",
    "wz_ui_icon/chisadin_music_service.png",
    "wz_build_",
    "wz_mod_version.txt",
    "wz_ota_build_id.txt",
    "res/godot/",          # the speedometer patch of the PCK is made by its own step
    "res/skins/default/skin_values.",   # the map colours are written into Waze's own lua (waze_skin_gen.py)
    "wz_map_skins/",       # the Mod's other map skins, which nothing loads
)
KEEP = (
    "gw_fonts/JetBrains_Mono/static/JetBrainsMono-Bold.ttf",
)


def walk(decode):
    """Real in-APK path -> file, for everything below root/assets."""
    root = os.path.join(decode, "root")
    names = {m["alias"]: m["name"] for m in json.load(open(os.path.join(decode, "path-map.json"), encoding="utf-8"))}
    out = {}
    for d, _, fs in os.walk(os.path.join(root, "assets")):
        for f in fs:
            rel = os.path.relpath(os.path.join(d, f), root).replace("\\", "/")
            out[names.get(rel, rel)[len("assets/"):]] = os.path.join(d, f)
    return out


def main():
    stock, mod, out = sys.argv[1:4]
    a, b = walk(stock), walk(mod)
    shutil.rmtree(out, ignore_errors=True)
    os.makedirs(out)
    kept = []
    for path in sorted(b):
        if path in a and filecmp.cmp(a[path], b[path], shallow=False):
            continue
        if path.startswith(SKIP_PREFIXES) and path not in KEEP:
            continue
        dest = os.path.join(out, path)
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        shutil.copyfile(b[path], dest)
        kept.append(path)
    with open(os.path.join(out, "index.txt"), "w", encoding="utf-8", newline="\n") as w:
        w.write("\n".join(kept) + "\n")
    total = sum(os.path.getsize(os.path.join(out, p)) for p in kept)
    print("files:", len(kept), "size KB:", total // 1024)


if __name__ == "__main__":
    main()
