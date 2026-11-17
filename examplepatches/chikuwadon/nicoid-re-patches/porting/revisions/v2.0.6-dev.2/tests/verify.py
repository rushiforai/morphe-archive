"""Guard the v2.0.6-dev.2 seek/start no-acceleration fix."""
from pathlib import Path
import re
ROOT=Path(__file__).resolve().parents[4]
REV=ROOT/"porting/revisions/v2.0.6-dev.2"
version=re.search(r"^version\s*=\s*([^\s]+)",(ROOT/"gradle.properties").read_text(),re.MULTILINE)
assert version and version.group(1)=="2.0.6-dev.2"
flow=(REV/"java/e/e/a/CommentFlow220.java").read_text()
build=(REV/"build_mpp.py").read_text()
workflow=(ROOT/".github/workflows/private-build.yml").read_text()
assert "public static synchronized void retime(" in flow
assert "public static synchronized void reset(Object rendererState)" in flow
assert "fDuration.setInt(comment,extended);" in flow
assert "state.put(comment,new DurationAdjustment(configured,extended));" in flow
assert "startField.setFloat" not in flow
assert "originalSpeed*duration" not in flow
assert "int bestLane=0;" in flow
assert "->retime(Ljava/lang/Object;Ljava/lang/Object;FF)V" in build
assert "->reset(Ljava/lang/Object;)V" in build
assert "if p.name != \"CommentFlow220.java\"" in build
assert "builder.VERSION=VERSION" in build
assert "CommentFlow261Test.java" in workflow and "v2.0.6-dev.2" in workflow
print("PASS: no velocity acceleration, restored comment duration on seek/reset")
