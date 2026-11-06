/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3580
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Ported to RVX by lavinhoque33, 2026-10-17.
 */

package app.morphe.extension.youtube.patches;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.youtube.settings.Settings;

// modified by lavinhoque33, 2026-10-17: ported from Morphe, added debug logging.
@SuppressWarnings("unused")
public class DisableContinueWatchingPromptPatch {

    /**
     * Injection point.
     *
     * @param comparison Result of comparing the time since the last user interaction with
     *                   the inactivity limit. Negative when the limit has not been reached.
     */
    public static int adjustInactivityComparison(int comparison) {
        if (Settings.DISABLE_CONTINUE_WATCHING_PROMPT.get()) {
            // Logged on every autoplay overlay check, so it also shows the hook is live.
            Logger.printDebug(() -> "Continue watching inactivity check, comparison: "
                    + comparison + " forced to -1");
            return -1;
        }
        return comparison;
    }

    /**
     * Injection point.
     */
    public static boolean disableConfirmDialog() {
        if (Settings.DISABLE_CONTINUE_WATCHING_PROMPT.get()) {
            Logger.printDebug(() -> "Suppressing 'Continue watching?' confirm dialog");
            return true;
        }
        return false;
    }
}
