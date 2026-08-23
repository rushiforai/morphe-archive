package dev.jason.gboardpatches.extension.cursortrackpad;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

public final class GboardCursorTrackpad1777Runtime {
    private GboardCursorTrackpad1777Runtime() {
    }

    public static Object applyOverriddenFlagValue(String flagName, Object stockResult) {
        try {
            if (!(GboardCursorTrackpad1777Policy.FREE_CURSOR_FLAG.equals(flagName)
                    || GboardCursorTrackpad1777Policy.FREE_CURSOR_LOCK_MODE_FLAG.equals(flagName))
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
        return GboardCursorTrackpad1777Policy.maybeForceFlag(
                flagName,
                stockResult,
                GboardCursorTrackpadSettings.readEnabled(preferences));
    }

    public static boolean applyOverriddenPreferenceValue(
            String preferenceKey,
            boolean stockResult) {
        try {
            if (!GboardCursorTrackpad1777Policy.ENABLE_SCRUB_MOVE_PREFERENCE.equals(
                    preferenceKey)) {
                return stockResult;
            }
            SharedPreferences preferences = GboardFlagRuntimeContext.preferencesOrNull();
            return preferences == null
                    ? stockResult
                    : applyOverriddenPreferenceValue(preferenceKey, stockResult, preferences);
        } catch (Throwable ignored) {
            return stockResult;
        }
    }

    static boolean applyOverriddenPreferenceValue(
            String preferenceKey,
            boolean stockResult,
            SharedPreferences preferences) {
        return GboardCursorTrackpad1777Policy.maybeForcePreference(
                preferenceKey,
                stockResult,
                GboardCursorTrackpadSettings.readEnabled(preferences));
    }

    public static boolean applyOverriddenResourcePreferenceValue(
            int preferenceResourceId,
            boolean stockResult) {
        try {
            if (preferenceResourceId
                    != GboardCursorTrackpad1777Policy.ENABLE_SCRUB_MOVE_PREFERENCE_RES_ID) {
                return stockResult;
            }
            SharedPreferences preferences = GboardFlagRuntimeContext.preferencesOrNull();
            return preferences == null
                    ? stockResult
                    : applyOverriddenResourcePreferenceValue(
                            preferenceResourceId, stockResult, preferences);
        } catch (Throwable ignored) {
            return stockResult;
        }
    }

    static boolean applyOverriddenResourcePreferenceValue(
            int preferenceResourceId,
            boolean stockResult,
            SharedPreferences preferences) {
        return GboardCursorTrackpad1777Policy.maybeForceResourcePreference(
                preferenceResourceId,
                stockResult,
                GboardCursorTrackpadSettings.readEnabled(preferences));
    }
}
