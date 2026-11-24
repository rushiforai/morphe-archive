/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.jira;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Process;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.AtlassianColors;

/**
 * Material You for Jira's Compose color palettes, which define their colors in code, and the Material You and pitch
 * black switches. The View colors come from the resource patch, under the {@code round} (Material You) and
 * {@code notlong} (pitch black) qualifiers, which {@link #wrap(Context)} turns on or off for every activity.
 */
@SuppressWarnings("unused")
public final class MaterialYou {
    /** The keys of the Fakh Patches switches. */
    private static final String MATERIAL_YOU = "fakh_material_you";
    private static final String PITCH_BLACK = "fakh_pitch_black";
    private static final String HIDE_ROVO = "fakh_hide_rovo";
    private static final String HIDE_TAB_LABELS = "fakh_hide_tab_labels";
    private static final String GLASS_NAVBAR = "fakh_glass_navbar";
    private static final String LIQUID_GLASS = "fakh_liquid_glass";
    /** The section of the bottom bar's tab switches, which the page shows as one row that opens a picker sheet. */
    static final String TABS_SECTION = "Navigation bar tabs";

    /** The darkest page background (0xRRGGBB), the canvas behind cards, which pitch black turns black. */
    private static final int DARK_CANVAS = 0x111213;
    /** The card background one step up (0xRRGGBB), which pitch black lowers to the canvas role. */
    private static final int DARK_CARD = 0x18191A;

    private MaterialYou() {
    }

    /**
     * Injected at the end of the static initializers of Jira's Compose palettes, once per color.
     *
     * @param packed a packed Compose color
     * @return the accent tone of the same lightness for a blue, or the surface role for an opaque neutral
     *     background, keeping the color's own alpha, or {@code packed}
     */
    public static long paletteColor(long packed) {
        if ((packed & 0x3FL) != 0 || Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return packed;
        Context context = AppRuntime.application();
        if (context == null || !materialYou(context)) return packed;
        return pack(AtlassianColors.color(context, (int) (packed >>> 32), true, pitchBlack(context), DARK_CANVAS, DARK_CARD));
    }

    /**
     * Injected before the Rovo button is drawn: the container of the button in a wallpaper accent tone, dark in dark
     * mode and light in light mode. Under the glass bar it has no container, so only the icon shows.
     *
     * @param packed the button's container color, packed
     * @return the accent tone, transparent under the glass bar, or {@code packed} while Material You is off
     */
    public static long rovoContainer(long packed) {
        return rovoFlat() ? pack(0) : rovoTone(packed, android.R.color.system_accent1_800, android.R.color.system_accent1_200);
    }

    /** Whether the Rovo button is only its icon, as the glass bar is on. It does not depend on Material You. */
    public static boolean rovoFlat() {
        return AppRuntime.application() != null && glassNavigationBar();
    }

    /**
     * Injected before the Rovo button is drawn: the color of its icon, the accent tone that reads on
     * {@link #rovoContainer}, or the accent of the bar's selected tab where the icon has nothing behind it.
     *
     * @param packed the button's icon color, packed
     * @return the accent tone, or {@code packed} while Material You is off
     */
    public static long rovoContent(long packed) {
        if (!rovoFlat()) return rovoTone(packed, android.R.color.system_accent1_100, android.R.color.system_accent1_900);
        // The accent of the bar's selected tab: the wallpaper's, or Jira's blue.
        Context context = AppRuntime.application();
        return pack(app.fakh.extension.shared.MaterialYou.accent(context, materialYou(context), 0xFF1868DB, 0xFF669DF1));
    }

    /** The color of a tone in the theme's mode, packed, or {@code packed} without the wallpaper's colors. */
    private static long rovoTone(long packed, int dark, int light) {
        Context context = AppRuntime.application();
        if (context == null || !app.fakh.extension.shared.MaterialYou.wallpaper(materialYou(context))) return packed;
        return pack(context.getColor(app.fakh.extension.shared.MaterialYou.night(context) ? dark : light));
    }

    /** The canvas of Jira's pages, behind their cards, as the palettes color it. */
    static int canvas(Context context) {
        return (int) (paletteColor(pack(app.fakh.extension.shared.MaterialYou.night(context) ? 0xFF000000 | DARK_CANVAS : 0xFFF8F8F8)) >>> 32);
    }

    /** The cards of Jira's pages, as the palettes color them. */
    static int card(Context context) {
        return (int) (paletteColor(pack(app.fakh.extension.shared.MaterialYou.night(context) ? 0xFF000000 | DARK_CARD : 0xFFFFFFFF)) >>> 32);
    }

    /**
     * Whether Material You is patched in and its switch is on. Read when the palettes are built, so a change applies
     * after a restart. Without the patch the glass bar's pill stays neutral.
     */
    static boolean materialYou(Context context) {
        return Features.on(MATERIAL_YOU);
    }

    /** Whether the pitch black switch is on. Read when the palettes are built, so a change applies after a restart. */
    private static boolean pitchBlack(Context context) {
        return Features.on(PITCH_BLACK);
    }

    /**
     * Injected at the start of AppCompatActivity.attachBaseContext. Selects the resource patch's colors, which sit
     * under two screen qualifiers that phones never report on their own terms here: {@code round} for Material You
     * and {@code notlong} for pitch black. Both are forced on or off from the settings.
     *
     * @param activity the activity being created, which the Settings snackbar later needs
     * @param base the activity's base context
     * @return a context with the screen shape overridden
     */
    public static Context wrap(android.app.Activity activity, Context base) {
        FakhSettings.remember(activity);
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return base;
        int layout = base.getResources().getConfiguration().screenLayout;
        Configuration override = new Configuration();
        // Layout direction bits left at 0 keep the base context's own direction.
        override.screenLayout = layout & ~(Configuration.SCREENLAYOUT_LONG_MASK | Configuration.SCREENLAYOUT_ROUND_MASK
                | Configuration.SCREENLAYOUT_LAYOUTDIR_MASK)
                | (pitchBlack(base) ? Configuration.SCREENLAYOUT_LONG_NO : Configuration.SCREENLAYOUT_LONG_YES)
                | (materialYou(base) ? Configuration.SCREENLAYOUT_ROUND_YES : Configuration.SCREENLAYOUT_ROUND_NO);
        return base.createConfigurationContext(override);
    }

    /** Whether the bottom bar hides the text under its icons. */
    static boolean hideTabLabels(Context context) {
        return Features.on(HIDE_TAB_LABELS);
    }

    /**
     * Whether the bottom bar is the glass capsule: its patch is in and its switch is on. Read when the bar is built and
     * when the app lays out its pages, so a change applies after a restart.
     *
     * @return whether the bar is glass
     */
    public static boolean glassNavigationBar() {
        return Features.on(GLASS_NAVBAR);
    }

    /** Whether the glass bar blurs what's behind it. */
    static boolean liquidGlass(Context context) {
        return Features.on(LIQUID_GLASS);
    }

    /** Whether the bottom bar shows the tab with this label; tabs it has no switch for always show. */
    static boolean tabShown(Context context, CharSequence label) {
        return label == null || !Features.has("fakh_tab_" + label) || Features.on("fakh_tab_" + label);
    }

    /** Whether the Rovo button and icons are hidden. */
    public static boolean hideRovo() {
        return Features.on(HIDE_ROVO);
    }

    /** The answers of the methods every object has, for proxies. */
    static Object objectMethod(Object proxy, Method method, Object[] args) {
        switch (method.getName()) {
            case "equals":
                return args != null && proxy == args[0];
            case "hashCode":
                return System.identityHashCode(proxy);
            default:
                return "FakhPatchesRow";
        }
    }

    /** An sRGB Compose color: the ARGB value in the high 32 bits, the color space id (sRGB is 0) below. */
    private static long pack(int argb) {
        return (argb & 0xFFFFFFFFL) << 32;
    }
}
