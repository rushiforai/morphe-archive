/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.morphe.extension.youtube.patches;

import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.settings.YouTubeActivityHook;

@SuppressWarnings("unused")
public class FixPreferenceIconPatch {
    private static final boolean REMOVE_BROKEN_PREFERENCE_ICON =
            Settings.RESTORE_OLD_SETTINGS_MENUS.get() || !YouTubeActivityHook.useBoldIcons(true);

    /**
     * Injection point.
     */
    public static boolean removePreferenceIcon() {
        return REMOVE_BROKEN_PREFERENCE_ICON;
    }
}
