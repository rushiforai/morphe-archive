/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.facebook.bookmark.tab.BookmarkTab;
import com.facebook.events.targetedtab.EventsTab;
import com.facebook.feed.tab.FeedTab;
import com.facebook.friending.tab.FriendRequestsTab;
import com.facebook.gemstone.tab.GemstoneTab;
import com.facebook.groups.targetedtab.groupstabtag.GroupsTargetedTab;
import com.facebook.marketplace.tab.MarketplaceTab;
import com.facebook.notifications.tab.NotificationsTab;
import com.facebook.timeline.dashboard.tab.TimelineTab;
import com.facebook.video.videohome.tab.WatchTab;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Hide tab badges: each tab's switch answers none for that tab's count at the tab bar's one count
 * hook, and only for that tab. The Reels tab stays with its own rule. The app icon switch has every
 * launcher writer put 0 on the icon. Off, paused or out of the build, every count is Facebook's.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TabBadgesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
        TabBadges.inBuildForTests = Boolean.TRUE;
        ReelsTabDot.inBuildForTests = Boolean.FALSE;
    }

    @After
    public void restore() {
        PauseForTests.resume();
        for (TabBadges.Tab tab : TabBadges.Tab.values()) tab.setting().resetToDefault();
        Settings.HIDE_APP_ICON_COUNT.resetToDefault();
        Settings.HIDE_REELS_TAB_DOT.resetToDefault();
        TabBadges.inBuildForTests = null;
        ReelsTabDot.inBuildForTests = null;
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.TAB_BADGES + ":")) return line;
        }
        return null;
    }

    /** One tab of each switch, by the class Facebook keeps for it. */
    private static Map<TabBadges.Tab, List<Object>> tabs() {
        Map<TabBadges.Tab, List<Object>> tabs = new LinkedHashMap<>();
        tabs.put(TabBadges.Tab.HOME, Arrays.asList(new FeedTab()));
        tabs.put(TabBadges.Tab.FRIENDS, Arrays.asList(new FriendRequestsTab()));
        tabs.put(TabBadges.Tab.MARKETPLACE, Arrays.asList(new MarketplaceTab()));
        tabs.put(TabBadges.Tab.NOTIFICATIONS, Arrays.asList(new NotificationsTab()));
        tabs.put(TabBadges.Tab.MENU, Arrays.asList(new BookmarkTab(), new TimelineTab()));
        tabs.put(TabBadges.Tab.GROUPS, Arrays.asList(new GroupsTargetedTab()));
        tabs.put(TabBadges.Tab.OTHER, Arrays.asList(new EventsTab(), new GemstoneTab()));
        return tabs;
    }

    /** The acceptance: a tab's switch on, that tab's count reads none at the hook, and no other tab's does. */
    @Test
    public void eachSwitchTakesOnlyItsOwnTabsCount() {
        Map<TabBadges.Tab, List<Object>> tabs = tabs();
        assertEquals("a switch has no tab here", TabBadges.Tab.values().length, tabs.size());
        for (TabBadges.Tab tab : TabBadges.Tab.values()) {
            assertFalse(tab + " doesn't start off", tab.setting().get());
        }
        for (List<Object> kept : tabs.values()) {
            for (Object tab : kept) assertFalse("all off, " + tab + " lost its count", ReelsTabDot.clear(tab));
        }
        for (Map.Entry<TabBadges.Tab, List<Object>> on : tabs.entrySet()) {
            on.getKey().setting().save(true);
            for (Map.Entry<TabBadges.Tab, List<Object>> asked : tabs.entrySet()) {
                for (Object tab : asked.getValue()) {
                    assertEquals(on.getKey() + " on, " + tab.getClass().getSimpleName(),
                            asked.getKey() == on.getKey(), ReelsTabDot.clear(tab));
                }
            }
            // The Reels tab keeps its count: its own switch, not this one, takes it.
            assertFalse(on.getKey() + " took the Reels tab's count", ReelsTabDot.clear(new WatchTab()));
            on.getKey().setting().save(false);
        }
        assertFalse("no tab lost a count", ReelsTabDot.clear(null));
        // 9 tabs asked with every switch off, then 10 for each of the 7 switches, then the null.
        assertEquals(FamilyNames.TAB_BADGES + ": invoked 80, 1 found, 0 missing. Counted: "
                + TabBadges.TAB_CLEARED + " 9", statusLine());
    }

    /** With Hide the Reels tab dot in too, each patch keeps to its own tabs at the one hook. */
    @Test
    public void theReelsRuleKeepsItsTabAndTheBadgeRuleTheRest() {
        ReelsTabDot.inBuildForTests = Boolean.TRUE;
        assertTrue(Settings.HIDE_REELS_TAB_DOT.get());
        assertTrue(ReelsTabDot.clear(new WatchTab()));
        assertFalse(ReelsTabDot.clear(new FeedTab()));
        Settings.HIDE_HOME_TAB_BADGE.save(true);
        assertTrue(ReelsTabDot.clear(new FeedTab()));
        Settings.HIDE_REELS_TAB_DOT.save(false);
        Settings.HIDE_OTHER_TAB_BADGES.save(true);
        assertFalse("the other tabs' switch took the Reels tab", ReelsTabDot.clear(new WatchTab()));

        // Without the Reels patch, its switch, on by default, leaves the Reels tab alone.
        Settings.HIDE_REELS_TAB_DOT.save(true);
        ReelsTabDot.inBuildForTests = Boolean.FALSE;
        assertFalse(ReelsTabDot.clear(new WatchTab()));
    }

    /** With the icon switch on, every launcher writer writes 0, which clears the badge. */
    @Test
    public void theIconCountIsWrittenAsNoneOnlyWithItsSwitch() {
        assertFalse("the switch doesn't start off", Settings.HIDE_APP_ICON_COUNT.get());
        assertEquals(7, TabBadges.iconCount(7));
        Settings.HIDE_APP_ICON_COUNT.save(true);
        assertEquals(0, TabBadges.iconCount(7));
        assertEquals(0, TabBadges.iconCount(0));
        // A tab's switch isn't the icon's.
        Settings.HIDE_APP_ICON_COUNT.save(false);
        Settings.HIDE_NOTIFICATIONS_TAB_BADGE.save(true);
        assertEquals(3, TabBadges.iconCount(3));
        assertEquals(FamilyNames.TAB_BADGES + ": invoked 4, 1 found, 0 missing. Counted: "
                + TabBadges.ICON_CLEARED + " 1", statusLine());
    }

    @Test
    public void offPausedOrOutOfTheBuildEveryCountIsFacebooks() {
        Settings.HIDE_FRIENDS_TAB_BADGE.save(true);
        Settings.HIDE_APP_ICON_COUNT.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " cleared a tab", ReelsTabDot.clear(new FriendRequestsTab()));
            assertEquals("a Hushfacebook paused by " + reason + " cleared the icon", 5, TabBadges.iconCount(5));
            PauseForTests.resume();
        }
        TabBadges.inBuildForTests = Boolean.FALSE;
        assertFalse(ReelsTabDot.clear(new FriendRequestsTab()));
        TabBadges.inBuildForTests = Boolean.TRUE;
        assertTrue(ReelsTabDot.clear(new FriendRequestsTab()));
        Settings.HIDE_FRIENDS_TAB_BADGE.save(false);
        assertFalse(ReelsTabDot.clear(new FriendRequestsTab()));
    }

    @Test
    public void tabsAreKnownByTheClassesFacebookKeeps() {
        assertNull(TabBadges.Tab.of(FacebookTabs.VIDEO_CLASS));
        assertEquals(TabBadges.Tab.MENU, TabBadges.Tab.of(FacebookTabs.PROFILE_CLASS));
        assertEquals(TabBadges.Tab.OTHER, TabBadges.Tab.of(FacebookTabs.FEEDS_CLASS));
        assertEquals(TabBadges.Tab.OTHER, TabBadges.Tab.of(FacebookTabs.GAMING_CLASS));
        assertEquals(TabBadges.Tab.HOME, TabBadges.Tab.of(FacebookTabs.HOME_CLASS));
    }
}
