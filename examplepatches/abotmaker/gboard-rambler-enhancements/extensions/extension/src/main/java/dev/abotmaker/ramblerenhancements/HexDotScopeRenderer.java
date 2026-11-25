package dev.abotmaker.ramblerenhancements;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;

/**
 * Zero-allocation Android {@link Canvas} renderer matching Hex by Anomaly's
 * {@code DotScopeShader.metal} / {@code rune_hud.wgsl} visual signature:
 * curved button-inset edge windowing, Strip trace glow or iOS soft halo + edge lobes,
 * power-curved dot radius &amp; opacity, and base-to-core color interpolation.
 */
public final class HexDotScopeRenderer {
    // Hex default Warm Pearl (recording) & Agent Blue (processing)
    private static final float[] DARK_YOU = {0.86f, 0.83f, 0.77f};
    private static final float[] DARK_YOU_CORE = {0.98f, 0.96f, 0.92f};
    private static final float[] DARK_AGENT = {0.70f, 0.78f, 0.90f};
    private static final float[] DARK_AGENT_CORE = {0.92f, 0.95f, 1.00f};
    private static final float[] DARK_CORAL = {1.00f, 0.38f, 0.31f};
    private static final float[] DARK_CORAL_CORE = {1.00f, 0.66f, 0.60f};

    private static final float[] LIGHT_YOU = {0.62f, 0.53f, 0.40f};
    private static final float[] LIGHT_YOU_CORE = {0.47f, 0.38f, 0.26f};
    private static final float[] LIGHT_AGENT = {0.40f, 0.47f, 0.58f};
    private static final float[] LIGHT_AGENT_CORE = {0.24f, 0.31f, 0.43f};
    private static final float[] LIGHT_CORAL = {0.82f, 0.24f, 0.20f};
    private static final float[] LIGHT_CORAL_CORE = {0.64f, 0.14f, 0.12f};

    private final Paint dotPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint glowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path clipPath = new Path();
    private final RectF clipRect = new RectF();
    private final float[] clipRadii = new float[8];

    // Pre-allocated RGB scratch buffers
    private final float[] listenBase = new float[3];
    private final float[] listenCore = new float[3];
    private final float[] processBase = new float[3];
    private final float[] processCore = new float[3];
    private final float[] frameBase = new float[3];
    private final float[] frameCore = new float[3];
    private final float[] saturatedGlow = new float[3];

    public HexDotScopeRenderer() {
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
            HexDotScopeSimulation sim,
            float externalOpacity) {
        if (canvas == null || bounds == null || sim == null || settings == null) {
            return;
        }
        int widthPx = bounds.width();
        int heightPx = bounds.height();
        if (widthPx <= 4 || heightPx <= 4) {
            return;
        }
        float opacity = HexDotScopeSimulation.clamp(sim.getOpacity() * externalOpacity, 0.0f, 1.0f);
        if (opacity <= 0.002f) {
            return;
        }

        int cols = sim.getColumns();
        int rows = sim.getRows();
        float[] dotPower = sim.getDotPower();
        float[] dotFresh = sim.getDotFresh();
        if (cols < 2 || rows < 2 || dotPower.length < cols * rows) {
            return;
        }

        float density = Math.max(1.0f, rawDensity);
        float widthDp = widthPx / density;
        float heightDp = heightPx / density;
        float halfW = widthDp * 0.5f;
        float halfH = heightDp * 0.5f;
        float radiusDp = HexDotScopeSimulation.clamp(
                cornerRadiusPx > 0.0f ? (cornerRadiusPx / density) : halfH, 0.0f, halfH);
        float pitchDp = sim.getSpacingDp();
        float pitchPx = pitchDp * density;
        boolean iosHalo = settings.isIosHaloGlow();
        float glowScale = settings.getGlowIntensity();

        float colorAlphaScale = resolveFramePalette(
                isDark, themeAccentColor, settings, sim.getCool(), sim.getFail());
        float effectiveOpacity = HexDotScopeSimulation.clamp(opacity * colorAlphaScale, 0.0f, 1.0f);
        if (effectiveOpacity <= 0.002f) {
            return;
        }

        boolean clipped = cornerRadiusPx > 0.5f;
        int saveCount = 0;
        if (clipped) {
            saveCount = clipBottomRoundedCorners(
                    canvas, bounds, cornerRadiusPx, clipPath, clipRect, clipRadii);
        }

        try {
            float centerX = bounds.left + widthPx * 0.5f;
            float centerY = bounds.top + heightPx * 0.5f;
            float colHalf = (cols - 1.0f) * 0.5f;
            float rowHalf = (rows - 1.0f) * 0.5f;

            // Pass 1: Hex glow pass (Strip trace glow vs iOS button-anchored lobes from DotScopeShader.metal)
            if (glowScale > 0.01f) {
                if (iosHalo) {
                    drawIosEdgeLobes(
                            canvas,
                            bounds,
                            density,
                            widthDp,
                            heightDp,
                            leadingInsetDp,
                            trailingInsetDp,
                            isDark,
                            sim.getGlow(),
                            sim.getLive(),
                            sim.getCool(),
                            glowScale,
                            effectiveOpacity,
                            frameBase,
                            frameCore,
                            saturatedGlow,
                            glowPaint);
                } else {
                    int glowRgb = packRgb(
                            (frameBase[0] + frameCore[0]) * 0.5f,
                            (frameBase[1] + frameCore[1]) * 0.5f,
                            (frameBase[2] + frameCore[2]) * 0.5f);
                    float outerStrength = (isDark ? 0.11f : 0.055f) * glowScale * effectiveOpacity;
                    float innerStrength = (isDark ? 0.16f : 0.08f) * glowScale * effectiveOpacity;
                    float outerGlowR = pitchPx * 2.15f;
                    float innerGlowR = pitchPx * 1.15f;

                    for (int j = 0; j < rows; j++) {
                        float cyDp = (j - rowHalf) * pitchDp;
                        float cyPx = centerY + cyDp * density;
                        int rowOffset = j * cols;
                        for (int i = 0; i < cols; i++) {
                            float power = dotPower[rowOffset + i];
                            if (power < 0.22f) {
                                continue;
                            }
                            float cxDp = (i - colHalf) * pitchDp;
                            float mask = edgeMask(cxDp, cyDp, halfW, halfH, radiusDp, false);
                            if (mask <= 0.01f) {
                                continue;
                            }
                            float win = scopeWindow(
                                    cxDp, cyDp, halfW, halfH, radiusDp,
                                    leadingInsetDp, trailingInsetDp, windowFadeDp);
                            if (win <= 0.01f) {
                                continue;
                            }
                            float cxPx = centerX + cxDp * density;
                            float weight = power * power * mask * win;
                            int aOuter = Math.round(255.0f * Math.min(1.0f, outerStrength * weight));
                            if (aOuter >= 2) {
                                glowPaint.setColor((aOuter << 24) | glowRgb);
                                canvas.drawCircle(cxPx, cyPx, outerGlowR, glowPaint);
                            }
                            int aInner = Math.round(255.0f * Math.min(1.0f, innerStrength * weight));
                            if (aInner >= 2) {
                                glowPaint.setColor((aInner << 24) | glowRgb);
                                canvas.drawCircle(cxPx, cyPx, innerGlowR, glowPaint);
                            }
                        }
                    }
                }
            }

            // Pass 2: Dot matrix field matching DotScopeShader.metal (desktop/strip vs iOS halo look)
            float unlit = iosHalo ? (isDark ? 0.055f : 0.10f) : (isDark ? 0.07f : 0.085f);
            float full = iosHalo ? (isDark ? 0.85f : 0.88f) : (isDark ? 0.96f : 1.0f);
            float curveExp = iosHalo ? (isDark ? 0.90f : 0.76f) : (isDark ? 0.90f : 0.75f);
            float presence = 0.5f + 0.5f * Math.max(sim.getLive(), sim.getCool());
            float grid = sim.getGrid();

            for (int j = 0; j < rows; j++) {
                float cyDp = (j - rowHalf) * pitchDp;
                float cyPx = centerY + cyDp * density;
                float rowNorm = Math.abs(cyDp) / Math.max(halfH, 1.0f);
                float floorAlpha = unlit
                        * (1.0f - 0.7f * HexDotScopeSimulation.smoothstep(0.35f, 0.95f, rowNorm))
                        * presence * grid;
                int rowOffset = j * cols;

                for (int i = 0; i < cols; i++) {
                    float cxDp = (i - colHalf) * pitchDp;
                    float mask = edgeMask(cxDp, cyDp, halfW, halfH, radiusDp, iosHalo);
                    if (mask <= 0.005f) {
                        continue;
                    }
                    float win = scopeWindow(
                            cxDp, cyDp, halfW, halfH, radiusDp,
                            leadingInsetDp, trailingInsetDp, windowFadeDp);
                    if (win <= 0.005f) {
                        continue;
                    }

                    int idx = rowOffset + i;
                    float power = Math.max(dotPower[idx], 1e-5f);
                    float fresh = dotFresh[idx];

                    float expVal = curveExp * (1.4f - 0.4f * fresh);
                    float alpha = floorAlpha + (full - floorAlpha) * (float) Math.pow(power, expVal);
                    float finalAlpha = alpha * mask * win * effectiveOpacity;
                    int alphaByte = Math.round(255.0f * HexDotScopeSimulation.clamp(finalAlpha, 0.0f, 1.0f));
                    if (alphaByte < 2) {
                        continue;
                    }

                    float blur = 1.0f - win;
                    float freshScale = 0.82f + 0.18f * fresh;
                    float sizeMix = HexDotScopeSimulation.smoothstep(0.03f, 0.20f, power);
                    float dotRadiusPx = (0.25f + 0.17f * (float) Math.pow(power, 0.6))
                            * (1.0f + (freshScale - 1.0f) * sizeMix)
                            * pitchPx
                            * (iosHalo ? (1.0f + 0.35f * blur) : 1.0f);

                    float coreMix = HexDotScopeSimulation.clamp(power * power * 1.1f, 0.0f, 0.9f)
                            * (0.3f + 0.7f * fresh);
                    float r = frameBase[0] + (frameCore[0] - frameBase[0]) * coreMix;
                    float g = frameBase[1] + (frameCore[1] - frameBase[1]) * coreMix;
                    float b = frameBase[2] + (frameCore[2] - frameBase[2]) * coreMix;
                    int dotRgb = packRgb(r, g, b);
                    float cxPx = centerX + cxDp * density;

                    // Soft per-dot halo from DotScopeShader.metal (desktop = false, lines 287-291)
                    if (iosHalo && glowScale > 0.01f && power > 0.20f) {
                        float haloAlpha = 0.20f * power * power * glowScale * mask * win * effectiveOpacity;
                        int haloByte = Math.round(255.0f * HexDotScopeSimulation.clamp(haloAlpha, 0.0f, 0.85f));
                        if (haloByte >= 2) {
                            glowPaint.setColor((haloByte << 24) | dotRgb);
                            float haloR = dotRadiusPx + (0.28f + 0.35f * blur) * pitchPx;
                            canvas.drawCircle(cxPx, cyPx, haloR, glowPaint);
                        }
                    }

                    dotPaint.setColor((alphaByte << 24) | dotRgb);
                    canvas.drawCircle(cxPx, cyPx, dotRadiusPx, dotPaint);
                }
            }
        } finally {
            if (clipped) {
                canvas.restoreToCount(saveCount);
            }
        }
    }

    /**
     * Soft button-anchored left/right glow lobes matching {@code DotScopeShader.metal::ds_glow_lobe}.
     */
    static void drawIosEdgeLobes(
            Canvas canvas,
            Rect bounds,
            float density,
            float widthDp,
            float heightDp,
            float leadingInsetDp,
            float trailingInsetDp,
            boolean isDark,
            float simGlow,
            float live,
            float cool,
            float glowScale,
            float effectiveOpacity,
            float[] baseRgb,
            float[] coreRgb,
            float[] scratchRgb,
            Paint glowPaint) {
        float restGlow = 0.045f * Math.max(live, cool * 0.6f);
        float lobeG = Math.min(1.0f, simGlow * 0.85f + restGlow);
        if (lobeG <= 0.005f) {
            return;
        }
        float midR = (baseRgb[0] + coreRgb[0]) * 0.5f;
        float midG = (baseRgb[1] + coreRgb[1]) * 0.5f;
        float midB = (baseRgb[2] + coreRgb[2]) * 0.5f;
        if (isDark) {
            saturate3(midR, midG, midB, 1.5f, scratchRgb);
        } else {
            saturate3(baseRgb[0], baseRgb[1], baseRgb[2], 1.8f, scratchRgb);
            scratchRgb[0] = scratchRgb[0] + (1.0f - scratchRgb[0]) * 0.12f;
            scratchRgb[1] = scratchRgb[1] + (1.0f - scratchRgb[1]) * 0.12f;
            scratchRgb[2] = scratchRgb[2] + (1.0f - scratchRgb[2]) * 0.12f;
        }
        int lobeRgb = packRgb(scratchRgb[0], scratchRgb[1], scratchRgb[2]);
        float peak = (isDark ? 0.30f : 0.18f) * 0.55f * Math.min(1.8f, glowScale) * effectiveOpacity;
        float cyPx = bounds.top + bounds.height() * 0.5f;
        float leftAnchorX = bounds.left + (leadingInsetDp + 24.0f) * density;
        float rightAnchorX = bounds.right - (trailingInsetDp + 24.0f) * density;
        float baseR = Math.max(heightDp * 0.58f, 22.0f + 22.0f * lobeG) * density;
        float leftAlpha = Math.min(0.65f, lobeG * peak);
        float rightAlpha = Math.min(0.65f, lobeG * 0.92f * peak);

        // Soft 3-ring Gaussian approximation (zero Shader allocation per frame)
        drawSoftLobe(canvas, leftAnchorX, cyPx, baseR, leftAlpha, lobeRgb, glowPaint);
        if (widthDp > 90.0f) {
            drawSoftLobe(canvas, rightAnchorX, cyPx, baseR, rightAlpha, lobeRgb, glowPaint);
        }
    }

    private static void drawSoftLobe(
            Canvas canvas,
            float cx,
            float cy,
            float maxRadius,
            float peakAlpha,
            int rgb,
            Paint paint) {
        int a1 = Math.round(255.0f * peakAlpha * 0.28f);
        int a2 = Math.round(255.0f * peakAlpha * 0.36f);
        int a3 = Math.round(255.0f * peakAlpha * 0.42f);
        if (a1 >= 2) {
            paint.setColor((a1 << 24) | rgb);
            canvas.drawCircle(cx, cy, maxRadius * 1.45f, paint);
        }
        if (a2 >= 2) {
            paint.setColor((a2 << 24) | rgb);
            canvas.drawCircle(cx, cy, maxRadius * 0.95f, paint);
        }
        if (a3 >= 2) {
            paint.setColor((a3 << 24) | rgb);
            canvas.drawCircle(cx, cy, maxRadius * 0.52f, paint);
        }
    }

    static int clipBottomRoundedCorners(
            Canvas canvas,
            Rect bounds,
            float cornerRadiusPx,
            Path clipPath,
            RectF clipRect,
            float[] clipRadii) {
        int saveCount = canvas.save();
        clipPath.rewind();
        clipRect.set(bounds.left, bounds.top, bounds.right, bounds.bottom);
        clipRadii[0] = 0.0f;
        clipRadii[1] = 0.0f;
        clipRadii[2] = 0.0f;
        clipRadii[3] = 0.0f;
        clipRadii[4] = cornerRadiusPx;
        clipRadii[5] = cornerRadiusPx;
        clipRadii[6] = cornerRadiusPx;
        clipRadii[7] = cornerRadiusPx;
        clipPath.addRoundRect(clipRect, clipRadii, Path.Direction.CW);
        canvas.clipPath(clipPath);
        return saveCount;
    }

    private float resolveFramePalette(
            boolean isDark,
            int themeAccentColor,
            RamblerWaveformSettings.SettingsSnapshot settings,
            float cool,
            float fail) {
        float listenAlpha = resolveSlotColors(
                settings.getListeningColorValue(),
                isDark,
                themeAccentColor,
                false,
                listenBase,
                listenCore);
        float processAlpha = resolveSlotColors(
                settings.getProcessingColorValue(),
                isDark,
                themeAccentColor,
                true,
                processBase,
                processCore);

        float[] coral = isDark ? DARK_CORAL : LIGHT_CORAL;
        float[] coralCore = isDark ? DARK_CORAL_CORE : LIGHT_CORAL_CORE;

        for (int c = 0; c < 3; c++) {
            float b = listenBase[c] + (processBase[c] - listenBase[c]) * cool;
            float cr = listenCore[c] + (processCore[c] - listenCore[c]) * cool;
            frameBase[c] = b + (coral[c] - b) * fail;
            frameCore[c] = cr + (coralCore[c] - cr) * fail;
        }
        return listenAlpha + (processAlpha - listenAlpha) * cool;
    }

    static float resolveSlotColors(
            String colorSpec,
            boolean isDark,
            int themeAccentColor,
            boolean isProcessingSlot,
            float[] outBase,
            float[] outCore) {
        if (RamblerWaveformSettings.isHexDefault(colorSpec)) {
            float[] b = isProcessingSlot
                    ? (isDark ? DARK_AGENT : LIGHT_AGENT)
                    : (isDark ? DARK_YOU : LIGHT_YOU);
            float[] cr = isProcessingSlot
                    ? (isDark ? DARK_AGENT_CORE : LIGHT_AGENT_CORE)
                    : (isDark ? DARK_YOU_CORE : LIGHT_YOU_CORE);
            System.arraycopy(b, 0, outBase, 0, 3);
            System.arraycopy(cr, 0, outCore, 0, 3);
            return 1.0f;
        }

        int argb;
        if (RamblerWaveformSettings.isThemeAuto(colorSpec)) {
            argb = themeAccentColor != 0
                    ? themeAccentColor
                    : (isProcessingSlot ? Color.parseColor("#7FA6E8") : Color.parseColor("#DBD4C4"));
            if (isProcessingSlot) {
                argb = shiftHueForProcessing(argb);
            }
        } else {
            Integer parsed = RamblerWaveformSettings.tryParseArgb(colorSpec);
            argb = parsed != null
                    ? parsed.intValue()
                    : (isProcessingSlot ? Color.parseColor("#7FA6E8") : Color.parseColor("#DBD4C4"));
        }

        float alpha = Color.alpha(argb) / 255.0f;
        float r = Color.red(argb) / 255.0f;
        float g = Color.green(argb) / 255.0f;
        float b = Color.blue(argb) / 255.0f;
        outBase[0] = r;
        outBase[1] = g;
        outBase[2] = b;

        derivePhosphorCore(r, g, b, isDark, outCore);
        return HexDotScopeSimulation.clamp(alpha, 0.15f, 1.0f);
    }

    /**
     * Derives a luminous incandescent phosphor core color from any user-chosen base color.
     */
    static void derivePhosphorCore(float r, float g, float b, boolean isDark, float[] outCore) {
        if (isDark) {
            outCore[0] = HexDotScopeSimulation.clamp(r + (1.0f - r) * 0.55f, 0.0f, 1.0f);
            outCore[1] = HexDotScopeSimulation.clamp(g + (1.0f - g) * 0.55f, 0.0f, 1.0f);
            outCore[2] = HexDotScopeSimulation.clamp(b + (1.0f - b) * 0.55f, 0.0f, 1.0f);
        } else {
            // On light themes, deepen toward crisp high-contrast ink while preserving hue.
            outCore[0] = HexDotScopeSimulation.clamp(r * 0.65f, 0.0f, 1.0f);
            outCore[1] = HexDotScopeSimulation.clamp(g * 0.65f, 0.0f, 1.0f);
            outCore[2] = HexDotScopeSimulation.clamp(b * 0.65f, 0.0f, 1.0f);
        }
    }

    private static void saturate3(float r, float g, float b, float k, float[] out) {
        float l = 0.299f * r + 0.587f * g + 0.114f * b;
        out[0] = HexDotScopeSimulation.clamp(l + (r - l) * k, 0.0f, 1.0f);
        out[1] = HexDotScopeSimulation.clamp(l + (g - l) * k, 0.0f, 1.0f);
        out[2] = HexDotScopeSimulation.clamp(l + (b - l) * k, 0.0f, 1.0f);
    }

    private static int shiftHueForProcessing(int argb) {
        float[] hsv = new float[3];
        Color.colorToHSV(argb, hsv);
        hsv[0] = (hsv[0] + 32.0f) % 360.0f;
        hsv[1] = HexDotScopeSimulation.clamp(hsv[1] * 0.92f, 0.18f, 1.0f);
        return Color.HSVToColor(Color.alpha(argb), hsv);
    }

    private static float roundedBoxSdf(float px, float py, float halfW, float halfH, float radius) {
        float qx = Math.abs(px) - halfW + radius;
        float qy = Math.abs(py) - halfH + radius;
        float ox = Math.max(qx, 0.0f);
        float oy = Math.max(qy, 0.0f);
        return (float) Math.sqrt(ox * ox + oy * oy) + Math.min(Math.max(qx, qy), 0.0f) - radius;
    }

    private static float edgeMask(
            float px, float py, float halfW, float halfH, float radius, boolean iosHalo) {
        float cap = -roundedBoxSdf(px, py, halfW, halfH, radius);
        return iosHalo
                ? HexDotScopeSimulation.smoothstep(2.0f, 6.2f, cap)
                : HexDotScopeSimulation.smoothstep(1.4f, 4.6f, cap);
    }

    /**
     * Capsule-curved edge window matching {@code DotScopeShader.metal::ds_scope_window}.
     */
    static float scopeWindow(
            float px,
            float py,
            float halfW,
            float halfH,
            float radius,
            float leadingInset,
            float trailingInset,
            float fade) {
        if (fade <= 0.01f) {
            return 1.0f;
        }
        float width = halfW * 2.0f;
        float xFromLeft = px + halfW;
        float xFromRight = width - xFromLeft;
        float dy = Math.max(Math.abs(py) - (halfH - radius), 0.0f);
        float rimInset = radius - (float) Math.sqrt(Math.max(radius * radius - dy * dy, 0.0f));

        float lead = leadingInset + rimInset;
        float trail = trailingInset + rimInset;

        float sL = HexDotScopeSimulation.smoothstep(lead, lead + fade, xFromLeft);
        float sR = HexDotScopeSimulation.smoothstep(trail, trail + fade, xFromRight);
        float winL = leadingInset > 0.5f ? sL : (1.0f + (sL - 1.0f) * 0.72f);
        float winR = trailingInset > 0.5f ? sR : (1.0f + (sR - 1.0f) * 0.72f);
        return Math.min(winL, winR);
    }

    static int packRgb(float r, float g, float b) {
        int ri = Math.round(255.0f * HexDotScopeSimulation.clamp(r, 0.0f, 1.0f));
        int gi = Math.round(255.0f * HexDotScopeSimulation.clamp(g, 0.0f, 1.0f));
        int bi = Math.round(255.0f * HexDotScopeSimulation.clamp(b, 0.0f, 1.0f));
        return (ri << 16) | (gi << 8) | bi;
    }
}
