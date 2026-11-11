#!/usr/bin/env python3
"""Guard ambient page backgrounds and longer preset fade, preserving UI layering."""
from pathlib import Path
r=Path(__file__).resolve().parents[2]
code=(r/"porting/revisions/v1.11.1-dev.14/java/e/e/a/AmbientLight.java").read_text()
dev=(r/"porting/revisions/v1.11.1-dev.14/java/e/e/a/Dev115.java").read_text()
viewport=(r/"extensions/extension/src/main/java/e/e/a/FullscreenViewport209.java").read_text()
for token in (
 "pageGlow.sides = split ? 8 : 2;",
 "pageGlow.corners = split;",
 "pageGlow.normalFade = true;",
 "pageGlow.setBounds(0, 0, matched.getWidth(), matched.getHeight());",
 "new LayerDrawable(new Drawable[]{base, pageGlow})",
 "matched.setBackground(layer);",
 "removePageGlow();",
 "normalPageView.setBackground(normalPageOriginal);",
 "detailPageAdjoinsVideo(page, decor, split)",
 "installDetailPlanes(matched)",
 'com.sauzask.nicoid.NicoidViewPager',
 "normalEdgeLimits[3] = pageGlowActive && split ? 0",
 "normalEdgeLimits[1] = tabGlowActive ? 0",
 "tabGlow.normalFade = true;",
 "perimeterGlow.normalFade = true;",
 "perimeterGlow.normalFade = false;",
 "float middleAt = normalFade ? .72f",
 "Math.round(alpha * .76f)",
 "Math.round(alpha * (normalFade ? .82f : .5f))",
 "final boolean next = !enabled(p)",
 "scheduleRefresh();",
 "glow.inner = mode == POPUP;",
):
    assert token in code,token
for forbidden in ("normalGlowView", "protectGlyphs(", "Region.Op.DIFFERENCE",
                  "getTextPath(", "new GlowSurface"):
    assert forbidden not in code,forbidden
assert 'getMethod("restoreNormalViewport",View.class)' in dev
assert "viewportSessions.remove(root)" in viewport

# Background placement translates the same video coordinates into each page.
def shift_video(video, decor_origin, page_origin):
    return tuple(v + decor_origin[i % 2] - page_origin[i % 2]
                 for i, v in enumerate(video))
assert shift_video((0,0,760,428),(0,0),(0,488))==(0,-488,760,-60)
assert shift_video((0,134,658,504),(0,0),(658,0))==(-658,134,0,504)
# The selected Vivid preset keeps most of its 108dp reach, unlike dev.7
# where the normal portrait halo was clipped to 9dp.
def normal_fade(distance,spread,alpha):
    t=distance/spread
    if t>=1: return 0
    if t<=.72: return alpha*(1-.24*t/.72)
    return alpha*.76*(1-t)/.28
assert normal_fade(70,108,162)>110
assert normal_fade(108,108,162)==0
print("PASS: Vivid normal halo depth, landscape side corners, and background stacking")

# Background layers clip the same falloff profile at their local bounds.
assert "if (sharedFade) c.clipRect(getBounds());" in code
assert "if (!inner && !sharedFade)" in code
assert "tabGlow.sharedFade = true;" in code and "pageGlow.sharedFade = true;" in code
assert "if ((glow.sides & (split ? 8 : 2)) == 0)" in code
assert "if ((glow.sides & (split ? 8 : 2)) == 0)" in code
assert 'perimeterGlow.tracePlane = null;' in code
diag=(r/"porting/revisions/v1.11.1-dev.14/java/e/e/a/AmbientGeometryTrace.java").read_text()
assert 'getGlobalVisibleRect' in diag and 'getClipChildren' in diag
assert '"e.e.a.ModernDebug", "record"' in diag
assert "getText(" not in diag and "getContentDescription(" not in diag
print("PASS shared gradient profile, direction gates and geometry diagnostics")

# Confirm the actual packaged layout has the ScrollView and the nested header
# used by the background-only continuation. The packaged binary XML string pools use UTF-8.
from zipfile import ZipFile
with ZipFile(r/"patches/src/main/resources/nicoid/resources.zip") as resources:
    fragment=resources.read("res/layout/videoinfo_fragment.xml")
    header=resources.read("res/layout/videoinfo_fragment_title.xml")
    assert b"ScrollView" in fragment
    assert b"LinearLayout" in header
assert 'findId(page, "infoscroll")' in code
assert 'findId(content, "buttonlay")' in code
assert 'installed = new LayerDrawable(new Drawable[]{original, detail});' in code
assert 'if (view != null && view.getBackground() == installed)' in code
assert 'Arrays.fill(normalEdgeLimits, 0);' in code
assert 'glow.normalFade = glow.sharedFade = mode == NORMAL;' in code
print("PASS native detail background targets, owned restoration and split underlay")

assert 'if (sharedFade) drawSharedCorners(c);' in code
assert '1f, normalAlphaStops(),' in code
assert 'normalFade ? normalAlphaStops()' in code
assert 'detail.cornerSources = reference.cornerSources;' in code
assert 'installTabGlow(decor, target, split)' in code
print("PASS matching straight-edge and corner attenuation and split tab continuation")

assert 'updateSplitSeam(target, split && pageGlowActive);' in code
assert 'Math.abs(glow.video.right - target.getWidth()) > 1' in code
assert 'glow.seamWidth = Math.min(dp(root, 24), glow.spread / 3);' in code
assert 'if (seamWidth > 0) drawSplitSeam(c);' in code
assert code.index('drawSplitSeam(c);') < code.index('drawEdge(c, edge);')
assert 'c.drawRect(left, Math.min(from, to), right, Math.max(from, to), paint);' in code
print("PASS split background feather stays under ambient and outside video")

for name in ("PlayerGestures", "PlayerGestures219"):
    guard=(r/f"porting/revisions/v1.10.1/helpers/e/e/a/{name}.smali").read_text()
    assert 'Landroid/widget/ImageButton;' in guard
assert 'class Toggle extends ImageButton implements' in code
assert 'toggleSerial' not in code
click=code[code.index('setOnClickListener(v -> {'):code.index('private void rebind()')]
assert click.index('p.edit().putBoolean(ENABLED, next).apply();') < click.index('MAIN.post(')
print("PASS ambient button uses native gesture exclusion and one shared toggle state")
