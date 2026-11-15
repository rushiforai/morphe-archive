"""Source regression contracts for v2.0.3-dev.4, not an Android device test."""
from pathlib import Path
import importlib.util,tempfile
R=Path(__file__).resolve().parents[1]
P=R.parent
spec=importlib.util.spec_from_file_location("_overlay206",R/"patch_206.py")
mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
with tempfile.TemporaryDirectory() as tmp:
 out=Path(tmp)/"e/e/a"
 mod.stage(P/"v2.0.0-dev.1/java/e/e/a",out)
 drawer=(out/"AppBarPlacement202.java").read_text()
 player=(out/"PlayerIcons.java").read_text()
 live=(out/"NicoliveActivity.java").read_text()
 assert "child.getLeft()+child.getTranslationX()+child.getWidth()" in drawer
 assert "normalContent.setTranslationZ(0f)" in drawer
 assert "normalChrome.setTranslationY(0)" in drawer
 assert "normalChrome.setAlpha(0f)" not in drawer
 assert "normalContent.setTranslationZ(8f)" not in drawer
 assert "PlayerStart206.install(root)" in player
 assert "NicoliveFloatingMini206.install" in live
mini=(R/"java/e/e/a/NicoliveFloatingMini206.java").read_text()
assert "circle.setStroke" not in mini
assert "edgeResize=(resizeLeft||px>getWidth()-edge)&&(resizeTop||py>getHeight()-edge)" in mini
assert "float delta=(horizontal*ratio+vertical)/(ratio*ratio+1);" in mini
assert "Gravity.TOP|Gravity.LEFT" in mini
handoff=(R/"java/e/e/a/FullscreenHandoff206.java").read_text()
assert "mark(Object fragment,Intent intent)" in handoff
assert "window.setAttributes" not in handoff or "w.setAttributes(attr)" in handoff
assert 'putExtra(EXTRA,true)' in handoff
assert "video.getHeight()>=decor.getHeight()*.72f" in handoff
media=(R/"java/e/e/a/MediaSeek206.java").read_text()
assert "WeakHashMap<Object,Snapshot>" in media
assert "onSeekTo" in media
builder=(R/"build_mpp.py").read_text()
for term in ("from patch_206 import OVERRIDES, stage",
 "VERSION = \"2.0.3-dev.4\"", "MediaSeek206;", "validDuration",
 "MediaSeek206;->requested","FullscreenHandoff206;->prepared",
 "FullscreenHandoff206;->beforeContent", "FullscreenHandoff206;"):
 assert term in builder,term
a=builder.index("fragment_file.write_text(fragment.replace(next_launch")
b=builder.index("next_launch))",a)
assert builder.find("FullscreenHandoff206;",a,b)>0
assert builder.find("FullscreenHandoff206;",a,b)<builder.find("+ next_launch))",a)
print("PASS: drawer native geometry, startup spinner, original popup corner math, fullscreen pre-launch and persistent seek-duration checks")
print("UNVERIFIED: in-app frames, hardware transitions, Android 16 notification gesture behavior")
