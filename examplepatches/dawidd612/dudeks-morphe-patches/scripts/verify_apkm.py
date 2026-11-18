"""Read-only APK/APKM/XAPK integrity audit, including every embedded APK's CRC.

Usage: python scripts/verify_apkm.py game.apkm
Uses at most one extracted split in temporary storage. Never repairs or rewrites
the input: a damaged download must be replaced from its original source.
"""
import argparse
import hashlib
import json
import shutil
import tempfile
import zipfile
from pathlib import Path


def apk_inputs(path):
    """Yield one seekable APK at a time; retain ownership until the next yield."""
    with zipfile.ZipFile(path) as package:
        if "AndroidManifest.xml" in package.namelist():
            yield Path(path).name, package
            return
        for entry in package.infolist():
            if entry.is_dir() or not entry.filename.lower().endswith(".apk"):
                continue
            with tempfile.TemporaryFile() as temp, package.open(entry) as source:
                shutil.copyfileobj(source, temp, 1024 * 1024)
                temp.seek(0)
                with zipfile.ZipFile(temp) as split:
                    yield entry.filename, split


def audit(path):
    path = Path(path)
    with path.open("rb") as source:
        identity = hashlib.file_digest(source, "sha256").hexdigest()
    result = {"file": path.name, "bytes": path.stat().st_size,
              "sha256": identity, "splits": []}
    with zipfile.ZipFile(path) as bundle:
        standalone = "AndroidManifest.xml" in bundle.namelist()
        for entry in bundle.infolist():
            if entry.is_dir():
                continue
            try:
                with bundle.open(entry) as source:
                    if standalone or not entry.filename.lower().endswith(".apk"):
                        while source.read(1024 * 1024):
                            pass
                        continue
                    with tempfile.TemporaryFile() as split_file:
                        shutil.copyfileobj(source, split_file, 1024 * 1024)
                        split_file.seek(0)
                        with zipfile.ZipFile(split_file) as split:
                            for item in split.infolist():
                                try:
                                    with split.open(item) as data:
                                        while data.read(1024 * 1024):
                                            pass
                                except Exception as error:
                                    raise ValueError(f"{item.filename}: {error}") from error
                            result["splits"].append({"name": entry.filename,
                                                     "bytes": entry.file_size,
                                                     "entries": len(split.infolist())})
            except Exception as error:
                raise ValueError(f"{entry.filename}: {error}") from error
        if standalone:
            result["splits"].append({"name": path.name, "bytes": path.stat().st_size,
                                     "entries": len(bundle.infolist())})
    if not result["splits"]:
        raise ValueError("Archive contains no APK splits")
    result["status"] = "PASS"
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apkm")
    args = parser.parse_args()
    try:
        result = audit(args.apkm)
    except (OSError, ValueError, zipfile.BadZipFile) as error:
        print(json.dumps({"status": "FAIL", "error": str(error)}, indent=2))
        return 1
    print(json.dumps(result, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
