package dev.jason.gboardpatches.extension.flowmode;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

public final class GboardFlowModeRuntime {
    private static final int ENABLED_STATE_UNKNOWN = -1;
    private static final int ENABLED_STATE_FALSE = 0;
    private static final int ENABLED_STATE_TRUE = 1;

    private static volatile int enabledState = ENABLED_STATE_UNKNOWN;

    private GboardFlowModeRuntime() {
    }

    public static Object applyFlagValue(String flagName, Object stockResult) {
        try {
            return applyFlagValue(
                    flagName,
                    stockResult,
                    GboardFlagRuntimeContext.preferencesOrNull());
        } catch (Throwable ignored) {
            enabledState = ENABLED_STATE_FALSE;
            return stockResult;
        }
    }

    static Object applyFlagValue(
            String flagName,
            Object stockResult,
            SharedPreferences preferences) {
        try {
            if (!GboardFlowModePolicy.isTargetFlagName(flagName)) {
                return stockResult;
            }
            if (preferences == null) {
                enabledState = ENABLED_STATE_FALSE;
                return stockResult;
            }
            boolean enabled = GboardFlowModeSettings.readEnabled(preferences);
            enabledState = enabled ? ENABLED_STATE_TRUE : ENABLED_STATE_FALSE;
            return GboardFlowModePolicy.maybeForceFlagValue(
                    flagName,
                    stockResult,
                    enabled);
        } catch (Throwable ignored) {
            enabledState = ENABLED_STATE_FALSE;
            return stockResult;
        }
    }

    public static int mapKeyCode(int keyCode) {
        try {
            return GboardFlowModePolicy.mapKeyCode(
                    keyCode,
                    enabledState == ENABLED_STATE_TRUE);
        } catch (Throwable ignored) {
            return keyCode;
        }
    }

}
