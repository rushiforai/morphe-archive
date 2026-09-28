/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * What Marketplace only does to Facebook's tab bar: it takes off Home with the news feed, Video,
 * Friends, Feeds, Groups, Gaming and Events, and leaves Marketplace, Notifications, the profile or
 * Menu tab and any tab it doesn't know.
 *
 * <p>Facebook builds the tab bar's list from the tabs its servers configure, leaving out each one
 * whose id is in the set of tabs hidden in its own Settings, Tab bar, Customize the bar. The patch
 * calls {@link #hidesTab} right after that set answers for a tab, so a tab this drops goes the way
 * a tab hidden there does. Facebook builds the list once and keeps it, so a change of the switch
 * shows when Facebook restarts. While the switch is on, {@link StartTabRoute} also opens Facebook on
 * Marketplace.
 *
 * <p>It fails open: with the patch not in the build, the switch off, Hushfacebook paused, the
 * settings not ready yet, a tab bar that has no Marketplace to open (not configured for the
 * account, or hidden in Facebook's editor), or a failure in here, the tab bar is Facebook's own.
 */
public final class MarketplaceOnly {
    /** The tabs this takes off the tab bar, by the class Facebook keeps for each. */
    static final Set<String> DROPPED_TABS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            FacebookTabs.HOME_CLASS,
            FacebookTabs.FEEDS_CLASS,
            FacebookTabs.MOST_RECENT_CLASS,
            FacebookTabs.VIDEO_CLASS,
            FacebookTabs.FRIENDS_CLASS,
            FacebookTabs.GROUPS_CLASS,
            FacebookTabs.GAMING_CLASS,
            FacebookTabs.GAMING_CONTROLLER_CLASS,
            FacebookTabs.EVENTS_CLASS)));

    /** The name the log lines go under, which is also their logcat tag after Morphe's prefix. */
    static final String SOURCE = "MarketplaceOnly";

    /** What every line of this hook starts with, for a person reading the log. */
    static final String PREFIX = "Marketplace only: ";

    /** Whether the patch is in this build, when a test says so instead of {@link SettingsStatus}. */
    @Nullable
    static volatile Boolean inBuildForTests;

    /** The tab classes a line has been logged for, so a rebuilt tab bar doesn't log them again. */
    private static final Set<String> logged = Collections.synchronizedSet(new HashSet<>());

    public enum State { OFF, WAITING, ACTIVE, RESTART_NEEDED, PAUSED, MISSING, HIDDEN, UNREADABLE }

    /** What the last tab-bar build actually used, not merely what its switch now asks for. */
    @Nullable
    private static volatile Boolean appliedChoice;
    private static volatile State availability = State.WAITING;

    private MarketplaceOnly() {
    }

    /** Whether this build carries the patch. */
    static boolean inBuild() {
        Boolean forced = inBuildForTests;
        return forced != null ? forced : SettingsStatus.marketplaceOnly();
    }

    /**
     * Whether the tab bar is Marketplace only now: the patch in the build, the settings ready and
     * its switch on, which a pause answers off. Never throws.
     */
    static boolean on() {
        try {
            return inBuild() && Utils.settingsReady() && Settings.MARKETPLACE_ONLY.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MARKETPLACE_ONLY, "marketplace only switch", failure);
            return false;
        }
    }

    /** State for settings, based on the tab list the hook has seen in this process. */
    public static State state() {
        if (!inBuild()) return State.OFF;
        if (!Utils.settingsReady()) return State.WAITING;
        boolean wanted = Settings.MARKETPLACE_ONLY.savedValue();
        Boolean applied = appliedChoice;
        // Pausing cannot put back tabs already removed from Facebook's cached bar.
        if (Boolean.TRUE.equals(applied) && !wanted) return State.RESTART_NEEDED;
        if (Setting.isPaused()) return wanted ? State.PAUSED : State.OFF;
        if (!wanted) return State.OFF;
        if (availability == State.MISSING || availability == State.HIDDEN || availability == State.UNREADABLE) {
            return availability;
        }
        if (Boolean.FALSE.equals(applied)) return State.RESTART_NEEDED;
        return availability;
    }

    /** An optional overlay. The six independent notification switches are never rewritten. */
    public static boolean quietNotifications() {
        return on() && Settings.MARKETPLACE_QUIET_NOTIFICATIONS.get();
    }

    /** Only background feed warm-ups ask this. Early startup and uncertain tab state fail open. */
    public static boolean skipFeedPrefetch() {
        try {
            if (!on() || !Settings.MARKETPLACE_SKIP_FEED_PREFETCH.get() || state() != State.ACTIVE) return false;
            if (logged.add("prefetch")) {
                Logger.diagnosticInfo(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                        () -> PREFIX + "skipped a background feed warm-up while Marketplace is active.");
            }
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MARKETPLACE_ONLY, "feed prefetch", failure);
            return false;
        }
    }

    /**
     * Injection point in Facebook's tab bar list builder, right after its set of hidden tab ids
     * answered [hidden] for [tab]. [configured] is the list of tabs the account is configured with
     * and [hiddenIds] the set, each id a String. Answers whether the tab stays off the bar: always
     * when Facebook hides it, and for a tab this drops while it's on and the bar keeps Marketplace.
     * Never throws.
     */
    public static boolean hidesTab(boolean hidden, @Nullable Object tab, @Nullable List<?> configured,
                                   @Nullable Set<?> hiddenIds) {
        try {
            if (tab == null || !inBuild()) return hidden;
            if (!Utils.settingsReady()) {
                appliedChoice = false;
                availability = State.WAITING;
                return hidden;
            }
            boolean wanted = on();
            availability = marketplaceAvailability(configured, hiddenIds);
            appliedChoice = wanted && availability == State.ACTIVE;
            if (hidden) return true;
            HookStatus.invoked(FamilyNames.MARKETPLACE_ONLY);
            String name = tab.getClass().getName();
            if (!DROPPED_TABS.contains(name) || !wanted) return false;
            if (availability != State.ACTIVE) {
                if (logged.add("")) {
                    Logger.diagnosticInfo(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE, () -> PREFIX
                            + "this tab bar has no Marketplace to open, so it stays as Facebook built it.");
                }
                return false;
            }
            HookStatus.bound(FamilyNames.MARKETPLACE_ONLY, "tab bar");
            if (logged.add(name)) {
                Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                        () -> PREFIX + "took " + tab.getClass().getSimpleName() + " off the tab bar.");
            }
            return true;
        } catch (Throwable failure) {
            availability = State.UNREADABLE;
            HookStatus.threw(FamilyNames.MARKETPLACE_ONLY, "tab bar", failure);
            return hidden;
        }
    }

    /**
     * Whether the tab bar will have Marketplace: the account is configured with it and it isn't
     * among the tabs hidden in Facebook's own editor. Without it there'd be nothing to open, so the
     * bar stays as Facebook built it.
     */
    private static State marketplaceAvailability(@Nullable List<?> configured, @Nullable Set<?> hiddenIds) {
        if (configured == null) return State.UNREADABLE;
        for (Object each : configured) {
            if (each == null || !StartTab.MARKETPLACE.isTab(each.getClass().getName())) continue;
            long id = StartTabRoute.TabBar.tabId(each);
            if (id == -1) return State.UNREADABLE;
            return hiddenIds != null && hiddenIds.contains(String.valueOf(id)) ? State.HIDDEN : State.ACTIVE;
        }
        return State.MISSING;
    }

    /** Forgets which lines were logged, as a new process would. */
    static void forgetLogged() {
        logged.clear();
        appliedChoice = null;
        availability = State.WAITING;
    }
}
