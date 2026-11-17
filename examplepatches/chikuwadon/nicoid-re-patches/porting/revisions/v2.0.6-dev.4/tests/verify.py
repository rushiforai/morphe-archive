"""Ensure v2.0.6-dev.4 includes stable comment motion and fullscreen options."""
from pathlib import Path
import re

ROOT=Path(__file__).resolve().parents[4]
REV=ROOT/"porting/revisions/v2.0.6-dev.4"
PREV=ROOT/"porting/revisions/v2.0.6-dev.2"
version=re.search(r"(?m)^version\s*=\s*(\S+)",
                  (ROOT/"gradle.properties").read_text())
assert version and version.group(1)=="2.0.6-dev.4"
flow=(REV/"java/e/e/a/CommentFlow220.java").read_text()
assert "originalSpeed*duration/(duration-age)" not in flow
assert "public static synchronized void reset(Object rendererState)" in flow
assert "readDuration(fDuration,comment)" in flow
assert "writeDuration(fDuration,comment,extended)" in flow
assert "type==Integer.class" in flow
assert "ReflectiveOperationException|IllegalArgumentException|SecurityException" in flow
builder=(REV/"build_mpp.py").read_text()
assert "v2.0.6-dev.2" in builder and "v2.0.6-dev.4/java" in builder
assert "overlay_262 import apply" in builder
assert "onVideoCreated(Landroid/app/Activity;)V" in builder
overlay=(ROOT/"porting/revisions/v2.0.6-dev.3/overlay_262.py").read_text()
for anchor in ("SettingsTools.smali","MenuOptions119.smali",
               "MenuEditor120.smali","Dev115.smali",
               "CommentVisuals.smali","0x43480000"):
 assert anchor in overlay,anchor
fullscreen=(ROOT/"porting/revisions/v2.0.6-dev.3/java/e/e/a/FullscreenOptions262.java").read_text()
for key in ("videolist_tap","intent_type","nicoid_app_resume_playback",
            "Fullscreen playback","全画面再生","全螢幕播放",
            "isFullScreen","isLandscape","nicoid_fullscreen_handoff208",
            "MENU_ID=0x46f9","entry.getKey()==6","order.indexOf(9)",
            "setPersistent(false)","setValue(full?SPECIAL:existingNative)"):
 assert key in fullscreen,key
assert "putString(key,nativeValue)" in fullscreen
assert "putBoolean(flag,fullscreen)" in fullscreen
workflow=(ROOT/".github/workflows/private-build.yml").read_text()
assert 'builder=porting/revisions/v2.0.6-dev.4' in workflow
assert 'CommentFlow261Test.java' in workflow
assert 'v2.0.6-dev.4/tests/verify.py' in workflow
print("PASS: dev.2 natural-speed seek reset preserved")
print("PASS: 3 localized fullscreen choices, menu action and stable default order")
print("PASS: retained native preference values and video lifecycle hooks")
