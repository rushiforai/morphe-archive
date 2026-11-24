/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.shared;

import android.content.Context;
import android.os.Build;

import java.util.HashMap;
import java.util.Map;

/**
 * The Atlassian Design System colors that Jira and Confluence share, as the Material You roles and the pitch black
 * colors that replace them. Both apps paint with the same tokens, so one table serves both.
 */
public final class AtlassianColors {
    // Material 3 surface roles (Android 14), with the neutral tones closest to them on Android 12 and 13.
    private static final boolean ROLES = Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE;

    /** Atlassian blue (0xRRGGBB) to the accent tone of the same lightness. */
    private static final Map<Integer, Integer> ACCENTS = new HashMap<>();
    /** Light neutral backgrounds (0xRRGGBB) to the surface role that replaces them. */
    private static final Map<Integer, Integer> LIGHT_SURFACES = new HashMap<>();
    /** Dark neutral backgrounds (0xRRGGBB) to the surface role that replaces them. */
    private static final Map<Integer, Integer> DARK_SURFACES = new HashMap<>();

    /** The darkest gray of the palette (0xRRGGBB), which takes the dark surface role. */
    private static final int DARK_CANVAS = 0x111213;

    static {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            ACCENTS.put(0xE9F2FE, android.R.color.system_accent1_50);
            ACCENTS.put(0xDEEBFF, android.R.color.system_accent1_50);
            ACCENTS.put(0xCFE1FD, android.R.color.system_accent1_100);
            ACCENTS.put(0xB3D4FF, android.R.color.system_accent1_100);
            ACCENTS.put(0xADCBFB, android.R.color.system_accent1_200);
            ACCENTS.put(0x8FB8F6, android.R.color.system_accent1_200);
            ACCENTS.put(0x669DF1, android.R.color.system_accent1_200);
            ACCENTS.put(0x4C9AFF, android.R.color.system_accent1_200);
            ACCENTS.put(0x4794FF, android.R.color.system_accent1_200);
            ACCENTS.put(0x4688EC, android.R.color.system_accent1_500);
            ACCENTS.put(0x2684FF, android.R.color.system_accent1_500);
            ACCENTS.put(0x247FFF, android.R.color.system_accent1_500);
            ACCENTS.put(0x357DE8, android.R.color.system_accent1_600);
            ACCENTS.put(0x1868DB, android.R.color.system_accent1_600);
            ACCENTS.put(0x0C66E4, android.R.color.system_accent1_600);
            ACCENTS.put(0x0065FF, android.R.color.system_accent1_600);
            ACCENTS.put(0x0052CC, android.R.color.system_accent1_600);
            ACCENTS.put(0x0055CC, android.R.color.system_accent1_600);
            ACCENTS.put(0x1558BC, android.R.color.system_accent1_700);
            ACCENTS.put(0x0747A6, android.R.color.system_accent1_700);
            ACCENTS.put(0x144794, android.R.color.system_accent1_800);
            ACCENTS.put(0x123263, android.R.color.system_accent1_800);
            ACCENTS.put(0x09326C, android.R.color.system_accent1_800);
            ACCENTS.put(0x1C2B42, android.R.color.system_accent1_900);
            // Light: cards and bars (white), the canvas behind them, tinted fills, borders. The legacy N* ramp
            // follows the same steps.
            LIGHT_SURFACES.put(0xFFFFFF, role(android.R.color.system_surface_light, android.R.color.system_neutral2_50));
            LIGHT_SURFACES.put(0xF8F8F8, role(android.R.color.system_surface_container_low_light, android.R.color.system_neutral2_100));
            LIGHT_SURFACES.put(0xF4F5F7, role(android.R.color.system_surface_container_low_light, android.R.color.system_neutral2_100));
            LIGHT_SURFACES.put(0xF0F1F2, role(android.R.color.system_surface_container_low_light, android.R.color.system_neutral2_100));
            LIGHT_SURFACES.put(0xEBECF0, role(android.R.color.system_surface_container_low_light, android.R.color.system_neutral2_100));
            LIGHT_SURFACES.put(0xDDDEE1, role(android.R.color.system_surface_container_highest_light, android.R.color.system_neutral2_200));
            // Dark: the canvas behind cards, cards a step lighter, raised surfaces of sheets and menus, borders.
            DARK_SURFACES.put(DARK_CANVAS, role(android.R.color.system_surface_dark, android.R.color.system_neutral1_1000));
            DARK_SURFACES.put(0x18191A, role(android.R.color.system_surface_container_dark, android.R.color.system_neutral1_900));
            DARK_SURFACES.put(0x1F1F21, role(android.R.color.system_surface_container_high_dark, android.R.color.system_neutral2_800));
            DARK_SURFACES.put(0x242528, role(android.R.color.system_surface_container_highest_dark, android.R.color.system_neutral2_700));
            DARK_SURFACES.put(0x2B2C2F, role(android.R.color.system_surface_container_highest_dark, android.R.color.system_neutral2_700));
            DARK_SURFACES.put(0x303134, role(android.R.color.system_surface_container_highest_dark, android.R.color.system_neutral2_700));
        }
    }

    private AtlassianColors() {
    }

    /** The Material 3 role on Android 14 and up, otherwise the neutral tone closest to it. */
    private static int role(int role, int fallback) {
        return ROLES ? role : fallback;
    }

    /**
     * An Atlassian color as Material You and pitch black paint it.
     *
     * @param context     a context that resolves the wallpaper's colors
     * @param argb        the app's color
     * @param materialYou whether blues take the accent and neutral backgrounds the surface roles
     * @param pitchBlack  whether the dark canvas turns black, and the dark cards the canvas role
     * @param darkCanvas  the app's dark page background (0xRRGGBB), which pitch black turns black
     * @param darkCard    the app's dark card background (0xRRGGBB), which pitch black lowers to the canvas role
     * @return the replacement, keeping the color's own alpha, or {@code argb}
     */
    public static int color(Context context, int argb, boolean materialYou, boolean pitchBlack, int darkCanvas, int darkCard) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return argb;
        int rgb = argb & 0xFFFFFF;
        boolean opaque = (argb >>> 24) == 0xFF;
        if (pitchBlack && opaque && rgb == darkCanvas) return 0xFF000000;
        if (pitchBlack && opaque && rgb == darkCard && materialYou) {
            return 0xFF000000 | context.getColor(DARK_SURFACES.get(DARK_CANVAS));
        }
        if (!materialYou) return argb;
        Integer tone = ACCENTS.get(rgb);
        if (tone == null && opaque) {
            tone = LIGHT_SURFACES.get(rgb);
            if (tone == null) tone = DARK_SURFACES.get(rgb);
        }
        return tone == null ? argb : (argb & 0xFF000000) | (context.getColor(tone) & 0xFFFFFF);
    }

    /**
     * An Atlassian blue as the accent tone of the same lightness, for text and icons, which keep their neutrals.
     *
     * @param context a context that resolves the wallpaper's colors
     * @param argb    the app's color
     * @return the accent tone with the color's own alpha, or {@code argb}
     */
    public static int accent(Context context, int argb) {
        Integer tone = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S ? ACCENTS.get(argb & 0xFFFFFF) : null;
        return tone == null ? argb : (argb & 0xFF000000) | (context.getColor(tone) & 0xFFFFFF);
    }
}
