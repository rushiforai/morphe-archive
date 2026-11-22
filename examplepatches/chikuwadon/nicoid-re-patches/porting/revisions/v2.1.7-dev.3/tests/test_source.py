#!/usr/bin/env python3
"""Guard the reviewed normal viewport inset restoration and development-only build."""
from pathlib import Path
import ast
import hashlib

HERE = Path(__file__).resolve().parents[1]
ROOT = HERE.parents[2]
stage = (HERE / "stage_candidate.py").read_text(encoding="utf-8")
ast.parse(stage)
assert 'version = 2.1.7-dev.3' in (ROOT / "gradle.properties").read_text(encoding="utf-8")
workflow = (ROOT / ".github/workflows/private-build.yml").read_text(encoding="utf-8")
assert '"2.1.7-dev.3"' in workflow
assert "porting/revisions/v$version/stage_candidate.py" in workflow
assert 'GITHUB_REF" == "refs/heads/dev"' in workflow
source = (ROOT / "porting/revisions/v2.1.7-dev.2/stage_candidate.py").read_bytes()
sha = hashlib.sha1(b"blob " + str(len(source)).encode() + b"\0" + source).hexdigest()
assert sha == "4a5311c993c96469cd973e0b90fae2ef0067760c"
assert sha in stage
assert 'PREVIOUS_VERSION = "2.1.7-dev.2"' in stage
assert 'VERSION = "2.1.7-dev.3"' in stage
for required in (
    "NormalVideoInsets;->schedule(Landroid/view/View;)V",
    "Dev115;->afterFullscreenRestore(Landroid/view/View;)V",
    "FullscreenViewport209;->side(Landroid/view/View;)Z",
    "lambda$afterFullscreenRestore$",
    "require(SCHEDULE not in body",
    "semantics_equal(validated, current",
    "result.read(part) == previous.read(part)",
    "validate_mpp(output, VERSION)",
    "namespace[\"stage\"]",
):
    assert required in stage, "Missing release-safe inset restoration guard: " + required
# Confirm the 59px status-bar shift shown in the field report is consistent with
# the previously tested Android inset algorithm. Do not hard-code a device inset.
insets = (ROOT / "porting/revisions/v2.0.0-dev.1/java/e/e/a/NormalVideoInsets.java").read_text(encoding="utf-8")
assert "baseline + Math.max(0, statusBottom - (top - (current - baseline)))" in insets
required_margin = lambda baseline, current, top, status: baseline + max(0, status - (top - (current - baseline)))
assert required_margin(0, 0, 0, 59) == 59
assert required_margin(0, 59, 59, 59) == 59
assert required_margin(0, 59, 118, 59) == 0
print("PASS: restored fullscreen-exit inset hook, delayed retry, idempotent 59px correction and baseline preservation")
