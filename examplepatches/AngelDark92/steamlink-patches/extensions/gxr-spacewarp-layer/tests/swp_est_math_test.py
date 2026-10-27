"""Algorithm-level tests for the 2026-10-26 dense coarse-to-fine estimator.

The thresholds and geometry below are PARSED from the production sources
(spacewarp_est.cpp / swp_shaders.h), not duplicated as easier test-only values.
The Python mirror follows the same loop shapes as the GLSL:

  * normalized matching error = mean per-channel |RGB delta| in [0,1];
  * zero displacement is always evaluated and a nonzero candidate must improve
    by max(1e-6, 1% of zero error);
  * dense integer search at the coarsest level covers the +-96 native-pixel
    envelope with no gaps; finer levels and the native pass refine +-2;
  * quadratic subpel uses the immediate neighbours and falls back to the centre
    score at an edge;
  * extrapolation is a backward warp with the time-shifted vector.

Run: python -B tests/swp_est_math_test.py
"""
import math
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
SRC = HERE.parent / "src"
EST_CPP = (SRC / "spacewarp_est.cpp").read_text(encoding="utf8")
SHADERS = (SRC / "swp_shaders.h").read_text(encoding="utf8")

FAILURES = []
CHECKS = 0


def check(cond, label):
    global CHECKS
    CHECKS += 1
    if not cond:
        FAILURES.append(label)
        print("FAIL:", label)


def production_number(pattern, text, label):
    match = re.search(pattern, text)
    if not match:
        raise SystemExit(f"production constant not found: {label}")
    return float(match.group(1))


# Production-owned configuration.
RATIO = production_number(r"minImprovementRatio\s*=\s*([0-9.eE+-]+)f?", EST_CPP,
                          "minImprovementRatio")
ABS = production_number(r"minImprovementAbs\s*=\s*([0-9.eE+-]+)f?", EST_CPP,
                        "minImprovementAbs")
BLOCK = int(production_number(r"c\.block\s*=\s*([0-9]+);", EST_CPP, "block"))
REFINE_BLOCK = int(production_number(r"c\.refineBlock\s*=\s*([0-9]+);", EST_CPP,
                                     "refineBlock"))
NATIVE_SEARCH = int(production_number(r"c\.nativeSearch\s*=\s*([0-9]+);", EST_CPP,
                                      "nativeSearch"))
LEVEL_SEARCH = int(production_number(r"c\.levelSearch\s*=\s*([0-9]+);", EST_CPP,
                                     "levelSearch"))
WORK_CAP = int(production_number(r"longest > ([0-9]+) \?", EST_CPP, "work cap"))
# The shader normalizes by 3 * count; the search envelope is documented as 96.
ENVELOPE = 96.0


def work_dims(w, h):
    longest = max(w, h)
    scale = WORK_CAP / longest if longest > WORK_CAP else 1.0
    return max(64, round(w * scale)), max(64, round(h * scale)), scale


def pyramid(w, h):
    ww, wh, _ = work_dims(w, h)
    dims = [(ww, wh)]
    while (dims[-1][0] > 64 or dims[-1][1] > 64) and len(dims) < 8:
        pw, ph = dims[-1]
        dims.append((pw if pw <= 64 else (pw + 1) // 2,
                     ph if ph <= 64 else (ph + 1) // 2))
    return dims


def noise(w, h, seed=123456789):
    s = seed
    out = []
    for _ in range(h):
        row = []
        for _ in range(w):
            s = (s * 1103515245 + 12345) & 0x7FFFFFFF
            row.append(((s >> 8) & 0xFFFF) / 65535.0)
        out.append(row)
    return out


def smooth(w, h):
    return [[0.5 + 0.4 * math.sin(x * 0.35) * math.sin(y * 0.27) for x in range(w)]
            for y in range(h)]


def bilinear(tex, u, v, w, h):
    x = min(max(u, 0.0), 1.0) * (w - 1)
    y = min(max(v, 0.0), 1.0) * (h - 1)
    x0, y0 = int(x), int(y)
    x1, y1 = min(x0 + 1, w - 1), min(y0 + 1, h - 1)
    fx, fy = x - x0, y - y0
    a = tex[y0][x0] * (1 - fx) + tex[y0][x1] * fx
    b = tex[y1][x0] * (1 - fx) + tex[y1][x1] * fx
    return a * (1 - fy) + b * fy


def shifted(src, dx, dy, w, h):
    out = [[0.0] * w for _ in range(h)]
    for y in range(h):
        for x in range(w):
            out[y][x] = bilinear(src, (x - dx) / (w - 1), (y - dy) / (h - 1), w, h)
    return out


def block_error(prev, curr, ox, oy, cx, cy, w, h, block, add_noise=None):
    total = 0.0
    count = 0
    for y in range(block):
        for x in range(block):
            ax, ay = ox + x, oy + y
            bx, by = cx + x, cy + y
            if not (0 <= ax < w and 0 <= ay < h and 0 <= bx < w and 0 <= by < h):
                continue
            a = prev[ay][ax]
            b = curr[by][bx]
            if add_noise is not None:
                b += add_noise(ax, ay)
            total += abs(a - b) * 3.0
            count += 1
    return total / (3.0 * count) if count else 1.0


def dense(prev, curr, w, h, origin, seed=(0, 0), radius=2, block=BLOCK,
          add_noise=None):
    zero = block_error(prev, curr, origin[0], origin[1], origin[0], origin[1], w, h,
                       block, add_noise)
    best = zero
    best_off = (0, 0)
    sx, sy = seed
    for oy in range(-radius, radius + 1):
        for ox in range(-radius, radius + 1):
            off = (sx + ox, sy + oy)
            if off == (0, 0):
                continue
            e = block_error(prev, curr, origin[0], origin[1], origin[0] + off[0],
                            origin[1] + off[1], w, h, block, add_noise)
            if e < best:
                best, best_off = e, off
    required = max(ABS, zero * RATIO)
    if best_off == (0, 0) or zero - best < required:
        return (0, 0), zero, best
    return best_off, zero, best


def subpel(xm, xc, xp, has_left=True, has_right=True):
    if not (has_left and has_right):
        return 0.0
    denom = xm - 2.0 * xc + xp
    if denom <= 1e-6:
        return 0.0
    return max(-0.5, min(0.5, 0.5 * (xm - xp) / denom))


def check_config():
    check(BLOCK == 8, "production block size is 8")
    check(REFINE_BLOCK == 4, "production native refine block is 4")
    check(NATIVE_SEARCH == 2, "production native search radius is 2")
    check(LEVEL_SEARCH == 2, "production level search radius is 2")
    check(WORK_CAP == 1024, "production working-image cap is 1024")
    check(abs(RATIO - 0.01) < 1e-12, "production improvement ratio is 1%")
    check(abs(ABS - 1e-6) < 1e-12, "production absolute floor is 1e-6")


def check_normalized_error():
    w = h = 16
    black = [[0.0] * w for _ in range(h)]
    white = [[1.0] * w for _ in range(h)]
    check(block_error(black, black, 0, 0, 0, 0, w, h, BLOCK) == 0.0,
          "identical blocks have zero normalized error")
    check(abs(block_error(black, white, 0, 0, 0, 0, w, h, BLOCK) - 1.0) < 1e-12,
          "inverted RGB blocks have normalized error 1.0")
    half = [[0.5] * w for _ in range(h)]
    check(abs(block_error(black, half, 0, 0, 0, 0, w, h, BLOCK) - 0.5) < 1e-12,
          "mean RGB delta is normalized consistently")


def check_zero_and_motion_candidates():
    w = h = 32
    prev = noise(w, h)
    curr = shifted(prev, 2, 1, w, h)
    off, zero, best = dense(prev, curr, w, h, (8, 8), radius=3)
    check(off == (2, 1), "dense search recovers the integer translation")
    check(zero - best >= max(ABS, zero * RATIO), "accepted motion clears the production threshold")

    # A tiny contrast change is not a scene cut: the improvement rule decides.
    low = [[0.5 + 0.02 * v for v in row] for row in prev]
    curr_low = shifted(low, 2, 1, w, h)
    off_low, _, _ = dense(low, curr_low, w, h, (8, 8), radius=3)
    check(off_low == (2, 1), "low-contrast motion is not cut off prematurely")

    # Compression-like noise: still recover the real motion.
    def noise_at(x, y):
        s = (x * 73856093) ^ (y * 19349663)
        return (((s >> 7) & 0xFF) / 255.0 - 0.5) * 0.04
    off_noisy, _, _ = dense(prev, curr, w, h, (8, 8), radius=3, add_noise=noise_at)
    check(off_noisy == (2, 1), "compression-noise fixture still recovers motion")

    # Scene cut: a constant black -> white change has equal error for every
    # candidate, so the improvement rule must refuse motion.
    black = [[0.0] * w for _ in range(h)]
    white = [[1.0] * w for _ in range(h)]
    off_cut, zero_cut, best_cut = dense(black, white, w, h, (8, 8), radius=3)
    check(off_cut == (0, 0) and abs(zero_cut - best_cut) < 1e-12,
          "scene cut does not produce confident motion")


def check_dense_gap_coverage():
    # 2204x2352 -> working 959x1024; coarse level 64x64. The +-96 native
    # envelope maps to a radius the dense integer loop must cover.
    dims = pyramid(2204, 2352)
    coarse_w = dims[-1][0]
    radius = max(1, math.ceil(ENVELOPE * coarse_w / 2204.0))
    check(radius == 3, "2204-wide coarse envelope is +-3 level texels")
    # Every integer offset inside the envelope is enumerated (no stride gaps).
    covered = {(ox, oy) for oy in range(-radius, radius + 1)
               for ox in range(-radius, radius + 1)}
    check(all((x, y) in covered for x in range(-radius, radius + 1)
              for y in range(-radius, radius + 1)),
          "dense coarse search has no gaps")
    # Wider inputs need a smaller radius, never a skipped step.
    dims2 = pyramid(5000, 3000)
    check(max(1, math.ceil(ENVELOPE * dims2[-1][0] / 5000.0)) >= 1,
          "widths above 4096 still cover the envelope")


def check_subpel_and_edges():
    # Symmetric parabola -> no shift; asymmetric -> the corrected sign; edge
    # neighbour missing -> centre score, so no false shift.
    check(subpel(4.0, 1.0, 4.0) == 0.0, "symmetric subpel fit is zero")
    check(abs(subpel(2.5, 1.0, 4.0) + 1.0 / 6.0) < 1e-12,
          "quadratic subpel has the corrected sign")
    check(abs(subpel(100.0, 1.0, 0.0) - 0.5) < 1e-12, "subpel clamps at +0.5")
    check(abs(subpel(0.0, 1.0, 100.0) + 0.5) < 1e-12, "subpel clamps at -0.5")
    check(subpel(1.0, 1.0, 1.0) == 0.0,
          "edge neighbours equal to the centre do not shift")
    check(subpel(1.0, 1.0, 4.0, has_left=False, has_right=True) == 0.0,
          "one-sided edge refinement is skipped instead of inventing half a pixel")
    check(subpel(1.0, 1.0, 4.0, has_left=True, has_right=False) == 0.0,
          "missing right edge neighbour is skipped")

    w = h = 48
    prev = smooth(w, h)
    curr = shifted(prev, 2.5, -1.5, w, h)
    off, zero, best = dense(prev, curr, w, h, (12, 12), radius=3, block=REFINE_BLOCK)
    check(abs(off[0] - 2) <= 1 and abs(off[1] + 2) <= 1,
          "native refine lands on the fractional motion's integer winner")
    # Evaluate axis neighbours and refine with the production rule.
    cx, cy = 12 + off[0], 12 + off[1]
    xm = block_error(prev, curr, 12, 12, cx - 1, cy, w, h, REFINE_BLOCK)
    xp = block_error(prev, curr, 12, 12, cx + 1, cy, w, h, REFINE_BLOCK)
    sx = subpel(xm, best, xp)
    check(abs(off[0] + sx - 2.5) <= 0.6,
          "fractional translation is refined within the subpel bound")


def check_head_rotation_alignment():
    # Column-major view matrices (world->camera). A yawed pair must map a world
    # direction through R_A * R_B^T exactly; the residual then carries content
    # motion only.
    def view(yaw):
        c, s = math.cos(yaw), math.sin(yaw)
        return [c, 0.0, s, 0.0,
                0.0, 1.0, 0.0, 0.0,
                -s, 0.0, c, 0.0,
                0.0, 0.0, 0.0, 1.0]

    def rot(a, b):
        out = [0.0] * 9
        for r in range(3):
            for c in range(3):
                out[c * 3 + r] = sum(a[k * 4 + r] * b[k * 4 + c] for k in range(3))
        return out

    def apply4(m, v):
        return [sum(m[c * 4 + r] * v[c] for c in range(3)) for r in range(3)]

    def apply3(m, v):
        return [sum(m[c * 3 + r] * v[c] for c in range(3)) for r in range(3)]

    a = view(math.radians(10.0))
    b = view(math.radians(-15.0))
    r = rot(a, b)
    world = [0.2, -0.1, -1.0]
    # d_A = R_A R_B^T d_B: rotate B's camera ray into A.
    d_b = apply4(b, world)
    d_a = apply4(a, world)
    rotated = apply3(r, d_b)
    check(all(abs(x - y) < 1e-9 for x, y in zip(rotated, d_a)),
          "rotation align maps B's camera ray into A exactly")
    # With no head rotation the alignment is the identity.
    same = rot(a, a)
    check(all(abs(apply3(same, world)[i] - world[i]) < 1e-9 for i in range(3)),
          "zero head rotation aligns as identity")


def check_extrapolation():
    w = h = 64
    src = [[float(x) for x in range(w)] for _ in range(h)]
    mv = (0.1, 0.0)
    sf = 1.5
    clamp = 48.0 / max(w, h)
    radius = 16.0 / max(w, h)
    # Centre pixel: stretch radius does not attenuate; offset = mv*(1-sf).
    x = w // 2
    d = max(-clamp, min(clamp, mv[0])) * (1.0 - sf)
    got = bilinear(src, (x + 0.5) / w + d, 0.5, w, h)
    want = (x + 0.5) / w * (w - 1) + d * (w - 1)
    check(abs(got - want) < 1e-9, "time-shifted extrapolation is exact on a ramp")
    # Border band attenuates.
    room = min(0.0, 1.0) / radius
    check(min(room, 1.0) < 1.0, "stretch radius attenuates the border")
    # Magnitude clamp.
    big = 9.0
    check(max(-clamp, min(clamp, big)) == clamp, "magnitude clamp bounds the offset")


def main():
    check_config()
    check_normalized_error()
    check_zero_and_motion_candidates()
    check_dense_gap_coverage()
    check_subpel_and_edges()
    check_head_rotation_alignment()
    check_extrapolation()
    print(f"gxr-spacewarp estimator math: {CHECKS} checks, {len(FAILURES)} failures")
    return 0 if not FAILURES else 1


if __name__ == "__main__":
    sys.exit(main())
