"""Source regression checks for v2.0.3-dev.2 (Android 16 test candidate)."""
from pathlib import Path
import importlib.util
import tempfile

ROOT=Path(__file__).resolve().parents[1]
REVISIONS=ROOT.parent
spec=importlib.util.spec_from_file_location("nicoid_patch204",ROOT/"patch_204.py")
mod=importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)

with tempfile.TemporaryDirectory() as tmp:
    dest=Path(tmp)/"e/e/a"
    mod.stage(REVISIONS/"v2.0.0-dev.1/java/e/e/a",dest)
    app=(dest/"AppBarPlacement202.java").read_text()
    live=(dest/"NicoliveActivity.java").read_text()
    frame=(dest/"NicolivePlayerFrame.java").read_text()
    icons=(dest/"PlayerIcons.java").read_text()
    assert "drawerWasOpen" in app
    assert "normalChrome.setAlpha(0f)" in app
    assert "normalContent.setTranslationY(0)" in app
    assert "normalContent.setTranslationZ(0f)" in app
    assert "NicoliveFloatingMini204.install" in live
    assert "miniWindow.sync(live)" in live
    assert "miniTouchSequence" in live
    assert "live.returnToFrame(miniFrame)" in live
    assert "comments.setVisibility(VISIBLE)" in frame
    assert "QueueVisibility204.attach(root)" in icons
    assert icons.count("paint.setStrokeWidth(.42f)")>=3
    assert icons.count("c.drawPath(skip,paint)") == 2

java=ROOT/"java/e/e/a"
cont=(java/"PlaybackContinuation204.java").read_text()
full=(java/"PopupFullscreen204.java").read_text()
queue=(java/"QueueVisibility204.java").read_text()
mini=(java/"NicoliveFloatingMini204.java").read_text()
assert "beforeContent(Activity activity)" in cont
assert "activity.setVisible(false)" in cont
assert "MiniSession225.beginMinimized(owner,destination)" in cont
assert "if(!selected)return" in full
assert 'setOnTouchListener' in full
assert "onSharedPreferenceChanged(SharedPreferences p,String key)" in queue
assert "setVisibility(enabled?View.VISIBLE:View.GONE)" in queue
assert "picture.comments.setVisibility" in mini
assert "setTranslationX" in mini and "setTranslationY" in mini

builder=(ROOT/"build_mpp.py").read_text()
for token in ("from patch_204 import OVERRIDES, stage",
              'VERSION = "2.0.3-dev.2"', "PlaybackContinuation204;->beforeContent",
              "PopupFullscreen204;->prepare", "PopupFullscreen204;",
              "PopupLayout236.smali","nicoid/method-delta.dex"):
    assert token in builder,token
print("PASS: early hidden next video, popup fullscreen-only routing and tear-down guards")
print("PASS: drawer occlusion, immediate queue controls, thin icon outlines and movable live comments")
print("NOTE: visual behavior must still be confirmed with the original APK on a device")
