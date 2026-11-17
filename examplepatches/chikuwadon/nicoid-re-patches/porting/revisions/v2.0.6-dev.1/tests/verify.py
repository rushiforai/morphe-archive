"""Validate the comment flow source and guarded dev-only MPP pipeline."""
from pathlib import Path
import re
ROOT=Path(__file__).resolve().parents[4]
REV=ROOT/"porting/revisions/v2.0.6-dev.1"
version=re.search(r"^version\s*=\s*([^\s]+)",(ROOT/"gradle.properties").read_text(),re.MULTILINE)
assert version and version.group(1).startswith("2.0.6"), "Unexpected patch version"
flow=(REV/"java/e/e/a/CommentFlow220.java").read_text()
build=(REV/"build_mpp.py").read_text()
workflow=(ROOT/".github/workflows/private-build.yml").read_text()
assert "public static void retime(Object incoming,float visualNow,float duration)" in flow
assert "adjusted=originalSpeed*duration/(duration-age)" in flow
assert "int bestLane=0;" in flow
assert "Math.floorMod(rot" not in flow
assert "->retime(Ljava/lang/Object;FF)V" in build
assert 'if p.name != "CommentFlow220.java"' in build
assert "builder.VERSION=VERSION" in build
assert "v2.0.6-dev.1" in workflow
assert "CommentFlow260Test.java" in workflow
print("PASS: duration-aware late comments and stable fallback lane selection")
