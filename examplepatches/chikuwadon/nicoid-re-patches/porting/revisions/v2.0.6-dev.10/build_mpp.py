"""v2.0.6-dev.10: deterministic fullscreen resume choice and menu consistency.

Keep v2.0.6-dev.8 comment drawing byte-for-byte and v2.0.6-dev.9
fullscreen menu/selection semantics. Only add general preference reconciliation.
"""
from pathlib import Path
import importlib.util
import sys

VERSION = "2.0.6-dev.10"
ROOT=Path(__file__).resolve().parent
DEV8=ROOT.parent/"v2.0.6-dev.8"/"build_mpp.py"
sys.path.insert(0,str(ROOT))
SOURCE=DEV8.read_text(encoding="utf-8")
old_version='VERSION = "2.0.6-dev.8"'
if SOURCE.count(old_version)!=1:raise RuntimeError("Unexpected source version")
SOURCE=SOURCE.replace(old_version,'VERSION = "2.0.6-dev.10"')
old_sources='    \x27        *sorted((ROOT.parent / "v2.0.6-dev.8/java").rglob("*.java")),\x27'
new_sources=(
    '    \x27        *sorted(p for p in (ROOT.parent / "v2.0.6-dev.8/java").rglob("*.java")\x27\n'
    '    \x27 if p.name not in ("FullscreenOptions262.java", "FullscreenOptions265.java")),\\n\x27\n'
    '    \x27        *sorted((ROOT.parent / "v2.0.6-dev.9/java").rglob("*.java")),\\n\x27\n'
    '    \x27        *sorted((ROOT.parent / "v2.0.6-dev.10/java").rglob("*.java")),\x27'
)
# The \x27 escape is expanded in these Python string values and matches the
# quoted source-list lines in the dev.8 MPP builder.
if SOURCE.count(old_sources)!=1:
    raise RuntimeError("Unexpected original helper compilation list")
SOURCE=SOURCE.replace(old_sources,new_sources)
hook_anchor="    '        overlay_comment_helpers(hooks)\\n'\n"
hook_insert=(
    "    '        overlay_comment_helpers(hooks)\\n'\n"
    "    '        from overlay_270 import apply as overlay_settings_270\\n'\n"
    "    '        overlay_settings_270(work, disassembled, hooks)\\n'\n"
)
if SOURCE.count(hook_anchor)!=1:
    raise RuntimeError("Missing settings overlay stage")
SOURCE=SOURCE.replace(hook_anchor,hook_insert)
spec=importlib.util.spec_from_file_location("nicoid_v206_dev10_base",DEV8)
module=importlib.util.module_from_spec(spec)
sys.modules[spec.name]=module
exec(compile(SOURCE,str(DEV8),"exec"),module.__dict__)
module.builder.VERSION=VERSION

if __name__=="__main__":
    module.builder.main()
