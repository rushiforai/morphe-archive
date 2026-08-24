package dev.jason.gboardpatches.extension.cursortrackpad;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

public final class GboardCursorTrackpad1803Runtime {
    private GboardCursorTrackpad1803Runtime() {
    }

    public static Object applyOverriddenFlagValue(String flagName, Object stockResult) {
        try {
            if (!(GboardCursorTrackpad1803Policy.FREE_CURSOR_FLAG.equals(flagName)
                    || GboardCursorTrackpad1803Policy.FREE_CURSOR_LOCK_MODE_FLAG.equals(flagName))
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
        return GboardCursorTrackpad1803Policy.maybeForceFlag(
                flagName,
                stockResult,
                GboardCursorTrackpadSettings.readEnabled(preferences));
    }

}
