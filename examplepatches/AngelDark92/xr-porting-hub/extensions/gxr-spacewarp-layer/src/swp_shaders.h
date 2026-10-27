// swp_shaders.h — embedded GLSL ES 3.2 shaders for the spacewarp estimator.
//
// 2026-10-26 dense coarse-to-fine revision. The PORTABLE plain-GLSL block
// matcher is the baseline; the QCOM hardware path uses the same geometry and
// is enabled only after capability, compilation and normalized-result parity
// checks (swp_est_worker.cpp). Every shader normalizes matching error to the
// mean per-channel RGB error in [0,1].
//
// Composition table (mirrored by swp_est_worker.cpp and the syntax test):
//   swp_vert_quad                                      self-contained
//   swp_downsample_frag                                self-contained
//   swp_dense_frag       = ver + DIRECT_PREFIX   + DENSE_CORE
//   swp_dense_fallback   = ver + FALLBACK_PREFIX + DENSE_CORE
//   swp_median_frag                                    self-contained
//   swp_refine_frag      = ver + DIRECT_PREFIX   + REFINE_CORE
//   swp_refine_fallback  = ver + FALLBACK_PREFIX + REFINE_CORE
//   swp_extrap_frag                                    self-contained
//   swp_align_frag                                     self-contained
//
// Units: the dense/refine maps carry NATIVE input-texel offsets in .rg (not
// level pixels), so every pyramid level seeds the next without a unit change.
// The final refine pass converts to uv (texel / nativeSize) and applies
// quadratic subpel. .ba stays 0.

#pragma once

#define SWP_GLSL_VERSION R"GLSL(#version 320 es
)GLSL"

#define SWP_GLSL_QUAD_VERT R"GLSL(precision highp float;
layout(location = 0) out vec2 vUv;
void main() {
    vec2 p = vec2(float((gl_VertexID << 1) & 2), float(gl_VertexID & 2));
    vUv = p;
    gl_Position = vec4(p * 2.0 - 1.0, 0.0, 1.0);
}
)GLSL"

// Direct path: QCOM hardware block-match SAD (GL_QCOM_block_match), normalized
// exactly like the portable path below.
#define SWP_GLSL_DIRECT_PREFIX R"GLSL(#extension GL_QCOM_block_match : require
#define SWP_SAD(tA, cA, tB, cB, bs) blockMatchSADQCOM(tA, cA, tB, cB, bs).x
)GLSL"

// Portable baseline: per-texel summed |RGB delta|. The helper leaves
// normalization to the pass so both paths share one contract.
#define SWP_GLSL_FALLBACK_PREFIX R"GLSL(precision highp int;
precision highp float;
float swpSadFallback(highp sampler2D texA, ivec2 cA, highp sampler2D texB, ivec2 cB, int blockSize) {
    float sad = 0.0;
    for (int y = 0; y < blockSize; ++y) {
        for (int x = 0; x < blockSize; ++x) {
            ivec2 t = ivec2(x, y);
            vec3 a = texelFetch(texA, cA + t, 0).rgb;
            vec3 b = texelFetch(texB, cB + t, 0).rgb;
            sad += abs(a.r - b.r) + abs(a.g - b.g) + abs(a.b - b.b);
        }
    }
    return sad;
}
#define SWP_SAD(tA, cA, tB, cB, bs) swpSadFallback(tA, cA, tB, cB, bs)
)GLSL"

// Generic downsample (box) from the source level/slot texture into the working
// pyramid. 16 taps keep the first 4x reduction from aliasing.
#define SWP_GLSL_DOWNSAMPLE_FRAG R"GLSL(#version 320 es
precision highp int;
precision highp float;
uniform highp sampler2D uSrc;
uniform ivec2 uSrcSize;
uniform ivec2 uDstSize;
layout(location = 0) in vec2 vUv;
layout(location = 0) out vec4 oColor;
void main() {
    ivec2 d = clamp(ivec2(clamp(vUv, 0.0, 1.0) * vec2(uDstSize)), ivec2(0), uDstSize - ivec2(1));
    vec2 scale = vec2(uSrcSize) / vec2(uDstSize);
    vec2 base = (vec2(d) + vec2(0.5)) * scale;
    vec3 sum = vec3(0.0);
    float aSum = 0.0;
    float count = 0.0;
    for (int y = 0; y < 4; ++y) {
        for (int x = 0; x < 4; ++x) {
            vec2 p = base + (vec2(float(x), float(y)) - vec2(1.5)) * scale * 0.25;
            ivec2 t = clamp(ivec2(floor(p)), ivec2(0), uSrcSize - ivec2(1));
            vec4 c = texelFetch(uSrc, t, 0);
            sum += c.rgb;
            aSum += c.a;
            count += 1.0;
        }
    }
    oColor = vec4(sum / count, aSum / count);
}
)GLSL"

// Dense coarse-to-fine search. At the coarsest level uHasSeed=0 and the whole
// +-96-native-pixel envelope is covered by integer steps (no search gaps). At
// finer levels the previous level's native-offset map seeds a +-uSearchRadius
// dense window. Zero displacement is always evaluated; a nonzero candidate is
// accepted only when it improves on zero by the production threshold.
#define SWP_GLSL_DENSE_CORE R"GLSL(precision highp int;
precision highp float;

uniform highp sampler2D uPrev;
uniform highp sampler2D uCurr;
uniform highp sampler2D uSeedTex;
uniform ivec2 uSeedSize;
uniform ivec2 uInputSize;       // this level's texels
uniform ivec2 uMvSize;          // this call's map texels
uniform int uBlock;
uniform ivec2 uSearchRadius;    // level texels around the seed (dense), per axis
uniform int uHasSeed;
uniform vec2 uSeedScale;        // level texels per native texel (x,y)
uniform vec2 uLevelToNative;    // native texels per level texel (x,y)
uniform float uMinImprovementRatio;
uniform float uMinImprovementAbs;

layout(location = 0) in vec2 vUv;
layout(location = 0) out vec4 oMv;

float blockError(ivec2 origin, ivec2 cand, int block) {
    float sum = 0.0;
    int count = 0;
    for (int y = 0; y < 8; ++y) {
        for (int x = 0; x < 8; ++x) {
            if (x >= block || y >= block) continue;
            ivec2 a = origin + ivec2(x, y);
            ivec2 b = cand + ivec2(x, y);
            if (any(lessThan(a, ivec2(0))) || any(greaterThanEqual(a, uInputSize)) ||
                any(lessThan(b, ivec2(0))) || any(greaterThanEqual(b, uInputSize))) {
                continue;
            }
            vec3 d = abs(texelFetch(uPrev, a, 0).rgb - texelFetch(uCurr, b, 0).rgb);
            sum += d.r + d.g + d.b;
            count += 1;
        }
    }
    return count > 0 ? sum / (3.0 * float(count)) : 1.0;
}

void main() {
    ivec2 tC = clamp(ivec2(clamp(vUv, 0.0, 1.0) * vec2(uMvSize)), ivec2(0), uMvSize - ivec2(1));
    ivec2 origin = clamp((tC * uInputSize) / uMvSize, ivec2(0), uInputSize - ivec2(1));
    float zeroError = blockError(origin, origin, uBlock);
    float bestError = zeroError;
    ivec2 bestLevelOffset = ivec2(0);
    ivec2 seedLevel = ivec2(0);
    if (uHasSeed != 0) {
        ivec2 st = clamp((tC * uSeedSize) / uMvSize, ivec2(0), uSeedSize - ivec2(1));
        vec2 seedNative = texelFetch(uSeedTex, st, 0).rg;
        seedLevel = ivec2(round(seedNative * uSeedScale));
        bestLevelOffset = seedLevel;
        bestError = blockError(origin, origin + seedLevel, uBlock);
    }
    for (int oy = -uSearchRadius.y; oy <= uSearchRadius.y; ++oy) {
        for (int ox = -uSearchRadius.x; ox <= uSearchRadius.x; ++ox) {
            ivec2 off = seedLevel + ivec2(ox, oy);
            if (off.x == seedLevel.x && off.y == seedLevel.y && uHasSeed != 0) continue;
            if (off.x == 0 && off.y == 0) continue;  // zero already measured
            float e = blockError(origin, origin + off, uBlock);
            if (e < bestError) { bestError = e; bestLevelOffset = off; }
        }
    }
    bool nonzero = bestLevelOffset.x != 0 || bestLevelOffset.y != 0;
    float improvement = zeroError - bestError;
    float required = max(uMinImprovementAbs, zeroError * uMinImprovementRatio);
    if (!nonzero || improvement < required) {
        oMv = vec4(0.0);
        return;
    }
    vec2 nativeOffset = vec2(bestLevelOffset) * uLevelToNative;
    oMv = vec4(nativeOffset, bestError, 0.0);
}
)GLSL"

// 9-element sorting-network median over the native-offset field.
#define SWP_GLSL_MEDIAN_FRAG R"GLSL(#version 320 es
precision highp int;
precision highp float;
uniform highp sampler2D uL1Raw;
uniform ivec2 uMvSize;
uniform ivec2 uMedianStride;
layout(location = 0) in vec2 vUv;
layout(location = 0) out vec4 oMed;
void main() {
    vec2 v[9];
    ivec2 t = clamp(ivec2(clamp(vUv, 0.0, 1.0) * vec2(uMvSize)), ivec2(0), uMvSize - ivec2(1));
    int i = 0;
    for (int dy = -1; dy <= 1; ++dy) {
        for (int dx = -1; dx <= 1; ++dx) {
            ivec2 c = clamp(t + ivec2(dx, dy) * uMedianStride, ivec2(0), uMvSize - ivec2(1));
            v[i++] = texelFetch(uL1Raw, c, 0).rg;
        }
    }
    vec2 tmp;
    #define SWP_CX(a, b) tmp = a; a = min(a, b); b = max(tmp, b);
    SWP_CX(v[0], v[1]); SWP_CX(v[3], v[4]); SWP_CX(v[6], v[7]);
    SWP_CX(v[1], v[2]); SWP_CX(v[4], v[5]); SWP_CX(v[7], v[8]);
    SWP_CX(v[0], v[1]); SWP_CX(v[3], v[4]); SWP_CX(v[6], v[7]); SWP_CX(v[2], v[5]);
    SWP_CX(v[0], v[3]); SWP_CX(v[1], v[4]); SWP_CX(v[5], v[8]);
    SWP_CX(v[3], v[6]); SWP_CX(v[4], v[7]); SWP_CX(v[2], v[5]);
    SWP_CX(v[0], v[3]); SWP_CX(v[1], v[4]); SWP_CX(v[5], v[7]); SWP_CX(v[2], v[6]);
    SWP_CX(v[1], v[3]); SWP_CX(v[4], v[6]);
    SWP_CX(v[2], v[4]); SWP_CX(v[5], v[6]);
    SWP_CX(v[2], v[3]);
    #undef SWP_CX
    oMed = vec4(v[4], 0.0, 0.0);
}
)GLSL"

// Native-coordinate refinement: dense +-uSearchRadius (2 native texels), the
// same normalized error rule, corrected quadratic subpel with edge-neighbour
// fallback, then the caller-contract uv write.
#define SWP_GLSL_REFINE_CORE R"GLSL(precision highp int;
precision highp float;

uniform highp sampler2D uPrev;
uniform highp sampler2D uCurr;
uniform highp sampler2D uSeedTex;
uniform ivec2 uSeedSize;
uniform ivec2 uInputSize;       // native rect texels
uniform ivec2 uMvSize;
uniform int uSearchRadius;
uniform int uBlock;
uniform float uMinImprovementRatio;
uniform float uMinImprovementAbs;

layout(location = 0) in vec2 vUv;
layout(location = 0) out vec4 oMv;

float blockError(ivec2 origin, ivec2 cand) {
    float sum = 0.0;
    int count = 0;
    for (int y = 0; y < 4; ++y) {
        for (int x = 0; x < 4; ++x) {
            if (x >= uBlock || y >= uBlock) continue;
            ivec2 a = origin + ivec2(x, y);
            ivec2 b = cand + ivec2(x, y);
            if (any(lessThan(a, ivec2(0))) || any(greaterThanEqual(a, uInputSize)) ||
                any(lessThan(b, ivec2(0))) || any(greaterThanEqual(b, uInputSize))) {
                continue;
            }
            vec3 d = abs(texelFetch(uPrev, a, 0).rgb - texelFetch(uCurr, b, 0).rgb);
            sum += d.r + d.g + d.b;
            count += 1;
        }
    }
    return count > 0 ? sum / (3.0 * float(count)) : 1.0;
}

void main() {
    ivec2 tC = clamp(ivec2(clamp(vUv, 0.0, 1.0) * vec2(uMvSize)), ivec2(0), uMvSize - ivec2(1));
    ivec2 origin = clamp((tC * uInputSize) / uMvSize, ivec2(0), uInputSize - ivec2(1));
    ivec2 seed = ivec2(round(texelFetch(uSeedTex, clamp((tC * uSeedSize) / uMvSize,
                                                          ivec2(0), uSeedSize - ivec2(1)), 0).rg));
    float zeroError = blockError(origin, origin);
    float bestError = zeroError;
    ivec2 best = ivec2(0);
    float seedError = blockError(origin, origin + seed);
    if (seedError < bestError) { bestError = seedError; best = seed; }
    for (int oy = -uSearchRadius; oy <= uSearchRadius; ++oy) {
        for (int ox = -uSearchRadius; ox <= uSearchRadius; ++ox) {
            ivec2 off = seed + ivec2(ox, oy);
            if (off.x == 0 && off.y == 0) continue;
            if (off.x == seed.x && off.y == seed.y) continue;
            float e = blockError(origin, origin + off);
            if (e < bestError) { bestError = e; best = off; }
        }
    }
    bool nonzero = best.x != 0 || best.y != 0;
    float required = max(uMinImprovementAbs, zeroError * uMinImprovementRatio);
    if (!nonzero || zeroError - bestError < required) {
        oMv = vec4(0.0);
        return;
    }

    // Corrected quadratic subpel: only fit an axis when BOTH immediate
    // neighbours are genuine. A missing edge neighbour must not invent a
    // half-pixel shift from centre/opposite scores alone.
    float c = bestError;
    float xm = c, xp = c, ym = c, yp = c;
    ivec2 base = origin + best;
    bool hasXm = base.x - 1 >= 0;
    bool hasXp = base.x + 1 < uInputSize.x;
    bool hasYm = base.y - 1 >= 0;
    bool hasYp = base.y + 1 < uInputSize.y;
    if (hasXm) xm = blockError(origin, base + ivec2(-1, 0));
    if (hasXp) xp = blockError(origin, base + ivec2(1, 0));
    if (hasYm) ym = blockError(origin, base + ivec2(0, -1));
    if (hasYp) yp = blockError(origin, base + ivec2(0, 1));
    vec2 sub = vec2(0.0);
    if (hasXm && hasXp) {
        float dx = xm - 2.0 * c + xp;
        if (dx > 1e-6) sub.x = clamp(0.5 * (xm - xp) / dx, -0.5, 0.5);
    }
    if (hasYm && hasYp) {
        float dy = ym - 2.0 * c + yp;
        if (dy > 1e-6) sub.y = clamp(0.5 * (ym - yp) / dy, -0.5, 0.5);
    }

    vec2 nativeOffset = vec2(best) + sub;
    oMv = vec4(nativeOffset / vec2(uInputSize), 0.0, 0.0);
}
)GLSL"

// Extrapolation warp: single-texture backward warp of srcTex by the stored
// motion field, scaled by normalized progress (time-shifted vectors).
#define SWP_GLSL_EXTRAP_FRAG R"GLSL(#version 320 es
precision highp float;

uniform highp sampler2D uSrc;
uniform highp sampler2D uMv;
uniform float uScaleFactor;
uniform float uFovScale;
uniform float uClampMag;
uniform float uSrRadius;
uniform int uSrMode;

layout(location = 0) in vec2 vUv;
layout(location = 0) out vec4 oColor;

void main() {
    vec2 d = texture(uMv, vUv).rg * uFovScale;
    d = clamp(d, vec2(-uClampMag), vec2(uClampMag));
    d *= (1.0 - uScaleFactor);
    if (uSrMode == 0) {
        vec2 room = min(vUv, vec2(1.0) - vUv) / max(uSrRadius, 1e-6);
        d *= min(room, vec2(1.0));
    }
    vec2 suv = clamp(vUv + d, vec2(0.0), vec2(1.0));
    oColor = vec4(texture(uSrc, suv).rgb, texture(uSrc, vUv).a);
}
)GLSL"

// Rotation alignment of the older composite (A) into the newer composite's
// camera (B). Output uv is B's screen; the sample is A's screen after the
// rotation-only transform R_A * R_B^T. Asymmetric FOV tangents are honored.
#define SWP_GLSL_ALIGN_FRAG R"GLSL(#version 320 es
precision highp float;

uniform highp sampler2D uPrev;
uniform vec4 uPrevFov;   // tan(angleLeft), tan(angleRight), tan(angleUp), tan(angleDown)
uniform vec4 uCurrFov;
uniform mat3 uRot;       // world->A * B^T

layout(location = 0) in vec2 vUv;
layout(location = 0) out vec4 oColor;

void main() {
    vec2 uv = clamp(vUv, 0.0, 1.0);
    float tanX = uCurrFov.x + uv.x * (uCurrFov.y - uCurrFov.x);
    float tanY = uCurrFov.w + uv.y * (uCurrFov.z - uCurrFov.w);
    vec3 dir = normalize(vec3(tanX, tanY, -1.0));
    vec3 rotated = uRot * dir;
    if (rotated.z >= -1e-6) { oColor = vec4(0.0, 0.0, 0.0, 1.0); return; }
    vec2 tanA = rotated.xy / -rotated.z;
    vec2 uvA = vec2((tanA.x - uPrevFov.x) / (uPrevFov.y - uPrevFov.x),
                    (tanA.y - uPrevFov.w) / (uPrevFov.z - uPrevFov.w));
    uvA = clamp(uvA, vec2(0.0), vec2(1.0));
    vec4 c = texture(uPrev, uvA);
    oColor = vec4(c.rgb, texture(uPrev, uv).a);
}
)GLSL"

namespace gxr {
namespace swp_shaders {

static const char* const swp_version_line = SWP_GLSL_VERSION;
static const char* const swp_sad_direct_prefix = SWP_GLSL_DIRECT_PREFIX;
static const char* const swp_sad_fallback_prefix = SWP_GLSL_FALLBACK_PREFIX;
static const char* const swp_dense_core = SWP_GLSL_DENSE_CORE;
static const char* const swp_refine_core = SWP_GLSL_REFINE_CORE;
static const char* const swp_downsample_frag = SWP_GLSL_DOWNSAMPLE_FRAG;
static const char* const swp_median_frag = SWP_GLSL_MEDIAN_FRAG;
static const char* const swp_extrap_frag = SWP_GLSL_EXTRAP_FRAG;
static const char* const swp_align_frag = SWP_GLSL_ALIGN_FRAG;
static const char* const swp_vert_quad = SWP_GLSL_VERSION SWP_GLSL_QUAD_VERT;
static const char* const swp_dense_frag =
    SWP_GLSL_VERSION SWP_GLSL_DIRECT_PREFIX SWP_GLSL_DENSE_CORE;
static const char* const swp_dense_fallback_frag =
    SWP_GLSL_VERSION SWP_GLSL_FALLBACK_PREFIX SWP_GLSL_DENSE_CORE;
static const char* const swp_refine_frag =
    SWP_GLSL_VERSION SWP_GLSL_DIRECT_PREFIX SWP_GLSL_REFINE_CORE;
static const char* const swp_refine_fallback_frag =
    SWP_GLSL_VERSION SWP_GLSL_FALLBACK_PREFIX SWP_GLSL_REFINE_CORE;

}  // namespace swp_shaders
}  // namespace gxr

#undef SWP_GLSL_VERSION
#undef SWP_GLSL_QUAD_VERT
#undef SWP_GLSL_DIRECT_PREFIX
#undef SWP_GLSL_FALLBACK_PREFIX
#undef SWP_GLSL_DOWNSAMPLE_FRAG
#undef SWP_GLSL_DENSE_CORE
#undef SWP_GLSL_MEDIAN_FRAG
#undef SWP_GLSL_REFINE_CORE
#undef SWP_GLSL_EXTRAP_FRAG
#undef SWP_GLSL_ALIGN_FRAG
