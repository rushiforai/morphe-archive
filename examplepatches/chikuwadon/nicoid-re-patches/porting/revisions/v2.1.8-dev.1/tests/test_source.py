#!/usr/bin/env python3
"""Guard paused-transition center control recovery and non-regressive staging."""
import ast
from pathlib import Path
HERE = Path(__file__).resolve().parents[1]
ROOT = HERE.parents[2]
java = (HERE / "PausedCenter218.java").read_text()
script = (HERE / "stage_candidate.py").read_text()
ast.parse(script)
assert "version = 2.1.8-dev.1" in (ROOT / "gradle.properties").read_text()
for term in ("getPlayWhenReady", "isPlaying", "getDuration",
             "viewbutton", "viewctrllay", "videoLayout", "postDelayed",
             "play.setVisibility(View.VISIBLE)", "paused(root)",
             "ModernDebug", "WeakReference<View>"):
    assert term in java, term
for term in ("d7220da8b7a7b8d630160b1b17234dd471ee6a96c7da6363b912516c53177081",
             "PlayerStart215$Watch.smali", "FullscreenHandoff211",
             "PausedCenter218;->afterFrame", "patch_watch",
             "semantics_equal", "validate_mpp", "nicoid/method-delta.dex",
             "nicoid/resources.zip"):
    assert term in script, term
wf = (ROOT / ".github/workflows/private-build.yml").read_text()
assert '"2.1.8-dev.1"' in wf
assert "porting/revisions/v$version/stage_candidate.py" in wf
assert "porting/revisions/v$version/tests/test_source.py" in wf
print("PASS: pause-only center play recovery, bounded callbacks, version and payload checks")
