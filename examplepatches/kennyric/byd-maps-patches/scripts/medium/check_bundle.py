#!/usr/bin/env python3
"""Verify the packaged Medium extensions against the pinned ABI, without an APK."""
import argparse
import json
from pathlib import Path
import re
import tempfile
import zipfile
from verify_extension import verify
from verify_vendor import inspect_jar

ROOT = Path(__file__).resolve().parents[2]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bundle", type=Path, nargs="?")
    args = parser.parse_args()
    candidates = [p for p in (ROOT / "patches/build/libs").glob("*.mpp")
                  if not p.name.endswith(("-sources.mpp", "-javadoc.mpp"))]
    # Older version bumps leave their bundles behind; the current project
    # version selects this checkout's bundle instead of requiring a clean.
    version = re.search(r"^version\s*=\s*(\S+)\s*$", (ROOT / "gradle.properties").read_text(), re.M)
    current = [p for p in candidates if version and p.name == f"patches-{version[1]}.mpp"] if version else []
    bundle = args.bundle or (current[0] if len(current) == 1 else None)
    if bundle is None and len(candidates) != 1:
        parser.error("Expected one current patch bundle; build the project or pass a path")
    if bundle is None:
        bundle = candidates[0]
    abi = json.loads((ROOT / "support/medium/stubs/abi.json").read_text())
    report = {}
    with zipfile.ZipFile(bundle) as archive, tempfile.TemporaryDirectory() as directory:
        names = archive.namelist()
        if any(name.startswith("extensions/") and "probe" in name for name in names):
            raise ValueError("Diagnostic probe must not enter the public bundle")
        for label, helper in [("reader", False), ("privacy", True)]:
            name = f"extensions/medium-{label}.mpe"
            if names.count(name) != 1:
                raise ValueError(f"Expected exactly one {name}")
            path = Path(directory) / f"{label}.dex"
            path.write_bytes(archive.read(name))
            report[label] = verify(path, abi, standalone_helper=helper)
    jars = list((ROOT / "support/medium/vendor/build/libs").glob("*-isolated.jar"))
    # Superseded vendor builds accumulate beside the current one. Prefer the
    # project version, then the newest published version, so a fresh version
    # bump (before its rebuild) still resolves deterministically.
    def jar_version(path):
        text = path.name.removeprefix("medium-vendor-").removesuffix("-isolated.jar")
        return tuple(int(part) if part.isdigit() else 0 for part in text.split("."))
    if len(jars) > 1:
        current_jars = [p for p in jars if version and p.name == f"medium-vendor-{version[1]}-isolated.jar"]
        jars = current_jars or [max(jars, key=jar_version)]
    if len(jars) != 1:
        raise ValueError("Expected exactly one private dependency JAR")
    report["vendor"] = inspect_jar(jars[0])
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
