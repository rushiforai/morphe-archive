#!/usr/bin/env python3
"""Stage v2.1.3 from the reviewed v2.1.2 runtime without behavioral changes.

Only the version markers and packaging are updated. Validate the root Android
patch DEX on both sides of the stage to prevent a JVM archive from publishing.
"""
from __future__ import annotations
import importlib.util
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
VERSION = "2.1.3"
ORIGINAL = ROOT / "porting/revisions/v2.1.2-release/stage_candidate.py"
spec = importlib.util.spec_from_file_location("v212_stage_for_v213", ORIGINAL)
assert spec is not None and spec.loader is not None
stage = importlib.util.module_from_spec(spec)
spec.loader.exec_module(stage)
stage.CANDIDATE_VERSION = VERSION
sys.path.insert(0, str(ROOT / ".github/scripts"))
from verify_android_mpp import validate_mpp

if __name__ == "__main__":
    args = sys.argv[1:]
    def required_path(flag: str) -> Path:
        if flag not in args or args.index(flag) + 1 >= len(args):
            raise ValueError(f"Missing {flag}")
        return Path(args[args.index(flag) + 1])
    compiled = required_path("--compiled")
    output = required_path("--output")
    validate_mpp(compiled, VERSION)
    stage.main()
    validate_mpp(output, VERSION)
    print("PASS: v2.1.3 preserves reviewed v2.1.2 runtime and Android root classes.dex")
