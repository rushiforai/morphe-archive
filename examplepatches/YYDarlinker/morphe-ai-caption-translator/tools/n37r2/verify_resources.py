"""Retain the existing structure/localization assertions, with scope anchored to N37 rather than N30."""
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
source=ROOT/'tools/n34/verify_artifacts.py';code=source.read_text(encoding='utf-8-sig')
assert code.count("'b52b65b:'+path")==1
code=code.replace("'b52b65b:'+path","'3c36bf4d0e3ebd499fc5f21e68a1f34e4f111ff5:'+path")
assert code.count("'CaptionOverlayV2.java',")==1
code=code.replace("'CaptionOverlayV2.java',","'CaptionOverlayV2.java','CaptionSurface.java',")
code=code.replace('n34-scope-and-localization.json','n37r2-scope-and-localization.json').replace('N34_ARTIFACT_AND_SCOPE_PASS','N37R2_ARTIFACT_AND_SCOPE_PASS').replace('protected_n30_paths','protected_paths_vs_n37').replace('N30_scope_exact','N37_scope_exact')
exec(compile(code,str(source),'exec'),{'__file__':str(source),'__name__':'__main__'})