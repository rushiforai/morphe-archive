package dev.jason.gboardpatches.extension.roundedkeyboard;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

public final class GboardRoundedKeyboardRuntime {
    private static final String MAIN_PANEL_SELECTOR =
            ".keyboard-base-area.keyboard-outline";
    private static final String BOTTOM_OUTLINE_SELECTOR =
            ".keyboard-body-area.keyboard-outline-bottom.clip-to-outline-for-old-android";

    private GboardRoundedKeyboardRuntime() {
    }

    public static boolean applyThemeAdmission(boolean stockResult) {
        if (stockResult) {
            return true;
        }
        try {
            GboardRoundedKeyboardConfig config = readConfigOrNull();
            return config != null && config.isEnabled();
        } catch (Throwable ignored) {
            return stockResult;
        }
    }

    public static float[] resolveEffectiveRadiiDp(String selector) {
        try {
            if (!MAIN_PANEL_SELECTOR.equals(selector)
                    && !BOTTOM_OUTLINE_SELECTOR.equals(selector)) {
                return null;
            }
            GboardRoundedKeyboardConfig config = readConfigOrNull();
            if (config == null || !config.isEnabled()) {
                return null;
            }
            float top = config.getMode() == GboardRoundedKeyboardConfig.Mode.BOTTOM
                    ? 0.0f : config.getTopRadiusDp();
            float bottom = config.getMode() == GboardRoundedKeyboardConfig.Mode.TOP
                    ? 0.0f : config.getBottomRadiusDp();
            if (BOTTOM_OUTLINE_SELECTOR.equals(selector)) {
                top = 0.0f;
            }
            return new float[] {top, top, bottom, bottom};
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static GboardRoundedKeyboardConfig readConfigOrNull() {
        SharedPreferences preferences = GboardFlagRuntimeContext.preferencesOrNull();
        return GboardRoundedKeyboardSettings.readSnapshotOrNull(preferences);
    }
}
