"""Guarded v2.0.6-dev.3 MPP builder.
Preserve the validated dev.2 comment timing fix and add fullscreen controls.
"""
VERSION = "2.0.6-dev.3"
from pathlib import Path
import importlib.util
import sys

ROOT=Path(__file__).resolve().parent
DEV2=ROOT.parent/"v2.0.6-dev.2"/"build_mpp.py"
SOURCE=DEV2.read_text(encoding="utf-8")
old_version='VERSION = "2.0.6-dev.2"'
assert SOURCE.count(old_version)==1
SOURCE=SOURCE.replace(old_version,'VERSION = "2.0.6-dev.3"')
old='        *sorted((ROOT.parent / "v2.0.6-dev.2/java").rglob("*.java")),'
new=old+'\\n'+'        *sorted((ROOT.parent / "v2.0.6-dev.3/java").rglob("*.java")),'
assert SOURCE.count(old)==1
SOURCE=SOURCE.replace(old,new)
entry='spec=importlib.util.spec_from_file_location("nicoid_v206_dev1_base",LEGACY)'
additional="sys.path.insert(0,str(Path(__file__).resolve().parent.parent/\"v2.0.6-dev.3\"))\nhook_anchor='        hook_dex = work / \"hooks.dex\"'\nhook_call=('        from overlay_262 import apply\\n'\n           '        apply(work, disassembled, hooks)\\n'+hook_anchor)\nif source.count(hook_anchor)!=1:raise RuntimeError(\"Hook stage moved\")\nsource=source.replace(hook_anchor,hook_call)\nnative_anchor='        native_back=activity_file.read_text()'\nnative_call='''        native_fullscreen=activity_file.read_text()\n        fullscreen_anchor=(\"    invoke-static {p0}, Le/e/a/FullscreenHandoff211;\"\n                           \"->beforeContent(Landroid/app/Activity;)V\")\n        if native_fullscreen.count(fullscreen_anchor)!=1:\n            raise RuntimeError(\"Video fullscreen anchor changed\")\n        native_fullscreen=native_fullscreen.replace(fullscreen_anchor,\n            \"    invoke-static {p0}, Le/e/a/FullscreenOptions262;\"\n            \"->onVideoCreated(Landroid/app/Activity;)V\\\\n\\\\n\"+fullscreen_anchor)\n        activity_file.write_text(native_fullscreen)\n'''+native_anchor\nif source.count(native_anchor)!=1:raise RuntimeError(\"Activity init stage moved\")\nsource=source.replace(native_anchor,native_call)\n"
assert SOURCE.count(entry)==1
SOURCE=SOURCE.replace(entry,additional+"\n"+entry)
module=importlib.util.module_from_spec(
    importlib.util.spec_from_file_location("nicoid_v206_dev3_base",DEV2))
exec(compile(SOURCE,str(DEV2),"exec"),module.__dict__)
if __name__=="__main__":
    module.builder.main()
