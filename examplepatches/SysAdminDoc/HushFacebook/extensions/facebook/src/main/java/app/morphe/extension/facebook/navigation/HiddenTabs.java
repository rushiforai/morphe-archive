/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BooleanSetting;

/**
 * What Hide tabs does to Facebook's tab bar: each tab whose switch is on comes off it, and every
 * other tab stays where Facebook put it.
 *
 * <p>Facebook's tab bar list builder asks {@link TabBarFilter} about each configured tab right after
 * its own set of hidden tab ids has answered, and that asks {@link #hidesTab}, so a tab goes the
 * way one hidden in Facebook's Settings, Tab bar, Customize the bar does. Each tab is known by the
 * classes Facebook keeps the names of ({@link FacebookTabs}). A tab Facebook's own set already
 * hides stays Facebook's. Facebook builds the list once and keeps it, so a change shows when it
 * restarts. Each page stays reachable from the Menu, and a start meant for a hidden tab opens Home.
 * Home and Menu can't be hidden, and neither can the profile tab some accounts get in Menu's place.
 * While Marketplace only is on, Marketplace stays whatever its switch says.
 *
 * <p>It fails open: with the patch not in the build, every switch off, Hushfacebook paused, the
 * settings not ready yet, or a failure in here, the tab bar is Facebook's own.
 */
public final class HiddenTabs {
    /** The name the log lines go under, which is also their logcat tag after Morphe's prefix. */
    static final String SOURCE = "HiddenTabs";

    /**
     * The tabs that can be hidden, each with the classes Facebook keeps for it and its switch. The
     * tab bar can ask about a tab before the settings are ready, so a tab names its switch only when
     * asked: naming it here would load the settings that early and break them for the whole start.
     */
    public enum Tab {
        FEEDS(StartTab.FEEDS, FacebookTabs.FEEDS_CLASS, FacebookTabs.MOST_RECENT_CLASS),
        FRIENDS(StartTab.FRIENDS, FacebookTabs.FRIENDS_CLASS),
        MARKETPLACE(StartTab.MARKETPLACE, FacebookTabs.MARKETPLACE_CLASS),
        GROUPS(null, FacebookTabs.GROUPS_CLASS),
        GAMING(null, FacebookTabs.GAMING_CLASS, FacebookTabs.GAMING_CONTROLLER_CLASS),
        EVENTS(null, FacebookTabs.EVENTS_CLASS);

        /** The start this tab answers, or null when a start can't be sent to it. */
        @Nullable
        final StartTab start;

        final List<String> classes;

        Tab(@Nullable StartTab start, String... classes) {
            this.start = start;
            this.classes = Collections.unmodifiableList(Arrays.asList(classes));
        }

        /** This tab's switch. */
        public BooleanSetting setting() {
            switch (this) {
                case FEEDS: return Settings.HIDE_FEEDS_TAB;
                case FRIENDS: return Settings.HIDE_FRIENDS_TAB;
                case MARKETPLACE: return Settings.HIDE_MARKETPLACE_TAB;
                case GROUPS: return Settings.HIDE_GROUPS_TAB;
                case GAMING: return Settings.HIDE_GAMING_TAB;
                default: return Settings.HIDE_EVENTS_TAB;
            }
        }

        /** The hideable tab a start asking for [start] would open, or null when none. */
        @Nullable
        public static Tab forStart(@Nullable StartTab start) {
            for (Tab tab : values()) {
                if (tab.start != null && tab.start == start) return tab;
            }
            return null;
        }

        /** The hideable tab of the class Java names [className], or null. */
        @Nullable
        static Tab of(@Nullable String className) {
            for (Tab tab : values()) {
                if (tab.classes.contains(className)) return tab;
            }
            return null;
        }
    }

    /** Whether the patch is in this build, when a test says so instead of {@link SettingsStatus}. */
    @Nullable
    static volatile Boolean inBuildForTests;

    /**
     * The tabs the bar this process built lost to their switches, each answered once Facebook has
     * built a bar. Facebook keeps the bar it built, so this, not the switch, says whether a tab is
     * there until Facebook restarts.
     */
    private static final Map<Tab, Boolean> tookOff = new ConcurrentHashMap<>();

    private HiddenTabs() {
    }

    /** Whether this build carries the patch. */
    static boolean inBuild() {
        Boolean forced = inBuildForTests;
        return forced != null ? forced : SettingsStatus.hiddenTabs();
    }

    /** Whether [tab] goes now: the patch in the build, the settings ready and its switch on. Never throws. */
    static boolean on(Tab tab) {
        try {
            return inBuild() && Utils.settingsReady() && tab.setting().get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDDEN_TABS, "tab switch", failure);
            return false;
        }
    }

    /** Whether Marketplace only, which keeps Marketplace on the bar, wins over [tab]'s switch. */
    private static boolean marketplaceOnlyKeeps(Tab tab) {
        return tab == Tab.MARKETPLACE && MarketplaceOnly.on();
    }

    /**
     * Whether a start asking for [start] would find its tab kept off the bar by a switch: the bar
     * this process built lost it, or, before Facebook has built one, the switch is on. The start
     * then asks for Home. Never throws.
     */
    static boolean offTheBar(@Nullable StartTab start) {
        for (Tab tab : Tab.values()) {
            if (tab.start == null || tab.start != start) continue;
            if (marketplaceOnlyKeeps(tab)) return false;
            Boolean built = tookOff.get(tab);
            return built != null ? built : on(tab);
        }
        return false;
    }

    /**
     * Asked by {@link TabBarFilter} for each configured tab, right after Facebook's hidden-tab set
     * answered [hidden] for [tab]. Answers whether the tab stays off the bar: always when Facebook
     * hides it, and for a hideable tab while its switch is on. Never throws.
     */
    public static boolean hidesTab(boolean hidden, @Nullable Object tab) {
        try {
            if (tab == null || !inBuild()) return hidden;
            Tab which = Tab.of(tab.getClass().getName());
            if (!Utils.settingsReady()) {
                // A bar built before the settings is Facebook's, and stays so until it restarts.
                if (which != null) tookOff.put(which, false);
                return hidden;
            }
            HookStatus.invoked(FamilyNames.HIDDEN_TABS);
            if (which == null || marketplaceOnlyKeeps(which)) return hidden;
            if (hidden) {
                tookOff.put(which, false);
                return true;
            }
            boolean wanted = on(which);
            tookOff.put(which, wanted);
            if (!wanted) return false;
            HookStatus.bound(FamilyNames.HIDDEN_TABS, "tab bar");
            Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "Hidden tabs: took " + tab.getClass().getSimpleName() + " off the tab bar.");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDDEN_TABS, "tab bar", failure);
            return hidden;
        }
    }

    /** Forgets the bar this process built, for tests. */
    static void clearForTests() {
        tookOff.clear();
    }
}
