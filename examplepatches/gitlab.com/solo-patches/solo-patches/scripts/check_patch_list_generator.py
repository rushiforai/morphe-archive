#!/usr/bin/env python3
"""Check compiled patch-list generation in an isolated working directory.

Build first. Pass the generator's JVM classpath (bundle, patcher dependencies and Gson):
python3 scripts/check_patch_list_generator.py '<classpath>'
The check never changes project metadata or recovery bundles.
"""

import argparse
import json
import os
import subprocess
import tempfile
import zipfile
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("classpath", help="JVM classpath containing util.PatchListGeneratorKt and its dependencies")
    args = parser.parse_args()
    repo = Path(__file__).resolve().parents[1]
    java = Path(os.environ["JAVA_HOME"]) / "bin/java" if os.environ.get("JAVA_HOME") else "java"
    bundles = [path for path in (repo / "patches/build/libs").glob("*.mpp") if "sources" not in path.name and "javadoc" not in path.name]
    if len(bundles) != 1:
        raise ValueError("Build exactly one primary .mpp bundle before checking patch-list generation")
    bundle = bundles[0]
    classpath = os.pathsep.join(str(Path(part).resolve()) for part in args.classpath.split(os.pathsep))
    with zipfile.ZipFile(bundle) as archive:
        manifest = archive.read("META-INF/MANIFEST.MF").decode()
    expected_version = next(line.partition(": ")[2] for line in manifest.splitlines() if line.startswith("Version: "))
    with tempfile.TemporaryDirectory(prefix="webnovel-patch-list-check-") as directory:
        folder = Path(directory)
        work = folder / "patches"
        libs = work / "build/libs"
        libs.mkdir(parents=True)
        candidate = libs / bundle.name
        candidate.symlink_to(bundle)
        output = folder / "patches-list.json"

        def generate():
            return subprocess.run(
                [str(java), "-Xmx512m", "-XX:ActiveProcessorCount=2", "-cp", classpath, "util.PatchListGeneratorKt"],
                cwd=work, capture_output=True, text=True, timeout=45,
            )

        result = generate()
        assert result.returncode == 0, result.stderr
        saved = output.read_bytes()
        assert json.loads(saved)["version"] == expected_version, "Generated version does not match selected bundle"
        duplicate = libs / "another-version.mpp"
        duplicate.symlink_to(bundle)
        result = generate()
        assert result.returncode != 0, "Ambiguous bundles silently selected one version"
        assert output.read_bytes() == saved, "Ambiguous input overwrote existing metadata"
        duplicate.unlink()
        candidate.unlink()
        with zipfile.ZipFile(bundle) as source, zipfile.ZipFile(candidate, "w") as target:
            for entry in source.infolist():
                content = source.read(entry)
                if entry.filename == "META-INF/MANIFEST.MF":
                    content = "\r\n".join(line for line in manifest.splitlines() if not line.startswith("Version: ")).encode()
                target.writestr(entry, content)
        result = generate()
        assert result.returncode != 0, "Bundle without a version silently generated metadata"
        assert output.read_bytes() == saved, "Missing version overwrote existing metadata"
    print("PASS: patch-list version matches bundle; ambiguous and unversioned inputs preserve prior metadata")


if __name__ == "__main__":
    main()
