package dev.jason.gboardpatches.extension.spacebarlogo;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.util.Log;

import java.util.Locale;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

public final class GboardSpacebarLogoSettings {
    private static final String TAG = "GboardPatches";
    public static final String PREF_KEY_ENABLED = "pref_spacebar_logo_enabled";
    public static final String PREF_KEY_COLOR = "pref_spacebar_logo_color";
    public static final String PREF_KEY_COLOR_SELECTION = "pref_spacebar_logo_color_selection";
    public static final String PREF_KEY_CUSTOM_COLOR = "pref_spacebar_logo_custom_color";
    public static final String PREF_KEY_ICON = "pref_spacebar_logo_icon";
    public static final boolean DEFAULT_ENABLED = false;
    public static final String DEFAULT_COLOR_HEX = "#4285F4";
    public static final String COLOR_VALUE_AUTO = "AUTO";
    public static final String COLOR_SELECTION_CUSTOM = "CUSTOM";
    public static final String GOOGLE_BLUE = "#4285F4";
    public static final String GOOGLE_RED = "#EA4335";
    public static final String GOOGLE_YELLOW = "#FBBC04";
    public static final String GOOGLE_GREEN = "#34A853";
    public static final String BLACK = "#000000";
    public static final String WHITE = "#FFFFFF";
    public static final String ICON_GOOGLE_G = GboardSpacebarLogoContract.ICON_GOOGLE_G;
    public static final String ICON_HEART = GboardSpacebarLogoContract.ICON_HEART;
    public static final String ICON_EMOJI = GboardSpacebarLogoContract.ICON_EMOJI;
    public static final String DEFAULT_ICON = GboardSpacebarLogoContract.DEFAULT_ICON;

    private GboardSpacebarLogoSettings() {
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_ENABLED;
        Object raw = preferences.getAll().get(PREF_KEY_ENABLED);
        if (raw instanceof Boolean) return ((Boolean) raw).booleanValue();
        if (raw instanceof String) {
            if ("true".equalsIgnoreCase((String) raw)) return true;
            if ("false".equalsIgnoreCase((String) raw)) return false;
        }
        return DEFAULT_ENABLED;
    }

    public static String readColorHex(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_COLOR_HEX;
        Object raw = preferences.getAll().get(PREF_KEY_COLOR);
        return normalizeColorValue(raw instanceof String ? (String) raw : null);
    }

    public static String readColorSelection(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_COLOR_HEX;
        Object raw = preferences.getAll().get(PREF_KEY_COLOR_SELECTION);
        String normalized = raw instanceof String ? normalizeColorSelection((String) raw) : null;
        return normalized != null ? normalized : selectionForColorValue(readColorHex(preferences));
    }

    public static String readCustomColorHex(SharedPreferences preferences) {
        if (preferences == null) return null;
        Object raw = preferences.getAll().get(PREF_KEY_CUSTOM_COLOR);
        return raw instanceof String ? tryNormalizeColorHex((String) raw) : null;
    }

    public static String readIcon(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_ICON;
        Object raw = preferences.getAll().get(PREF_KEY_ICON);
        return GboardSpacebarLogoContract.normalizeIcon(raw instanceof String ? (String) raw : null);
    }

    public static void ensureDefaults(SharedPreferences preferences) {
        if (preferences == null) return;
        SharedPreferences.Editor editor = preferences.edit();
        boolean changed = false;
        if (!preferences.contains(PREF_KEY_ENABLED)) {
            editor.putBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED);
            changed = true;
        }
        if (!preferences.contains(PREF_KEY_COLOR)) {
            editor.putString(PREF_KEY_COLOR, DEFAULT_COLOR_HEX);
            changed = true;
        }
        if (!preferences.contains(PREF_KEY_COLOR_SELECTION)) {
            String colorValue = readColorHex(preferences);
            String selection = selectionForColorValue(colorValue);
            editor.putString(PREF_KEY_COLOR_SELECTION, selection);
            if (COLOR_SELECTION_CUSTOM.equals(selection)
                    && !preferences.contains(PREF_KEY_CUSTOM_COLOR)) {
                editor.putString(PREF_KEY_CUSTOM_COLOR, colorValue);
            }
            changed = true;
        }
        if (!preferences.contains(PREF_KEY_ICON)) {
            editor.putString(PREF_KEY_ICON, DEFAULT_ICON);
            changed = true;
        }
        if (changed) editor.commit();
    }

    public static boolean writeEnabled(Context context, boolean enabled) {
        try {
            if (context == null) return false;
            return writeAndRefresh(context, writeEnabled(
                    GboardPatchesSettings.preferences(context), enabled));
        } catch (Throwable throwable) {
            logWarningSafely("Failed to write spacebar logo enabled state", throwable);
            return false;
        }
    }

    static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        return preferences != null && preferences.edit()
                .putBoolean(PREF_KEY_ENABLED, enabled)
                .commit();
    }

    public static boolean writeColorHex(Context context, String colorHex) {
        try {
            if (context == null) return false;
            return writeAndRefresh(context, writeColorHex(
                    GboardPatchesSettings.preferences(context), colorHex));
        } catch (Throwable throwable) {
            logWarningSafely("Failed to write spacebar logo color", throwable);
            return false;
        }
    }

    static boolean writeColorHex(SharedPreferences preferences, String colorHex) {
        if (preferences == null) return false;
        String normalized = normalizeColorValue(colorHex);
        String selection = selectionForColorValue(normalized);
        SharedPreferences.Editor editor = preferences.edit()
                .putString(PREF_KEY_COLOR, normalized)
                .putString(PREF_KEY_COLOR_SELECTION, selection);
        if (COLOR_SELECTION_CUSTOM.equals(selection)) {
            editor.putString(PREF_KEY_CUSTOM_COLOR, normalized);
        }
        return editor.commit();
    }

    public static boolean writeCustomColor(Context context, String colorHex) {
        try {
            if (context == null) return false;
            return writeAndRefresh(context, writeCustomColor(
                    GboardPatchesSettings.preferences(context), colorHex));
        } catch (Throwable throwable) {
            logWarningSafely("Failed to write custom spacebar logo color", throwable);
            return false;
        }
    }

    static boolean writeCustomColor(SharedPreferences preferences, String colorHex) {
        if (preferences == null) return false;
        String normalized = normalizeColorHex(colorHex);
        return preferences.edit()
                .putString(PREF_KEY_COLOR, normalized)
                .putString(PREF_KEY_COLOR_SELECTION, COLOR_SELECTION_CUSTOM)
                .putString(PREF_KEY_CUSTOM_COLOR, normalized)
                .commit();
    }

    public static boolean writeIcon(Context context, String icon) {
        try {
            if (context == null) return false;
            return writeAndRefresh(context, writeIcon(
                    GboardPatchesSettings.preferences(context), icon));
        } catch (Throwable throwable) {
            logWarningSafely("Failed to write spacebar logo icon", throwable);
            return false;
        }
    }

    static boolean writeIcon(SharedPreferences preferences, String icon) {
        return preferences != null && preferences.edit().putString(
                PREF_KEY_ICON, GboardSpacebarLogoContract.normalizeIcon(icon)).commit();
    }

    public static boolean isAutomaticColor(String value) {
        return COLOR_VALUE_AUTO.equals(normalizeColorValue(value));
    }

    public static String normalizeColorValue(String value) {
        String normalized = value == null ? "" : value.trim();
        return COLOR_VALUE_AUTO.equalsIgnoreCase(normalized)
                ? COLOR_VALUE_AUTO : normalizeColorHex(normalized);
    }

    public static String normalizeColorHex(String value) {
        String normalized = tryNormalizeColorHex(value);
        return normalized == null ? DEFAULT_COLOR_HEX : normalized;
    }

    public static String tryNormalizeColorHex(String value) {
        String normalized = value == null ? "" : value.trim();
        if (normalized.startsWith("#")) normalized = normalized.substring(1);
        if ((normalized.length() != 6 && normalized.length() != 8)
                || !normalized.matches("[0-9a-fA-F]+")) return null;
        return "#" + normalized.toUpperCase(Locale.ROOT);
    }

    public static GboardSpacebarLogoRuntime.SettingsSnapshot snapshot(Context context) {
        try {
            SharedPreferences preferences = GboardPatchesSettings.preferences(context);
            ensureDefaults(preferences);
            String color = readColorHex(preferences);
            int parsedColor = Color.parseColor(
                    isAutomaticColor(color) ? DEFAULT_COLOR_HEX : color);
            return new GboardSpacebarLogoRuntime.SettingsSnapshot(
                    readEnabled(preferences), !isAutomaticColor(color), parsedColor,
                    readIcon(preferences));
        } catch (Throwable throwable) {
            logWarningSafely("Failed to read spacebar logo settings", throwable);
            return disabledSnapshot();
        }
    }

    private static boolean writeAndRefresh(Context context, boolean committed) {
        if (committed) {
            try {
                GboardSpacebarLogoRuntime.refreshBoundSpacebars(snapshot(context));
            } catch (Throwable throwable) {
                logWarningSafely("Failed to refresh spacebar logo settings", throwable);
            }
        }
        return committed;
    }

    private static GboardSpacebarLogoRuntime.SettingsSnapshot disabledSnapshot() {
        return new GboardSpacebarLogoRuntime.SettingsSnapshot(
                false, false, 0, DEFAULT_ICON);
    }

    private static void logWarningSafely(String message, Throwable throwable) {
        try {
            Log.w(TAG, message, throwable);
        } catch (Throwable ignored) {
            // Settings failure handling must not affect the host app.
        }
    }

    private static String normalizeColorSelection(String value) {
        if (value == null) return null;
        if (COLOR_SELECTION_CUSTOM.equalsIgnoreCase(value.trim())) return COLOR_SELECTION_CUSTOM;
        if (COLOR_VALUE_AUTO.equalsIgnoreCase(value.trim())) return COLOR_VALUE_AUTO;
        String color = tryNormalizeColorHex(value);
        return isPresetColor(color) ? color : null;
    }

    private static String selectionForColorValue(String value) {
        if (isAutomaticColor(value)) return COLOR_VALUE_AUTO;
        String normalized = normalizeColorHex(value);
        return isPresetColor(normalized) ? normalized : COLOR_SELECTION_CUSTOM;
    }

    private static boolean isPresetColor(String value) {
        return GOOGLE_BLUE.equals(value) || GOOGLE_RED.equals(value)
                || GOOGLE_YELLOW.equals(value) || GOOGLE_GREEN.equals(value)
                || BLACK.equals(value) || WHITE.equals(value);
    }
}
