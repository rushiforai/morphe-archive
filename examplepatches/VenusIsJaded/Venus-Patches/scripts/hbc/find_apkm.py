#!/usr/bin/env python3
"""Print the newest complete Discord .apkm in ~/uploaded_files (or the folder given): one that opens as a ZIP and has
base.apk. A half-uploaded file is skipped instead of failing later inside unzip."""
import pathlib, sys, zipfile
folder = pathlib.Path(sys.argv[1] if len(sys.argv) > 1 else pathlib.Path.home() / "uploaded_files")
for path in sorted(folder.glob("*.apkm"), key=lambda p: p.stat().st_mtime, reverse=True):
    try:
        with zipfile.ZipFile(path) as z:
            if "base.apk" in z.namelist():
                print(path); sys.exit(0)
    except zipfile.BadZipFile:
        print(f"Skipping incomplete {path.name}", file=sys.stderr)
sys.exit("No complete Discord .apkm found; pass its path")
