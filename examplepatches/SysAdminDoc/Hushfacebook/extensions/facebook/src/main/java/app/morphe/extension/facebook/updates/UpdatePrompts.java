/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.updates;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The switch behind Facebook's own update prompts.
 *
 * <p>A patched Facebook carries the patcher's key, so Meta's updates can't install over it, and
 * every prompt to take one leads nowhere. Facebook has no installer of its own: on phones with
 * Meta App Manager it prompts through that app, and elsewhere through Google Play. What the
 * patch reaches is Facebook's part: the two Meta App Manager promotion filters, the push message
 * that has the manager check for an update, and the chat promotion filter that targets versions
 * below a ceiling. Each hook runs first thing in its method and answers true to stop it, or false
 * to let Facebook's own code run, as it does off, paused, before the settings are ready, or on
 * any failure.
 */
public final class UpdatePrompts {
    /**
     * The chat promotion filter that passes only for versions at or below a ceiling, which is
     * what a promotion aimed at older versions carries.
     */
    public static final String VERSION_CEILING_FILTER = "app_max_version";

    private UpdatePrompts() {
    }

    /** Runs first in both Meta App Manager promotion filters. True fails the filter, so its promotion never shows. */
    public static boolean blockPromotion() {
        try {
            HookStatus.invoked(FamilyNames.UPDATE_PROMPTS);
            return on();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UPDATE_PROMPTS, "update promotion filter", failure);
            return false;
        }
    }

    /** Runs first in the handler of the push that has Meta App Manager look for an update. True skips it. */
    public static boolean blockForceSync() {
        try {
            HookStatus.invoked(FamilyNames.UPDATE_PROMPTS);
            return on();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UPDATE_PROMPTS, "force-sync push", failure);
            return false;
        }
    }

    /**
     * Runs first in the chat promotion filter evaluator with the filter's name. True has the
     * version ceiling filter fail; any other filter, or none, is left to Facebook without a count.
     */
    public static boolean blockVersionCeiling(String filter) {
        try {
            if (!VERSION_CEILING_FILTER.equals(filter)) return false;
            HookStatus.invoked(FamilyNames.UPDATE_PROMPTS);
            return on();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UPDATE_PROMPTS, "version ceiling filter", failure);
            return false;
        }
    }

    private static boolean on() {
        return Utils.settingsReady() && Settings.STOP_UPDATE_PROMPTS.get();
    }
}
