package dev.jason.gboardpatches.extension.emojisize;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

public final class GboardEmojiSize1777Runtime {
    private GboardEmojiSize1777Runtime() {
    }

    public static Object applyOverriddenFlagValue(String flagName, Object stockResult) {
        try {
            if (!GboardEmojiSize1777Policy.EMOJI_SCALE_SUPPORTED_FLAG.equals(flagName)
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
        return GboardEmojiSize1777Policy.maybeForce(
                flagName,
                stockResult,
                GboardEmojiSizeSettings.readEnabled(preferences));
    }
}
