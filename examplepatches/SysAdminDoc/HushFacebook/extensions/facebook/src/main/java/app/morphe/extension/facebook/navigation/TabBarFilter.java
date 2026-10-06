/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import androidx.annotation.Nullable;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The one question Facebook's tab bar list builder asks Hushfacebook about each configured tab,
 * right after Facebook's own set of hidden tab ids has answered for it. Every patch that takes a
 * tab off the bar answers here, so the builder carries a single call however many of them are in
 * the build, the way the feed carries a single guard.
 *
 * <p>Each rule hears Facebook's own answer, never another rule's, so none of them takes a tab
 * another one dropped for a tab Facebook's settings hide. A tab stays off when Facebook's set or
 * any rule says so. Each rule fails open on its own and never throws.
 *
 * <p>Facebook decides whether a Menu shortcut, a link or a notification opens a tab by looking in
 * the tabs the account is configured with, not the ones on the bar, so a tab taken off here would
 * still be switched to and nothing would open. The tab links patch asks {@link #launchedTab},
 * {@link #friendsTab} and {@link #configuresTab} there, and a tab Hide tabs or Hide the Reels tab
 * took off this process's bar counts as one the account hasn't got: Facebook opens its page on its
 * own screen. A tab Marketplace only drops stays switched to, so the rest of Facebook stays out of
 * reach while it's on, and a tab Facebook's own settings hide stays Facebook's.
 */
public final class TabBarFilter {
    /** The name the log lines go under, which is also their logcat tag after Morphe's prefix. */
    static final String SOURCE = "TabBarFilter";

    /**
     * For each tab the bar this process built has asked about, by the class Facebook keeps for it,
     * the patch that took it off and frees its links, or an empty string when it's on the bar or off
     * it for another reason. Facebook keeps the bar it built, so this, not the switches, says what a
     * link finds until Facebook restarts.
     */
    private static final Map<String, String> freed = new ConcurrentHashMap<>();

    private TabBarFilter() {
    }

    /**
     * Injection point in Facebook's tab bar list builder, right after its set of hidden tab ids
     * answered [hidden] for [tab]. [configured] is the list of tabs the account is configured with
     * and [hiddenIds] the set, each id a String. Answers whether the tab stays off the bar. Never
     * throws.
     */
    public static boolean hidesTab(boolean hidden, @Nullable Object tab, @Nullable List<?> configured,
                                   @Nullable Set<?> hiddenIds) {
        boolean marketplaceOnly = MarketplaceOnly.hidesTab(hidden, tab, configured, hiddenIds);
        boolean reelsTab = ReelsTab.hidesTab(hidden, tab);
        boolean hiddenTabs = HiddenTabs.hidesTab(hidden, tab);
        if (tab != null) {
            String family = hidden || marketplaceOnly ? ""
                    : hiddenTabs ? FamilyNames.HIDDEN_TABS
                    : reelsTab ? FamilyNames.REELS_TAB
                    : "";
            freed.put(tab.getClass().getName(), family);
        }
        return marketplaceOnly || reelsTab || hiddenTabs;
    }

    /** The patch that took [tab] off this process's bar and frees its links, or null. Never throws. */
    @Nullable
    private static String freedBy(@Nullable Object tab) {
        try {
            if (tab == null) return null;
            String family = freed.get(tab.getClass().getName());
            return family == null || family.isEmpty() ? null : family;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDDEN_TABS, "tab link", failure);
            return null;
        }
    }

    /** [tab], or null when a switch took it off this process's bar, logged under [where]. Never throws. */
    @Nullable
    private static Object linked(@Nullable Object tab, String where) {
        String family = freedBy(tab);
        if (family == null) return tab;
        HookStatus.bound(family, where);
        Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                () -> "Tab links: " + tab.getClass().getSimpleName() + " is off the tab bar, so its page opens on its own screen.");
        return null;
    }

    /**
     * Injection point where Facebook picks the configured tab a page it's starting belongs to, by
     * the page's launch URI, to switch to that tab instead of starting anything. Answers [tab], or
     * null for a tab a switch took off this process's bar, so the page starts on its own screen.
     * Never throws.
     */
    @Nullable
    public static Object launchedTab(@Nullable Object tab) {
        return linked(tab, "launched tab");
    }

    /**
     * Injection point where Facebook's Friends link finds the Friends tab among the configured
     * tabs, to turn the link into a switch to it. Answers [tab], or null when a switch took it off
     * this process's bar, so the link opens Friends on its own screen. Never throws.
     */
    @Nullable
    public static Object friendsTab(@Nullable Object tab) {
        return linked(tab, "Friends link");
    }

    /**
     * Injection point where Facebook checks whether the tab a target_tab_id link names is among the
     * configured tabs, [configured] its answer, to switch to it rather than open the tab's page on
     * its own screen. Answers false for a tab a switch took off this process's bar. Never throws.
     */
    public static boolean configuresTab(boolean configured, @Nullable Object tab) {
        return configured && linked(tab, "tab link") != null;
    }

    /** Forgets the bar this process built, for tests. */
    static void clearForTests() {
        freed.clear();
    }
}
