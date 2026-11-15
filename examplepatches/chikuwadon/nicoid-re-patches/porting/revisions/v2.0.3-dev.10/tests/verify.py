"""v2.0.3-dev.10: right 4:3 normal gutter fade regression, no Android device."""
from pathlib import Path
import importlib.util
import tempfile
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location("dev10", ROOT / "patch_212.py")
patch=importlib.util.module_from_spec(spec)
spec.loader.exec_module(patch)
with tempfile.TemporaryDirectory() as temporary:
    out=Path(temporary)/"e/e/a"
    out.mkdir(parents=True,exist_ok=True)
    patch.stage(ROOT.parent/"v2.0.0-dev.1/java/e/e/a",out)
    ambient=(out/"AmbientLight.java").read_text()
    icons=(out/"PlayerIcons.java").read_text()
    appbar=(out/"AppBarPlacement202.java").read_text()
    retained=(out/"RetainedPlayback137.java").read_text()
    for needle in (
        "boolean inner, corners, normalFade, sharedFade, balanceRightGutter;",
        "if (edge == 3 && balanceRightGutter && !inner)",
        "final float[] reach = {1f, .96f, .85f, .68f, .48f, .26f};",
        "fadeStops = fadeStops.clone();",
        "perimeterGlow.balanceRightGutter = !split",
        "normalEdgeLimits[2] > 0 && normalEdgeLimits[3] > 0",
        "normal 4:3 right-edge full reach=",
        "normalEdgeLimits[3]=Math.min(sideReach",
        "pageGlow.video.set(visiblePicture);",
        "tabGlow.video.set(visiblePicture);",
        "normalGlowLayer.update(parent)",
    ):
        assert needle in ambient,needle
    assert "PlayerStart211.install(root)" in icons
    assert "DrawerFront211.attach(host, frame, layer)" in appbar
    assert "onSeekTo(long requested)" in retained

java=ROOT.parent/"v2.0.3-dev.9/java/e/e/a"
for name,needles in {
    "FullscreenHandoff211.java": ("onActivityResumed(Activity a){restoreOutgoing(a", "decoded-landscape-frame"),
    "PlayerStart211.java": ("scheduleQueueSpacing();", "FullscreenHandoff211.firstFrame(r)"),
    "DrawerFront211.java": ("miniPaddingLifted", "restoreMini()")
}.items():
    s=(java/name).read_text()
    for needle in needles:assert needle in s,(name,needle)

builder=(ROOT/"build_mpp.py").read_text()
assert 'VERSION = "2.0.3-dev.10"' in builder
assert "from patch_212 import OVERRIDES, stage" in builder
assert 'ROOT.parent / "v2.0.3-dev.9/java"' in builder
candidate=(ROOT/"verify_ci_candidate.py").read_text()
assert "2.0.3-dev.10" in candidate
print("PASS: normal 4:3 right reach is gated by symmetric 4:3 black gutters")
print("PASS: normal left/bottom page, queued controls, drawer and fullscreen handoff retained")
print("NOT VERIFIED: OEM compositor motion, actual Android screen and Morphe application")
