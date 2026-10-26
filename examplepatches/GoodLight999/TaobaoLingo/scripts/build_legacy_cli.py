#!/usr/bin/env python3
"""Build an offline Morphe Desktop 1.18.x patch bundle from project sources.

The main .mpp targets Patcher 2.0 / Morphe Manager. This adapter compiles the
same patch operations against Desktop 1.18.1 / Patcher 1.15.1 for local tests.
The resulting JAR-based .mpp has NO classes.dex; do not import it in Manager.
"""
from pathlib import Path
import argparse
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
SOURCES = [
    "TaobaoLanguagePatches.kt",
    "JapanEnglishPickerPatch.kt",
    "JapanEnglishServerPatch.kt",
    "DinamicXEnglishLabelsPatch.kt",
]
SOURCE_DIR = ROOT / "patches/src/main/kotlin/dev/goodlight999/taobaolingo"
IMPORT = "import app.morphe.patcher.Fingerprint"
FLAGS_IMPORT = "import com.android.tools.smali.dexlib2.AccessFlags\n" + IMPORT


def adapt(source: str, name: str) -> str:
    if name == "TaobaoLanguagePatches.kt":
        if source.count("isStatic = true") != 2 or "isStatic = false" in source:
            raise ValueError("Expected two static string resource getter fingerprints")
        return source.replace(IMPORT, FLAGS_IMPORT, 1).replace(
            "isStatic = true",
            "accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL)",
        )
    if name == "JapanEnglishServerPatch.kt":
        if source.count("isStatic = false") != 1 or "isStatic = true" in source:
            raise ValueError("Expected one public instance response fingerprint")
        return source.replace(IMPORT, FLAGS_IMPORT, 1).replace(
            "isStatic = false", "accessFlags = listOf(AccessFlags.PUBLIC)",
        )
    if name == "DinamicXEnglishLabelsPatch.kt":
        if source.count("isStatic = false") != 4 or "isStatic = true" in source:
            raise ValueError("Expected four DinamicX setter + text attribute fingerprints")
        return source.replace(IMPORT, FLAGS_IMPORT, 1).replace(
            "isStatic = false", "accessFlags = listOf(AccessFlags.PUBLIC)",
        )
    if name == "JapanEnglishPickerPatch.kt":
        return source
    raise ValueError(f"Unexpected source name {name}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--desktop-jar", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--kotlinc", default="kotlinc")
    args = parser.parse_args()
    if not args.desktop_jar.is_file():
        parser.error(f"Desktop JAR missing: {args.desktop_jar}")
    with tempfile.TemporaryDirectory(prefix="taobaolingo-legacy-") as temp:
        tmp = Path(temp)
        paths = []
        for name in SOURCES:
            source = SOURCE_DIR / name
            if not source.is_file():
                parser.error(f"Patch source missing: {source}")
            target = tmp / name
            target.write_text(adapt(source.read_text(encoding="utf-8"), name),
                              encoding="utf-8")
            paths.append(str(target))
        classes = tmp / "classes"
        subprocess.run([
            args.kotlinc, "-Xskip-metadata-version-check",
            "-Xcontext-receivers",
            "-cp", str(args.desktop_jar.resolve()),
            *paths, "-d", str(classes)
        ], check=True)
        manifest = (
            "Manifest-Version: 1.0\n"
            "Name: TaobaoLingo\n"
            "Description: Offline compatibility test bundle\n"
            "Version: 0.2.0-legacy\n"
            "Author: GoodLight999\n"
            "Source: https://github.com/GoodLight999/TaobaoLingo\n"
            "License: GPL-3.0-only\n"
            "Patcher-Version: 1.15.1\n\n"
        )
        args.out.parent.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(args.out, "w", zipfile.ZIP_DEFLATED) as bundle:
            bundle.writestr("META-INF/MANIFEST.MF", manifest)
            for path in sorted(classes.rglob("*")):
                if path.is_file():
                    bundle.write(path, path.relative_to(classes).as_posix())
    print(f"Legacy Desktop CLI test bundle: {args.out}")


if __name__ == "__main__":
    main()
