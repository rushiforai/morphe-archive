/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.fomo;

import android.content.Context;
import android.os.Build;
import android.view.View;

import app.fakh.extension.shared.Features;

/**
 * Recolors FOMO's dark palette with the wallpaper colors. React Native converts every color prop through
 * {@code ColorPropConverter.getColor}, so the patch routes its result through {@link #remap}.
 */
public final class MaterialYou {
    private static final int[] CARD = {0x2A2A2A, 0x303030, 0x2E2E2E, 0x212121};
    private static final int[] BORDER = {0x494949, 0x4A4A4A, 0x434343};
    private static final int[] ACCENT_STRONG = {0x09436C, 0x0A5991, 0x0C43A2};
    private static final int[] ACCENT = {0x2F95DC, 0x3A90F7, 0x3F8EF1, 0x2980B9, 0x1F6FDE, 0x1E56B3, 0x007AFF};

    /** Whether the patch is in the app and its switch in Fakh Patches is on. */
    private static boolean materialYou() {
        return Features.on(FomoSettings.MATERIAL_YOU);
    }

    private static boolean pitchBlack() {
        return Features.on(FomoSettings.PITCH_BLACK);
    }

    private static boolean hidePostDivider() {
        return Features.on(FomoSettings.HIDE_POST_DIVIDER);
    }

    /** Any context, for the text spans, which are built without one. */
    private static Context appContext;

    private MaterialYou() {
    }

    /** {@link #remap} for a color that is applied to [view]. */
    public static Integer remapFor(View view, Integer color) {
        Integer mapped = remap(color, view.getContext());
        // The divider is #212121 in the app and whatever that becomes once the theme patches have recolored it.
        if (mapped != null && hidePostDivider()
                && (mapped == 0xFF212121 || mapped.equals(remap(0xFF212121, view.getContext())))) {
            hideIfSeparator(view);
        }
        return mapped;
    }

    /** The divider between two posts is a thin full-width view in the card color: clear its background once it is laid out. */
    private static void hideIfSeparator(View view) {
        float maxHeight = 16 * view.getResources().getDisplayMetrics().density;
        view.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
            if (b - t > 0 && b - t <= maxHeight && r - l > v.getResources().getDisplayMetrics().widthPixels / 2) {
                v.setBackground(null);
            }
        });
    }

    /** {@link #remap} for a border color of [view]. */
    public static Integer remapBorder(View view, Integer color) {
        boolean tint = materialYou() && !pitchBlack();
        if (color != null && tint && (color >>> 24) == 0xFF && contains(BORDER, color & 0xFFFFFF)) {
            return 0;
        }
        // The line above the bottom bar, a light gray in the app, takes the border tone of the theme.
        if (color != null && (color >>> 24) == 0xFF && (color & 0xFFFFFF) == 0xD8D8D8 && Build.VERSION.SDK_INT >= 31) {
            Context context = view.getContext();
            if (pitchBlack()) return 0xFF000000 | 0x2A2A2A;
            if (tint) return 0xFF000000 | surface(context, "system_surface_container_highest_dark", "system_neutral2_700");
        }
        return remap(color, view.getContext());
    }

    /** {@link #remap} for a text span, which has no context of its own. */
    public static int remapInt(int color) {
        return appContext == null ? color : remap(color, appContext);
    }

    /** Returns [color] with the surfaces black (Pitch black) or tinted by the wallpaper, and the accents swapped for system colors; unknown colors pass through. */
    public static Integer remap(Integer color, Context context) {
        if (color == null || context == null || Build.VERSION.SDK_INT < 31) return color;
        appContext = context.getApplicationContext();
        boolean black = pitchBlack();
        boolean dynamic = materialYou();
        int argb = color;
        int alpha = argb >>> 24;
        int rgb = argb & 0xFFFFFF;
        int role;
        if (alpha == 0xFF && rgb == 0x000000) {
            if (black || !dynamic) return color;
            role = surface(context, "system_surface_dark", "system_neutral1_1000");
        } else if (alpha == 0xFF && contains(CARD, rgb)) {
            if (black) role = 0x121212;
            else if (dynamic) role = surface(context, "system_surface_container_dark", "system_neutral1_900");
            else return color;
        } else if (alpha == 0xFF && contains(BORDER, rgb)) {
            if (black) role = 0x2A2A2A;
            else if (dynamic) role = surface(context, "system_surface_container_highest_dark", "system_neutral2_700");
            else return color;
        } else if (!dynamic) {
            return color;
        } else if (contains(ACCENT_STRONG, rgb)) {
            role = named(context, "system_accent1_700");
        } else if (contains(ACCENT, rgb)) {
            role = named(context, "system_accent1_200");
        } else if (rgb == 0x2E5F9B) {
            role = named(context, "system_accent1_600");
        } else if (rgb == 0xA8C7EF) {
            role = named(context, "system_accent1_100");
        } else if (rgb == 0x1B2E4A) {
            role = named(context, "system_accent1_800");
        } else if (isBlue(rgb)) {
            // The blues the lists above do not name: the tab indicator, the dark navy chips.
            float[] hsv = new float[3];
            android.graphics.Color.colorToHSV(rgb | 0xFF000000, hsv);
            role = named(context, hsv[2] < 0.3f ? "system_accent1_800" : hsv[2] < 0.55f ? "system_accent1_700" : "system_accent1_200");
        } else {
            return color;
        }
        return (alpha << 24) | (role & 0xFFFFFF);
    }

    /** A saturated blue: hue from cyan-blue to blue-violet, which leaves the red, green, yellow and purple brand colors alone. */
    private static boolean isBlue(int rgb) {
        float[] hsv = new float[3];
        android.graphics.Color.colorToHSV(rgb | 0xFF000000, hsv);
        return hsv[0] >= 195f && hsv[0] <= 255f && hsv[1] > 0.4f && hsv[2] > 0.1f;
    }

    private static boolean contains(int[] values, int rgb) {
        for (int value : values) if (value == rgb) return true;
        return false;
    }

    /** The Android 14 role when it exists, otherwise the closest tone of the Android 12 palette. */
    private static int surface(Context context, String role, String fallback) {
        return Build.VERSION.SDK_INT >= 34 ? named(context, role) : named(context, fallback);
    }

    private static int named(Context context, String name) {
        int id = context.getResources().getIdentifier(name, "color", "android");
        return context.getColor(id);
    }
}
