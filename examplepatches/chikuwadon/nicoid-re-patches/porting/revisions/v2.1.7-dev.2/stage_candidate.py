#!/usr/bin/env python3
"""Stage the reviewed current development runtime with its optional compatibility component."""
from __future__ import annotations

import argparse
from copy import copy
import hashlib
import sys
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE = HERE.parent / "v2.1.7-dev.1" / "stage_candidate.py"
PREVIOUS_SOURCE_SHA = "958ef611d59568a368a73fcd16ec2085ce905e0d"
VERSION = "2.1.7-dev.2"
PREVIOUS_VERSION = "2.1.7-dev.1"
sys.path.insert(0, str(HERE / "compat"))


def stage(compiled: Path, approved: Path, output: Path, tools: Path) -> None:
    if len({compiled.resolve(), approved.resolve(), output.resolve()}) != 3:
        raise ValueError("Input and output MPP paths must be distinct")
    original = SOURCE.read_bytes()
    actual = hashlib.sha1(b"blob " + str(len(original)).encode() + b"\0" + original).hexdigest()
    if actual != PREVIOUS_SOURCE_SHA:
        raise ValueError("Previous reviewed development stage source changed")
    script = original.decode("utf-8")
    if script.count(PREVIOUS_VERSION) < 4:
        raise ValueError("Unexpected upstream development version markers")
    script = script.replace(PREVIOUS_VERSION, VERSION)
    context = {"__name__": "reviewed_dev_stage", "__file__": str(SOURCE)}
    exec(compile(script, str(SOURCE), "exec"), context)
    from bundle_overlay import make_candidate
    from verify_android_mpp import validate_mpp

    with TemporaryDirectory(prefix="nicoid-compat-staging-") as scratch:
        interim = Path(scratch) / "reviewed.mpp"
        context["stage"](compiled, approved, interim, tools)
        validate_mpp(interim, VERSION)
        make_candidate(interim, output)
        validate_mpp(output, VERSION)
        with ZipFile(interim) as baseline, ZipFile(output) as final:
            if baseline.namelist() != final.namelist():
                raise ValueError("Container members changed")
            for part in baseline.namelist():
                if part == "nicoid/helpers.mpe":
                    continue
                if baseline.read(part) != final.read(part):
                    raise ValueError("Unexpected modification to: " + part)
            if baseline.read("nicoid/method-delta.dex") != final.read("nicoid/method-delta.dex"):
                raise ValueError("Core playback delta changed")
        print("PASS: reviewed development runtime and optional compatibility component")
        print("MPP SHA256:", hashlib.sha256(output.read_bytes()).hexdigest())


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiled", required=True, type=Path)
    parser.add_argument("--approved", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--tools", type=Path,
                        default=ROOT / "porting/revisions/v2.0.0-dev.1/tools")
    args = parser.parse_args()
    stage(args.compiled, args.approved, args.output, args.tools)
