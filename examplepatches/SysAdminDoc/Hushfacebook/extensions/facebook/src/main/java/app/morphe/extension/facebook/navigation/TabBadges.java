/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BooleanSetting;

/**
 * What Hide tab badges does: a tab whose switch is on shows no dot or count, and with the icon switch
 * on, Facebook's app icon shows no count.
 *
 * <p>Facebook's tab bar asks one method of its jewel controller how many new items each tab shows,
 * and the hook first in it, {@link ReelsTabDot#clear}, asks {@link #clearsTab} about every tab but
 * Reels, which has a switch of its own. An answer of none takes the tab's dot and count away. Each tab
 * is known by the class Facebook keeps for it ({@link FacebookTabs}).
 *
 * <p>Facebook writes its own count onto the launcher icon through one writer per launcher family,
 * and each hands the count it's about to write to {@link #iconCount} first, which answers 0 while the
 * switch is on. Nothing here marks anything seen or touches a notification, so they still arrive and
 * the Notifications tab still lists them. A launcher that counts the notifications in the shade on
 * its own still can.
 *
 * <p>Off, paused, before the settings are ready, with the patch not in the build, or when anything
 * here fails, every count is Facebook's own.
 */
public final class TabBadges {
    /** Counted under the patch's name each time a tab's count is answered with none. */
    static final String TAB_CLEARED = "tab count cleared";

    /** Counted each time a launcher writer was about to put a count on the icon and wrote 0. */
    static final String ICON_CLEARED = "app icon count cleared";

    private static final String FAMILY = FamilyNames.TAB_BADGES;

    /**
     * The tabs with a badge switch, each with the classes Facebook keeps for it. The tab bar can ask
     * before the settings are ready, so a tab names its switch only when asked.
     */
    public enum Tab {
        HOME(FacebookTabs.HOME_CLASS),
        FRIENDS(FacebookTabs.FRIENDS_CLASS),
        MARKETPLACE(FacebookTabs.MARKETPLACE_CLASS),
        NOTIFICATIONS(FacebookTabs.NOTIFICATIONS_CLASS),
        /** Menu, or the profile tab some accounts get in its place. */
        MENU(FacebookTabs.MENU_CLASS, FacebookTabs.PROFILE_CLASS),
        GROUPS(FacebookTabs.GROUPS_CLASS),
        /** Every other tab but Reels: Feeds, Gaming, Events, Dating and the rest. */
        OTHER;

        final List<String> classes;

        Tab(String... classes) {
            this.classes = Collections.unmodifiableList(Arrays.asList(classes));
        }

        /** This tab's switch. */
        public BooleanSetting setting() {
            switch (this) {
                case HOME: return Settings.HIDE_HOME_TAB_BADGE;
                case FRIENDS: return Settings.HIDE_FRIENDS_TAB_BADGE;
                case MARKETPLACE: return Settings.HIDE_MARKETPLACE_TAB_BADGE;
                case NOTIFICATIONS: return Settings.HIDE_NOTIFICATIONS_TAB_BADGE;
                case MENU: return Settings.HIDE_MENU_TAB_BADGE;
                case GROUPS: return Settings.HIDE_GROUPS_TAB_BADGE;
                default: return Settings.HIDE_OTHER_TAB_BADGES;
            }
        }

        /** The tab of the class Java names [className]: a named one, {@link #OTHER}, or null for Reels. */
        @Nullable
        static Tab of(String className) {
            if (FacebookTabs.VIDEO_CLASS.equals(className)) return null;
            for (Tab tab : values()) {
                if (tab.classes.contains(className)) return tab;
            }
            return OTHER;
        }
    }

    /** Whether the patch is in this build, when a test says so instead of {@link SettingsStatus}. */
    @Nullable
    static volatile Boolean inBuildForTests;

    private TabBadges() {
    }

    /** Whether this build carries the patch. */
    static boolean inBuild() {
        Boolean forced = inBuildForTests;
        return forced != null ? forced : SettingsStatus.tabBadges();
    }

    /**
     * Asked by the tab bar's count hook about [tab]. True answers 0 for it; false leaves the count to
     * Facebook, and to the Reels rule for the Reels tab. Never throws.
     */
    static boolean clearsTab(@Nullable Object tab) {
        try {
            if (!inBuild()) return false;
            HookStatus.invoked(FAMILY);
            if (tab == null || !Utils.settingsReady()) return false;
            Tab which = Tab.of(tab.getClass().getName());
            if (which == null || !which.setting().get()) return false;
            HookStatus.bound(FAMILY, "tab count");
            HookStatus.counted(FAMILY, TAB_CLEARED);
            Logger.printDebug(() -> "Tab badges: the " + which + " tab's count reads 0");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "tab count", failure);
            return false;
        }
    }

    /**
     * The hook, first in each of Facebook's launcher badge writers: the count to write instead of
     * [count]. 0 while the switch is on, which clears the icon's badge; otherwise Facebook's own.
     */
    public static int iconCount(int count) {
        try {
            HookStatus.invoked(FAMILY);
            if (!Utils.settingsReady() || !Settings.HIDE_APP_ICON_COUNT.get()) return count;
            HookStatus.bound(FAMILY, "icon count");
            if (count != 0) {
                HookStatus.counted(FAMILY, ICON_CLEARED);
                Logger.printDebug(() -> "Tab badges: the app icon count " + count + " is written as 0");
            }
            return 0;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "icon count", failure);
            return count;
        }
    }
}
