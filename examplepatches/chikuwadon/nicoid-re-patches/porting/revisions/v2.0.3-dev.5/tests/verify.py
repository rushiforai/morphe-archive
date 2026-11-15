"""v2.0.3-dev.5 user-reported regression contracts (source + DEX candidates)."""
from pathlib import Path
import importlib.util,tempfile
R=Path(__file__).resolve().parents[1]
P=R.parent
spec=importlib.util.spec_from_file_location("_overlay207",R/"patch_207.py")
mod=importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)
with tempfile.TemporaryDirectory() as tmp:
 out=Path(tmp)/"e/e/a"
 mod.stage(P/"v2.0.0-dev.1/java/e/e/a",out)
 drawer=(out/"AppBarPlacement202.java").read_text()
 icons=(out/"PlayerIcons.java").read_text()
 ambient=(out/"AmbientLight.java").read_text()
 retained=(out/"RetainedPlayback137.java").read_text()
 assert "DrawerFront207.attach(host, frame, layer);" in drawer
 assert "normalContent.setTranslationY(0)" not in drawer
 assert "normalChrome.setTranslationY(0)" not in drawer
 assert "normalChrome.setAlpha(0f)" not in drawer
 assert "drawerWasOpen" not in drawer
 assert "avoidMiniOverlap" in drawer
 assert "PlayerStart207.install(root)" in icons
 assert "PlayerStart206.install(root)" not in icons
 assert "normalBlackBand(sample, 3)" in ambient
 assert "Math.min(rightSafe" in ambient
 assert "Math.min(leftSafe" in ambient
 assert 'onSeekTo(long requested)' in retained
 assert 'PlaybackState.ACTION_STOP|PlaybackState.ACTION_SEEK_TO' in retained
 assert 'getMethod("seekTo",long.class)' in retained
 assert 's.media.setCallback(new MediaSession.Callback()' in retained
 for key in ("AppBarPlacement202.java","AmbientLight.java","PlayerIcons.java","RetainedPlayback137.java"):
  assert (out/key).stat().st_size>0,key
full=(R/"java/e/e/a/FullscreenHandoff207.java").read_text()
assert "Configuration.ORIENTATION_LANDSCAPE" in full
assert 'fragment instanceof Activity?fragment' in full
start=(R/"java/e/e/a/PlayerStart207.java").read_text()
assert '"viewbutton","prevbutton","nextbutton"' in start
assert 'getDuration' in start
front=(R/"java/e/e/a/DrawerFront207.java").read_text()
assert 'c.setTranslationZ' in front
assert 'getLeft()+child.getTranslationX()' in front
assert 'normalChrome' not in front
builder=(R/"build_mpp.py").read_text()
for part in (
  "from patch_207 import OVERRIDES, stage",
  'VERSION = "2.0.3-dev.5"',
  "FullscreenHandoff207;",
  "native_queue_start",
  "manual_start",
  "fragment_file.write_text(fragment.replace(next_launch",
  "RetainedPlayback137",
):
 if part=="RetainedPlayback137": continue
 assert part in builder,part
a=builder.index("fragment_file.write_text(fragment.replace(next_launch")
assert builder.index("FullscreenHandoff207;",a)<builder.index("+ next_launch",a)
print("PASS: native drawer foreground, all loading-control glyphs, right ambient, retained media seek and fullscreen-before-launch")
print("NOTE: no Android runtime or Morphe patched APK simulated")
