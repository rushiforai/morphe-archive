#!/usr/bin/env python3
"""Apply the bounded comment-frame overlay to verified v2.1.4-dev.2 MPP.

This is a local development candidate, not an official release script.
It preserves the manager DEX and every MPP entry except the helper DEX and
manifest, verifies its base SHA-256, and refuses unexpected class changes.
"""
from __future__ import annotations

import argparse
from copy import copy
import hashlib
import importlib.util
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
BASE = HERE.parent / "v2.1.4-dev.2"
DEV1 = HERE.parent / "v2.1.4-dev.1"
SPEC = importlib.util.spec_from_file_location("v214_dev2_stage", BASE / "stage_candidate.py")
assert SPEC is not None and SPEC.loader is not None
BASE_TOOLS = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(BASE_TOOLS)
assemble = BASE_TOOLS.assemble
disassemble = BASE_TOOLS.disassemble
require = BASE_TOOLS.require
run = BASE_TOOLS.run
validate_mpp = BASE_TOOLS.validate_mpp
PREVIOUS = "2.1.4-dev.2"
VERSION = "2.1.4-dev.3"
BASE_SHA256 = "f23b6c6c58a01e660268925fef3c0980c32d422883cfe9a83c551b8714337482"
OWNER = Path("e/e/a")
NAMES = {"CommentSource280", "ScrollingComments267", "ScrollingTimeline267"}
MANIFEST = "META-INF/MANIFEST.MF"
PAYLOAD = "nicoid/helpers.mpe"


def belongs(path: Path) -> bool:
    return path.parent == OWNER and path.stem.split("$", 1)[0] in NAMES


def stage(args: argparse.Namespace, tmp: Path) -> None:
    require(args.base.resolve() != args.output.resolve(), "Use a separate dev.3 output")
    require(hashlib.sha256(args.base.read_bytes()).hexdigest() == BASE_SHA256,
            "Use the verified dev.2 MPP with the expected SHA-256")
    validate_mpp(args.base, PREVIOUS)
    with ZipFile(args.base) as archive:
        originals = archive.namelist()
        require(len(originals) == len(set(originals)), "Duplicate MPP entries")
        classes = tmp / "classes"
        classes.mkdir()
        changed = {x.name for x in HERE.glob("java/e/e/a/*.java")}
        base_sources = (p for p in (DEV1 / "java").rglob("*.java") if p.name not in changed)
        java_sources = sorted(base_sources) + sorted((HERE / "java").rglob("*.java"))
        java_sources += sorted((DEV1 / "stubs").rglob("*.java"))
        run("javac", "--release", "8", "-encoding", "UTF-8", "-cp", args.android_jar,
            "-d", classes, *java_sources)
        generated_dex = tmp / "generated"
        generated_dex.mkdir()
        run(args.d8, "--min-api", "28", "--lib", args.android_jar, "--output", generated_dex,
            *sorted(p for p in classes.rglob("*.class") if p.stem.split("$", 1)[0] in NAMES))
        modified = disassemble(generated_dex / "classes.dex", tmp / "generated-smali", args.tools)
        shared_lambda = Path("com/android/tools/r8/annotations/LambdaMethod.smali")
        require(modified and all(belongs(p) or p == shared_lambda for p in modified),
                "Unexpected source class in dev.3 DEX")
        require({OWNER / (name + ".smali") for name in NAMES}.issubset(modified),
                "Missing comment renderer class")
        original_dex = tmp / "original.dex"
        original_dex.write_bytes(archive.read(PAYLOAD))
        directory = tmp / "helpers"
        original = disassemble(original_dex, directory, args.tools)
        for path in original:
            if belongs(path):
                (directory / path).unlink()
        for path, data in modified.items():
            if belongs(path):
                target = directory / path
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(data)
            else:
                require(path in original, "Missing preexisting shared D8 metadata")
        version_path = directory / OWNER / "PatchVersion237.smali"
        old = f'"{PREVIOUS}"'
        code = version_path.read_text()
        require(code.count(old) == 1, "Unexpected patch version field")
        version_path.write_text(code.replace(old, f'"{VERSION}"'))
        output_dex = tmp / "new.dex"
        assemble(directory, output_dex, args.tools)
        checked = disassemble(output_dex, tmp / "checked-smali", args.tools)
        version_class = OWNER / "PatchVersion237.smali"
        require(set(checked) == (set(original) - {p for p in original if belongs(p)})
                | {p for p in modified if belongs(p)},
                "Dev.3 introduced unexpected helper classes")
        require(all(checked[p] == original[p] for p in original
                    if not belongs(p) and p != version_class), "Unrelated DEX class changed")
        require(version_class in checked and checked[version_class] != original[version_class],
                "Patch version not updated")
        previous = archive.read(MANIFEST)
        marker = f"Version: {PREVIOUS}\r\n".encode()
        require(previous.count(marker) == 1, "Unexpected MPP manifest version")
        overrides = {PAYLOAD: output_dex.read_bytes(),
                     MANIFEST: previous.replace(marker, f"Version: {VERSION}\r\n".encode())}
        args.output.parent.mkdir(parents=True, exist_ok=True)
        with ZipFile(args.output, "w") as result:
            for entry in archive.infolist():
                result.writestr(copy(entry), overrides.get(entry.filename, archive.read(entry.filename)))
        with ZipFile(args.output) as result:
            require(result.namelist() == originals, "MPP archive entries were changed")
            require(all(result.read(p) == archive.read(p) for p in originals if p not in overrides),
                    "An unrelated MPP resource was modified")
    print("PASS: scoped comment classes, unchanged manager DEX and MPP archive layout")
    print("PASS:", validate_mpp(args.output, VERSION))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ("base", "output", "tools", "android-jar", "d8"):
        parser.add_argument("--" + name, type=Path, required=True)
    args = parser.parse_args()
    with TemporaryDirectory(prefix="nicoid-budget-") as directory:
        stage(args, Path(directory))


if __name__ == "__main__":
    main()
