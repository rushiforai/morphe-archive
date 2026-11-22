#!/usr/bin/env python3
"""Restore the normal viewport inset callback after fullscreen transitions."""
from __future__ import annotations
import argparse
from copy import copy
import hashlib
import os
import re
import sys
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
UPSTREAM = HERE.parent / "v2.1.7-dev.2" / "stage_candidate.py"
UPSTREAM_SHA = "4a5311c993c96469cd973e0b90fae2ef0067760c"
PREVIOUS_VERSION = "2.1.7-dev.2"
VERSION = "2.1.7-dev.3"
HELPERS = "nicoid/helpers.mpe"
OWNER = Path("e/e/a")
VIEWPORT = OWNER / "FullscreenViewport209.smali"
RESTORE = OWNER / "Dev115.smali"
INSETS = OWNER / "NormalVideoInsets.smali"
SCHEDULE = b"invoke-static {p0}, Le/e/a/NormalVideoInsets;->schedule(Landroid/view/View;)V"

sys.path[:0] = [str(ROOT / ".github/scripts"), str(HERE.parent / "v2.1.0-release")]
from stage_verified import TOOLS, assemble, require, run, semantics_equal
from verify_android_mpp import validate_mpp


def disassemble(dex: Path, output: Path, tools: Path) -> dict[Path, bytes]:
    classpath = os.pathsep.join(str(tools / part) for part in TOOLS)
    run("java", "-cp", classpath, "org.jf.baksmali.Main", "disassemble",
        "--sequential-labels", dex, "-o", output)
    return {p.relative_to(output): p.read_bytes() for p in output.rglob("*.smali")}


def within_method(source: bytes, name: bytes, original: bytes, revised: bytes) -> bytes:
    """Change a single invocation inside one uniquely located Smali method."""
    matches = list(re.finditer(rb"(?m)^\.method [^\r\n]*" + re.escape(name) +
                               rb"[^\r\n]*\n.*?^\.end method", source, re.DOTALL | re.MULTILINE))
    require(len(matches) == 1, "Expected exactly one " + name.decode() + " method")
    found = matches[0]
    body = found.group(0)
    require(body.count(original) == 1, "Unexpected existing call in " + name.decode())
    require(SCHEDULE not in body, "Insets callback already installed in " + name.decode())
    patched = body.replace(original, revised)
    return source[:found.start()] + patched + source[found.end():]


def stage(compiled: Path, approved: Path, output: Path, tools: Path) -> None:
    require(len({compiled.resolve(), approved.resolve(), output.resolve()}) == 3,
            "Compiled, approved and candidate files must be distinct")
    original = UPSTREAM.read_bytes()
    digest = hashlib.sha1(b"blob " + str(len(original)).encode() + b"\0" + original).hexdigest()
    require(digest == UPSTREAM_SHA, "Reviewed dev.2 source checksum mismatch")
    upstream = original.decode("utf-8")
    require(upstream.count('"' + PREVIOUS_VERSION + '"') == 1,
            "Unexpected previous development version declaration")
    upstream = upstream.replace('"' + PREVIOUS_VERSION + '"', '"' + VERSION + '"')
    namespace = {"__name__": "reviewed_dev_stage", "__file__": str(UPSTREAM)}
    exec(compile(upstream, str(UPSTREAM), "exec"), namespace)

    with TemporaryDirectory(prefix="nicoid-viewport-restoration-") as temporary:
        work = Path(temporary)
        inherited = work / "reviewed-dev.mpp"
        namespace["stage"](compiled, approved, inherited, tools)
        validate_mpp(inherited, VERSION)

        with ZipFile(inherited) as previous:
            base_dex = work / "previous.dex"
            base_dex.write_bytes(previous.read(HELPERS))
            current = disassemble(base_dex, work / "original", tools)
            require(all(p in current for p in (VIEWPORT, RESTORE, INSETS)),
                    "Previous viewport and inset components are missing")
            require(b".method public static schedule(Landroid/view/View;)V" in current[INSETS],
                    "Normal viewport inset listener is unavailable")
            require(SCHEDULE not in current[VIEWPORT] and SCHEDULE not in current[RESTORE],
                    "Normal viewport callback unexpectedly already connected")

            # The fullscreen exit occurs before Android has finished restoring
            # status-bar geometry. Register at exit and re-register from the
            # original 40/240 ms delayed callbacks, preserving the existing
            # sidebar policy and avoiding a single-layout timing dependency.
            exit_call = b"invoke-static {p0}, Le/e/a/Dev115;->afterFullscreenRestore(Landroid/view/View;)V"
            current[VIEWPORT] = within_method(
                current[VIEWPORT], b"restore(Landroid/view/View;)V", exit_call,
                SCHEDULE + b"\n\n    " + exit_call)
            side_call = b"invoke-static {p0}, Le/e/a/FullscreenViewport209;->side(Landroid/view/View;)Z"
            current[RESTORE] = within_method(
                current[RESTORE], b"lambda$afterFullscreenRestore$", side_call,
                SCHEDULE + b"\n\n    " + side_call)

            output_smali = work / "updated"
            for path, contents in current.items():
                destination = output_smali / path
                destination.parent.mkdir(parents=True, exist_ok=True)
                destination.write_bytes(contents)
            staged_dex = work / "updated.dex"
            assemble(output_smali, staged_dex, tools)
            validated = disassemble(staged_dex, work / "checked", tools)
            semantics_equal(validated, current, "normal viewport restoration")
            require(set(validated) == set(current), "Unexpected helper class changes")
            new_helper = staged_dex.read_bytes()
            require(new_helper != previous.read(HELPERS), "Viewport restoration was not staged")

            output.parent.mkdir(parents=True, exist_ok=True)
            with ZipFile(output, "w") as result:
                for info in previous.infolist():
                    result.writestr(copy(info),
                                    new_helper if info.filename == HELPERS else previous.read(info.filename))
        with ZipFile(inherited) as previous, ZipFile(output) as result:
            require(result.testzip() is None, "Invalid verification candidate")
            require(result.namelist() == previous.namelist(), "MPP container members changed")
            for part in previous.namelist():
                if part == HELPERS:
                    require(result.read(part) == new_helper, "Updated helper DEX missing")
                else:
                    require(result.read(part) == previous.read(part),
                            "Unrelated MPP member changed: " + part)
    validate_mpp(output, VERSION)
    print("PASS: status-bar inset repair staged without changing other MPP members")
    print("MPP SHA256:", hashlib.sha256(output.read_bytes()).hexdigest())


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiled", type=Path, required=True)
    parser.add_argument("--approved", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--tools", type=Path, default=ROOT / "porting/revisions/v2.0.0-dev.1/tools")
    args = parser.parse_args()
    stage(args.compiled, args.approved, args.output, args.tools)
