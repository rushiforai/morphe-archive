#!/usr/bin/env python3
"""Reconcile a verified, scoped runtime payload with the current development MPP.

The binary snapshot is generated from a separately verified build.
Keep the existing app playback code, extensions and native/resource inputs intact.
"""
from __future__ import annotations

import argparse
from copy import copy
import gzip
import hashlib
import os
from pathlib import Path
import subprocess
import sys
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
sys.path.insert(0, str(ROOT / ".github/scripts"))
from verify_android_mpp import validate_mpp

VERSION = "2.1.8-dev.2"
HELPERS = "nicoid/helpers.mpe"
STANDARD = Path("e/e/a/internal/standard150")
SNAPSHOT = HERE / "runtime-overlay.dex.gz"
SNAPSHOT_SHA = "eaa769e14bb5e29f86d83f58a19bb7d2a7b1b4b5184f5cdc839d5eea846c184f"
SNAPSHOT_DEX_SHA = "70627c1007562acf1fa5e998a49cfa26533f0aa6475b1dad6c1e719d7c7cd555"
TOOLS = ("assemble/*", "dexlib2.jar", "guava.jar")


def require(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError(message)


def run(*args) -> None:
    subprocess.run([str(x) for x in args], check=True)


def classpath(tools: Path) -> str:
    return os.pathsep.join(str(tools / p) for p in TOOLS)


def disassemble(dex: Path, target: Path, tools: Path) -> dict[Path, bytes]:
    run("java", "-cp", classpath(tools), "org.jf.baksmali.Main",
        "disassemble", "--sequential-labels", dex, "-o", target)
    return {p.relative_to(target): p.read_bytes() for p in target.rglob("*.smali")}


def canonical_game(path: Path) -> bool:
    return path.parent == STANDARD and path.name.startswith("BikeRun") and path.suffix == ".smali"


def semantics_equal(a: dict[Path, bytes], b: dict[Path, bytes], context: str) -> None:
    require(set(a) == set(b), context + ": changed class inventory")
    altered = sorted(str(p) for p in a if a[p] != b[p])
    require(not altered, context + ": unrelated instructions changed: " + repr(altered[:12]))


def merge(staged: Path, output: Path, tools: Path) -> None:
    require(staged.is_file() and staged.resolve() != output.resolve(),
            "Input missing or same as output")
    payload = SNAPSHOT.read_bytes()
    require(hashlib.sha256(payload).hexdigest() == SNAPSHOT_SHA,
            "Pinned runtime input mismatch")
    raw = gzip.decompress(payload)
    require(hashlib.sha256(raw).hexdigest() == SNAPSHOT_DEX_SHA,
            "Pinned DEX content mismatch")
    require(raw[:4] == bytes((100, 101, 120, 10)), "Not a standard DEX")

    validate_mpp(staged, VERSION)
    with TemporaryDirectory(prefix="nicoid-scoped-payload-") as dirname, ZipFile(staged) as bundle:
        work = Path(dirname)
        old_dex = work / "existing.dex"
        old_dex.write_bytes(bundle.read(HELPERS))
        payload_dex = work / "runtime.dex"
        payload_dex.write_bytes(raw)

        original_folder = work / "original"
        current = disassemble(old_dex, original_folder, tools)
        replacement = disassemble(payload_dex, work / "replaced", tools)

        old_game = {p: v for p, v in current.items() if canonical_game(p)}
        new_game = {p: v for p, v in replacement.items() if canonical_game(p)}
        require(len(old_game) == len(new_game) == 22, "Expected 22 established runtime classes")
        require(set(old_game) == set(new_game) == set(replacement),
                "Replacement includes unrelated classes or misses an existing runtime class")

        model = new_game[STANDARD / "BikeRunModel.smali"]
        require(b"v1.5.1" in model and b"v1.5.1-dev." not in model,
                "Stable runtime identity not set")
        require(b"->tryWheelieCrush(" in model and b"->pickupStage:I" in model and
                b"->stompPrevY:F" in model,
                "Approved game mechanics absent from snapshot")
        require(b"PausedCenter218" in b"".join(current.values()),
                "Recent paused-frame behavior missing from the current MPP")

        for relative, source in new_game.items():
            (original_folder / relative).write_bytes(source)

        updated_dex = work / "merged.dex"
        run("java", "-cp", classpath(tools), "org.jf.smali.Main",
            "assemble", "-a", "28", original_folder, "-o", updated_dex)
        confirmed = disassemble(updated_dex, work / "roundtrip", tools)

        semantics_equal({p: s for p, s in confirmed.items() if p not in old_game},
                        {p: s for p, s in current.items() if p not in old_game},
                        "Current non-runtime classes")
        semantics_equal({p: confirmed[p] for p in new_game},
                        new_game, "Verified scoped runtime payload")
        require(confirmed[STANDARD / "BikeRunModel.smali"] != old_game[STANDARD / "BikeRunModel.smali"],
                "Payload did not change the target class")

        output.parent.mkdir(parents=True, exist_ok=True)
        with ZipFile(output, "w") as rewritten:
            for info in bundle.infolist():
                if info.filename == HELPERS:
                    rewritten.writestr(copy(info), updated_dex.read_bytes())
                else:
                    rewritten.writestr(copy(info), bundle.read(info.filename))

        with ZipFile(output) as actual:
            require(actual.testzip() is None and actual.namelist() == bundle.namelist(),
                    "MPP structure or member integrity changed")
            for info in bundle.infolist():
                if info.filename != HELPERS:
                    require(actual.read(info.filename) == bundle.read(info.filename),
                            "Non-helper member unexpectedly changed: " + info.filename)

    validate_mpp(output, VERSION)
    print("PASS: scoped runtime synchronized; existing MPP classes and resources preserved")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--tools", required=True, type=Path)
    args = parser.parse_args()
    merge(args.input, args.output, args.tools)
