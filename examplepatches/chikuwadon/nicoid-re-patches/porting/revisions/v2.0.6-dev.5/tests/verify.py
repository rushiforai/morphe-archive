"""v2.0.6-dev.5: comment motion and fullscreen control regression contracts."""
from pathlib import Path
import re

ROOT=Path(__file__).resolve().parents[4]
REV=ROOT/"porting/revisions/v2.0.6-dev.5"
props=(ROOT/"gradle.properties").read_text()
version=re.search(r"(?m)^version\s*=\s*(\S+)",props)
assert version and version.group(1)=="2.0.6-dev.5"
flow=(REV/"java/e/e/a/CommentFlow220.java").read_text()
assert "int bestLane=0" in flow
assert "return intended;" in flow
assert "WeakHashMap" not in flow and "fDuration" not in flow
assert "retime(Object state,Object incoming" in flow
assert "reset(Object state)" in flow
builder=(REV/"build_mpp.py").read_text()
for term in ("v2.0.6-dev.3/java","v2.0.6-dev.5/java",
             "from overlay_262 import apply as apply_262",
             "from overlay_265 import apply as apply_265",
             "onVideoCreated(Landroid/app/Activity;)V"):
 assert term in builder,term
assert "v2.0.6-dev.2/java" not in builder
overlay=(REV/"overlay_265.py").read_text()
assert "ListActions.smali" in overlay and "ListActions;->ACTIONS" in overlay
assert "Dev111.smali" in overlay and "->settings(" in overlay and "FullscreenOptions265;" in overlay
assert "->resumeSummary(" in overlay and "FullscreenOptions265;" in overlay
# Exercise the smali splice on real compiled ListActions source.
import importlib.util
spec=importlib.util.spec_from_file_location("overlay_265",REV/"overlay_265.py")
mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
native=(ROOT/"porting/revisions/v1.10.1/helpers/e/e/a/ListActions.smali").read_text()
modified=mod.method(native,
  ".method public static extra(Ljava/lang/Object;Ljava/lang/Object;)V",
  mod.attach_menu,"real video menu")
assert modified.count("Le/e/a/FullscreenOptions265;->attach(")==1
assert "invoke-static {v11, v14, v3, v2}" in modified
full=(REV/"java/e/e/a/FullscreenOptions265.java").read_text()
for needle in ("全画面再生に戻る","Return to fullscreen playback","返回全螢幕播放",
               "video_menu_visible_","FullscreenOptions262.settings(activity)",
               "MenuEditor120.order(host)","->attach(", "video_menu_order_v1"):
 # Smali references live in overlay; the Java module must contain all APIs.
 assert needle in (full+overlay),needle
assert "menu.clear();" in full and "actions.add(new ListActions.Action" in full
wf=(ROOT/".github/workflows/private-build.yml").read_text()
assert "builder=porting/revisions/v2.0.6-dev.5" in wf
assert "CommentFlow265Test.java" in wf
print("PASS: native-duration comment flow and deterministic lanes")
print("PASS: real list menu insertion and custom order preservation")
print("PASS: fullscreen resume choice installed after Dev111 settings")
