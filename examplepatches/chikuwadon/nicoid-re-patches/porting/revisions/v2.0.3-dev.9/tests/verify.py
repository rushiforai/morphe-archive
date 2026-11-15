"""v2.0.3-dev.9 regression checks for queued playback and normal-mode layered UI."""
from pathlib import Path
import importlib.util
import tempfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("_dev211",ROOT/"patch_211.py")
module=importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)

with tempfile.TemporaryDirectory() as work:
    staged=Path(work)/"e/e/a"
    module.stage(ROOT.parent/"v2.0.0-dev.1/java/e/e/a",staged)
    ambient=(staged/"AmbientLight.java").read_text()
    icons=(staged/"PlayerIcons.java").read_text()
    appbar=(staged/"AppBarPlacement202.java").read_text()
    retained=(staged/"RetainedPlayback137.java").read_text()
    for anchor in (
        "tabGlow.sides = split ? 8 : (2 | 4 | 8);",
        "pageGlow.sides = split ? 8 : (2 | 4 | 8);",
        "pageGlow.corners = true;",
        "pageGlow.video.set(visiblePicture);",
        "pageGlow.video.offset(parentScreen[0]-pageScreen[0]",
        "installDetailPlanes(normalPageView);",
        "normalGlowLayer.update(parent)",
        "normalBlackBand(sample, 2)",
        "normalBlackBand(sample, 3)"
    ): assert anchor in ambient,anchor
    assert "PlayerStart211.install(root)" in icons
    assert "DrawerFront211.attach(host, frame, layer);" in appbar
    assert "onSeekTo(long requested)" in retained

start=(ROOT/"java/e/e/a/PlayerStart211.java").read_text()
for anchor in ("FullscreenHandoff211.firstFrame(r)","scheduleQueueSpacing();",
               "button.setTranslationX(button.getTranslationX()+wanted-current)",
               "onSurfaceTextureUpdated(SurfaceTexture t)","prevbutton","nextbutton"):
    assert anchor in start,anchor
assert "getDuration" not in start
drawer=(ROOT/"java/e/e/a/DrawerFront211.java").read_text()
for anchor in ("nicoid-retained-mini-player","PlaybackPanels113 reserves 64dp",
               "miniBodyPadding","miniPaddingLifted","miniBody.setPadding",
               "body.setPadding(body.getPaddingLeft()","body.bringToFront()",
               "windowTabLayer.bringToFront()"):
    assert anchor in drawer,anchor
assert "t.setVisibility(View.INVISIBLE)" not in drawer
full=(ROOT/"java/e/e/a/FullscreenHandoff211.java").read_text()
for anchor in ("SCREEN_ORIENTATION_LOCKED","fullscreen-next outgoing display orientation locked",
               "onActivityResumed(Activity a){restoreOutgoing(a",
               "applyNativeRotation(Activity activity,int requested)",
               "gate.decoded&&landscape&&picture"):
    assert anchor in full,anchor
assert "restoreAllOutgoing()" not in full
builder=(ROOT/"build_mpp.py").read_text()
assert 'VERSION = "2.0.3-dev.9"' in builder
assert "from patch_211 import OVERRIDES, stage" in builder
assert builder.count("FullscreenHandoff211;") >= 7
assert builder.count("->afterLaunch(Ljava/lang/Object;Landroid/content/Intent;)V") == 3
print("PASS: 4:3 full-width glow, native mini drawer overlay, queued controls, landscape handoff")
print("PASS: media seek, comment and startup control behavior preserved at source level")
print("NOT TESTED: Android runtime rotation/compositor/gestures or Morphe application")
