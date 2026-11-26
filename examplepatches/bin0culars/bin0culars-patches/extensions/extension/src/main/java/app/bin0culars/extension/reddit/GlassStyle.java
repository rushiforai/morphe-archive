package app.bin0culars.extension.reddit;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Shader;
import android.os.Build;
import app.bin0culars.extension.reddit.settings.BinocularsMods;

final class GlassStyle {

    static final int STRENGTH_CLEAR = 0;
    static final int STRENGTH_BALANCED = 1;
    static final int STRENGTH_SOLID = 2;

    private static final float SHADOW_OFFSET_Y_DP = 1f;
    private static final float BALANCED_SHADOW_BLUR_DP = 6f;
    private static final float SOLID_SHADOW_BLUR_DP = 10f;
    private static final int BALANCED_SHADOW_COLOR = 0x24000000;
    private static final int SOLID_SHADOW_COLOR = 0x3D000000;

    private static final int BALANCED_HAIRLINE_LIGHT = 0x1F000000;
    private static final int BALANCED_HAIRLINE_DARK = 0x1AFFFFFF;
    private static final int SOLID_HAIRLINE_LIGHT = 0x38000000;
    private static final int SOLID_HAIRLINE_DARK = 0x2EFFFFFF;

    private static final float SEARCH_BUTTON_SHADOW_MARGIN_DP = 16f;
    private static final int SHADER_CACHE_SIZE = 4;

    private static final Object DRAW_LOCK = new Object();
    private static final Path CLIP_PATH = new Path();
    private static final float[] SHADER_TOP = new float[SHADER_CACHE_SIZE];
    private static final float[] SHADER_HEIGHT = new float[SHADER_CACHE_SIZE];
    private static final boolean[] SHADER_DARK = new boolean[SHADER_CACHE_SIZE];
    private static final LinearGradient[] SHADERS = new LinearGradient[SHADER_CACHE_SIZE];
    private static int shaderNextSlot;

    private static Paint shadowPaint;
    private static int cachedShadowStrength = -1;
    private static float cachedShadowDensity = -1f;

    private static Paint innerPaint;
    private static Paint outerPaint;

    private GlassStyle() {}

    static int strength() {
        try {
            String choice = BinocularsMods.getChoice("glass_navigation_strength");
            if ("clear".equals(choice)) {
                return STRENGTH_CLEAR;
            }
            if ("solid".equals(choice)) {
                return STRENGTH_SOLID;
            }
            return STRENGTH_BALANCED;
        } catch (Throwable ignored) {
            return STRENGTH_BALANCED;
        }
    }

    static boolean isClear() {
        return strength() == STRENGTH_CLEAR;
    }

    static boolean isSolid() {
        return strength() == STRENGTH_SOLID;
    }

    static int searchButtonMarginPx() {
        try {
            if (strength() == STRENGTH_CLEAR) {
                return 0;
            }
            return (int) Math.ceil(SEARCH_BUTTON_SHADOW_MARGIN_DP * GlassNavPatch.getDensity());
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static Canvas canvasFromScope(Object scope) {
        try {
            return GlassBlur.nativeCanvas(GlassBlur.composeCanvas(scope));
        } catch (Throwable ignored) {
            return null;
        }
    }

    static void drawShadow(Object scope, float left, float top, float w, float h, float radius) {
        if (strength() == STRENGTH_CLEAR) {
            return;
        }
        drawShadow(canvasFromScope(scope), left, top, w, h, radius);
    }

    static void drawShadow(Canvas canvas, float left, float top, float w, float h, float radius) {
        try {
            if (canvas == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.O || w <= 0f || h <= 0f) {
                return;
            }
            int mode = strength();
            if (mode == STRENGTH_CLEAR) {
                return;
            }
            float density = GlassNavPatch.getDensity();
            synchronized (DRAW_LOCK) {
                if (shadowPaint == null) {
                    shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
                    shadowPaint.setStyle(Paint.Style.FILL);
                    shadowPaint.setColor(Color.BLACK);
                }
                if (cachedShadowStrength != mode || cachedShadowDensity != density) {
                    float blurPx = (mode == STRENGTH_SOLID ? SOLID_SHADOW_BLUR_DP : BALANCED_SHADOW_BLUR_DP) * density;
                    float dyPx = SHADOW_OFFSET_Y_DP * density;
                    int shadowColor = mode == STRENGTH_SOLID ? SOLID_SHADOW_COLOR : BALANCED_SHADOW_COLOR;
                    shadowPaint.setShadowLayer(blurPx, 0f, dyPx, shadowColor);
                    cachedShadowStrength = mode;
                    cachedShadowDensity = density;
                }
                CLIP_PATH.reset();
                CLIP_PATH.addRoundRect(left, top, left + w, top + h, radius, radius, Path.Direction.CW);
                canvas.save();
                try {
                    canvas.clipOutPath(CLIP_PATH);
                    // Inset by 1px so the opaque fill's AA edge stays strictly inside clipOutPath.
                    float inset = (w > 2f && h > 2f) ? 1f : 0f;
                    float sRadius = Math.max(0f, radius - inset);
                    canvas.drawRoundRect(
                            left + inset,
                            top + inset,
                            left + w - inset,
                            top + h - inset,
                            sRadius,
                            sRadius,
                            shadowPaint);
                } finally {
                    canvas.restore();
                }
            }
        } catch (Throwable ignored) {
        }
    }

    static void drawOutline(Object scope, float left, float top, float w, float h, float radius) {
        if (strength() == STRENGTH_CLEAR) {
            return;
        }
        drawOutline(canvasFromScope(scope), left, top, w, h, radius);
    }

    static void drawOutline(Canvas canvas, float left, float top, float w, float h, float radius) {
        try {
            if (canvas == null || w <= 0f || h <= 0f) {
                return;
            }
            int mode = strength();
            if (mode == STRENGTH_CLEAR) {
                return;
            }
            float density = GlassNavPatch.getDensity();
            float strokeWidth = GlassBlur.EDGE_DP * density;
            float halfStroke = strokeWidth / 2f;
            boolean isDark = GlassNavPatch.glassIsDark();

            synchronized (DRAW_LOCK) {
                if (innerPaint == null) {
                    innerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
                    innerPaint.setStyle(Paint.Style.STROKE);
                }
                innerPaint.setStrokeWidth(strokeWidth);
                innerPaint.setShader(getOrCreateInnerShader(top, h, isDark));

                float iLeft = left + halfStroke;
                float iTop = top + halfStroke;
                float iRight = left + w - halfStroke;
                float iBottom = top + h - halfStroke;
                if (iRight > iLeft && iBottom > iTop) {
                    float iRadius = Math.max(0f, radius - halfStroke);
                    canvas.drawRoundRect(iLeft, iTop, iRight, iBottom, iRadius, iRadius, innerPaint);
                }

                if (outerPaint == null) {
                    outerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
                    outerPaint.setStyle(Paint.Style.STROKE);
                }
                outerPaint.setStrokeWidth(strokeWidth);
                int hairlineColor;
                if (mode == STRENGTH_SOLID) {
                    hairlineColor = isDark ? SOLID_HAIRLINE_DARK : SOLID_HAIRLINE_LIGHT;
                } else {
                    hairlineColor = isDark ? BALANCED_HAIRLINE_DARK : BALANCED_HAIRLINE_LIGHT;
                }
                outerPaint.setColor(hairlineColor);
                canvas.drawRoundRect(
                        left - halfStroke,
                        top - halfStroke,
                        left + w + halfStroke,
                        top + h + halfStroke,
                        radius + halfStroke,
                        radius + halfStroke,
                        outerPaint);
            }
        } catch (Throwable ignored) {
        }
    }

    private static LinearGradient getOrCreateInnerShader(float top, float h, boolean isDark) {
        for (int i = 0; i < SHADER_CACHE_SIZE; i++) {
            if (SHADERS[i] != null
                    && SHADER_TOP[i] == top
                    && SHADER_HEIGHT[i] == h
                    && SHADER_DARK[i] == isDark) {
                return SHADERS[i];
            }
        }
        int colorStart = isDark ? 0x40FFFFFF : 0xB3FFFFFF;
        int colorEnd = isDark ? 0x0DFFFFFF : 0x14000000;
        LinearGradient shader = new LinearGradient(0f, top, 0f, top + h, colorStart, colorEnd, Shader.TileMode.CLAMP);
        int slot = shaderNextSlot;
        shaderNextSlot = (slot + 1) % SHADER_CACHE_SIZE;
        SHADER_TOP[slot] = top;
        SHADER_HEIGHT[slot] = h;
        SHADER_DARK[slot] = isDark;
        SHADERS[slot] = shader;
        return shader;
    }
}
