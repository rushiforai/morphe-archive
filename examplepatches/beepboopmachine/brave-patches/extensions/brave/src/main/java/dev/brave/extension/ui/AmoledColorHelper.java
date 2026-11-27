package dev.brave.extension.ui;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.util.TypedValue;

public class AmoledColorHelper {
    private static volatile boolean sLastKnownNightMode = false;

    public static boolean isNightMode(Context context) {
        if (context == null) return sLastKnownNightMode;
        try {
            int uiMode = context.getResources().getConfiguration().uiMode;
            boolean night = (uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            sLastKnownNightMode = night;
            return night;
        } catch (Throwable t) {
            return sLastKnownNightMode;
        }
    }

    /**
     * Direct replacement for g7b.g(Context, TypedValue)I.
     */
    public static int getThemeColor(Context context, TypedValue typedValue) {
        if (context == null || typedValue == null) return 0;
        int color;
        try {
            if (typedValue.resourceId != 0) {
                color = context.getColor(typedValue.resourceId);
            } else {
                color = typedValue.data;
            }
        } catch (Throwable t) {
            color = typedValue.data;
        }
        return remapColor(context, color);
    }

    public static int remapColor(Context context, int color) {
        if (!isNightMode(context)) {
            return color;
        }
        return remapColorInternal(color);
    }

    public static int remapColor(int color) {
        if (!sLastKnownNightMode) {
            return color;
        }
        return remapColorInternal(color);
    }

    private static int remapColorInternal(int color) {
        int alpha = Color.alpha(color);
        if (alpha == 0) return color;
        int rgb = color & 0x00FFFFFF;

        // Exact Brave v1.100.58 + Material 3 + Chromium dark surface tokens -> Pure AMOLED Black
        switch (rgb) {
            case 0x1E2029: // Brave primary dark surface (toolbar/menu/bg)
            case 0x1E2025: // Brave dark surface container
            case 0x17171F: // Brave dark background
            case 0x1F1F27: // Brave dark elevated surface
            case 0x1F1F23: // Brave dark gray
            case 0x1C1C1D: // Brave dark surface
            case 0x1F1F1F: // M3 dark surface baseline
            case 0x141414: // Chrome dark surface
            case 0x121212: // Material baseline dark surface
            case 0x202124: // Google/Chromium dark gray surface
            case 0x212529: // Brave dark card
            case 0x0F0F0F: // Near black
                return (alpha << 24) | 0x000000;

            // Stepped elevated containers (3-dot menu, omnibox, sheets, cards)
            case 0x1B1B1B:
            case 0x242424:
                return (alpha << 24) | 0x08080A;
            case 0x272733:
            case 0x28292C:
            case 0x2B2B2B:
            case 0x2E3039: // Brave elevated dark blue-gray (omnibox / menu / cards)
            case 0x2D2F31:
                return (alpha << 24) | 0x0C0C0E;
            case 0x303134:
            case 0x343438:
            case 0x36373A:
            case 0x383839:
                return (alpha << 24) | 0x121214;

            default:
                // Only apply broad dark-surface fallback to fully opaque colors so semi-transparent
                // dividers, scrims, and secondary overlays preserve their intended contrast.
                if (alpha != 0xFF) {
                    return color;
                }
                int r = (rgb >> 16) & 0xFF;
                int g = (rgb >> 8) & 0xFF;
                int b = rgb & 0xFF;
                int max = Math.max(r, Math.max(g, b));
                int min = Math.min(r, Math.min(g, b));
                int spread = max - min;
                // Catch Brave dark charcoal & blue-gray surface shades (while preserving vivid brand accents)
                if (max <= 0x26 && spread <= 16) {
                    return (alpha << 24) | 0x000000;
                }
                if (max <= 0x3B && spread <= 18) {
                    return (alpha << 24) | 0x0C0C0E;
                }
                return color;
        }
    }
}
