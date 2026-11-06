/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-03.
 */

package app.morphe.extension.youtube.patches.general.offline;

/** Persisted appearance and pixel geometry, independent of Android views. */
final class OfflineSubtitleStyle {
    static final int CUSTOM = 3;
    static final int CUSTOM_COLOUR = 4;
    private static final String HEX_DIGITS = "0123456789ABCDEF";

    int size = 1;
    int colour;
    int position;
    int opacity = 60;
    boolean enabled = true;
    String language = "";
    int verticalPercent = 50;
    int font;
    int customColour = 0xFFFFFFFF;

    static OfflineSubtitleStyle parse(String saved) {
        OfflineSubtitleStyle style = new OfflineSubtitleStyle();
        if (saved == null) return style;
        String[] values = saved.split(",", -1);
        boolean current = values.length > 6 && "v2".equals(values[6]);
        style.size = number(values, 0, 0, 3, 1);
        style.colour = number(values, 1, 0, current ? CUSTOM_COLOUR : 3, 0);
        style.position = number(values, 2, 0, current ? CUSTOM : 2, 0);
        int background = number(values, 3, 0, current ? 100 : 1, current ? 60 : 1);
        style.opacity = current ? opacityStep(background) : background * 60;
        style.enabled = !"0".equals(field(values, 4));
        String language = field(values, 5);
        if (language.matches("[A-Za-z0-9-]{1,64}")) style.language = language;
        if (current) {
            style.verticalPercent = number(values, 7, 0, 100, 50);
            style.font = number(values, 8, 0, 6, 0);
            style.customColour = parseColour(field(values, 9), 0xFFFFFFFF);
        }
        return style;
    }

    String encode() {
        return size + "," + colour + "," + position + "," + opacity + "," + (enabled ? "1" : "0")
                + "," + language + ",v2," + verticalPercent + "," + font + "," + colourHex(customColour);
    }

    private static String field(String[] values, int index) {
        return index < values.length ? values[index] : "";
    }

    private static int number(String[] values, int index, int minimum, int maximum, int fallback) {
        try {
            int value = Integer.parseInt(field(values, index));
            return value >= minimum && value <= maximum ? value : fallback;
        } catch (NumberFormatException ignored) {
            return fallback;
        }
    }

    static int sizeSp(int size) {
        return switch (size) {
            case 0 -> 16;
            case 2 -> 26;
            case 3 -> 32;
            default -> 20;
        };
    }

    static int opacityStep(int percent) {
        return Math.round(Math.max(0, Math.min(100, percent)) / 5f) * 5;
    }

    static int opacityAlpha(int percent) {
        return Math.round(Math.max(0, Math.min(100, percent)) * 255f / 100f);
    }

    static int maxWidth(int videoWidth) {
        return Math.max(0, (int) (videoWidth * 0.9f));
    }

    static int boxWidth(float textWidth, int sidePadding, int maximum) {
        int desired = (int) Math.ceil(Math.max(0, textWidth)) + 2 * Math.max(0, sidePadding);
        return Math.max(0, Math.min(maximum, desired));
    }

    static int horizontalPadding(float textPixels) {
        return Math.max(0, Math.round(textPixels * 0.5f));
    }

    static int verticalPadding(float textPixels) {
        return Math.max(0, Math.round(textPixels * 0.2f));
    }

    /** Centre as a percentage of the visible video height, clamped to keep the measured box inside. */
    static int verticalOffset(int videoHeight, int boxHeight, int percent) {
        int height = Math.max(0, videoHeight);
        int box = Math.max(0, Math.min(height, boxHeight));
        int centre = Math.round(height * (Math.max(0, Math.min(100, percent)) / 100f));
        return Math.max(0, Math.min(height - box, centre - box / 2));
    }

    static int parseColour(String value, int fallback) {
        if (value == null || !value.startsWith("#") || (value.length() != 7 && value.length() != 9)) {
            return fallback | 0xFF000000;
        }
        for (int index = 1; index < value.length(); index++) {
            if (Character.digit(value.charAt(index), 16) < 0) return fallback | 0xFF000000;
        }
        try {
            return (int) Long.parseLong(value.substring(1), 16) | 0xFF000000;
        } catch (NumberFormatException ignored) {
            return fallback | 0xFF000000;
        }
    }

    static String colourHex(int colour) {
        char[] hex = new char[7];
        hex[0] = '#';
        for (int index = 6; index > 0; index--) {
            hex[index] = HEX_DIGITS.charAt(colour & 15);
            colour >>>= 4;
        }
        return new String(hex);
    }
}
