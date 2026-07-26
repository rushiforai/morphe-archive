package dev.jason.gboardpatches.extension.advancedvoice;

import java.util.Locale;

public final class GboardAdvancedVoice1777Policy {
    public static final String ENABLE_NGA_FLAG = "enable_nga";
    public static final String ENABLE_ADVANCED_FEATURES_FLAG =
            "enable_advanced_features_in_consolidated_sd_stack";
    public static final String ENABLE_DICTATION_SPLIT_INSTALL_FLAG =
            "enable_dictation_feature_split_install";
    public static final String HANDLE_FALLBACK_INSIDE_SD_STACK_FLAG =
            "handle_fallback_inside_sd_stack";

    private GboardAdvancedVoice1777Policy() {
    }

    public static Object maybeForceFlag(String flagName, Object originalResult) {
        if (!isAdvancedVoiceFlag(flagName)
                || !(originalResult instanceof Boolean)
                || Boolean.TRUE.equals(originalResult)) {
            return originalResult;
        }
        return Boolean.TRUE;
    }

    public static boolean shouldPromoteNativeReadiness(
            Object originalResult,
            boolean nativeLoaded) {
        return Boolean.FALSE.equals(originalResult) && nativeLoaded;
    }

    public static Object maybeEnableExactZhTwFormatter(
            Locale locale,
            boolean stockAdvancedFeaturesDisabled,
            Object originalFormatterDisabled) {
        if (locale == null
                || !"zh-TW".equals(locale.toLanguageTag())
                || stockAdvancedFeaturesDisabled
                || !Boolean.TRUE.equals(originalFormatterDisabled)) {
            return originalFormatterDisabled;
        }
        return Boolean.FALSE;
    }

    private static boolean isAdvancedVoiceFlag(String flagName) {
        return ENABLE_NGA_FLAG.equals(flagName)
                || ENABLE_ADVANCED_FEATURES_FLAG.equals(flagName)
                || ENABLE_DICTATION_SPLIT_INSTALL_FLAG.equals(flagName)
                || HANDLE_FALLBACK_INSIDE_SD_STACK_FLAG.equals(flagName);
    }
}

