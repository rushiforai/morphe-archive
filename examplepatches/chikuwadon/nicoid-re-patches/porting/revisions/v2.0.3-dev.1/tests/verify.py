"""Source contracts for the v2.0.3-dev.1 playback and UI regressions."""
from pathlib import Path
import importlib.util, tempfile

REV=Path(__file__).resolve().parents[1]
REVISIONS=REV.parent
ROOT=REVISIONS.parent.parent
spec=importlib.util.spec_from_file_location("patch_203",REV/"patch_203.py")
overlay=importlib.util.module_from_spec(spec)
spec.loader.exec_module(overlay)

with tempfile.TemporaryDirectory() as tmp:
    staged=Path(tmp)/"e/e/a"
    overlay.stage(REVISIONS/"v2.0.0-dev.1/java/e/e/a",staged)
    app=(staged/"AppBarPlacement202.java").read_text()
    ambient=(staged/"AmbientLight.java").read_text()
    live=(staged/"NicoliveActivity.java").read_text()
    player=(staged/"NicolivePlayerFrame.java").read_text()
    assert "drawerOpen(Activity host)" in app
    assert 'getMethod("isDrawerVisible", int.class)' in app
    assert "View.INVISIBLE : View.VISIBLE" in app
    assert 'findViewWithTag("nicoid-retained-mini-player")' in app
    assert 'int overlap = 0' in app
    assert 'mini.getLocationOnScreen(position)' in app
    assert "content.left = darkMargin(sample" not in ambient
    assert "Use the measured visible Surface/Texture bounds" in ambient
    assert "miniFrame.compact(true)" in live
    assert "live.returnToFrame(miniFrame)" in live
    assert "live.popup==null" in live
    assert "live.pause()" in live and "live.resume()" in live
    assert "if(compact){bottom.setVisibility(GONE);return;}" in player

menu=(REV/"java/e/e/a/MenuVisible203.java").read_text()
assert 'video_menu_visible_7' in menu and 'video_menu_visible_9' in menu
assert 'keyForAction(ListActions.Action action)' in menu
assert '"video_menu_visible_9"' in menu and '"video_menu_visible_7"' in menu
assert 'migrate(' not in menu
native=(REVISIONS/"v1.10.1/method-delta/e/e/a/b0$a.smali").read_text()
assert "const/16 v5, 0x9" in native and "const/4 v6, 0x7" in native
builder=(REV/"build_mpp.py").read_text()
for token in ('from patch_203 import OVERRIDES, stage','VERSION = "2.0.3-dev.1"',
              'MenuOptions119.smali','ManualQueue119.smali','PlaybackSession.smali','nicoid/method-delta.dex',
              'FullscreenContinuity203;','PlaybackContinuation203;'):
    assert token in builder,token
print("PASS: semantic menu key mapping, bottom mini docking, drawer priority, ambient fullscreen, live mini, legacy video continuity")
print("NOTE: Android runtime playback, white-bar visual regression and Morphe application require device checks")
