#!/usr/bin/env python3
"""Compile Tutto Enhancements as a Morphe MPP (desktop JAR + Android DEX).

Requires the preserved recovery tools and official Kotlin compiler 2.4.20.
Does not download, sign an APK, access a device, or include private inputs.
"""
import argparse
import json
import os
from pathlib import Path
import sys
import tempfile
import zipfile

sys.path.insert(0, str(Path(__file__).resolve().parent))
from build import ROOT, jar_classes, run, sha256

VERSION = "1.7.0"
REPO = "https://github.com/selim-durmus/ungoogled-maps-local-enhancements"
COMPILER_SHA = "59e9ca74c7904ef2c122b12114937673ccce68de820a663f0ed66ccf8799e0b7"


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--recovery-root", type=Path, required=True)
    p.add_argument("--kotlin-zip", type=Path, required=True)
    p.add_argument("--output", type=Path, default=ROOT / "dist" / f"tutto-enhancements-{VERSION}.mpp")
    args = p.parse_args()
    kit = args.recovery_root.resolve()
    if sha256(args.kotlin_zip) != COMPILER_SHA:
        raise ValueError("Expected official kotlin-compiler-2.4.20.zip; checksum mismatch")
    lock = json.loads((ROOT / "config/build-lock.json").read_text())
    for name in ("tools/morphe-desktop.jar", "sdk/build-tools/36.0.0/lib/d8.jar", "sdk/platforms/android-36/android.jar"):
        if sha256(kit / name) != lock["files"][name]:
            raise ValueError("Changed recovery build input: " + name)
    java = kit / "jdk/bin/java.exe"
    javac = kit / "jdk/bin/javac.exe"
    android = kit / "sdk/platforms/android-36/android.jar"
    d8 = kit / "sdk/build-tools/36.0.0/lib/d8.jar"
    api = kit / "tools/morphe-desktop.jar"
    root = ROOT / "build"
    root.mkdir(exist_ok=True)
    # Retain the scratch directory for reproducibility and bytecode inspection.
    work = Path(tempfile.mkdtemp(prefix="bundle-", dir=root))
    with zipfile.ZipFile(args.kotlin_zip) as z:
        z.extractall(work / "kotlin")
    classes = work / "helpers"
    classes.mkdir()
    sources = sorted(f for directory in ("src", "stubs", "tests") for f in (ROOT / directory).rglob("*.java"))
    run(javac, "-encoding", "UTF-8", "--release", "8", "-cp", android, "-d", classes, *sources)
    run(java, "-cp", str(classes) + os.pathsep + str(android), "org.ungoogled.ui.RouteGuardTest")
    run(java, "-cp", classes, "org.ungoogled.ui.LabelIndexTest")
    jar_classes(work / "helpers.jar", classes, "HomeWorkShortcuts*.class|LabelSuggestions*.class|LabelIndex*.class")
    jar_classes(work / "stubs.jar", classes, "Saved*.class|History*.class")
    extension = work / "extension"
    extension.mkdir()
    run(java, "-cp", d8, "com.android.tools.r8.D8", "--min-api", "32", "--lib", android,
        "--classpath", work / "stubs.jar", "--output", extension, work / "helpers.jar")
    compiler = work / "kotlin/kotlinc/lib"
    patch_classes = work / "patch-classes"
    run(java, "-cp", str(compiler / "*"), "org.jetbrains.kotlin.cli.jvm.K2JVMCompiler",
        "-no-stdlib", "-no-reflect", "-language-version", "2.2", "-jvm-target", "11", "-classpath", api,
        "-d", patch_classes, ROOT / "morphe/TuttoEnhancements.kt", ROOT / "morphe/GenerateCatalog.kt")
    run(java, "-cp", str(patch_classes) + os.pathsep + str(api), "tutto.build.GenerateCatalogKt",
        VERSION, ROOT / "patches-list.json")
    with zipfile.ZipFile(work / "patch.jar", "w") as z:
        for f in sorted((patch_classes / "tutto/patches").rglob("*.class")):
            z.write(f, f.relative_to(patch_classes).as_posix())
    patch_dex = work / "patch-dex"
    patch_dex.mkdir()
    run(java, "-cp", d8, "com.android.tools.r8.D8", "--min-api", "26", "--lib", android,
        "--classpath", api, "--output", patch_dex, work / "patch.jar")
    manifest = {
        "Manifest-Version": "1.0", "Name": "Tutto Enhancements",
        "Description": "Home and Work shortcuts and local search suggestions.",
        "Version": VERSION, "Source": REPO, "Author": "selim-durmus",
        "Contact": "https://github.com/selim-durmus", "Website": REPO,
        "License": "GPLv3", "Patcher-Version": "2.0.0",
    }
    # JAR manifests require UTF-8 lines <=72 bytes, with folded continuations.
    manifest_lines = []
    for key, value in manifest.items():
        line = key + ": " + value
        while len(line) > 70:
            manifest_lines.append(line[:70]); line = " " + line[70:]
        manifest_lines.append(line)
    manifest_bytes = ("\r\n".join(manifest_lines) + "\r\n\r\n").encode()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    entries = {"META-INF/MANIFEST.MF": manifest_bytes,
               "classes.dex": (patch_dex / "classes.dex").read_bytes(),
               "extensions/tutto.mpe": (extension / "classes.dex").read_bytes()}
    for f in patch_classes.rglob("*"):
        if f.is_file() and not f.relative_to(patch_classes).as_posix().startswith("tutto/build/"):
            entries[f.relative_to(patch_classes).as_posix()] = f.read_bytes()
    # Fixed entry times give reproducible bundles from the same source/toolchain.
    with zipfile.ZipFile(args.output, "w", zipfile.ZIP_DEFLATED) as z:
        for name, data in sorted(entries.items()):
            info = zipfile.ZipInfo(name, (2026, 10, 7, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            z.writestr(info, data)
    print("MPP:", args.output.resolve())
    print("SHA256:", sha256(args.output))
    source_files = [ROOT / "build-bundle.py"] + sorted(
        f for directory in ("src", "stubs", "morphe") for f in (ROOT / directory).rglob("*") if f.is_file())
    args.output.with_suffix(".sources.json").write_text(json.dumps(
        {f.relative_to(ROOT).as_posix(): sha256(f) for f in source_files}, indent=2) + "\n")
    print("Build workspace:", work)


if __name__ == "__main__":
    main()
