package dev.jason.gboardpatches.extension.cursortrackpad;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

public final class GboardCursorTrackpadRuntime {
    private GboardCursorTrackpadRuntime() {
    }

    public static boolean applyBooleanPreference(String key, boolean stock) {
        if (!"enable_scrub_move".equals(key) || stock) return stock;
        return isEnabledOrStock(stock);
    }

    // 18.8.0.1022711984-beta R.string id whose value is the "enable_scrub_move" preference key
    // (18.6.3: 0x7f140952). The earlier 0x7f14096b came from an older build and is
    // "float_keyboard_in_multi_window" in 18.6.3. The id is confirmed once by its value.
    static final int SCRUB_MOVE_KEY_RESOURCE_ID = 0x7f14096a;
    private static volatile int scrubMoveKeyState; // 0 unknown, 1 confirmed, -1 mismatch

    public static boolean applyResourceBooleanPreference(int key, boolean stock) {
        if (key != SCRUB_MOVE_KEY_RESOURCE_ID || stock || !scrubMoveKeyConfirmed()) return stock;
        return isEnabledOrStock(stock);
    }

    private static boolean scrubMoveKeyConfirmed() {
        int state = scrubMoveKeyState;
        if (state != 0) return state > 0;
        try {
            android.content.Context context = GboardFlagRuntimeContext.resolveContext();
            if (context == null) return false;
            state = "enable_scrub_move".equals(context.getString(SCRUB_MOVE_KEY_RESOURCE_ID))
                    ? 1 : -1;
        } catch (Throwable ignored) {
            state = -1;
        }
        scrubMoveKeyState = state;
        return state > 0;
    }

    private static boolean isEnabledOrStock(boolean stock) {
        try {
            SharedPreferences prefs = GboardFlagRuntimeContext.preferencesOrNull();
            return applyPreference(stock, prefs);
        } catch (Throwable ignored) { return stock; }
    }

    static boolean applyPreference(boolean stock, SharedPreferences prefs) {
        return prefs == null ? stock : stock || GboardCursorTrackpadSettings.readEnabled(prefs);
    }

    public static Object applyOverriddenFlagValue(String flagName, Object stockResult) {
        try {
            if (!(GboardCursorTrackpadPolicy.FREE_CURSOR_FLAG.equals(flagName)
                    || GboardCursorTrackpadPolicy.FREE_CURSOR_LOCK_MODE_FLAG.equals(flagName))
                    || !Boolean.FALSE.equals(stockResult)) {
                return stockResult;
            }
            SharedPreferences preferences = GboardFlagRuntimeContext.preferencesOrNull();
            return preferences == null
                    ? stockResult
                    : applyOverriddenFlagValue(flagName, stockResult, preferences);
        } catch (Throwable ignored) {
            return stockResult;
        }
    }

    static Object applyOverriddenFlagValue(
            String flagName,
            Object stockResult,
            SharedPreferences preferences) {
        return GboardCursorTrackpadPolicy.maybeForceFlag(
                flagName,
                stockResult,
                GboardCursorTrackpadSettings.readEnabled(preferences));
    }

}
