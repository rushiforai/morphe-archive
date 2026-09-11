#!/usr/bin/env python3
"""
Rebuild APK: replace dex files in a base APK, preserving ALL entries (unicode-safe).
Usage: rebuild_apk.py <base.apk> <dex_dir> <out.apk>
"""
import zipfile
import sys
import os

base = sys.argv[1]
dex_dir = sys.argv[2]
out = sys.argv[3]

zin = zipfile.ZipFile(base)
zout = zipfile.ZipFile(out, 'w', zipfile.ZIP_DEFLATED)

copied = 0
for item in zin.infolist():
    if item.filename.endswith('.dex'):
        continue  # will be replaced from dex_dir
    try:
        data = zin.read(item.filename)
        zout.writestr(item, data)
        copied += 1
    except Exception as e:
        print(f"  FAIL copy {item.filename}: {e}")

for f in sorted(os.listdir(dex_dir)):
    if f.endswith('.dex'):
        src = os.path.join(dex_dir, f)
        zout.write(src, f)
        print(f"  added dex: {f}")

zout.close()
zin.close()
print(f"Copied {copied} entries, added patched dex, wrote {out}")
