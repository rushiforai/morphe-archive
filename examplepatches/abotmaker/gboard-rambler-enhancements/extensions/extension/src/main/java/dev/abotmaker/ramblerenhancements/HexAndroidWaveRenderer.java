package dev.abotmaker.ramblerenhancements;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;

/**
 * Zero-allocation Android {@link Canvas} renderer for Hex by Anomaly's Android keyboard
 * scrolling 7-row dot sine waveform ({@code DotScopeView.kt}), adapted to respect Gboard's
 * rounded header corners, button edge insets, Listening color, and minimal Hex tuning.
 */
public final class HexAndroidWaveRenderer {
    private static final float BASE_STEP_DP = 5.0f;
    private static final float BASE_RADIUS_DP = 0.95f;
    private static final float ROW_SPACING_RATIO = 0.72f;
    private static final float WAVE_FREQ = 0.55f;
    private static final float WAVE_AMPLITUDE_ROWS = 2.65f;

    private final Paint dotPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint glowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path clipPath = new Path();
    private final RectF clipRect = new RectF();
    private final float[] clipRadii = new float[8];
    private final float[] listenBase = new float[3];
    private final float[] listenCore = new float[3];
    private final float[] scratchGlow = new float[3];

    public HexAndroidWaveRenderer() {
        dotPaint.setStyle(Paint.Style.FILL);
        glowPaint.setStyle(Paint.Style.FILL);
    }

    public void draw(
            Canvas canvas,
            Rect bounds,
            float rawDensity,
            float cornerRadiusPx,
            float leadingInsetDp,
            float trailingInsetDp,
            float windowFadeDp,
            boolean isDark,
            int themeAccentColor,
            RamblerWaveformSettings.SettingsSnapshot settings,
            HexAndroidWaveSimulation sim,
            float externalOpacity) {
        if (canvas == null || bounds == null || sim == null || settings == null) {
            return;
        }
        int widthPx = bounds.width();
        int heightPx = bounds.height();
        if (widthPx <= 4 || heightPx <= 4) {
            return;
        }
        float density = Math.max(1.0f, rawDensity);
        float colorAlpha = HexDotScopeRenderer.resolveSlotColors(
                settings.getListeningColorValue(),
                isDark,
                themeAccentColor,
                false,
                listenBase,
                listenCore);
        float effectiveOpacity = HexDotScopeSimulation.clamp(
                sim.getOpacity() * externalOpacity * colorAlpha, 0.0f, 1.0f);
        if (effectiveOpacity <= 0.002f) {
            return;
        }

        float widthDp = widthPx / density;
        float heightDp = heightPx / density;
        float halfW = widthDp * 0.5f;
        float halfH = heightDp * 0.5f;
        float radiusDp = HexDotScopeSimulation.clamp(
                cornerRadiusPx > 0.0f ? (cornerRadiusPx / density) : halfH, 0.0f, halfH);

        float spacingScale = settings.getDotSpacingDp()
                / RamblerWaveformSettings.DEFAULT_DOT_SPACING_DP;
        float stepDp = BASE_STEP_DP * spacingScale;
        float stepPx = Math.max(3.0f, stepDp * density);
        int columns = Math.max(1, (int) (widthPx / stepPx));
        float rowPitchPx = Math.min(stepPx * ROW_SPACING_RATIO, (heightPx - 6.0f * density) / 6.0f);
        rowPitchPx = Math.max(2.0f, rowPitchPx);
        float dotRadiusPx = Math.max(1.2f, BASE_RADIUS_DP * spacingScale * density);

        boolean clipped = cornerRadiusPx > 0.5f;
        int saveCount = 0;
        if (clipped) {
            saveCount = HexDotScopeRenderer.clipBottomRoundedCorners(
                    canvas, bounds, cornerRadiusPx, clipPath, clipRect, clipRadii);
        }

        try {
            float glowScale = settings.getGlowIntensity();
            boolean iosHalo = settings.isIosHaloGlow();
            if (iosHalo && glowScale > 0.01f) {
                HexDotScopeRenderer.drawIosEdgeLobes(
                        canvas,
                        bounds,
                        density,
                        widthDp,
                        heightDp,
                        leadingInsetDp,
                        trailingInsetDp,
                        isDark,
                        sim.getCurrentLevel(),
                        1.0f,
                        0.0f,
                        glowScale,
                        effectiveOpacity,
                        listenBase,
                        listenCore,
                        scratchGlow,
                        glowPaint);
            }

            float[] levels = sim.getLevels();
            int levelCount = levels.length;
            int tick = sim.getTick();
            float centerX = bounds.left + widthPx * 0.5f;
            float centerY = bounds.top + heightPx * 0.5f;
            int glowRgb = HexDotScopeRenderer.packRgb(
                    (listenBase[0] + listenCore[0]) * 0.5f,
                    (listenBase[1] + listenCore[1]) * 0.5f,
                    (listenBase[2] + listenCore[2]) * 0.5f);
            float colStepPx = (float) widthPx / columns;

            for (int x = 0; x < columns; x++) {
                float cxPx = bounds.left + (x + 0.5f) * colStepPx;
                float cxDp = (cxPx - centerX) / density;
                int sampleIndex = Math.min(levelCount - 1, x * levelCount / columns);
                float level = levels[sampleIndex];
                float wave = level * (float) Math.sin((x + tick) * WAVE_FREQ) * WAVE_AMPLITUDE_ROWS;

                for (int y = -3; y <= 3; y++) {
                    float cyPx = centerY + y * rowPitchPx;
                    float cyDp = (cyPx - centerY) / density;
                    float win = HexDotScopeRenderer.scopeWindow(
                            cxDp, cyDp, halfW, halfH, radiusDp,
                            leadingInsetDp, trailingInsetDp, windowFadeDp);
                    if (win <= 0.01f) {
                        continue;
                    }

                    float edge = HexDotScopeSimulation.clamp(
                            1.0f - Math.abs(y - wave), 0.0f, 1.0f);
                    float rawAlpha = (26.0f + 220.0f * edge) / 255.0f;
                    int alphaByte = Math.round(255.0f * HexDotScopeSimulation.clamp(
                            rawAlpha * win * effectiveOpacity, 0.0f, 1.0f));
                    if (alphaByte < 2) {
                        continue;
                    }

                    float coreMix = edge * edge * 0.75f;
                    float r = listenBase[0] + (listenCore[0] - listenBase[0]) * coreMix;
                    float g = listenBase[1] + (listenCore[1] - listenBase[1]) * coreMix;
                    float b = listenBase[2] + (listenCore[2] - listenBase[2]) * coreMix;

                    if (glowScale > 0.01f && edge > 0.35f) {
                        float haloStrength = (iosHalo ? 0.22f : 0.14f)
                                * glowScale * edge * edge * win * effectiveOpacity;
                        int haloByte = Math.round(255.0f * Math.min(0.75f, haloStrength));
                        if (haloByte >= 2) {
                            glowPaint.setColor((haloByte << 24) | glowRgb);
                            canvas.drawCircle(cxPx, cyPx, dotRadiusPx * (iosHalo ? 2.5f : 2.1f), glowPaint);
                        }
                    }

                    dotPaint.setColor((alphaByte << 24) | HexDotScopeRenderer.packRgb(r, g, b));
                    canvas.drawCircle(cxPx, cyPx, dotRadiusPx, dotPaint);
                }
            }
        } finally {
            if (clipped) {
                canvas.restoreToCount(saveCount);
            }
        }
    }
}
