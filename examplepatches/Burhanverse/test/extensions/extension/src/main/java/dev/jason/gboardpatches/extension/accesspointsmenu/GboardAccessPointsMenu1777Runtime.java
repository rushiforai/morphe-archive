package dev.jason.gboardpatches.extension.accesspointsmenu;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

public final class GboardAccessPointsMenu1777Runtime {
    private GboardAccessPointsMenu1777Runtime() {
    }

    public static Object applyOverriddenFlagValue(String flagName, Object stockResult) {
        try {
            if (!GboardAccessPointsMenu1777Policy.MENU_REDESIGN_FLAG.equals(flagName)
                    || !(stockResult instanceof Boolean)) {
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
        return GboardAccessPointsMenu1777Policy.mirrorSwitch(
                flagName,
                stockResult,
                GboardAccessPointsMenuSettings.readEnabled(preferences));
    }
}
