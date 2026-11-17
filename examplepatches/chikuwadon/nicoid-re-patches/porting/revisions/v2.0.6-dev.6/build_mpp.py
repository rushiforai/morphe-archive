"""v2.0.6-dev.5: safe comment timing + complete fullscreen menu/return.

Apply guarded source overlays to the verified v2.0.5-dev.17 pipeline. Do not
reuse dev.2's late-comment duration mutation (it caused slow/popping comments).
The original v2.0.5 MPP and release tags are not changed.
"""
from pathlib import Path
import importlib.util
import sys

VERSION = "2.0.6-dev.6"
ROOT = Path(__file__).resolve().parent
LEGACY = ROOT.parent / "v2.0.5-dev.17" / "build_mpp.py"
sys.path.insert(0,str(ROOT.parent / "v2.0.6-dev.3"))
sys.path.insert(0,str(ROOT.parent / "v2.0.6-dev.5"))
sys.path.insert(0,str(ROOT))
source = LEGACY.read_text(encoding="utf-8")

old_sources = '        *sorted((ROOT.parent / "v2.0.5-dev.4/java").rglob("*.java")),'
new_sources = (
    '        *sorted(p for p in (ROOT.parent / "v2.0.5-dev.4/java").rglob("*.java")'
    ' if p.name != "CommentFlow220.java"),\n'
    '        *sorted(p for p in (ROOT.parent / "v2.0.6-dev.3/java").rglob("*.java")'
    ' if p.name != "FullscreenOptions262.java"),\n'
    '        *sorted(p for p in (ROOT.parent / "v2.0.6-dev.5/java").rglob("*.java")'
    ' if p.name != "FullscreenOptions265.java"),\n'
    '        *sorted((ROOT.parent / "v2.0.6-dev.6/java").rglob("*.java")),'
)
if source.count(old_sources) != 1:
    raise RuntimeError("Changed legacy comment helper compilation anchor")
source = source.replace(old_sources,new_sources)

hook_anchor = '        hook_dex = work / "hooks.dex"'
hook_call = (
    '        from overlay_262 import apply as apply_262\n'
    '        apply_262(work, disassembled, hooks)\n'
    '        from overlay_265 import apply as apply_265\n'
    '        apply_265(work, disassembled, hooks)\n'
    + hook_anchor
)
if source.count(hook_anchor) != 1:
    raise RuntimeError("Helper overlay compilation stage changed")
source = source.replace(hook_anchor,hook_call)

activity_anchor = '        native_back=activity_file.read_text()'
activity_call = '''        native_fullscreen=activity_file.read_text()
        fullscreen_anchor=("    invoke-static {p0}, Le/e/a/FullscreenHandoff211;"
                           "->beforeContent(Landroid/app/Activity;)V")
        if native_fullscreen.count(fullscreen_anchor)!=1:
            raise RuntimeError("Native video fullscreen preparation changed")
        native_fullscreen=native_fullscreen.replace(fullscreen_anchor,
            "    invoke-static {p0}, Le/e/a/FullscreenOptions262;"
            "->onVideoCreated(Landroid/app/Activity;)V\\n\\n"+fullscreen_anchor)
        activity_file.write_text(native_fullscreen)
''' + activity_anchor
if source.count(activity_anchor) != 1:
    raise RuntimeError("Native VideoActivity lifecycle insertion changed")
source = source.replace(activity_anchor,activity_call)

spec = importlib.util.spec_from_file_location("nicoid_v206_dev5_builder",LEGACY)
builder = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = builder
exec(compile(source,str(LEGACY),"exec"),builder.__dict__)
builder.VERSION = VERSION

if __name__ == "__main__":
    builder.main()
