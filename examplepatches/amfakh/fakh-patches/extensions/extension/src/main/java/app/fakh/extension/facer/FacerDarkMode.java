/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.facer;

import android.app.Application;
import android.content.res.Configuration;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import app.fakh.extension.shared.AppRuntime;

/**
 * Remaps Facer's hardcoded Compose light surfaces and dark text to dark tones
 * whenever the
 * system is in dark mode.
 */
@SuppressWarnings("unused")
public final class FacerDarkMode {
    private static final long COLOR_CANVAS_DARK = 0x000000L;
    private static final long COLOR_SURFACE_DARK = 0x101012L;
    private static final long COLOR_RAISED_DARK = 0x1C1C1EL;
    private static final long COLOR_TEXT_PRIMARY_DARK = 0xEAEAEAL;
    private static final long COLOR_TEXT_SECONDARY_DARK = 0xA8A8B0L;

    private FacerDarkMode() {
    }

    /** Returns true when the host app's configuration is in night mode. */
    public static boolean isDark() {
        Application app = AppRuntime.application();
        if (app == null)
            return false;
        int mode = app.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES;
    }

    /**
     * Remaps neutral white / near-white Compose background colors to dark surfaces
     * in dark mode.
     */
    public static long surfaceColor(long packed) {
        if (!isDark() || (packed & 0x3FL) != 0L)
            return packed;
        long argb = packed >>> 32;
        long a = (argb >>> 24) & 0xFFL;
        if (a == 0L)
            return packed;
        int r = (int) ((argb >>> 16) & 0xFFL);
        int g = (int) ((argb >>> 8) & 0xFFL);
        int b = (int) (argb & 0xFFL);
        int max = Math.max(r, Math.max(g, b));
        int min = Math.min(r, Math.min(g, b));
        if (max - min > 20 || min < 226)
            return packed;
        long rgb;
        if (min >= 250) {
            rgb = COLOR_CANVAS_DARK;
        } else if (min >= 240) {
            rgb = COLOR_SURFACE_DARK;
        } else {
            rgb = COLOR_RAISED_DARK;
        }
        return ((a << 24) | rgb) << 32;
    }

    /**
     * Remaps neutral black / dark-gray Compose text colors to light text in dark
     * mode.
     */
    public static long textColor(long packed) {
        if (!isDark() || (packed & 0x3FL) != 0L)
            return packed;
        long argb = packed >>> 32;
        long a = (argb >>> 24) & 0xFFL;
        if (a == 0L)
            return packed;
        int r = (int) ((argb >>> 16) & 0xFFL);
        int g = (int) ((argb >>> 8) & 0xFFL);
        int b = (int) (argb & 0xFFL);
        int max = Math.max(r, Math.max(g, b));
        int min = Math.min(r, Math.min(g, b));
        if (max - min > 24 || max > 125)
            return packed;
        long rgb = max <= 72 ? COLOR_TEXT_PRIMARY_DARK : COLOR_TEXT_SECONDARY_DARK;
        return ((a << 24) | rgb) << 32;
    }

    /**
     * Default `LocalContentColor` for Compose screens that omit an explicit text
     * color.
     */
    public static long defaultContentColor() {
        return (isDark() ? (0xFF000000L | COLOR_TEXT_PRIMARY_DARK) : 0xFF000000L) << 32;
    }

    /**
     * Base shimmer skeleton color (dark gray in night mode, original light gray in
     * light mode).
     */
    public static long shimmerBase() {
        return (isDark() ? 0xFF141416L : 0xFFE6E8EBL) << 32;
    }

    /**
     * Highlight shimmer skeleton color (slightly lighter dark gray in night mode).
     */
    public static long shimmerHighlight() {
        return (isDark() ? 0xFF242428L : 0xFFF7F8F9L) << 32;
    }

    /**
     * Remaps white / near-white ARGB stops in Compose LinearGradient arrays to dark
     * canvas in night mode.
     */
    public static void remapGradientColors(int[] colors) {
        if (!isDark() || colors == null)
            return;
        for (int i = 0; i < colors.length; i++) {
            int c = colors[i];
            int a = (c >>> 24) & 0xFF;
            int r = (c >>> 16) & 0xFF;
            int g = (c >>> 8) & 0xFF;
            int b = c & 0xFF;
            int max = Math.max(r, Math.max(g, b));
            int min = Math.min(r, Math.min(g, b));
            if (max - min <= 20 && min >= 230) {
                colors[i] = (a << 24) | 0x000000;
            }
        }
    }

    /**
     * Replaces `null` chrome color on CustomToolbarView with pitch black in night
     * mode so title and icons turn white.
     */
    public static Integer toolbarChromeColor(Integer color) {
        if (color == null && isDark()) {
            return 0xFF000000;
        }
        return color;
    }

    /**
     * Remaps hardcoded dark ARGB text colors (e.g. WatchfaceViewFactory) to light
     * text in night mode.
     */
    public static int argbTextColor(int color) {
        if (!isDark())
            return color;
        if (color == 0)
            return 0xFFEAEAEA;
        int a = (color >>> 24) & 0xFF;
        if (a == 0)
            return color;
        int r = (color >>> 16) & 0xFF;
        int g = (color >>> 8) & 0xFF;
        int b = color & 0xFF;
        int max = Math.max(r, Math.max(g, b));
        int min = Math.min(r, Math.min(g, b));
        if (max - min > 24 || max > 125)
            return color;
        return (a << 24) | (max <= 72 ? 0xEAEAEA : 0xA8A8B0);
    }

    /**
     * Remaps white / near-white status bar colors (from SystemBarInsets) to dark
     * canvas in night mode.
     */
    public static int statusBarColor(int color) {
        if (!isDark())
            return color;
        int a = (color >>> 24) & 0xFF;
        if (a == 0)
            return color;
        int r = (color >>> 16) & 0xFF;
        int g = (color >>> 8) & 0xFF;
        int b = color & 0xFF;
        int max = Math.max(r, Math.max(g, b));
        int min = Math.min(r, Math.min(g, b));
        if (max - min <= 20 && min >= 226) {
            return (a << 24) | 0x000000;
        }
        return color;
    }

    /** Keeps system bar icons light (non-dark) whenever dark mode is active. */
    public static boolean lightSystemBars(boolean light) {
        return !isDark() && light;
    }

    /**
     * Tints the toolbar search icon and SearchView input text/icons light in dark
     * mode.
     */
    public static void styleSearchMenuItem(MenuItem item) {
        if (!isDark() || item == null)
            return;
        Drawable icon = item.getIcon();
        if (icon != null) {
            icon.mutate().setColorFilter(0xFFEAEAEA, PorterDuff.Mode.SRC_IN);
        }
        View actionView = item.getActionView();
        if (actionView != null) {
            tintSearchTree(actionView);
        }
    }

    private static void tintSearchTree(View view) {
        if (view instanceof TextView) {
            TextView tv = (TextView) view;
            tv.setTextColor(0xFFEAEAEA);
            tv.setHintTextColor(0xFFA8A8B0);
        } else if (view instanceof ImageView) {
            Drawable d = ((ImageView) view).getDrawable();
            if (d != null) {
                d.mutate().setColorFilter(0xFFEAEAEA, PorterDuff.Mode.SRC_IN);
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) {
                tintSearchTree(vg.getChildAt(i));
            }
        }
    }
}
