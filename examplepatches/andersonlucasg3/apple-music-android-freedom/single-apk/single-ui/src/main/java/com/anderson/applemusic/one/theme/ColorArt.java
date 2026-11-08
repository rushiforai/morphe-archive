package com.anderson.applemusic.one.theme;

import android.graphics.Bitmap;

/**
 * Extracts a dominant, readable colour from cover art. The full-screen player tints its
 * background gradient with it (the API 29-friendly equivalent of the companions'
 * blurred artwork wash: no RenderEffect, no RenderScript, no software blur).
 */
public final class ColorArt {

    private ColorArt() {
    }

    public static int dominant(Bitmap bitmap) {
        if (bitmap == null || bitmap.isRecycled()) return Tokens.SURFACE;
        Bitmap small = null;
        try {
            small = Bitmap.createScaledBitmap(bitmap, 24, 24, false);
            long red = 0L;
            long green = 0L;
            long blue = 0L;
            long weightSum = 0L;
            for (int y = 0; y < small.getHeight(); y++) {
                for (int x = 0; x < small.getWidth(); x++) {
                    int pixel = small.getPixel(x, y);
                    if (((pixel >>> 24) & 0xFF) < 128) continue;
                    int r = (pixel >> 16) & 0xFF;
                    int g = (pixel >> 8) & 0xFF;
                    int b = pixel & 0xFF;
                    int luma = (r * 299 + g * 587 + b * 114) / 1000;
                    // Skip near-black and near-white: they make a flat wash.
                    if (luma < 26 || luma > 232) continue;
                    int max = Math.max(r, Math.max(g, b));
                    int min = Math.min(r, Math.min(g, b));
                    // Weight by saturation so a red cover wins over its grey border.
                    int weight = 1 + (max - min) * 2;
                    red += (long) r * weight;
                    green += (long) g * weight;
                    blue += (long) b * weight;
                    weightSum += weight;
                }
            }
            if (weightSum == 0L) return Tokens.SURFACE;
            int r = (int) (red / weightSum);
            int g = (int) (green / weightSum);
            int b = (int) (blue / weightSum);
            return 0xFF000000 | (r << 16) | (g << 8) | b;
        } catch (Throwable ignored) {
            return Tokens.SURFACE;
        } finally {
            if (small != null && small != bitmap) small.recycle();
        }
    }

    /** Linear mix: {@code amount} 0 returns {@code from}, 1 returns {@code to}. */
    public static int blend(int from, int to, float amount) {
        float f = Math.max(0f, Math.min(1f, amount));
        int a = (int) (alpha(from) + (alpha(to) - alpha(from)) * f);
        int r = (int) (red(from) + (red(to) - red(from)) * f);
        int g = (int) (green(from) + (green(to) - green(from)) * f);
        int b = (int) (blue(from) + (blue(to) - blue(from)) * f);
        return (a << 24) | (r << 16) | (g << 8) | b;
    }

    private static int alpha(int color) {
        return (color >>> 24) & 0xFF;
    }

    private static int red(int color) {
        return (color >> 16) & 0xFF;
    }

    private static int green(int color) {
        return (color >> 8) & 0xFF;
    }

    private static int blue(int color) {
        return color & 0xFF;
    }
}
