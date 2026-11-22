#!/usr/bin/env python3
"""Check the dev.5 build route and comment producer ownership."""
from pathlib import Path
import ast

revision = Path(__file__).resolve().parents[1]
root = revision.parents[2]
stage = (revision / "stage_candidate.py").read_text(encoding="utf-8")
source = (revision / "CommentPresentation.java").read_text(encoding="utf-8")
ast.parse(stage)
assert 'version = 2.1.6-dev.5\n' in (root / "gradle.properties").read_text(encoding="utf-8")
workflow = (root / ".github/workflows/private-build.yml").read_text(encoding="utf-8")
assert '"$version" == "2.1.6-dev.5"' in workflow
for name in ("dev4.patch_runtime", "dev4.compile_sources", "wire_native",
             "CommentPresentation;->appendDiagnostics", "CommentPresentation;->release"):
    assert name in stage, name
for name in ("lockHardwareCanvas()", "view.lockCanvas()", "state.texture.get() != texture",
             "nicoid-retained-mini-player", "NicoidPopupViewService", "postGapsOver25ms",
             "Comment presentation diagnostics:", "DIAGNOSTICS.removeFirst()"):
    assert name in source, name
print("PASS: v2.1.6-dev.5 comment presentation and diagnostic export")
