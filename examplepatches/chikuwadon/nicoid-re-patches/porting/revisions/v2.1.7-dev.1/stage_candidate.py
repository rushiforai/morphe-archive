#!/usr/bin/env python3
"""Stage private v2.1.7-dev.1 link-choice repair from immutable v2.1.6 MPP."""
from __future__ import annotations
import argparse
from copy import copy
import hashlib
import os
import sys
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
sys.path[:0] = [str(ROOT / ".github/scripts"), str(HERE.parent / "v2.1.0-release")]
from stage_verified import TOOLS, assemble, require, run, semantics_equal
from verify_android_mpp import validate_mpp
import importlib.util

spec = importlib.util.spec_from_file_location("dev4_stage", HERE.parent / "v2.1.6-dev.4/stage_candidate.py")
dev4 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dev4)

VERSION = "2.1.7-dev.1"
BASE_VERSION = "2.1.6"
BASE_SHA256 = "c8e1c627bb15c46ebf49345bc0a703f00ed05998783fb280326c555527bb2978"
HELPERS = "nicoid/helpers.mpe"
EXTENSION = "extensions/extension.mpe"
MANIFEST = "META-INF/MANIFEST.MF"
OWNER = Path("e/e/a")
ADDED = OWNER / "LinkIntentPolicy217.smali"

def replace(entries, path, before, after, count=1):
    require(path in entries, "Missing runtime owner: " + str(path))
    require(entries[path].count(before) == count, "Unexpected anchor count: " + str(path))
    entries[path] = entries[path].replace(before, after)

def disassemble(dex, directory, tools):
    classpath = os.pathsep.join(str(tools / entry) for entry in TOOLS)
    run("java", "-cp", classpath, "org.jf.baksmali.Main", "disassemble",
        "--sequential-labels", dex, "-o", directory)
    return {p.relative_to(directory): p.read_bytes() for p in directory.rglob("*.smali")}

def compile_policy(work, tools):
    android, d8 = dev4.android_tools()
    classes = work / "classes"
    classes.mkdir()
    run("javac", "--release", "8", "-encoding", "UTF-8", "-cp", android,
        "-d", classes, HERE / "LinkIntentPolicy217.java")
    out = work / "d8"
    out.mkdir()
    run(d8, "--min-api", "28", "--lib", android, "--output", out,
        classes / OWNER / "LinkIntentPolicy217.class")
    generated = disassemble(out / "classes.dex", work / "generated", tools)
    require(set(generated) == {ADDED},
            "Link policy unexpectedly introduces other classes: " + str(set(generated)))
    return generated[ADDED]

def assemble_checked(entries, work, tools):
    directory = work / "updated"
    for path, data in entries.items():
        file = directory / path
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_bytes(data)
    dex = work / "staged.dex"
    assemble(directory, dex, tools)
    semantics_equal(disassemble(dex, work / "checked", tools), entries, work.name)
    return dex.read_bytes()

def stage(compiled, approved, output, tools):
    require(len({compiled.resolve(), approved.resolve(), output.resolve()}) == 3,
            "Do not overwrite reviewed or compiled MPP")
    validate_mpp(compiled, VERSION)
    require(hashlib.sha256(approved.read_bytes()).hexdigest() == BASE_SHA256,
            "Published v2.1.6 MPP checksum differs from approved release")
    validate_mpp(approved, BASE_VERSION)
    with TemporaryDirectory(prefix="nicoid-link-dev1-") as tmp, ZipFile(approved) as bundle:
        work = Path(tmp)
        helper = compile_policy(work, tools)
        overrides = {}
        for name in (HELPERS, EXTENSION):
            folder = work / ("helpers" if name == HELPERS else "extension")
            folder.mkdir()
            input_dex = folder / "base.dex"
            input_dex.write_bytes(bundle.read(name))
            entries = disassemble(input_dex, folder / "original", tools)
            if name == HELPERS:
                require(ADDED not in entries, "Link policy already installed")
                hook = (b"invoke-static {p0}, Le/e/a/SettingsDisplay216;"
                        b"->install(Landroid/preference/PreferenceActivity;)V")
                replace(entries, OWNER / "SettingsTools.smali", hook,
                        hook + (b"\n\n    invoke-static {p0}, Le/e/a/LinkIntentPolicy217;"
                                b"->install(Landroid/content/Context;)V"))
                entries[ADDED] = helper
                replace(entries, OWNER / "PatchVersion237.smali",
                        b'"2.1.6"', b'"2.1.7-dev.1"')
            replace(entries, OWNER / "ModernShorts.smali",
                    b'"v2.1.6 @chikuwadon"',
                    b'"v2.1.7-dev.1 @chikuwadon"', 2)
            overrides[name] = assemble_checked(entries, folder, tools)

        manifest = bundle.read(MANIFEST)
        old = b"Version: 2.1.6\r\n"
        require(manifest.count(old) == 1, "Unexpected baseline manifest version")
        overrides[MANIFEST] = manifest.replace(old, b"Version: 2.1.7-dev.1\r\n")
        output.parent.mkdir(parents=True, exist_ok=True)
        with ZipFile(output, "w") as out:
            for item in bundle.infolist():
                out.writestr(copy(item),
                    overrides.get(item.filename, bundle.read(item.filename)))
        with ZipFile(output) as result:
            require(result.testzip() is None, "Invalid MPP archive")
            require(result.namelist() == bundle.namelist(), "MPP entries changed")
            for name in bundle.namelist():
                expected = overrides.get(name, bundle.read(name))
                require(result.read(name) == expected, "Unexpected payload change: " + name)
            require(result.read("nicoid/method-delta.dex") ==
                    bundle.read("nicoid/method-delta.dex"),
                    "Native playback bytecode changed")
            require(result.read("nicoid/resources.zip") ==
                    bundle.read("nicoid/resources.zip"),
                    "Bundled resources/manifest changed")
    validate_mpp(output, VERSION)
    print("PASS: "+ VERSION + " SHA-256 " + hashlib.sha256(output.read_bytes()).hexdigest())

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiled", required=True, type=Path)
    parser.add_argument("--approved", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--tools", type=Path, default=HERE.parent / "v2.0.0-dev.1/tools")
    args = parser.parse_args()
    stage(args.compiled, args.approved, args.output, args.tools)
