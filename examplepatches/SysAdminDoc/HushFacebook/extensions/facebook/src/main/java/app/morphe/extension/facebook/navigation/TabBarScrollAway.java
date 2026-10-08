/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Whether the tab bar at the bottom slides away while the feed scrolls down. Facebook has this
 * built in: as its main screen starts, it adds the bottom bar to the views that scroll away with
 * the feed, the way the top bar does, when one check answers yes. That check passes only with
 * scroll-away running on the phone and the bar at the bottom, and then asks two server settings
 * that turn the experiment on for some accounts. The hook sits between those two parts. Its yes
 * stands in for the server settings, and Facebook's own code then slides the bar out scrolling
 * down, brings it back scrolling up or at the top, and keeps the feed clear of it. The feed's
 * floating button, the mini player and the screens that make room for the bar ask the same check,
 * so they move with it.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the answer is no and
 * Facebook asks its server settings as before. With the bar at the top the hook isn't reached. The
 * bar's entry is made as the main screen starts, so a change shows after a restart.
 */
public final class TabBarScrollAway {
    /** Counted under the patch's name each time the check is answered yes. */
    static final String SLIDES_AWAY = "Tab bar set to slide away";

    private static final String FAMILY = FamilyNames.BOTTOM_TAB_BAR;

    private TabBarScrollAway() {
    }

    /**
     * The hook, right after Facebook's check finds the tab bar at the bottom. True lets the bar
     * slide away; false leaves the answer to Facebook's server settings.
     */
    public static boolean slidesAway() {
        try {
            HookStatus.invoked(FAMILY);
            if (!Utils.settingsReady() || !Settings.TAB_BAR_SCROLL_AWAY.get()) return false;
            HookStatus.bound(FAMILY, "tab bar scroll-away");
            HookStatus.counted(FAMILY, SLIDES_AWAY);
            Logger.printDebug(() -> "Tab bar scroll-away: the bar at the bottom slides away");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "tab bar scroll-away", failure);
            return false;
        }
    }
}
