#!/usr/bin/env python3
"""Stage v2.1.9-dev.5 from the SHA-256-pinned dev.4 MPP."""
import argparse
from copy import copy
from hashlib import sha256
import os
from pathlib import Path
import subprocess
import sys
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
TOOLS = ROOT / "porting/revisions/v2.0.0-dev.1/tools"
sys.path.insert(0, str(ROOT / ".github/scripts"))
from verify_android_mpp import validate_mpp

BASE_VERSION = "2.1.9-dev.4"
VERSION = "2.1.9-dev.5"
BASE_SHA = "0d148bef1aa774ba140f0ae08bf55ff581fd916c6883be42907b29569aa0d6c9"
PACKAGE = Path("e/e/a")
HELPERS = "nicoid/helpers.mpe"
EXTENSION = "extensions/extension.mpe"
MANIFEST = "META-INF/MANIFEST.MF"

def require(condition, message):
    if not condition:
        raise ValueError(message)

def once(source, start, replacement):
    require(source.count(start) == 1, "Missing or ambiguous source anchor: " + repr(start))
    return source.replace(start, replacement, 1)

def patch_dialog(source):
    # Keep the same title, localization, size calculation, and callbacks.
    # Build the message as formatted file size, blank line, confirmation.
    description = """    invoke-static {p0}, Le/e/a/TemporaryCache221;->confirmation(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2"""
    separator = """    const-string v3, "\\n\\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2"""
    size = """    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1"""
    before = "\n\n".join((description, separator, size))
    after = "\n\n".join((size.removesuffix("move-result-object p1") + "move-result-object v2", separator, description.removesuffix("move-result-object v2") + "move-result-object p1"))
    return once(source, before, after)

def patch_version(source):
    require(source.count(BASE_VERSION) > 0, "Missing patch version literal")
    return source.replace(BASE_VERSION, VERSION)

def apply_overlay(directory, edits):
    for relative, transform in edits.items():
        file = directory / relative
        before = file.read_text(encoding="utf-8")
        after = transform(before)
        require(before != after, "No change to " + str(relative))
        file.write_text(after, encoding="utf-8", newline="\n")

def commands(tools):
    classpath = os.pathsep.join(str(tools / member) for member in (
        "assemble/*", "dexlib2.jar", "guava.jar"))
    return ["java", "-cp", classpath]

def disassemble(java, dex, directory):
    subprocess.run(java + ["org.jf.baksmali.Main", "disassemble",
        "--sequential-labels", str(dex), "-o", str(directory)], check=True)

def stage(baseline, output, tools):
    require(baseline.resolve() != output.resolve(), "Input and output must differ")
    require(sha256(baseline.read_bytes()).hexdigest() == BASE_SHA, "Expected the verified dev.4 MPP")
    validate_mpp(baseline, BASE_VERSION)
    edits = {
        HELPERS: {
            PACKAGE / "TemporaryCache221.smali": patch_dialog,
            PACKAGE / "PatchVersion237.smali": patch_version,
            PACKAGE / "ModernShorts.smali": patch_version,
        },
        EXTENSION: {PACKAGE / "ModernShorts.smali": patch_version},
    }
    java = commands(tools)
    output.parent.mkdir(parents=True, exist_ok=True)
    with TemporaryDirectory(prefix="nicoid-dev219-") as temp, ZipFile(baseline) as old:
        work = Path(temp)
        assets = {}
        for number, (name, transforms) in enumerate(edits.items()):
            src = work / f"base-{number}.dex"
            src.write_bytes(old.read(name))
            folder = work / f"smali-{number}"
            disassemble(java, src, folder)
            apply_overlay(folder, transforms)
            dex = work / f"candidate-{number}.dex"
            subprocess.run(java + ["org.jf.smali.Main", "assemble", "-a", "28",
                str(folder), "-o", str(dex)], check=True)
            checked = work / f"verified-{number}"
            disassemble(java, dex, checked)
            expected = {p.relative_to(folder): p.read_bytes() for p in folder.rglob("*.smali")
                if p.relative_to(folder) not in transforms}
            actual = {p.relative_to(checked): p.read_bytes() for p in checked.rglob("*.smali")
                if p.relative_to(checked) not in transforms}
            require(actual == expected, "Unexpected change to an untouched class in " + name)
            require(all((checked / p).is_file() for p in transforms), "Missing modified class in " + name)
            assets[name] = dex.read_bytes()
        assets[MANIFEST] = once(old.read(MANIFEST),
            f"Version: {BASE_VERSION}\r\n".encode(), f"Version: {VERSION}\r\n".encode())
        candidate = output.with_name(output.name + ".staging")
        try:
            with ZipFile(candidate, "w") as bundle:
                for entry in old.infolist():
                    member = assets.get(entry.filename)
                    bundle.writestr(copy(entry), old.read(entry) if member is None else member)
            validate_mpp(candidate, VERSION)
            with ZipFile(candidate) as new:
                require(new.namelist() == old.namelist() and new.testzip() is None, "Invalid MPP")
                require(all(new.read(name) == old.read(name) for name in old.namelist()
                    if name not in assets), "Unexpected package change")
            candidate.replace(output)
        finally:
            candidate.unlink(missing_ok=True)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--tools", default=TOOLS, type=Path)
    args = parser.parse_args()
    stage(args.input, args.output, args.tools)
