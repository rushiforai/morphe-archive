#!/usr/bin/env python3
"""Stage dev.4 runtime changes and the verified comment renderer on the published MPP."""
import argparse
import hashlib
import os
import sys
from copy import copy
import importlib.util
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
sys.path[:0] = [str(ROOT / ".github/scripts"), str(HERE.parent / "v2.1.0-release")]
from stage_verified import TOOLS, assemble, require, run, semantics_equal
from verify_android_mpp import validate_mpp

VERSION = "2.1.6-dev.5"
spec = importlib.util.spec_from_file_location("dev4_stage", HERE.parent / "v2.1.6-dev.4/stage_candidate.py")
dev4 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dev4)
OWNER = Path("e/e/a")
HELPER = OWNER / "CommentPresentation.smali"
NATIVE = OWNER / "u.smali"


def replace(entries, path, before, after, count=1):
    require(entries[path].count(before) == count, f"Unexpected bytecode anchor: {path}")
    entries[path] = entries[path].replace(before, after)


def update_version(entries, version, helpers):
    replace(entries, OWNER / "ModernShorts.smali",
            f'"v{dev4.PREVIOUS} @chikuwadon"'.encode(),
            f'"v{version} @chikuwadon"'.encode(), 2)
    if helpers:
        replace(entries, OWNER / "PatchVersion237.smali",
                f'"{dev4.PREVIOUS}"'.encode(), f'"{version}"'.encode())


def wire_native(entries):
    replace(entries, NATIVE,
            b"invoke-virtual {p0}, Landroid/view/TextureView;->lockCanvas()Landroid/graphics/Canvas;",
            b"invoke-static {p0}, Le/e/a/CommentPresentation;->lock(Landroid/view/TextureView;)Landroid/graphics/Canvas;")
    replace(entries, NATIVE,
            b"invoke-virtual {p0, v7}, Landroid/view/TextureView;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V",
            b"invoke-static {p0, v7}, Le/e/a/CommentPresentation;->post(Landroid/view/TextureView;Landroid/graphics/Canvas;)V",
            2)
    stop = b"invoke-static {p0}, Le/e/a/CommentFrames;->stop(Landroid/view/TextureView;)V"
    replace(entries, NATIVE, stop, stop + (
        b"\n\n    invoke-static {p0}, Le/e/a/CommentPresentation;->release(Landroid/view/TextureView;)V"))


def disassemble(dex, directory, tools):
    classpath = os.pathsep.join(str(tools / entry) for entry in TOOLS)
    run("java", "-cp", classpath, "org.jf.baksmali.Main", "disassemble",
        "--sequential-labels", dex, "-o", directory)
    return {path.relative_to(directory): path.read_bytes() for path in directory.rglob("*.smali")}


def write_dex(entries, work, tools):
    directory = work / "updated"
    for path, contents in entries.items():
        target = directory / path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(contents)
    dex = work / "updated.dex"
    assemble(directory, dex, tools)
    semantics_equal(disassemble(dex, work / "checked", tools), entries, work.name)
    return dex.read_bytes()


def compile_helper(work, tools):
    android_jar, d8 = dev4.android_tools()
    source = HERE / "CommentPresentation.java"
    classes = work / "classes"
    classes.mkdir()
    run("javac", "--release", "8", "-encoding", "UTF-8", "-cp", android_jar,
        "-d", classes, source)
    dex_dir = work / "compiled"
    dex_dir.mkdir()
    run(d8, "--min-api", "28", "--lib", android_jar, "--output", dex_dir,
        classes / OWNER / "CommentPresentation.class")
    entries = disassemble(dex_dir / "classes.dex", work / "generated", tools)
    require(set(entries) == {HELPER}, "Unexpected helper class set")
    return entries[HELPER]


def stage(compiled, approved, output, tools):
    require(output.resolve() not in (compiled.resolve(), approved.resolve()),
            "Choose a separate candidate output")
    validate_mpp(compiled, VERSION)
    require(hashlib.sha256(approved.read_bytes()).hexdigest() == dev4.APPROVED_SHA256,
            "Published MPP fingerprint mismatch")
    validate_mpp(approved, dev4.PREVIOUS)
    with TemporaryDirectory(prefix="nicoid-dev5-") as tmp, ZipFile(approved) as bundle:
        work = Path(tmp)
        inherited_dir = work / "dev4"
        inherited_dir.mkdir()
        inherited = dev4.compile_sources(inherited_dir, tools)
        helper = compile_helper(work, tools)
        overrides = {}
        for name in (dev4.HELPERS, "nicoid/method-delta.dex", dev4.EXTENSION):
            directory = work / Path(name).stem
            directory.mkdir()
            original = directory / "base.dex"
            original.write_bytes(bundle.read(name))
            if name == dev4.HELPERS:
                # Reuse dev.4's settings, mini-player, popup, network and screen-off edits.
                source = directory / "inherited"
                baseline = dev4.disassemble(original, source, tools)
                dev4.patch_runtime(source)
                require(HELPER not in baseline and HELPER not in inherited,
                        "Unexpected presentation helper in inherited inputs")
                for path, data in inherited.items():
                    (source / path).write_bytes(data)
                inherited_dex = directory / "inherited.dex"
                assemble(source, inherited_dex, tools)
                entries = disassemble(inherited_dex, directory / "inherited-checked", tools)
                require(OWNER / "Media3Diagnostics276$NetworkRetry.smali" in inherited,
                        "Network retry helper missing")
                legacy_owners = {
                    "SettingsTools", "PlaybackDisplayOptions", "DirectBackground235$State",
                    "Media3Diagnostics276", "Media3Diagnostics276$Probe",
                    "Media3Diagnostics276$Attempt", "AppResume253", "Dev119",
                    "RetainedPlayback137",
                }
                baseline = disassemble(original, directory / "canonical-baseline", tools)
                inherited_changes = {p.stem for p in baseline if entries[p] != baseline[p]}
                require(inherited_changes == legacy_owners,
                        "Unexpected inherited helper changes: " + str(inherited_changes ^ legacy_owners))
                require(entries.keys() == baseline.keys() | inherited.keys(),
                        "Unexpected inherited helper class set")
                entries[HELPER] = helper
                # Match a single invocation in the exported app diagnostics.
                save = b"invoke-static {p0, v1}, Le/e/a/Followup173;->saveLog(Landroid/content/Context;Ljava/lang/String;)V"
                replace(entries, OWNER / "ModernDebug.smali", save, (
                    b"invoke-static {v1}, Le/e/a/CommentPresentation;->appendDiagnostics"
                    b"(Ljava/lang/String;)Ljava/lang/String;\n\n    move-result-object v1\n\n    " + save))
                update_version(entries, VERSION, helpers=True)
            else:
                entries = disassemble(original, directory / "base", tools)
                if name == "nicoid/method-delta.dex":
                    wire_native(entries)
                else:
                    update_version(entries, VERSION, helpers=False)
            overrides[name] = write_dex(entries, directory, tools)

        manifest = bundle.read(dev4.MANIFEST)
        version_line = f"Version: {dev4.PREVIOUS}\r\n".encode()
        overrides[dev4.MANIFEST] = manifest.replace(
            version_line, f"Version: {VERSION}\r\n".encode())
        require(manifest.count(version_line) == 1, "Unexpected manifest version")
        output.parent.mkdir(parents=True, exist_ok=True)
        with ZipFile(output, "w") as candidate:
            for info in bundle.infolist():
                name = info.filename
                candidate.writestr(copy(info), overrides[name] if name in overrides else bundle.read(name))
        with ZipFile(output) as candidate:
            require(candidate.namelist() == bundle.namelist(), "MPP entries changed")
            for name in bundle.namelist():
                expected = overrides[name] if name in overrides else bundle.read(name)
                require(candidate.read(name) == expected, f"Unexpected MPP entry: {name}")
    validate_mpp(output, VERSION)
    print(f"PASS: {VERSION}, SHA-256 {hashlib.sha256(output.read_bytes()).hexdigest()}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiled", required=True, type=Path)
    parser.add_argument("--approved", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--tools", type=Path, default=HERE.parent / "v2.0.0-dev.1/tools")
    args = parser.parse_args()
    stage(args.compiled, args.approved, args.output, args.tools)
