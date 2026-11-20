#!/usr/bin/env python3
"""Stage the packaging-only v2.1.3-dev.1 hotfix from validated v2.1.2 source.

No playback, ambient, playlist or backup behavior changes. The Android-host
classes.dex remains copied from Gradle buildAndroid and is validated before and
after the existing v2.1.2 bytecode staging.
"""
from __future__ import annotations
from pathlib import Path
import importlib.util
import sys

ROOT=Path(__file__).resolve().parents[3]
SCRIPT=ROOT/"porting/revisions/v2.1.2-release/stage_candidate.py"
spec=importlib.util.spec_from_file_location("v212_stage", SCRIPT)
assert spec and spec.loader
stage=importlib.util.module_from_spec(spec)
spec.loader.exec_module(stage)
stage.CANDIDATE_VERSION="2.1.3-dev.1"
sys.path.insert(0,str(ROOT/".github/scripts"))
from verify_android_mpp import validate_mpp

if __name__=="__main__":
    args=sys.argv[1:]
    def path_flag(name):
        if name not in args or args.index(name)+1>=len(args):
            raise ValueError(f"Missing {name}")
        return Path(args[args.index(name)+1])
    compiled=path_flag("--compiled")
    output=path_flag("--output")
    validate_mpp(compiled,stage.CANDIDATE_VERSION)
    stage.main()
    validate_mpp(output,stage.CANDIDATE_VERSION)
    print("PASS: v2.1.3-dev.1 MPP retains Android root classes.dex and reviewed v2.1.2 behavior")
