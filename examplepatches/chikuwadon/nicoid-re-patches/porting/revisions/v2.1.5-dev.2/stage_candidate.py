#!/usr/bin/env python3
"""Stage a bounded Media3 seek-buffer freeze fix on the exact v2.1.4 runtime.

Development only. Keep every existing patch class, native delta, resources,
settings and release asset intact except the explicitly audited bytecode.
"""
from __future__ import annotations
import argparse
import hashlib
from copy import copy
import os
import re
import sys
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
sys.path.insert(0, str(ROOT / "porting/revisions/v2.1.0-release"))
sys.path.insert(0, str(ROOT / ".github/scripts"))
from stage_verified import assemble, disassemble, run, require
from verify_android_mpp import validate_mpp

VERSION = "2.1.5-dev.2"
PREVIOUS = "2.1.4"
APPROVED_SHA256 = "58c9d990d36d9f05e58e29bcb4ad45da8a435a16c8f4a649d82d02a538995df4"
HELPERS = "nicoid/helpers.mpe"
EXTENSION = "extensions/extension.mpe"
MANIFEST = "META-INF/MANIFEST.MF"
OWNER = Path("e/e/a")
DIAGNOSTICS = OWNER / "Media3Diagnostics276.smali"
VERSION_OWNERS = {
    OWNER / "PatchVersion237.smali": ('"2.1.4"', '"2.1.5-dev.2"', 1),
    OWNER / "ModernShorts.smali": ('"v2.1.4 @chikuwadon"', '"v2.1.5-dev.2 @chikuwadon"', 2),
}


def android_tools():
    home = os.environ.get("ANDROID_HOME") or os.environ.get("ANDROID_SDK_ROOT")
    require(bool(home), "Android SDK is required")
    sdk = Path(home)
    def platform_key(path):
        found = re.fullmatch(r"android-(\d+)(?:-ext(\d+))?", path.parent.name)
        return (int(found.group(1)), int(found.group(2) or 0)) if found else (0, 0)
    jars = sorted((p for p in (sdk / "platforms").glob("android-*/android.jar")
                   if platform_key(p)[0]), key=platform_key)
    d8s = sorted((p for p in (sdk / "build-tools").glob("*/d8")),
                 key=lambda p: tuple(int(x) for x in re.findall(r"\d+", p.parent.name)))
    require(jars and d8s, "Android platform jar or d8 is missing")
    return jars[-1], d8s[-1]


def replace_literal(directory, entry, old, new, count):
    path = directory / entry
    data = path.read_text(encoding="utf-8")
    require(data.count(old) == count, "Unexpected version owner: " + str(entry))
    path.write_text(data.replace(old, new), encoding="utf-8")


def compile_diagnostic(temp, tools):
    android, d8 = android_tools()
    classes = temp / "java-classes"
    classes.mkdir()
    run("javac", "--release", "8", "-encoding", "UTF-8",
        "-cp", android, "-d", classes, HERE / "Media3Diagnostics276.java")
    generated = temp / "new-dex"
    generated.mkdir()
    run(d8, "--min-api", "28", "--lib", android, "--output", generated,
        *sorted(classes.rglob("*.class")))
    result = disassemble(generated / "classes.dex", temp / "new-smali", tools)
    expected = {
        OWNER / "Media3Diagnostics276.smali",
        OWNER / "Media3Diagnostics276$Probe.smali",
        OWNER / "Media3Diagnostics276$Attempt.smali",
    }
    # A tool-version-specific R8 annotation is not application code.
    annotation = Path("com/android/tools/r8/annotations/LambdaMethod.smali")
    require(set(result) in (expected, expected | {annotation}),
            "Unexpected diagnostic class set: " + str(set(result) ^ expected))
    return {p: data for p, data in result.items() if p in expected}


def stage(compiled, approved, output, tools):
    require(compiled.resolve() != output.resolve(), "Do not overwrite Gradle input")
    validate_mpp(compiled, VERSION)
    require(hashlib.sha256(approved.read_bytes()).hexdigest() == APPROVED_SHA256,
            "Official v2.1.4 MPP SHA-256 mismatch")
    validate_mpp(approved, PREVIOUS)
    with TemporaryDirectory(prefix="nicoid-seek-freeze-") as temp_name, ZipFile(approved) as base:
        temp = Path(temp_name)
        original = temp / "stable.dex"
        original.write_bytes(base.read(HELPERS))
        stable = disassemble(original, temp / "stable-smali", tools)
        require(len(stable) >= 7400 and DIAGNOSTICS in stable,
                "Stable Media3 baseline is missing or incomplete")
        smali = temp / "stable-smali"
        for entry, (old, new, count) in VERSION_OWNERS.items():
            replace_literal(smali, entry, old, new, count)
        injected = compile_diagnostic(temp, tools)
        added = set(injected) - set(stable)
        require(added == {
            OWNER / "Media3Diagnostics276$Probe.smali",
            OWNER / "Media3Diagnostics276$Attempt.smali",
        }, "Unexpected or missing recovery helper")
        for path, contents in injected.items():
            (smali / path).write_bytes(contents)
        player = (smali / OWNER / "Media3VideoPlayer.smali").read_text()
        for hook in ("onEvents", "onPlayIntentChange", "onStart",
                     "onPause", "onHandoffPause", "onError"):
            require("Media3Diagnostics276;->" + hook in player,
                    "Required Media3 hook missing: " + hook)
        revised = temp / "revised.dex"
        assemble(smali, revised, tools)
        checked = disassemble(revised, temp / "checked", tools)
        require(checked.keys() == stable.keys() | added,
                "Unexpected helper classes or missing stable classes")
        changed = {p for p in stable if checked[p] != stable[p]}
        require(changed == set(VERSION_OWNERS) | {DIAGNOSTICS},
                "Unintended helper code change: " + str(changed))
        diagnostic_text = checked[DIAGNOSTICS].decode()
        for signal in ("getPlaybackState", "getPlaybackSuppressionReason",
                       "getCurrentMediaItem"):
            require(signal in diagnostic_text, "Missing recovery runtime guard: " + signal)
        probe_text = checked[OWNER / "Media3Diagnostics276$Probe.smali"].decode()
        for signal in ('"stop"', '"prepare"'):
            require(signal in probe_text, "Recovery method missing: " + signal)
        extension = temp / "extension.dex"
        extension.write_bytes(base.read(EXTENSION))
        original_extension = disassemble(extension, temp / "extension-original", tools)
        banner = OWNER / "ModernShorts.smali"
        # Use the SHA-locked public v2.1.4 runtime, never the older
        # Gradle-generated extension jar: only the official release is
        # known to include the reviewed v2.1.4 Shorts and playback behavior.
        replace_literal(temp / "extension-original", banner,
                        '"v2.1.4 @chikuwadon"',
                        '"v2.1.5-dev.2 @chikuwadon"', 2)
        revised_ext = temp / "extension.dex.revised"
        assemble(temp / "extension-original", revised_ext, tools)
        ext_checked = disassemble(revised_ext, temp / "extension-checked", tools)
        require(ext_checked.keys() == original_extension.keys(),
                "Extension class set changed")
        # Version-only banner is the only extension modification.
        ext_before = disassemble(extension, temp / "extension-before", tools)
        require({p for p in ext_before if ext_before[p] != ext_checked[p]} == {banner},
                "Unexpected extension behavior change")
        manifest = base.read(MANIFEST)
        previous = ("Version: " + PREVIOUS + "\r\n").encode()
        require(manifest.count(previous) == 1, "Approved MPP manifest mismatch")
        new_manifest = manifest.replace(
            previous, ("Version: " + VERSION + "\r\n").encode())
        replacements = {HELPERS: revised.read_bytes(), EXTENSION: revised_ext.read_bytes(),
                        MANIFEST: new_manifest}
        output.parent.mkdir(parents=True, exist_ok=True)
        with ZipFile(output, "w") as final:
            for entry in base.infolist():
                final.writestr(copy(entry), replacements.get(entry.filename, base.read(entry.filename)))
        with ZipFile(output) as final:
            require(final.namelist() == base.namelist() and final.testzip() is None,
                    "Output MPP layout or integrity failure")
            for entry in base.namelist():
                if entry not in replacements:
                    require(final.read(entry) == base.read(entry),
                            "Unintended MPP entry change: " + entry)
        print("PASS: replaced only Media3 diagnostics/recovery and version owners")
        print("PASS: preserved all approved v2.1.4 native hooks, resource bytes and playback helpers")
    validate_mpp(output, VERSION)
    print("PASS: valid Android MPP " + str(output))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ("compiled", "approved", "output", "tools"):
        parser.add_argument("--" + name, required=True, type=Path)
    args = parser.parse_args()
    stage(args.compiled, args.approved, args.output, args.tools)


if __name__ == "__main__":
    main()
