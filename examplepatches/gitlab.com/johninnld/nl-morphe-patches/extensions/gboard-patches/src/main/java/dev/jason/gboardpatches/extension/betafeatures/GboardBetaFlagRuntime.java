package dev.jason.gboardpatches.extension.betafeatures;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

/**
 * Forces the 18.8.0 beta gates that are pure boolean switches with live consumers and no model or
 * server dependency.  Each entry below was verified in the beta dex:
 *
 * <ul>
 *   <li>{@code enable_plain_text_chip_for_quick_paste} - lgj adds a second chip for a plain-text
 *       clip so one tap pastes it.</li>
 *   <li>{@code enable_clipboard_pk_floating_chip} - shc shows the floating clipboard chip (also
 *       needs Gboard's own {@code aabv.t()}).</li>
 *   <li>{@code enable_invisible_floating_resizing} - afnh/afri enable the invisible resize band
 *       on a floating keyboard.</li>
 *   <li>{@code enable_emoji2} - acsv switches to the Emoji2 provider instead of the legacy one.</li>
 *   <li>{@code enable_remove_suggestion_v2} - DragConfirmationPopupView picks the new
 *       swipe-to-remove confirmation layout.</li>
 * </ul>
 */
public final class GboardBetaFlagRuntime {
    public static final String PLAIN_TEXT_QUICK_PASTE_CHIP_FLAG =
            "enable_plain_text_chip_for_quick_paste";
    public static final String CLIPBOARD_FLOATING_CHIP_FLAG =
            "enable_clipboard_pk_floating_chip";
    public static final String INVISIBLE_FLOATING_RESIZE_FLAG =
            "enable_invisible_floating_resizing";
    public static final String EMOJI2_FLAG = "enable_emoji2";
    public static final String REMOVE_SUGGESTION_V2_FLAG = "enable_remove_suggestion_v2";

    private GboardBetaFlagRuntime() {
    }

    /** Flag-family hook: called with every flag name and Gboard's own value for it. */
    public static Object applyFlagValue(String flagName, Object originalResult) {
        try {
            if (!isBetaFlag(flagName) || !(originalResult instanceof Boolean)) {
                return originalResult;
            }
            return applyFlagValue(flagName, originalResult, GboardFlagRuntimeContext.preferencesOrNull());
        } catch (Throwable ignored) {
            return originalResult;
        }
    }

    static Object applyFlagValue(String flagName, Object originalResult,
                                 SharedPreferences preferences) {
        try {
            if (!isBetaFlag(flagName) || !(originalResult instanceof Boolean) || preferences == null) {
                return originalResult;
            }
            return GboardBetaFlagSettings.readEnabled(preferences)
                    && GboardBetaFlagSettings.readFlagEnabled(preferences, flagName)
                    ? Boolean.TRUE
                    : originalResult;
        } catch (Throwable ignored) {
            return originalResult;
        }
    }

    public static boolean isBetaFlag(String flagName) {
        if (flagName == null) {
            return false;
        }
        switch (flagName) {
            case PLAIN_TEXT_QUICK_PASTE_CHIP_FLAG:
            case CLIPBOARD_FLOATING_CHIP_FLAG:
            case INVISIBLE_FLOATING_RESIZE_FLAG:
            case EMOJI2_FLAG:
            case REMOVE_SUGGESTION_V2_FLAG:
                return true;
            default:
                return false;
        }
    }
}
