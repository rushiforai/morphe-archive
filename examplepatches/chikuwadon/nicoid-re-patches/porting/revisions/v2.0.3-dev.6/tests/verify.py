"""v2.0.3-dev.6 source regression checks. Android output still needs device validation."""
from pathlib import Path
import importlib.util
import tempfile

ROOT=Path(__file__).resolve().parents[1]
REVISIONS=ROOT.parent
spec=importlib.util.spec_from_file_location("_dev208", ROOT/"patch_208.py")
module=importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)

with tempfile.TemporaryDirectory() as temporary:
    stage=Path(temporary)/"e/e/a"
    module.stage(REVISIONS/"v2.0.0-dev.1/java/e/e/a",stage)
    icons=(stage/"PlayerIcons.java").read_text()
    appbar=(stage/"AppBarPlacement202.java").read_text()
    ambient=(stage/"AmbientLight.java").read_text()
    retained=(stage/"RetainedPlayback137.java").read_text()
    assert "PlayerStart208.install(root)" in icons
    assert "PlayerStart207.install(root)" not in icons
    assert "DrawerFront208.attach(host, frame, layer)" in appbar
    assert "DrawerFront207.attach(host, frame, layer)" not in appbar
    assert "normalGlowLayer.update(decor)" in ambient
    assert "normalGlowLayer.setTag(\"nicoid-normal-ambient-underlay\")" in ambient
    assert "decor.getOverlay().add(perimeterGlow)" not in ambient
    assert "normalBlackBand(sample, 2)" in ambient
    assert "normalBlackBand(sample, 3)" in ambient
    assert "Math.min(rightSafe" in ambient
    assert "Math.min(leftSafe" in ambient
    assert "onSeekTo(long requested)" in retained
    assert 'PlaybackState.ACTION_STOP|PlaybackState.ACTION_SEEK_TO' in retained

center=(ROOT/"java/e/e/a/PlayerStart208.java").read_text()
for text in ("viewbutton", "prevbutton", "nextbutton", "onSurfaceTextureUpdated",
             "firstFrame()", "hide()", "removeOnAttachStateChangeListener"):
    assert text in center,text
assert "getDuration" not in center
assert ">3500" not in center
assert "postDelayed(this,32)" in center

drawer=(ROOT/"java/e/e/a/DrawerFront208.java").read_text()
assert "t.setVisibility(View.INVISIBLE)" in drawer
assert "t.setVisibility(initial)" in drawer
assert "isDrawerVisible" in drawer
assert "setTranslationZ" not in drawer
assert "setElevation" not in drawer

layer=(ROOT/"java/e/e/a/NormalGlowLayer208.java").read_text()
assert "source.setCallback(this)" in layer
assert "canvas.translate(-offsetX,-offsetY)" in layer
assert "setClickable(false)" in layer

full=(ROOT/"java/e/e/a/FullscreenHandoff208.java").read_text()
for text in ('flag(fragment,"B0")','flag(fragment,"C0")',
             "beforeContent(Activity a)", "afterLaunch(Object source,Intent intent)",
             "overridePendingTransition(0,0)","Configuration.ORIENTATION_LANDSCAPE"):
    assert text in full,text

builder=(ROOT/"build_mpp.py").read_text()
assert 'VERSION = "2.0.3-dev.6"' in builder
assert "from patch_208 import OVERRIDES, stage" in builder
assert builder.count("FullscreenHandoff208;") >= 6
assert builder.count("->afterLaunch(Ljava/lang/Object;Landroid/content/Intent;)V") == 3
assert 'FullscreenHandoff207;' not in builder

print("PASS: first decoded frame gate, drawer-layer occlusion, under-video ambient, full-intent propagation")
print("PASS: previous media-seek and NicoLive stages retained")
print("NOT TESTED: actual Android rendered frames, transitions, and Morphe application")
