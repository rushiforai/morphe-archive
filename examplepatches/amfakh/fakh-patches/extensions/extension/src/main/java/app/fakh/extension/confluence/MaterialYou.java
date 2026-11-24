/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.confluence;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.AtlassianColors;

/**
 * Material You and pitch black for Confluence, whose screens are React Native. Its JavaScript paints with Atlassian
 * tokens, which reach Android as plain colors in three places: the color props of views, the spans of text, and the
 * paint of SVG icons; native Compose screens build theirs in static color schemes. Each is rewritten here by value,
 * while its switch in Fakh Patches is on. The switches are read once per launch, so a change applies after a restart.
 */
@SuppressWarnings("unused")
public final class MaterialYou {
    /** The app, which resolves the wallpaper's colors; looked up once, since every prop of every view passes here. */
    private static Context context;

    /** The dark page background (0xRRGGBB), which pitch black turns black. */
    private static final int DARK_CANVAS = 0x1F1F21;
    /** The dark background of the navigation bar, buttons and menus (0xRRGGBB), lowered to the canvas role. */
    private static final int DARK_CARD = 0x242528;

    /** The keys of the Fakh Patches switches. */
    static final String MATERIAL_YOU = "fakh_material_you";
    static final String PITCH_BLACK = "fakh_pitch_black";
    static final String GLASS = "fakh_glass_navbar";
    /** The background blur of the glass bar. */
    static final String LIQUID_GLASS = "fakh_liquid_glass";

    /** The link behind "Rate us", which the Fakh Patches row opens in its place. */
    private static final String RATE_US = "https://play.google.com/store/apps/details?id=com.atlassian.android.confluence.core";

    /** The star of the "Rate us" row's icon. */
    private static final String RATE_US_STAR = "M6.655 6.336 8 2.84l1.345 3.497 3.506.27-2.7 2.25.973 3.627L8 10.341"
            + "l-3.124 2.142.973-3.627-2.7-2.25z";
    /** The Material extension icon (a puzzle piece), scaled from its 24-unit box to the star's 16. */
    private static final String PUZZLE = "M13.667,7.333H12.667V4.667c0,-0.733 -0.6,-1.333 -1.333,-1.333h-2.667V2.333"
            + "C8.667,1.413 7.92,0.667 7,0.667S5.333,1.413 5.333,2.333V3.333H2.667c-0.733,0 -1.327,0.6 -1.327,1.333"
            + "v2.533H2.333c0.993,0 1.8,0.807 1.8,1.8s-0.807,1.8 -1.8,1.8H1.333V13.333c0,0.733 0.6,1.333 1.333,1.333"
            + "h2.533v-1c0,-0.993 0.807,-1.8 1.8,-1.8 0.993,0 1.8,0.807 1.8,1.8V14.667H11.333c0.733,0 1.333,-0.6 1.333,-1.333"
            + "v-2.667h1c0.92,0 1.667,-0.747 1.667,-1.667S14.587,7.333 13.667,7.333z";

    /** The switches as read at the first color of this launch, or null before it. */
    private static Boolean materialYou;
    private static Boolean pitchBlack;

    private MaterialYou() {
    }

    /** Whether Material You is patched in and its switch is on. */
    static boolean materialYou() {
        if (materialYou == null) {
            Context context = context();
            if (context == null) return false;
            materialYou = Features.on(MATERIAL_YOU);
        }
        return materialYou;
    }

    /** Whether Pitch black is patched in and its switch is on. */
    static boolean pitchBlack() {
        if (pitchBlack == null) {
            Context context = context();
            if (context == null) return false;
            pitchBlack = Features.on(PITCH_BLACK);
        }
        return pitchBlack;
    }

    /**
     * Injected at the start of React Native's text transform, which every piece of text passes before it is measured
     * and drawn: "Rate us" in the Account screen becomes the Fakh Patches row.
     *
     * @param text a piece of a text view's text
     * @return the row's label, or {@code text}
     */
    public static String label(String text) {
        return "Rate us".equals(text) ? "Fakh Patches" : text;
    }

    /**
     * Injected at the start of React Native's Linking.openURL: the "Rate us" row's link opens the Fakh Patches page.
     *
     * @param module the Linking module, whose current activity starts the page
     * @param url    the link the JavaScript opens
     * @return true when the page was opened in the link's place
     */
    public static boolean openUrl(Object module, String url) {
        if (url == null || !url.startsWith(RATE_US)) return false;
        Context from = null;
        try {
            from = (Activity) module.getClass().getMethod("getCurrentActivity").invoke(module);
        } catch (ReflectiveOperationException ignored) {
            // The page opens in a task of its own below.
        }
        Intent intent = new Intent();
        if (from == null) {
            from = context();
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        if (from == null) return false;
        from.startActivity(intent.setClassName(from, FakhPatchesActivity.class.getName()));
        return true;
    }

    /**
     * Injected at the start of react-native-svg's path setter: the star of the "Rate us" row, which no other icon draws,
     * becomes a puzzle piece (the Material extension icon) for the Fakh Patches row, in the same 16-unit box.
     *
     * @param d the path data a shape is given
     * @return the puzzle piece in the star's place, or {@code d}
     */
    public static String path(String d) {
        return RATE_US_STAR.equals(d) ? PUZZLE : d;
    }

    /** The app's context, or null while the process has no Application yet. */
    private static Context context() {
        if (context == null) context = AppRuntime.application();
        return context;
    }

    /**
     * Injected before ColorPropConverter.getColor returns: the color of a view prop (background, border, text input,
     * switch, spinner).
     *
     * @param color the color React Native resolved, or null
     * @return the Material You or pitch black color, or {@code color}
     */
    public static Integer prop(Integer color) {
        Context context = context();
        if (color == null || context == null) return color;
        int argb = AtlassianColors.color(context, color, materialYou(), pitchBlack(), DARK_CANVAS, DARK_CARD);
        return argb == color ? color : Integer.valueOf(argb);
    }

    /**
     * Injected after each color a native Compose color scheme loads in its static initializer.
     *
     * @param packed a packed Compose color
     * @return the Material You or pitch black color, packed, or {@code packed}
     */
    public static long packed(long packed) {
        Context context = context();
        if ((packed & 0x3FL) != 0 || context == null) return packed;
        int argb = (int) (packed >>> 32);
        int color = AtlassianColors.color(context, argb, materialYou(), pitchBlack(), DARK_CANVAS, DARK_CARD);
        return color == argb ? packed : (color & 0xFFFFFFFFL) << 32;
    }

    /**
     * Injected at the start of the text color span and before an SVG shape sets its paint color: blues take the
     * accent, neutrals stay, so white text and icons on a button keep their white.
     *
     * @param argb the color of the text or shape
     * @return the accent tone, or {@code argb}
     */
    public static int accent(int argb) {
        Context context = context();
        return context == null || !materialYou() ? argb : AtlassianColors.accent(context, argb);
    }
}
