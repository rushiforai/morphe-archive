"""Static regression contracts for v2.0.3-dev.3; not an emulator test."""
from pathlib import Path
import importlib.util,tempfile

R=Path(__file__).resolve().parents[1]
P=R.parent
spec=importlib.util.spec_from_file_location("_overlay205",R/"patch_205.py")
mod=importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)
with tempfile.TemporaryDirectory() as tmp:
    out=Path(tmp)/"e/e/a"
    mod.stage(P/"v2.0.0-dev.1/java/e/e/a",out)
    menu=(out/"AppBarPlacement202.java").read_text()
    icons=(out/"PlayerIcons.java").read_text()
    live=(out/"NicoliveActivity.java").read_text()
    ui=(out/"NicoliveUi.java").read_text()
    assert 'new String[]{"e", "isDrawerVisible", "isDrawerOpen"}' in menu
    assert "normalChrome.setAlpha(0f)" in menu
    assert "image.setImageDrawable(icon)" in icons
    assert "null,mask" in icons
    assert 'name.equals("prev")||name.equals("next")' in icons
    assert "NicoliveFloatingMini205.install" in live
    assert "onUserLeaveHint" in live
    assert "service.showPopup()" in live
    assert "service.returnToFrame(miniFrame)" in live
    assert 'name.equals("pause")||name.equals("play")?2.9f' in ui

mini=(R/"java/e/e/a/NicoliveFloatingMini205.java").read_text()
full=(R/"java/e/e/a/FullscreenHandoff205.java").read_text()
seek=(R/"java/e/e/a/MediaSeek205.java").read_text()
assert "new ScaleGestureDetector" in mini
assert "edgeResize=e.getX()" in mini
assert "if(controlsShown)reopen.run();else showControls(true);" in mini
assert "GradientDrawable.OVAL" in mini
assert "activity.setVisible(false)" in full
assert "reveal(a)" in full
assert "previous>0?previous:latest" in seek
builder=(R/"build_mpp.py").read_text()
for token in ('from patch_205 import OVERRIDES, stage',
              'VERSION = "2.0.3-dev.3"', 'PlaybackReturn.smali',
              'FullscreenHandoff205;->beforeContent','FullscreenHandoff205;->prepared',
              'MediaControls.smali','MediaSeek205;','PopupFullscreen204;->prepare'):
    assert token in builder, token
print("PASS: single icon, fullscreen skip sizing, drawer menu, NicoLive controls/gestures, rotation and notification seek guards")
print("NOTE: actual media session interaction and device timing require Android 16 validation")
