/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import androidx.annotation.Nullable;

import java.util.List;
import java.util.Set;

/**
 * The one question Facebook's tab bar list builder asks Hushfacebook about each configured tab,
 * right after Facebook's own set of hidden tab ids has answered for it. Every patch that takes a
 * tab off the bar answers here, so the builder carries a single call however many of them are in
 * the build, the way the feed carries a single guard.
 *
 * <p>Each rule hears Facebook's own answer, never another rule's, so none of them takes a tab
 * another one dropped for a tab Facebook's settings hide. A tab stays off when Facebook's set or
 * any rule says so. Each rule fails open on its own and never throws.
 */
public final class TabBarFilter {
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
        return marketplaceOnly || reelsTab;
    }
}
