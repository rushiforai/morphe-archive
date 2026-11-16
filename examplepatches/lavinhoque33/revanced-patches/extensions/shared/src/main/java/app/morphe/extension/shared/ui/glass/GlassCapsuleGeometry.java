/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4424
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.shared.ui.glass;

/** Density-independent capsule decisions used by both the bar and the settings preview. */
public final class GlassCapsuleGeometry {
    private GlassCapsuleGeometry() {
    }

    /** Pack shown count and button width without allocating in the pre-draw callback. */
    public static long getButtonsLayout(int barWidth, int buttons, int contentWidth, int appMinWidth,
                                       int widthPercent, int spacing, int margin, int minTouchWidth, int minSpacing) {
        int maxWidth = Math.max(0, (barWidth - 2 * margin) * clamp(widthPercent, 50, 100) / 100);
        int minWidth = Math.max(minTouchWidth, appMinWidth);
        int minButtonWidth = Math.max(minWidth, contentWidth + minSpacing);
        int shown = Math.max(1, Math.min(buttons, maxWidth / minButtonWidth));
        int buttonWidth = Math.min(Math.max(minWidth, contentWidth + spacing), maxWidth / shown);
        return ((long) shown << 32) | (buttonWidth & 0xFFFFFFFFL);
    }

    public static int shownButtons(long layout) {
        return (int) (layout >>> 32);
    }

    public static int buttonWidth(long layout) {
        return (int) layout;
    }

    public static boolean isButtonShown(int index, int shown, int selected) {
        int lastShown = selected >= shown ? shown - 2 : shown - 1;
        return index <= lastShown || index == selected;
    }

    public static int getCapsuleHeight(int baseHeight, int contentHeight, int heightPercent, int verticalPadding) {
        int minHeight = contentHeight + 2 * verticalPadding;
        return Math.max(minHeight, Math.round(Math.max(baseHeight, minHeight) * clamp(heightPercent, 60, 160) / 100f));
    }

    public static float scaledAlpha(float alpha, int opacity) {
        return Math.max(0, Math.min(1, alpha * clamp(opacity, 0, 100) / 50f));
    }

    public static float cornerRadius(float requested, float height) {
        return Math.min(requested, height / 2);
    }

    public static float artworkRadius(float cardRadius, float padding, float minimum) {
        return Math.max(minimum, cardRadius - padding);
    }

    public static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }
}
