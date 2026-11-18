#!/usr/bin/env python3
"""Verify that a released Morphe .mpp is actually Android-loadable.

Morphe Manager's PatchBundle.Loader.validateDexEntries refuses zip archives
without at least one nonempty .dex entry. JVM desktop Morphe can read .class
files and will not expose this mistake.
"""
import struct
from pathlib import Path
import sys
import zipfile

ROOT = Path(__file__).resolve().parent.parent

def validate_morphe_bundle(path: Path) -> list[str]:
    if not path.is_file():
        raise ValueError(f"missing patch bundle: {path}")
    try:
        with zipfile.ZipFile(path) as archive:
            bad = archive.testzip()
            if bad:
                raise ValueError(f"corrupted zip member: {bad}")
            dexs = [x for x in archive.infolist() if x.filename.lower().endswith(".dex")]
            if not dexs:
                raise ValueError("Morphe Android Manager: patch bundle is missing dex entries")
            if any(x.file_size <= 0 for x in dexs):
                raise ValueError("Morphe Android Manager: patch bundle contains empty dex entries")
            for entry in dexs:
                dex = archive.read(entry.filename)
                if len(dex) < 112 or not dex.startswith(bytes((100, 101, 120, 10))):
                    raise ValueError(f"{entry.filename}: invalid DEX header")
                class_count = struct.unpack_from("<I", dex, 0x60)[0]
                if class_count < 1:
                    raise ValueError(f"{entry.filename}: zero Android class definitions")
            main_dex = b"".join(archive.read(entry.filename) for entry in dexs)
            if b"HideSupportBannerPatchKt" not in main_dex or b"Permanently hide donation banner" not in main_dex:
                raise ValueError("compiled DEX is missing FairEmail patch class or patch name")
            if not any(x.filename.endswith(".class") for x in archive.infolist()):
                raise ValueError("missing JVM class entries; desktop support not verified")
            manifest = archive.read("META-INF/MANIFEST.MF").decode("utf-8")
            if "Patcher-Version:" not in manifest:
                raise ValueError("missing Patcher-Version manifest")
            return [x.filename for x in dexs]
    except (zipfile.BadZipFile, KeyError) as exc:
        raise ValueError(f"not a valid Morphe patch bundle: {exc}") from exc

def main():
    from validate_morphe_metadata import VERSION
    path = ROOT / "patches" / "build" / "libs" / f"patches-{VERSION}.mpp"
    dexs = validate_morphe_bundle(path)
    print(f"MORPHE_ANDROID_DEX_PASS: {path.name}, {dexs}, {path.stat().st_size} bytes")

if __name__ == "__main__":
    main()
