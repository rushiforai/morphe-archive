"""Guarded v2.0.6-dev.1 MPP builder; preserve approved dev.17 baseline."""
from pathlib import Path
import importlib.util
import sys
VERSION = "2.0.6-dev.1"
ROOT = Path(__file__).resolve().parent
LEGACY = ROOT.parent / "v2.0.5-dev.17" / "build_mpp.py"
source = LEGACY.read_text(encoding="utf-8")
old_sources = '        *sorted((ROOT.parent / "v2.0.5-dev.4/java").rglob("*.java")),'
new_sources = ('        *sorted(p for p in (ROOT.parent / "v2.0.5-dev.4/java").rglob("*.java")'
               ' if p.name != "CommentFlow220.java"),\n'
               '        *sorted((ROOT.parent / "v2.0.6-dev.1/java").rglob("*.java")),')
old_row = "        visuals=visuals.replace(row_result,row_fallback)"
new_row = old_row + '''
        # Retiming is applied once immediately after speed/width calculation.
        speed_anchor = "    iput v1, v9, Le/e/a/CommentVisuals$Entry;->speed:F"
        if visuals.count(speed_anchor)!=1:raise ValueError("Missing speed anchor")
        visuals=visuals.replace(speed_anchor,speed_anchor+
            "\\n\\n    invoke-static {v9, v11, v5}, Le/e/a/CommentFlow220;"
            "->retime(Ljava/lang/Object;FF)V")
'''
for label,old,new in (("flow helper",old_sources,new_sources),
                      ("duration retiming",old_row,new_row)):
 if source.count(old)!=1:raise RuntimeError("Upstream builder drift: "+label)
 source=source.replace(old,new)
spec=importlib.util.spec_from_file_location("nicoid_v206_dev1_base",LEGACY)
builder=importlib.util.module_from_spec(spec)
sys.modules[spec.name]=builder
exec(compile(source,str(LEGACY),"exec"),builder.__dict__)
builder.VERSION=VERSION
if __name__=="__main__":
 builder.main()
