#!/usr/bin/env python3
"""Verify a built bundle's real exports and graph against the checked-in catalog."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bundle", type=Path)
    parser.add_argument("--desktop-jar", type=Path,
                        default=Path("/mnt/c/Users/Corey/Downloads/morphe-desktop-1.20.0-all.jar"))
    parser.add_argument("--kotlinc", default="/mnt/c/Program Files/Android/Android Studio/plugins/Kotlin/kotlinc/bin/kotlinc")
    parser.add_argument("--java", default="/usr/lib/jvm/java-21-openjdk-amd64/bin/java")
    args = parser.parse_args()
    subprocess.run(["python3", "tools/generate_morphe_catalog.py", "--check"], cwd=ROOT, check=True)
    catalog = json.loads((ROOT / "tools/morphe-catalog.json").read_text())
    entries = [entry for entry in catalog["patches"] if entry["decision"] == "expose"]
    core = []
    for source in (ROOT / "patches/src/main/kotlin").rglob("*.kt"):
        if source.name == "MorpheCatalogPatches.kt":
            continue
        core += re.findall(r'\b(?:bytecodePatch|resourcePatch|rawResourcePatch)\(\s*name\s*=\s*"([^"\n]+)"',
                           source.read_text())
    expected = {name: True for name in core}
    for entry in entries:
        assert entry["export_name"] not in expected, entry["export_name"]
        expected[entry["export_name"]] = entry["default"]
    with zipfile.ZipFile(args.bundle) as bundle:
        assert bundle.testzip() is None, "Corrupt bundle"
        assert bundle.read("classes.dex").startswith(b"dex\n"), "Missing Manager patch code"
        for source in (ROOT / "vendor/morphe/resources").rglob("*"):
            if source.is_file():
                name = str(source.relative_to(ROOT / "vendor/morphe/resources"))
                assert hashlib.sha256(bundle.read(name)).digest() == hashlib.sha256(source.read_bytes()).digest(), name
        assert "afterglow/licenses/NOTICE" in bundle.namelist()
    with tempfile.TemporaryDirectory(prefix="afterglow-catalog-") as directory:
        directory = Path(directory)
        table = directory / "expected.tsv"
        table.write_text("".join(f"{name}\t{str(default).lower()}\n" for name, default in sorted(expected.items())))
        classes = directory / "classes"
        subprocess.run([args.kotlinc, "-jvm-target", "11", "-Xskip-prerelease-check", "-Xcontext-parameters",
                        "-classpath", str(args.desktop_jar), "-d", str(classes),
                        str(ROOT / "tools/jvm/MorpheCatalogBundleTest.kt")], check=True)
        subprocess.run([args.java, "-cp", f"{classes}:{args.desktop_jar}",
                        "MorpheCatalogBundleTestKt", str(args.bundle.resolve()), str(table)], check=True)


if __name__ == "__main__":
    main()
