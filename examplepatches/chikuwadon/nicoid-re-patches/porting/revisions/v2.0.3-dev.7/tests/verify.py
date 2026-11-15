"""v2.0.3-dev.7 staged regression checks, no APK required."""
from pathlib import Path
import importlib.util
import tempfile

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("dev7_patch",ROOT/"patch_209.py")
patch=importlib.util.module_from_spec(spec)
spec.loader.exec_module(patch)

with tempfile.TemporaryDirectory() as folder:
    dest=Path(folder)/"e/e/a"
    patch.stage(ROOT.parent/"v2.0.0-dev.1/java/e/e/a",dest)
    ambient=(dest/"AmbientLight.java").read_text()
    appbar=(dest/"AppBarPlacement202.java").read_text()
    icons=(dest/"PlayerIcons.java").read_text()
    retained=(dest/"RetainedPlayback137.java").read_text()
    assert "normalGlowLayer.update(parent)" in ambient
    assert "visiblePicture.intersect(0,0,parentWidth,parentHeight)" in ambient
    assert "normalEdgeLimits[3]=Math.min(sideReach" in ambient
    assert "normalEdgeLimits[2]=Math.min(sideReach" in ambient
    assert "normalBlackBand(sample, 2)" in ambient
    assert "normalBlackBand(sample, 3)" in ambient
    assert "DrawerFront209.attach(host, frame, layer);" in appbar
    assert "PlayerStart209.install(root)" in icons
    assert "onSeekTo(long requested)" in retained

start=(ROOT/"java/e/e/a/PlayerStart209.java").read_text()
assert "FullscreenHandoff209.firstFrame(r)" in start
assert "onSurfaceTextureUpdated" in start
assert "getDuration" not in start

full=(ROOT/"java/e/e/a/FullscreenHandoff209.java").read_text()
assert "gate.decoded&&landscape&&picture" in full
assert "decoded-landscape-frame" in full
assert "fullscreen-next decoded-frame received" in full

drawer=(ROOT/"java/e/e/a/DrawerFront209.java").read_text()
assert "foreground.bringToFront()" in drawer
assert "foreground.setElevation(highest+1f)" in drawer
assert "windowTabLayer.bringToFront()" in drawer
assert "t.setVisibility(View.INVISIBLE)" not in drawer

builder=(ROOT/"build_mpp.py").read_text()
assert 'VERSION = "2.0.3-dev.7"' in builder
assert "from patch_209 import OVERRIDES, stage" in builder
assert builder.count("FullscreenHandoff209;")>=6
assert builder.count("->afterLaunch(Ljava/lang/Object;Landroid/content/Intent;)V")==3

print("PASS: staged 4:3 local glow, native drawer z-order, fullscreen first-frame gate")
print("PASS: retained 3-button startup and MediaSession seek behavior")
print("NOT TESTED: Android device rendering or Morphe application")
