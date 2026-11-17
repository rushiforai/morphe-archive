"""v2.0.6-dev.8 regression contracts: explicit normal vs fullscreen video menu.

Legacy playback options remain under regression coverage.
"""
from pathlib import Path
import re

ROOT=Path(__file__).resolve().parents[4]
REV=ROOT/"porting/revisions/v2.0.6-dev.8"
PREV=ROOT/"porting/revisions/v2.0.6-dev.5"
version=re.search(r"(?m)^version\s*=\s*(\S+)",(ROOT/"gradle.properties").read_text())
assert version and version.group(1)=="2.0.6-dev.8"

builder=(REV/"build_mpp.py").read_text()
for anchor in ("v2.0.6-dev.5/java","v2.0.6-dev.8/java",
               'p.name != "FullscreenOptions262.java"',
               'p.name != "FullscreenOptions265.java"',
               "from overlay_262 import apply as apply_262",
               "from overlay_265 import apply as apply_265"):
 assert anchor in builder,anchor
assert (REV/"java/e/e/a/ScrollingComments267.java").is_file()
assert "overlay_comment_helpers(hooks)" in builder and "overlay_comment_native(native_dir)" in builder
assert (PREV/"java/e/e/a/CommentFlow220.java").is_file()

action=(REV/"java/e/e/a/FullscreenOptions262.java").read_text()
for needle in ("public static synchronized void armNormal()",
               "public static synchronized void armMenu()",
               "PlaybackChoice266.armNormal(SystemClock.uptimeMillis())",
               "PlaybackChoice266.armFullscreen(SystemClock.uptimeMillis())",
               "if(menuChoice==PlaybackChoice266.NORMAL)return;",
               "if(!selected)selected=consumeResume();",
               "actions.set(normalAt,new ListActions.Action(normalItem",
               "try{nativeRun.run();}catch(RuntimeException"):
 assert needle in action,needle
assert "menuUntil" not in action
assert "setDefaultValue(" not in action
assert "putString(key,nativeValue)" in action

menu=(REV/"java/e/e/a/FullscreenOptions265.java").read_text()
for needle in ("final Runnable nativeRun=normal==null?null:normal.run;",
               "FullscreenOptions262.armNormal();",
               "FullscreenOptions262.armMenu();",
               "actions.set(actions.indexOf(normal),",
               "if(!fullVisible)return;",
               "item.setOnMenuItemClickListener(clicked->{explicitNormal.run();return true;});",
               "video_menu_order_v1"):
 assert needle in menu,needle
assert menu.index("FullscreenOptions262.armNormal();")<menu.index("if(!fullVisible)return;"), "Normal action must work even when fullscreen menu hidden"
assert "Method arm=FullscreenOptions262.class.getDeclaredMethod" not in menu, "No reflective action routing"
assert "menu.clear();" in menu

choice=(REV/"java/e/e/a/PlaybackChoice266.java").read_text()
assert "public static synchronized int consume(long elapsedMs)" in choice
assert "pending=NONE;" in choice
assert "elapsedMs-armedAt<=TTL_MS" in choice
wf=(ROOT/".github/workflows/private-build.yml").read_text()
assert "builder=porting/revisions/v2.0.6-dev.8" in wf
assert "PlaybackChoice266Test.java" in wf

print("PASS: explicit normal selection overrides tap-to-fullscreen")
print("PASS: both real video menu implementations retain original callbacks")
print("PASS: preserved existing settings, full/menu ordering while the scrolling renderer is replaced")
