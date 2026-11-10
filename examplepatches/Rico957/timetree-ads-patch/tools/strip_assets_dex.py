#!/usr/bin/env python3
"""Remove the redundant `assets.dex` entry that apktool emits when the app ships a
dex inside assets/ (TimeTree ships Facebook Audience Network's classes.dex there).

The original `assets/audience_network/classes.dex` is preserved, so the SDK keeps
loading its own code; the extra root-level entry would only inflate the APK.

Usage:
    python strip_assets_dex.py <apk>
"""
import os
import sys
import zipfile

if len(sys.argv) < 2:
    print(__doc__)
    raise SystemExit(2)

src = sys.argv[1]
tmp = src + ".clean"

with zipfile.ZipFile(src) as zin, zipfile.ZipFile(tmp, "w", allowZip64=True) as zout:
    dropped = 0
    for info in zin.infolist():
        if info.filename == "assets.dex":
            dropped += 1
            continue
        out = zipfile.ZipInfo(info.filename, date_time=info.date_time)
        out.compress_type = info.compress_type
        out.external_attr = info.external_attr
        out.internal_attr = info.internal_attr
        out.create_system = info.create_system
        zout.writestr(out, zin.read(info.filename))

os.replace(tmp, src)
print(f"strip_assets_dex: dropped {dropped} entry")
