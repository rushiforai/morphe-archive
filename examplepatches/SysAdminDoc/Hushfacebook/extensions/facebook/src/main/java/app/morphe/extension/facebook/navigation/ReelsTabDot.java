/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The dot and "new" count on the Reels tab, called Video on some accounts. Facebook's tab bar asks
 * one method of its jewel controller (FbMainTabActivityJewelController.getTrackedCountWithLogging)
 * how many new items each tab shows. With the switch on, that answer is 0 for the Reels tab, so its
 * badge and the "new" in its label go. Every other tab keeps its count unless Hide tab badges
 * ({@link TabBadges}) takes it.
 *
 * <p>The one hook in that method is this class's, whichever of the two patches is in, so it asks
 * {@link TabBadges} first and runs the Reels rule only when its own patch is in the build.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the count is
 * Facebook's own.
 */
public final class ReelsTabDot {
    /** Counted under the patch's name each time the Reels tab's count is answered with none. */
    static final String CLEARED = "Reels tab count cleared";

    private static final String FAMILY = FamilyNames.REELS_TAB_DOT;

    /** Whether the patch is in this build, when a test says so instead of {@link SettingsStatus}. */
    @Nullable
    static volatile Boolean inBuildForTests;

    private ReelsTabDot() {
    }

    /** Whether this build carries the patch. */
    static boolean inBuild() {
        Boolean forced = inBuildForTests;
        return forced != null ? forced : SettingsStatus.reelsTabDot();
    }

    /**
     * The hook, first thing in the jewel controller's count for [tab]. True answers 0 for it;
     * false leaves the count to Facebook.
     */
    public static boolean clear(Object tab) {
        if (TabBadges.clearsTab(tab)) return true;
        try {
            if (!inBuild()) return false;
            HookStatus.invoked(FAMILY);
            if (tab == null || !Utils.settingsReady() || !Settings.HIDE_REELS_TAB_DOT.get()) return false;
            if (!FacebookTabs.VIDEO_CLASS.equals(tab.getClass().getName())) return false;
            HookStatus.bound(FAMILY, "tab count");
            HookStatus.counted(FAMILY, CLEARED);
            Logger.printDebug(() -> "Reels tab dot: the Reels tab's new count reads 0");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "tab count", failure);
            return false;
        }
    }
}
