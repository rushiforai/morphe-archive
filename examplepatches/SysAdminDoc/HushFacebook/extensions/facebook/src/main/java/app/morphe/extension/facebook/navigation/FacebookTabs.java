/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

/**
 * Facebook's own tabs: the id its tab bar knows each one by, and the class it keeps the name of.
 *
 * <p>Every tab is a subclass of Facebook's {@code TabTag}, and those are among the few classes
 * Redex leaves named. Each hands its id to TabTag's constructor. The ids are the tabs' bookmark ids
 * on Facebook's servers, the same on 577 and 580, and the main screen opens on the tab whose id a
 * start carries as {@link #TARGET_TAB_ID}, which is how Facebook's own tab shortcuts and
 * notifications reach a tab. The patches module's fixture test reads these constants out of the
 * built extension and holds them to both builds.
 */
public final class FacebookTabs {
    /** The intent extra Facebook's main screen opens a tab by, a long holding the tab's id. */
    public static final String TARGET_TAB_ID = "target_tab_id";

    /** The activity Facebook's launcher icon starts, and the main screen its tabs live on. */
    public static final String MAIN_TAB_ACTIVITY = "com.facebook.katana.activity.FbMainTabActivity";

    /** What Facebook's main screen hands its work to. Redex keeps the name. */
    public static final String MAIN_TAB_DELEGATE = "com.facebook.katana.activity.FbMainTabActivityDelegate";

    /** The class every tab extends. It holds one long, the tab's id. */
    public static final String TAB_TAG = "com.facebook.navigation.tabbar.state.model.TabTag";

    /** The tab bar's configuration: the tabs in order. */
    public static final String NAVIGATION_CONFIG = "com.facebook.navigation.tabbar.state.model.NavigationConfig";

    /** The field of the main screen's delegate that holds the tab bar's state, a lazy value. */
    public static final String TAB_BAR_STATE = "tabBarStateManager$delegate";

    public static final long HOME_ID = 4748854339L;
    public static final String HOME_CLASS = "com.facebook.feed.tab.FeedTab";

    public static final long FEEDS_ID = 608920319153834L;
    public static final String FEEDS_CLASS = "com.facebook.feed.feedstab.tab.FeedsTab";
    /** A second tab under the Feeds id, for the most recent posts. */
    public static final String MOST_RECENT_CLASS = "com.facebook.feed.filters.tab.MostRecentFeedTab";

    /** Called Video or Reels in the tab bar, depending on the account. */
    public static final long VIDEO_ID = 2392950137L;
    public static final String VIDEO_CLASS = "com.facebook.video.videohome.tab.WatchTab";

    public static final long FRIENDS_ID = 772219799489960L;
    public static final String FRIENDS_CLASS = "com.facebook.friending.tab.FriendRequestsTab";

    public static final long MARKETPLACE_ID = 1606854132932955L;
    public static final String MARKETPLACE_CLASS = "com.facebook.marketplace.tab.MarketplaceTab";

    public static final long NOTIFICATIONS_ID = 1603421209951282L;
    public static final String NOTIFICATIONS_CLASS = "com.facebook.notifications.tab.NotificationsTab";

    /** The Menu tab, the one with the bookmarks and Settings. */
    public static final long MENU_ID = 281710865595635L;
    public static final String MENU_CLASS = "com.facebook.bookmark.tab.BookmarkTab";

    /** The profile tab, which some accounts get in place of Menu. */
    public static final String PROFILE_CLASS = "com.facebook.timeline.dashboard.tab.TimelineTab";

    /** Tabs a start can't be sent to, which Marketplace only takes off the bar. */
    public static final String GROUPS_CLASS = "com.facebook.groups.targetedtab.groupstabtag.GroupsTargetedTab";
    public static final String GAMING_CLASS = "com.facebook.games.tab.GamesTab";
    /** A second tab class for Gaming, drawn with a game controller. */
    public static final String GAMING_CONTROLLER_CLASS = "com.facebook.games.tab.GamesTabWithSNESControllerIcon";
    public static final String EVENTS_CLASS = "com.facebook.events.targetedtab.EventsTab";

    private FacebookTabs() {
    }
}
