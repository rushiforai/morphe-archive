/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import com.facebook.bookmark.tab.BookmarkTab;
import com.facebook.events.targetedtab.EventsTab;
import com.facebook.feed.tab.FeedTab;
import com.facebook.friending.tab.FriendRequestsTab;
import com.facebook.katana.activity.FbMainTabActivity;
import com.facebook.marketplace.tab.MarketplaceTab;
import com.facebook.navigation.tabbar.state.model.TabTag;
import com.facebook.notifications.tab.NotificationsTab;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Hide tabs over Facebook's tab bar as its list builder asks the tab bar filter, one tab at a time
 * after Facebook's own hidden-tab set has answered, and the start it keeps off a hidden tab.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HiddenTabsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final List<TabTag> configured = Arrays.asList(new FeedTab(), new FriendRequestsTab(), new MarketplaceTab(),
            new EventsTab(), new NotificationsTab(), new BookmarkTab());

    @Before
    public void inBuild() {
        HiddenTabs.inBuildForTests = Boolean.TRUE;
        HiddenTabs.clearForTests();
        TabBarFilter.clearForTests();
    }

    @After
    public void restore() {
        HiddenTabs.inBuildForTests = null;
        HiddenTabs.clearForTests();
        TabBarFilter.clearForTests();
        MarketplaceOnlyForTests.inBuild(null);
        PauseForTests.resume();
        for (HiddenTabs.Tab tab : HiddenTabs.Tab.values()) tab.setting().resetToDefault();
        Settings.MARKETPLACE_ONLY.resetToDefault();
        Settings.OPEN_ON_CHOSEN_TAB.resetToDefault();
        Settings.START_TAB.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        StartTabRoute.settled();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    private static List<String> shown(List<? extends TabTag> configured, Set<String> hiddenIds) {
        List<String> shown = new ArrayList<>();
        for (TabTag tab : configured) {
            boolean hidden = hiddenIds.contains(String.valueOf(tab.id));
            if (!TabBarFilter.hidesTab(hidden, tab, configured, hiddenIds)) shown.add(tab.getClass().getSimpleName());
        }
        return shown;
    }

    private final List<String> stock = Arrays.asList("FeedTab", "FriendRequestsTab", "MarketplaceTab", "EventsTab",
            "NotificationsTab", "BookmarkTab");

    @Test
    public void everySwitchStartsOffAndTheBarIsFacebooks() {
        for (HiddenTabs.Tab tab : HiddenTabs.Tab.values()) {
            assertFalse(tab.name(), tab.setting().defaultValue);
            assertTrue(tab.name() + ": Facebook builds the bar once", tab.setting().rebootApp);
        }
        assertEquals(stock, shown(configured, Collections.emptySet()));
    }

    @Test
    public void aTabWhoseSwitchIsOnLeavesTheBar() {
        Settings.HIDE_FRIENDS_TAB.save(true);
        Settings.HIDE_EVENTS_TAB.save(true);
        assertEquals(Arrays.asList("FeedTab", "MarketplaceTab", "NotificationsTab", "BookmarkTab"),
                shown(configured, Collections.emptySet()));
        assertTrue("a start meant for Friends opens Home", HiddenTabs.offTheBar(StartTab.FRIENDS));
        assertFalse(HiddenTabs.offTheBar(StartTab.MARKETPLACE));
        assertFalse("Home can't be hidden", HiddenTabs.offTheBar(StartTab.HOME));
    }

    /** Facebook's own Hide stays in charge, and a tab it hid isn't one this took off. */
    @Test
    public void aTabFacebookAlreadyHidesIsLeftToFacebook() {
        Settings.HIDE_FRIENDS_TAB.save(true);
        Set<String> hidden = Collections.singleton(String.valueOf(new FriendRequestsTab().id));
        assertEquals(Arrays.asList("FeedTab", "MarketplaceTab", "EventsTab", "NotificationsTab", "BookmarkTab"),
                shown(configured, hidden));
        assertFalse(HiddenTabs.offTheBar(StartTab.FRIENDS));
    }

    @Test
    public void marketplaceOnlyKeepsMarketplace() {
        MarketplaceOnlyForTests.inBuild(Boolean.TRUE);
        Settings.MARKETPLACE_ONLY.save(true);
        Settings.HIDE_MARKETPLACE_TAB.save(true);
        assertTrue(shown(configured, Collections.emptySet()).contains("MarketplaceTab"));
        assertFalse(HiddenTabs.offTheBar(StartTab.MARKETPLACE));
    }

    /**
     * A link, a Menu shortcut or a notification for a tab this took off finds no tab to switch to,
     * so Facebook opens the page on its own screen. Every other tab keeps Facebook's answer.
     */
    @Test
    public void aHiddenTabsPageOpensOnItsOwnScreen() {
        Settings.HIDE_MARKETPLACE_TAB.save(true);
        Settings.HIDE_FRIENDS_TAB.save(true);
        shown(configured, Collections.emptySet());
        MarketplaceTab marketplace = new MarketplaceTab();
        assertNull("a started Marketplace page isn't switched to the tab", TabBarFilter.launchedTab(marketplace));
        assertNull("a Friends link isn't switched to the tab", TabBarFilter.friendsTab(new FriendRequestsTab()));
        assertFalse("a target_tab_id link opens the page", TabBarFilter.configuresTab(true, marketplace));
        FeedTab home = new FeedTab();
        EventsTab events = new EventsTab();
        assertSame(home, TabBarFilter.launchedTab(home));
        assertSame(events, TabBarFilter.friendsTab(events));
        assertTrue(TabBarFilter.configuresTab(true, events));
        assertFalse("Facebook's own answer stays", TabBarFilter.configuresTab(false, events));
        assertNull(TabBarFilter.launchedTab(null));
    }

    /** Facebook's own Hide and Marketplace only keep a tab's links switching to it, as they did. */
    @Test
    public void aTabFacebookOrMarketplaceOnlyTookOffKeepsItsLinks() {
        Settings.HIDE_FRIENDS_TAB.save(true);
        FriendRequestsTab friends = new FriendRequestsTab();
        shown(configured, Collections.singleton(String.valueOf(friends.id)));
        assertSame(friends, TabBarFilter.friendsTab(friends));

        HiddenTabs.clearForTests();
        TabBarFilter.clearForTests();
        MarketplaceOnlyForTests.inBuild(Boolean.TRUE);
        Settings.MARKETPLACE_ONLY.save(true);
        assertEquals(Arrays.asList("MarketplaceTab", "NotificationsTab", "BookmarkTab"), shown(configured, Collections.emptySet()));
        assertSame("Marketplace only keeps the rest of Facebook out of reach", friends, TabBarFilter.friendsTab(friends));
    }

    /** The links follow the bar Facebook built, which it keeps until it restarts. */
    @Test
    public void theLinksFollowTheBarThisProcessBuilt() {
        MarketplaceTab marketplace = new MarketplaceTab();
        Settings.HIDE_MARKETPLACE_TAB.save(true);
        shown(configured, Collections.emptySet());
        Settings.HIDE_MARKETPLACE_TAB.save(false);
        assertNull("the bar still has no Marketplace", TabBarFilter.launchedTab(marketplace));

        HiddenTabs.clearForTests();
        TabBarFilter.clearForTests();
        Settings.HIDE_MARKETPLACE_TAB.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        shown(configured, Collections.emptySet());
        assertSame("a bar built while paused is Facebook's, and so are its links", marketplace,
                TabBarFilter.launchedTab(marketplace));
    }

    /** A start sent to a chosen tab this keeps off the bar opens Home, and the log names Hide tabs. */
    @Test
    public void aChosenHiddenTabOpensHome() {
        Settings.OPEN_ON_CHOSEN_TAB.save(true);
        Settings.START_TAB.save(StartTab.FRIENDS);
        Settings.HIDE_FRIENDS_TAB.save(true);
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        FbMainTabActivity screen = StartTabRouteForTests.screen(StartTabRouteForTests.launcherStart());
        StartTabRoute.onActivityCreate(screen, null);
        StartTabRoute.settled();
        assertEquals(FacebookTabs.HOME_ID, screen.getIntent().getLongExtra(FacebookTabs.TARGET_TAB_ID, -1));
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("Hide tabs keeps friends off the tab bar, so asked for home"));
    }

    @Test
    public void pausedOrOutOfTheBuildTheBarIsFacebooks() {
        Settings.HIDE_FRIENDS_TAB.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertEquals(stock, shown(configured, Collections.emptySet()));
        PauseForTests.resume();
        HiddenTabs.clearForTests();
        HiddenTabs.inBuildForTests = Boolean.FALSE;
        assertEquals(stock, shown(configured, Collections.emptySet()));
        assertFalse(HiddenTabs.offTheBar(StartTab.FRIENDS));
    }
}
