#!/usr/bin/env python3
"""Prepare the pinned hxreborn v1.80.0 tree for our five-patch *local* Morphe bundle.

Builds only from a fresh, pinned Git checkout. Never modifies this repository,
user APKs, Android devices, system settings or credentials.
"""
from __future__ import annotations

import argparse
import os
from pathlib import Path
import shutil
import subprocess

UPSTREAM_SHA = "83839f596c9c7d8555c97809c34c2daabde03ec7"
RELEASE_VERSION = os.environ.get("REALMELINK_RELEASE_VERSION", "0.3.0")
BUNDLE_NAME = "RealmeLink Plus"


def clean_other_sources(project: Path) -> None:
    patches = project / "patches/src/main/kotlin/app/morphe/patches"
    required = [
        patches / "realmelink",
        patches / "shared/compat/AppCompatibilities.kt",
        project / "patches/src/main/java/app/morphe/patches/shared/misc/png/PngImage.java",
    ]
    for path in required:
        if not path.exists():
            raise RuntimeError(f"Missing expected upstream/overlay source: {path}")
    allowed_shared = {
        Path("compat/AppCompatibilities.kt"),
    }
    for child in patches.iterdir():
        if child.name == "realmelink":
            continue
        if child.name != "shared":
            if child.is_dir():
                shutil.rmtree(child)
            else:
                child.unlink()
            continue
        for file in sorted(child.rglob("*"), reverse=True):
            if file.is_file() and file.relative_to(child) not in allowed_shared:
                file.unlink()
        for sub in sorted(child.rglob("*"), reverse=True):
            if sub.is_dir() and not any(sub.iterdir()):
                sub.rmdir()

    # No unrelated resources/binaries in the patch bundle.
    resources = project / "patches/src/main/resources"
    if resources.exists():
        for node in resources.iterdir():
            if node.name not in {"proton-bundle-version.txt"}:
                if node.is_dir():
                    shutil.rmtree(node)
                else:
                    node.unlink()

    # Keep one runtime extension, drop all other app-specific Java sources.
    java = project / "extensions/extension/src/main/java"
    runtime = java / "app/hxreborn/extension/realmelink"
    for required in ("ModeKeeper.java", "ModeSettingsUi.java"):
        if not (runtime / required).is_file():
            raise RuntimeError(f"{required} missing; overlay step was skipped")
    for file in list(java.rglob("*.java")):
        if not file.is_relative_to(runtime):
            file.unlink()


def rewrite_info(project: Path) -> None:
    gradle = project / "patches/build.gradle.kts"
    s = gradle.read_text(encoding="utf-8")
    expected = {
        'name = "hxreborn’s patches"': f'name = "{BUNDLE_NAME}"',
        'description = "Patches for the apps I actually use"':
            'description = "Five realme Link 5.8.811.2814 Morphe patches: '
            'AMOLED theme, session bypass, ANC mode memory, Game Mode memory and clean home screen"',
        'source = "git@github.com:hxreborn/morphe-patches.git"':
            'source = "https://github.com/Rafaello0/RealmeLink-Plus"',
        'author = "hxreborn"':
            'author = "RaFaeLL0"',
        'contact = "https://github.com/hxreborn/morphe-patches/issues"':
            'contact = "https://github.com/Rafaello0/RealmeLink-Plus/issues"',
        'website = "https://github.com/hxreborn/morphe-patches"':
            'website = "https://github.com/Rafaello0/RealmeLink-Plus"',
    }
    for old, new in expected.items():
        if s.count(old) != 1:
            raise RuntimeError(f"Expected exactly one Gradle metadata field {old!r}")
        s = s.replace(old, new, 1)
    # The upstream Morphe shared library also bundles generic all-app patches.
    # None is used by our five realme patches; keep them out of the local .mpp.
    build_marker = 'tasks {\n    jar {'
    if s.count(build_marker) != 1:
        raise RuntimeError("Expected upstream jar task not found")
    s = s.replace(build_marker,
        'tasks {\n    jar {\n        exclude("app/morphe/patches/all/**")', 1)
    gradle.write_text(s, encoding="utf-8")

    prop_file = project / "gradle.properties"
    properties = prop_file.read_text(encoding="utf-8")
    if properties.count("version = 1.80.0") != 1:
        raise RuntimeError("Unexpected upstream version")
    properties = properties.replace("version = 1.80.0", f"version = {RELEASE_VERSION}", 1)
    prop_file.write_text(properties, encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("upstream", type=Path, help="Git clone of hxreborn v1.80.0")
    args = parser.parse_args()
    project = args.upstream.resolve()
    if not project.is_dir():
        raise RuntimeError("Upstream directory not found")
    sha = subprocess.check_output(["git", "-C", str(project), "rev-parse", "HEAD"], text=True).strip()
    if sha != UPSTREAM_SHA:
        raise RuntimeError(f"Unexpected hxreborn SHA {sha}, expected {UPSTREAM_SHA}")
    clean_other_sources(project)
    rewrite_info(project)
    print(f"Prepared {BUNDLE_NAME} {RELEASE_VERSION}; only realme Link patch code retained")


if __name__ == "__main__":
    main()
