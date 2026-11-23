package dev.materialtidal.extension.tidal.navbar;

import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Shader;

import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Shared Material 3 Expressive liquid-glass pill geometry, lighting, and directional specular rim
 * renderer unifying {@link ExpressiveNavbarView} and {@link ExpressiveMiniPlayerView} into one
 * cohesive floating dock.
 */
final class ExpressiveDockGlass {

    static final float BAR_HEIGHT_DP = 64f;
    static final float HORIZ_PAD_DP = 3f;
    static final float GAP_DP = 10f;

    private static final float[] SHADOW_SPREADS_DP = {3.0f, 1.8f, 0.8f};
    private static final float[] SHADOW_DYS_DP = {1.8f, 1.0f, 0.45f};
    private static final float[] SHADOW_ALPHA_FACTORS = {0.18f, 0.26f, 0.34f};

    private ExpressiveDockGlass() {
    }

    static boolean isFrostedDockEnabled() {
        return MaterialYouConfig.isMaterialYouEnabled()
                && !MaterialYouColorEngine.isEffectiveAmoledBlack()
                && MaterialYouConfig.isExpressiveBlurEnabled()
                && MaterialYouConfig.isNavbarProgressiveBlurEnabled();
    }

    static boolean isLightColor(int argb) {
        int r = (argb >>> 16) & 0xFF;
        int g = (argb >>> 8) & 0xFF;
        int b = argb & 0xFF;
        float lum = (0.299f * r + 0.587f * g + 0.114f * b) / 255f;
        return lum > 0.56f;
    }

    static int pickContrastColor(int bgArgb, int darkCandidate, int lightCandidate) {
        return isLightColor(bgArgb) ? darkCandidate : lightCandidate;
    }

    /**
     * Per-pill shader cache eliminating per-frame {@link LinearGradient} / {@link RadialGradient}
     * allocations while keeping specular lighting crisp under translation or stretch.
     */
    static final class DockPillShaderCache {
        final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Paint glowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Paint sheenPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Path clipPath = new Path();
        final RectF tempRect = new RectF();
        final RectF strokeRect = new RectF();

        private float sheenTop = Float.NaN;
        private float sheenBottom = Float.NaN;
        private boolean sheenLightMode;
        private Shader sheenShader;

        private float rimTop = Float.NaN;
        private float rimBottom = Float.NaN;
        private int rimBorderColor;
        private boolean rimLightSurface;
        private Shader rimShader;

        private float glowCx = Float.NaN;
        private float glowCy = Float.NaN;
        private float glowRadius = Float.NaN;
        private int glowRgb;
        private int glowAlphaByte = -1;
        private Shader glowShader;

        DockPillShaderCache() {
            shadowPaint.setStyle(Paint.Style.FILL);
            fillPaint.setStyle(Paint.Style.FILL);
            glowPaint.setStyle(Paint.Style.FILL);
            sheenPaint.setStyle(Paint.Style.FILL);
            rimPaint.setStyle(Paint.Style.STROKE);
            rimPaint.setStrokeCap(Paint.Cap.ROUND);
            rimPaint.setStrokeJoin(Paint.Join.ROUND);
        }

        Shader getOrCreateSheen(float top, float bottom, boolean lightSurface) {
            if (sheenShader == null
                    || Math.abs(sheenTop - top) > 0.5f
                    || Math.abs(sheenBottom - bottom) > 0.5f
                    || sheenLightMode != lightSurface) {
                sheenTop = top;
                sheenBottom = bottom;
                sheenLightMode = lightSurface;
                int topWhite = lightSurface ? 0x30FFFFFF : 0x1DFFFFFF;
                int midWhite = lightSurface ? 0x0AFFFFFF : 0x05FFFFFF;
                sheenShader = new LinearGradient(
                        0f, top,
                        0f, Math.max(top + 1f, bottom),
                        new int[]{topWhite, midWhite, 0x00FFFFFF},
                        new float[]{0f, 0.45f, 1f},
                        Shader.TileMode.CLAMP);
            }
            return sheenShader;
        }

        Shader getOrCreateRim(float top, float bottom, int borderColor, boolean lightSurface) {
            if (rimShader == null
                    || Math.abs(rimTop - top) > 0.5f
                    || Math.abs(rimBottom - bottom) > 0.5f
                    || rimBorderColor != borderColor
                    || rimLightSurface != lightSurface) {
                rimTop = top;
                rimBottom = bottom;
                rimBorderColor = borderColor;
                rimLightSurface = lightSurface;
                int opaqueBorder = borderColor | 0xFF000000;
                int topHighlight = lightSurface
                        ? 0xCCFFFFFF
                        : MaterialYouColorEngine.withAlpha(
                                MaterialYouColorEngine.blendRgb(opaqueBorder, 0xFFFFFFFF, 0.54f), 0x5A);
                int midRim = lightSurface
                        ? MaterialYouColorEngine.withAlpha(opaqueBorder, 0x52)
                        : MaterialYouColorEngine.withAlpha(
                                MaterialYouColorEngine.blendRgb(opaqueBorder, 0xFFFFFFFF, 0.22f), 0x26);
                int bottomRim = lightSurface
                        ? MaterialYouColorEngine.withAlpha(opaqueBorder, 0x7A)
                        : MaterialYouColorEngine.withAlpha(borderColor, 0x16);
                rimShader = new LinearGradient(
                        0f, top,
                        0f, Math.max(top + 1f, bottom),
                        new int[]{topHighlight, midRim, bottomRim},
                        new float[]{0f, 0.38f, 1f},
                        Shader.TileMode.CLAMP);
            }
            return rimShader;
        }

        Shader getOrCreateGlow(float cx, float cy, float radius, int accentRgb, int maxAlphaByte) {
            int cleanRgb = accentRgb & 0x00FFFFFF;
            if (glowShader == null
                    || Math.abs(glowCx - cx) > 0.5f
                    || Math.abs(glowCy - cy) > 0.5f
                    || Math.abs(glowRadius - radius) > 0.5f
                    || glowRgb != cleanRgb
                    || glowAlphaByte != maxAlphaByte) {
                glowCx = cx;
                glowCy = cy;
                glowRadius = Math.max(1f, radius);
                glowRgb = cleanRgb;
                glowAlphaByte = maxAlphaByte;
                glowShader = new RadialGradient(
                        cx, cy, glowRadius,
                        new int[]{
                                MaterialYouColorEngine.withAlpha(accentRgb, maxAlphaByte),
                                MaterialYouColorEngine.withAlpha(accentRgb, Math.round(maxAlphaByte * 0.42f)),
                                MaterialYouColorEngine.withAlpha(accentRgb, 0)
                        },
                        new float[]{0f, 0.48f, 1f},
                        Shader.TileMode.CLAMP);
            }
            return glowShader;
        }
    }

    static void drawGlassPill(
            Canvas canvas,
            RectF rect,
            float radius,
            float density,
            int surfaceColor,
            int borderColor,
            int shadowBase,
            boolean frosted,
            int accentRgb,
            float accentStrength,
            DockPillShaderCache cache
    ) {
        if (rect.width() <= 0f || rect.height() <= 0f) {
            return;
        }

        // 1. Tight 3-layer elevation shadow (max horizontal overhang ~1.14dp < 3dp pad)
        int baseAlpha = (shadowBase >>> 24) & 0xFF;
        if (baseAlpha > 0) {
            for (int i = 0; i < SHADOW_SPREADS_DP.length; i++) {
                float exp = SHADOW_SPREADS_DP[i] * density;
                float dy = SHADOW_DYS_DP[i] * density;
                cache.tempRect.set(
                        rect.left - exp * 0.38f,
                        rect.top + dy - exp * 0.25f,
                        rect.right + exp * 0.38f,
                        rect.bottom + dy + exp * 0.45f);
                cache.shadowPaint.setColor(MaterialYouColorEngine.withAlpha(
                        shadowBase, Math.round(baseAlpha * SHADOW_ALPHA_FACTORS[i])));
                canvas.drawRoundRect(
                        cache.tempRect,
                        radius + exp * 0.35f,
                        radius + exp * 0.35f,
                        cache.shadowPaint);
            }
        }

        // 2. Frosted base surface
        boolean lightSurface = isLightColor(surfaceColor);
        int fillColor = frosted
                ? MaterialYouColorEngine.withAlpha(surfaceColor, lightSurface ? 0xDE : 0xCC)
                : surfaceColor;
        cache.fillPaint.setColor(fillColor);
        canvas.drawRoundRect(rect, radius, radius, cache.fillPaint);

        // 3. Ambient cover glow + top glass bevel sheen clipped inside the rounded pill
        boolean hasGlow = accentStrength > 0.01f && !MaterialYouColorEngine.isEffectiveAmoledBlack();
        if (frosted || hasGlow) {
            canvas.save();
            cache.clipPath.reset();
            cache.clipPath.addRoundRect(rect, radius, radius, Path.Direction.CW);
            canvas.clipPath(cache.clipPath);

            if (hasGlow) {
                int maxAlpha = Math.max(0, Math.min(255, Math.round(0x36 * Math.min(1f, accentStrength))));
                float glowCx = rect.left + rect.height() * 0.65f;
                float glowR = Math.max(rect.height() * 1.9f, rect.width() * 0.48f);
                cache.glowPaint.setShader(
                        cache.getOrCreateGlow(glowCx, rect.centerY(), glowR, accentRgb, maxAlpha));
                canvas.drawRect(rect, cache.glowPaint);
            }

            if (frosted) {
                float sheenH = rect.height() * 0.44f;
                cache.sheenPaint.setShader(
                        cache.getOrCreateSheen(rect.top, rect.top + sheenH, lightSurface));
                canvas.drawRect(rect.left, rect.top, rect.right, rect.top + sheenH, cache.sheenPaint);
            }
            canvas.restore();
        }

        // 4. Directional 1dp specular rim border
        float strokeW = Math.max(1f, 1f * density);
        float halfStroke = strokeW * 0.5f;
        cache.strokeRect.set(rect);
        cache.strokeRect.inset(halfStroke, halfStroke);
        float innerR = Math.max(1f, radius - halfStroke);
        cache.rimPaint.setStrokeWidth(strokeW);

        if (frosted) {
            cache.rimPaint.setColor(0xFFFFFFFF);
            cache.rimPaint.setShader(
                    cache.getOrCreateRim(cache.strokeRect.top, cache.strokeRect.bottom, borderColor, lightSurface));
        } else {
            cache.rimPaint.setShader(null);
            cache.rimPaint.setColor(borderColor);
        }
        canvas.drawRoundRect(cache.strokeRect, innerR, innerR, cache.rimPaint);
    }
}
