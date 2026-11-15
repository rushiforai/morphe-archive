"""v2.0.3-dev.8 source regression checks, Android device rendering still separate."""
from pathlib import Path
import importlib.util
import tempfile
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("_dev8",ROOT/"patch_210.py")
patch=importlib.util.module_from_spec(spec);spec.loader.exec_module(patch)
with tempfile.TemporaryDirectory() as folder:
    dest=Path(folder)/"e/e/a"
    patch.stage(ROOT.parent/"v2.0.0-dev.1/java/e/e/a",dest)
    ambient=(dest/"AmbientLight.java").read_text(encoding="utf-8")
    appbar=(dest/"AppBarPlacement202.java").read_text(encoding="utf-8")
    icons=(dest/"PlayerIcons.java").read_text(encoding="utf-8")
    retained=(dest/"RetainedPlayback137.java").read_text(encoding="utf-8")
    assert "tabGlow.sides = split ? 8 : (2 | 4);" in ambient
    assert "tabGlow.corners = true;" in ambient
    assert "tabGlow.video.set(visiblePicture)" in ambient
    assert "tabGlow.video.offset(parentScreen[0]-tabScreen[0]" in ambient
    assert "normalGlowLayer.update(parent)" in ambient
    assert "normalEdgeLimits[3]=Math.min(sideReach" in ambient
    assert "normalBlackBand(sample, 2)" in ambient
    assert "normalBlackBand(sample, 3)" in ambient
    assert "DrawerFront210.attach(host, frame, layer)" in appbar
    assert "PlayerStart210.install(root)" in icons
    assert "onSeekTo(long requested)" in retained
start=(ROOT/"java/e/e/a/PlayerStart210.java").read_text()
assert "FullscreenHandoff210.firstFrame(r)" in start
assert "onSurfaceTextureUpdated" in start
assert "getDuration" not in start
drawer=(ROOT/"java/e/e/a/DrawerFront210.java").read_text()
for anchor in ("nicoid-retained-mini-player","restoreMini()","raiseMini(root,c)",
               "android.R.id.content","currentPanel.bringToFront()","body.bringToFront()"):
    # The mini is restored via the saved miniPanel, not the discovery local.
    if anchor=="currentPanel.bringToFront()":continue
    assert anchor in drawer,anchor
assert "miniPanel.bringToFront()" in drawer
assert "t.setVisibility(View.INVISIBLE)" not in drawer
full=(ROOT/"java/e/e/a/FullscreenHandoff210.java").read_text()
assert "applyNativeRotation(Activity activity,int requested)" in full
assert "nicoid_continue_mini203" in full
assert "gate.decoded&&landscape&&picture" in full
assert "decoded-landscape-frame" in full
builder=(ROOT/"build_mpp.py").read_text()
assert 'VERSION = "2.0.3-dev.8"' in builder
assert "from patch_210 import OVERRIDES, stage" in builder
assert "FullscreenHandoff210;" in builder and "->applyNativeRotation(Landroid/app/Activity;I)V" in builder
assert builder.count("FullscreenHandoff210;")>=7
assert builder.count("->afterLaunch(Ljava/lang/Object;Landroid/content/Intent;)V")==3
print("PASS: bottom-left 4:3 glow, retained mini occlusion, fullscreen orientation preserved")
print("PASS: first-frame controls, MediaSession seek and NicoLive prior overlays retained")
print("NOT VERIFIED: real screen motion, Android runtime and Morphe application")
