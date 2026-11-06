package dev.jason.gboardpatches.extension.emojisize;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

public final class GboardEmojiSize1803Runtime {
    private GboardEmojiSize1803Runtime() {
    }

    public static Object applyOverriddenFlagValue(String flagName, Object stockResult) {
        try {
            if (!GboardEmojiSize1803Policy.EMOJI_SCALE_SUPPORTED_FLAG.equals(flagName)
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
        return GboardEmojiSize1803Policy.maybeForce(
                flagName,
                stockResult,
                GboardEmojiSizeSettings.readEnabled(preferences));
    }
}
