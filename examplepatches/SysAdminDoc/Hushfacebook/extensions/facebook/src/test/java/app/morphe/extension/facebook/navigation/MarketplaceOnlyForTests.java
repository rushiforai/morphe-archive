/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import com.facebook.feed.tab.FeedTab;
import com.facebook.marketplace.tab.MarketplaceTab;
import com.facebook.notifications.tab.NotificationsTab;

import java.util.Arrays;
import java.util.Collections;

/** Marketplace only as the tab bar builder asks it, for tests in any package. */
public final class MarketplaceOnlyForTests {
    private MarketplaceOnlyForTests() {
    }

    /** Says the patch is in the build, or with null, asks SettingsStatus again. */
    public static void inBuild(Boolean inBuild) {
        MarketplaceOnly.inBuildForTests = inBuild;
    }

    public static void resetState() {
        MarketplaceOnly.forgetLogged();
    }

    public static boolean quietsNotifications() {
        Boolean before = MarketplaceOnly.inBuildForTests;
        MarketplaceOnly.inBuildForTests = Boolean.TRUE;
        try {
            return MarketplaceOnly.quietNotifications();
        } finally {
            MarketplaceOnly.inBuildForTests = before;
        }
    }

    public static boolean skipsFeedPrefetch() {
        Boolean before = MarketplaceOnly.inBuildForTests;
        MarketplaceOnly.inBuildForTests = Boolean.TRUE;
        try {
            hidesHome();
            return MarketplaceOnly.skipFeedPrefetch();
        } finally {
            MarketplaceOnly.inBuildForTests = before;
            MarketplaceOnly.forgetLogged();
        }
    }

    /**
     * Asks the hook about Home on a tab bar configured with Home, Marketplace and Notifications,
     * nothing hidden, with the patch in the build. True when it takes Home off, which is the switch
     * changing what Facebook would have done.
     */
    public static boolean hidesHome() {
        Boolean before = MarketplaceOnly.inBuildForTests;
        MarketplaceOnly.inBuildForTests = Boolean.TRUE;
        try {
            return MarketplaceOnly.hidesTab(false, new FeedTab(),
                    Arrays.asList(new FeedTab(), new MarketplaceTab(), new NotificationsTab()), Collections.emptySet());
        } finally {
            MarketplaceOnly.inBuildForTests = before;
        }
    }
}
