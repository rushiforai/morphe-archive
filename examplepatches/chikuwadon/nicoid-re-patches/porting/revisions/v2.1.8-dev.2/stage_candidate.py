#!/usr/bin/env python3
"""Stage a pause-only center-play restoration hook from exact public v2.1.7."""
from __future__ import annotations
import argparse
import hashlib
import os
import re
import sys
from copy import copy
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
OWNER = Path("e/e/a")
VERSION = "2.1.8-dev.2"
BASE_VERSION = "2.1.7"
BASE_SHA256 = "d7220da8b7a7b8d630160b1b17234dd471ee6a96c7da6363b912516c53177081"
HELPERS = "nicoid/helpers.mpe"
EXTENSION = "extensions/extension.mpe"
MANIFEST = "META-INF/MANIFEST.MF"
WATCH = OWNER / "PlayerStart215$Watch.smali"
NEW_HELPER = OWNER / "PausedCenter218.smali"

sys.path[:0] = [str(ROOT / ".github/scripts"), str(HERE.parent / "v2.1.0-release")]
from stage_verified import TOOLS, assemble, require, run, semantics_equal
from verify_android_mpp import validate_mpp
import importlib.util

spec = importlib.util.spec_from_file_location(
    "nicoid_stage_217dev1", HERE.parent / "v2.1.7-dev.1/stage_candidate.py")
review = importlib.util.module_from_spec(spec)
spec.loader.exec_module(review)


def disassemble(dex: Path, folder: Path, tools: Path):
    classpath = os.pathsep.join(str(tools / part) for part in TOOLS)
    run("java", "-cp", classpath, "org.jf.baksmali.Main",
        "disassemble", "--sequential-labels", dex, "-o", folder)
    return {f.relative_to(folder): f.read_bytes() for f in folder.rglob("*.smali")}


def compile_helper(work: Path, tools: Path):
    android, d8 = review.dev4.android_tools()
    classes = work / "classes"
    classes.mkdir()
    run("javac", "--release", "8", "-encoding", "UTF-8", "-cp", android,
        "-d", classes, HERE / "PausedCenter218.java")
    output = work / "d8"
    output.mkdir()
    bytecodes = sorted((classes / OWNER).glob("PausedCenter218*.class"))
    require(len(bytecodes) == 2, "Expected pause-repair helper and scoped callback")
    run(d8, "--min-api", "28", "--lib", android, "--output", output, *bytecodes)
    generated = disassemble(output / "classes.dex", work / "new-smali", tools)
    require(NEW_HELPER in generated, "Missing compiled pause-repair helper")
    require(all(str(x).startswith(str(OWNER / "PausedCenter218")) for x in generated),
            "Unexpected class introduced by pause-control helper")
    return generated


def patch_watch(source: bytes) -> bytes:
    method = re.search(rb"(?ms)^\.method [^\r\n]*firstFrame\(\)V\r?\n.*?^\.end method",
                       source)
    require(method is not None, "First-frame callback was replaced")
    body = method.group(0)
    call = (rb"(?m)^(\s*invoke-static \{(?P<reg>[vp]\d+)\}, "
            rb"Le/e/a/FullscreenHandoff211;->firstFrame\(Landroid/view/View;\)V)")
    hits = list(re.finditer(call, body))
    require(len(hits) == 1, "Expected a single decoded-frame handoff anchor")
    require(b"PausedCenter218" not in body, "Pause repair installed more than once")
    hit = hits[0]
    invocation = (b"\n    invoke-static {" + hit.group("reg") +
                  b"}, Le/e/a/PausedCenter218;->afterFrame(Landroid/view/View;)V")
    replaced = body[:hit.end()] + invocation + body[hit.end():]
    source = source[:method.start()] + replaced + source[method.end():]
    # PlayerStart215.Watch.run() repeatedly hides the center button every 32ms
    # until a new TextureView update arrives. A paused handoff may preserve the
    # existing decoded frame and produce no new update. Complete the pending
    # first-frame watcher immediately when an available retained surface is
    # positively confirmed and playback is explicitly paused.
    run = re.search(rb"(?ms)^\.method [^\r\n]*run\(\)V\r?\n.*?^\.end method", source)
    require(run is not None, "Missing PlayerStart215 Watch.run method")
    body = run.group(0)
    directive = re.search(rb"(?m)^    \.(registers|locals) (\d+)\s*$", body)
    require(directive is not None and int(directive.group(2)) >= 2,
            "Insufficient Watch.run registers for paused-frame fast path")
    require(b"canUsePausedFrame" not in body, "Paused fast path already installed")
    guard = b"""
    iget-object v0, p0, Le/e/a/PlayerStart215$Watch;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Le/e/a/PausedCenter218;->canUsePausedFrame(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :nicoid_paused_frame_continue_218

    invoke-virtual {p0}, Le/e/a/PlayerStart215$Watch;->firstFrame()V

    return-void

    :nicoid_paused_frame_continue_218
"""
    body = body[:directive.end()] + guard + body[directive.end():]
    return source[:run.start()] + body + source[run.end():]


def normalized_watch(code: bytes) -> list[bytes]:
    """Normalize text and branch labels per method; Smali reuses label names in each method."""
    lines = [line.strip() for line in code.splitlines() if line.strip() and not line.strip().startswith(b".line ")]

    def section(lines: list[bytes]) -> list[bytes]:
        label_definitions = [line[1:] for line in lines if line.startswith(b":")]
        require(len(label_definitions) == len(set(label_definitions)),
                "Repeated label inside the same method")
        labels = {label: ("L" + str(i)).encode("ascii")
                  for i, label in enumerate(label_definitions)}
        def canonical(line):
            def translate(match):
                label = match.group()[1:]
                if label not in labels:
                    # Colon-bearing constants or type annotations are not branch references.
                    return match.group()
                return b":" + labels[label]
            return re.sub(rb":[A-Za-z_][A-Za-z_0-9]*", translate, line)
        return [canonical(line) for line in lines]

    normalized = []
    current = []
    for line in lines:
        if line.startswith(b".method "):
            require(not current, "Nested Smali method section")
            current.append(line)
        elif current:
            current.append(line)
            if line == b".end method":
                normalized.extend(section(current))
                current = []
        else:
            normalized.append(line)
    require(not current, "Unterminated Smali method")
    return normalized


def compile_smali(entries, work: Path, tools: Path) -> bytes:
    path = work / "smali"
    for name, data in entries.items():
        target = path / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)
    dex = work / "updated.dex"
    assemble(path, dex, tools)
    actual = disassemble(dex, work / "confirmed", tools)
    if WATCH not in entries:
        semantics_equal(actual, entries, str(work) + " untouched extension classes")
        return dex.read_bytes()
    untouched = {p: code for p, code in entries.items() if p != WATCH}
    require(set(actual) == set(entries), "Class set changed during Smali reassembly")
    semantics_equal({p: code for p, code in actual.items() if p != WATCH},
                    untouched, str(work) + " unchanged classes")
    hook = b"Le/e/a/PausedCenter218;->afterFrame(Landroid/view/View;)V"
    require(actual[WATCH].count(hook) == 1, "Pause recovery hook missing or duplicated")
    retained = b"Le/e/a/PausedCenter218;->canUsePausedFrame(Landroid/view/View;)Z"
    require(actual[WATCH].count(retained) == 1,
            "Retained paused TextureView handoff missing or duplicated")
    if normalized_watch(actual[WATCH]) != normalized_watch(entries[WATCH]):
        import difflib
        actual_lines = [l.decode("utf-8", "replace") for l in normalized_watch(actual[WATCH])]
        expected_lines = [l.decode("utf-8", "replace") for l in normalized_watch(entries[WATCH])]
        diff = list(difflib.unified_diff(expected_lines, actual_lines,
                                         fromfile="expected", tofile="reassembled"))
        raise RuntimeError("Modified first-frame method differs after assembly: " +
                           "\\n".join(diff[:48]))
    print("PASS: first-frame Smali instructions and labels preserved after reassembly")
    return dex.read_bytes()


def stage(compiled: Path, approved: Path, output: Path, tools: Path):
    require(len({compiled.resolve(), approved.resolve(), output.resolve()}) == 3,
            "Build, baseline and output must be separate")
    validate_mpp(compiled, VERSION)
    require(hashlib.sha256(approved.read_bytes()).hexdigest() == BASE_SHA256,
            "Public v2.1.7 MPP changed from verified release")
    validate_mpp(approved, BASE_VERSION)
    with TemporaryDirectory(prefix="nicoid-center-pause-") as tmp, ZipFile(approved) as bundle:
        work = Path(tmp)
        added = compile_helper(work, tools)
        result_entries = {}
        for name in (HELPERS, EXTENSION):
            folder = work / ("helpers" if name == HELPERS else "extension")
            folder.mkdir()
            dex = folder / "source.dex"
            dex.write_bytes(bundle.read(name))
            classes = disassemble(dex, folder / "original", tools)
            if name == HELPERS:
                require(WATCH in classes, "Missing center playback first-frame guard")
                require(not any(p in classes for p in added), "New helper already present")
                classes[WATCH] = patch_watch(classes[WATCH])
                classes.update(added)
                ver = OWNER / "PatchVersion237.smali"
                require(ver in classes and classes[ver].count(b'"2.1.7"') == 1,
                        "Current helper version anchor changed")
                classes[ver] = classes[ver].replace(b'"2.1.7"', b'"2.1.8-dev.2"')
            shorts = OWNER / "ModernShorts.smali"
            require(shorts in classes and classes[shorts].count(
                b'"v2.1.7 @chikuwadon"') == 2, "Previous Shorts metadata changed")
            classes[shorts] = classes[shorts].replace(
                b'"v2.1.7 @chikuwadon"', b'"v2.1.8-dev.2 @chikuwadon"')
            result_entries[name] = compile_smali(classes, folder, tools)
        manifest = bundle.read(MANIFEST)
        previous = b"Version: 2.1.7\r\n"
        require(manifest.count(previous) == 1, "MPP manifest version changed")
        result_entries[MANIFEST] = manifest.replace(previous, b"Version: 2.1.8-dev.2\r\n")
        output.parent.mkdir(parents=True, exist_ok=True)
        with ZipFile(output, "w") as out:
            for entry in bundle.infolist():
                out.writestr(copy(entry), result_entries.get(entry.filename, bundle.read(entry.filename)))
        with ZipFile(output) as out:
            require(out.testzip() is None, "Invalid zip payload")
            require(out.namelist() == bundle.namelist(), "Altered MPP container member list")
            for entry in bundle.namelist():
                expected = result_entries.get(entry, bundle.read(entry))
                require(out.read(entry) == expected, "Unexpected MPP change: " + entry)
            require(out.read("nicoid/method-delta.dex") ==
                    bundle.read("nicoid/method-delta.dex"), "Native method patch changed")
            require(out.read("nicoid/resources.zip") ==
                    bundle.read("nicoid/resources.zip"), "Original Android resource payload changed")
    validate_mpp(output, VERSION)
    print("PASS:", VERSION, hashlib.sha256(output.read_bytes()).hexdigest())


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiled", required=True, type=Path)
    parser.add_argument("--approved", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--tools", type=Path, default=HERE.parent / "v2.0.0-dev.1/tools")
    a = parser.parse_args()
    stage(a.compiled, a.approved, a.output, a.tools)
