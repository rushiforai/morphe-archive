"""v2.0.3-dev.10: make both 4:3 player gutters visually continuous.

No changes to player controls, mini-drawer layering or Activity transitions.
"""
from pathlib import Path
import importlib.util

ROOT = Path(__file__).resolve().parent
PREV = ROOT.parent / "v2.0.3-dev.9" / "patch_211.py"
spec = importlib.util.spec_from_file_location("_nicoid_dev9_patch", PREV)
previous = importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES = frozenset(previous.OVERRIDES)


def once(source, before, after, label):
    n = source.count(before)
    if n != 1:
        raise AssertionError(f"{label}: expected one anchor, found {n}")
    return source.replace(before, after)


def extend_normal_right_fade(source):
    # This flag is set only on the outer, ordinary 4:3 video gutter plane.
    source = once(source,
        "int seamWidth, seamColor;\n        boolean inner, corners, normalFade, sharedFade;",
        "int seamWidth, seamColor;\n"
        "        boolean inner, corners, normalFade, sharedFade, balanceRightGutter;",
        "bounded right-edge profile")
    source = once(source,
        """            Shader fade = new LinearGradient(0, 0, 0, depth,
                    alphaStops(alpha, normalFade ? 100 : softness), FADE_STOPS, Shader.TileMode.CLAMP);""",
        """            int[] fadeStops = alphaStops(alpha, normalFade ? 100 : softness);
            if (edge == 3 && balanceRightGutter && !inner) {
                // Sample palette varies with the video: a bright/pale right
                // edge can still look like an abruptly black outer band when
                // using the regular 90%-to-zero fade. Preserve the picture
                // colors and extend only the right-gutter alpha profile.
                // The outer boundary is the device edge, not another UI pane.
                final float[] reach = {1f, .96f, .85f, .68f, .48f, .26f};
                fadeStops = fadeStops.clone();
                for (int i = 0; i < reach.length; i++) {
                    int extended = Math.min(255, Math.round(alpha * reach[i]));
                    fadeStops[i] = Math.max(fadeStops[i] >>> 24, extended) << 24;
                }
            }
            Shader fade = new LinearGradient(0, 0, 0, depth,
                    fadeStops, FADE_STOPS, Shader.TileMode.CLAMP);""",
        "4:3 right gutter alpha decay")
    source = once(source,
        """                    normalEdgeLimits[3]=Math.min(sideReach,Math.max(0,parentWidth-visiblePicture.right));""",
        """                    normalEdgeLimits[3]=Math.min(sideReach,Math.max(0,parentWidth-visiblePicture.right));
                    // Both edges have actual black gutters. The rightmost
                    // gradient can continue all the way to the screen edge
                    // instead of falling into a visibly black outer stripe.
                    perimeterGlow.balanceRightGutter = !split
                            && normalEdgeLimits[2] > 0 && normalEdgeLimits[3] > 0
                            && visiblePicture.right + normalEdgeLimits[3] >= parentWidth - 1;
                    if (perimeterGlow.balanceRightGutter)
                        AmbientGeometryTrace.record("normal 4:3 right-edge full reach="
                                + normalEdgeLimits[3] + "px");""",
        "4:3 right-gutter conditional enable")
    return source


def stage(base, destination):
    base, destination = Path(base), Path(destination)
    previous.stage(base, destination)
    path = destination / "AmbientLight.java"
    path.write_text(extend_normal_right_fade(path.read_text(encoding="utf-8")),
                    encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
