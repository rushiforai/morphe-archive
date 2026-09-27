/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;

import com.facebook.feed.tab.FeedTab;
import com.facebook.friending.tab.FriendRequestsTab;
import com.facebook.katana.activity.FbMainTabActivity;
import com.facebook.katana.activity.FbMainTabActivityDelegate;
import com.facebook.marketplace.tab.MarketplaceTab;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

import java.time.Duration;
import java.util.Arrays;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.SettingsEntry;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * The hook first thing in the main screen's creation: a start from the launcher icon gets a copy of
 * its intent that asks Facebook for the chosen tab, and every other start keeps its own destination.
 * Then the check a moment after the screen shows, which reads what Facebook opened.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class StartTabRouteTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.OPEN_ON_CHOSEN_TAB.resetToDefault();
        Settings.START_TAB.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.START_TAB + ":")) return line;
        }
        return null;
    }

    /** The main screen started by [intent], after the hook has seen its creation with [saved]. */
    private static FbMainTabActivity created(Intent intent, Bundle saved) {
        FbMainTabActivity screen = StartTabRouteForTests.screen(intent);
        StartTabRoute.onActivityCreate(screen, saved);
        return screen;
    }

    @Test
    public void aStartFromTheLauncherIconAsksForMarketplaceByDefault() {
        assertTrue("the switch starts off", Settings.OPEN_ON_CHOSEN_TAB.get());
        assertEquals(StartTab.MARKETPLACE, Settings.START_TAB.get());
        FbMainTabActivity screen = StartTabRouteForTests.screen(StartTabRouteForTests.launcherStart());
        Intent launched = screen.getIntent();

        StartTabRoute.onActivityCreate(screen, null);

        Intent routed = screen.getIntent();
        assertNotSame("the screen kept the intent it was started with", launched, routed);
        assertEquals(FacebookTabs.MARKETPLACE_ID, routed.getLongExtra(FacebookTabs.TARGET_TAB_ID, -1));
        assertEquals("marketplace", routed.getStringExtra(StartTabRoute.ROUTED));
        assertEquals(Intent.ACTION_MAIN, routed.getAction());
        assertTrue(routed.hasCategory(Intent.CATEGORY_LAUNCHER));
        assertEquals(launched.getFlags(), routed.getFlags());
        assertEquals(launched.getComponent(), routed.getComponent());
        // Facebook's start-up prediction may be reading the first one on another thread.
        assertFalse("the intent the screen was started with was changed", launched.hasExtra(FacebookTabs.TARGET_TAB_ID));
        assertEquals(FamilyNames.START_TAB + ": invoked 1, 0 found, 0 missing", statusLine());
    }

    @Test
    public void eachTabAsksForItsOwnId() {
        for (StartTab tab : StartTab.values()) {
            Settings.START_TAB.save(tab);
            FbMainTabActivity screen = created(StartTabRouteForTests.launcherStart(), null);
            assertEquals(tab.name(), tab.tabId, screen.getIntent().getLongExtra(FacebookTabs.TARGET_TAB_ID, -1));
        }
        assertEquals(FacebookTabs.HOME_ID, StartTab.HOME.tabId);
        assertEquals(FacebookTabs.FEEDS_ID, StartTab.FEEDS.tabId);
        assertEquals(FacebookTabs.VIDEO_ID, StartTab.VIDEO.tabId);
        assertEquals(FacebookTabs.FRIENDS_ID, StartTab.FRIENDS.tabId);
        assertEquals(FacebookTabs.MARKETPLACE_ID, StartTab.MARKETPLACE.tabId);
        assertEquals(FacebookTabs.NOTIFICATIONS_ID, StartTab.NOTIFICATIONS.tabId);
        assertEquals(FacebookTabs.MENU_ID, StartTab.MENU.tabId);
    }

    /**
     * A link, a notification, a shortcut and a restored screen each keep where they were going:
     * the screen keeps the very intent it was started with.
     */
    @Test
    public void everyOtherStartKeepsItsOwnDestination() {
        Intent notification = StartTabRouteForTests.launcherStart()
                .putExtra(FacebookTabs.TARGET_TAB_ID, FacebookTabs.NOTIFICATIONS_ID);
        Intent[] others = {
                new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.facebook.com/marketplace/item/1/")),
                StartTabRouteForTests.launcherStart().setData(Uri.parse("fb://feed")),
                notification,
                StartTabRouteForTests.launcherStart().putExtra("tabbar_target_intent", new Intent()),
                StartTabRouteForTests.launcherStart().putExtra("extra_launch_uri", "fb://notifications"),
                StartTabRouteForTests.launcherStart().putExtra("target_fragment", 7),
                StartTabRouteForTests.launcherStart().putExtra("fragment_type", 7),
                new Intent(Intent.ACTION_MAIN),
                new Intent(Intent.ACTION_VIEW).putExtra(SettingsEntry.EXTRA_OPEN_SETTINGS, true),
        };
        for (Intent intent : others) {
            FbMainTabActivity screen = created(intent, null);
            assertSame(intent.toString(), intent, screen.getIntent());
            assertFalse(intent.toString(), screen.getIntent().hasExtra(StartTabRoute.ROUTED));
        }
        assertEquals("a notification's own tab was replaced", FacebookTabs.NOTIFICATIONS_ID,
                notification.getLongExtra(FacebookTabs.TARGET_TAB_ID, -1));

        // Android restoring the screen, after a rotation or with the process gone: Facebook puts
        // back what was on screen.
        Intent launcher = StartTabRouteForTests.launcherStart();
        FbMainTabActivity restored = created(launcher, new Bundle());
        assertSame(launcher, restored.getIntent());

        assertEquals(FamilyNames.START_TAB + ": invoked " + (others.length + 1) + ", 0 found, 0 missing", statusLine());
    }

    @Test
    public void onlyTheMainScreenIsTouched() {
        Intent launcher = StartTabRouteForTests.launcherStart();
        Activity other = Robolectric.buildActivity(Activity.class, launcher).get();
        StartTabRoute.onActivityCreate(other, null);
        assertSame(launcher, other.getIntent());
        assertNull("another activity counted as the main screen", statusLine());
        StartTabRoute.onActivityCreate(null, null);
        assertNull(statusLine());
    }

    @Test
    public void offOrPausedFacebookOpensWhereItChooses() {
        Settings.OPEN_ON_CHOSEN_TAB.save(false);
        Intent launcher = StartTabRouteForTests.launcherStart();
        assertSame(launcher, created(launcher, null).getIntent());

        Settings.OPEN_ON_CHOSEN_TAB.save(true);
        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            Intent paused = StartTabRouteForTests.launcherStart();
            assertSame(why.name(), paused, created(paused, null).getIntent());
        }
        PauseForTests.resume();
        assertTrue(StartTabRouteForTests.routes());
    }

    @Test
    public void beforeTheSettingsAreReadyTheStartIsFacebooks() {
        boolean[] routed = {true};
        SettingsContextRule.withoutContext(() -> routed[0] = StartTabRouteForTests.routes());
        assertFalse(routed[0]);
        SettingsContextRule.beforeThePauseIsDecided(() -> routed[0] = StartTabRouteForTests.routes());
        assertFalse(routed[0]);
        assertTrue(StartTabRouteForTests.routes());
    }

    /** A failure in the hook leaves Facebook's start as it was and says so in Hook status. */
    @Test
    public void aFailureLeavesTheStartAlone() {
        FbMainTabActivity screen = StartTabRouteForTests.screen(StartTabRouteForTests.launcherStart());
        screen.failGetIntent = true;
        StartTabRoute.onActivityCreate(screen, null);
        screen.failGetIntent = false;
        assertFalse(screen.getIntent().hasExtra(FacebookTabs.TARGET_TAB_ID));
        String line = statusLine();
        assertNotNull(line);
        assertTrue(line, line.startsWith(FamilyNames.START_TAB + ": invoked 1, 0 found, 1 missing"));
        assertTrue(line, line.contains("'start tab' hook (it threw java.lang.IllegalStateException)"));
    }

    /** The log names what a start carried, never the link or a value, which can name a person. */
    @Test
    public void theLogNamesWhatAStartCarriedButNotItsValues() {
        Intent link = new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.facebook.com/some.person/posts/123"))
                .putExtra("notification_source", "PUSH")
                .putExtra("extra_secret", "c_user=100012345678901");
        String described = StartTabRoute.describe(link);
        assertTrue(described, described.contains("action android.intent.action.VIEW"));
        assertTrue(described, described.contains("a link"));
        assertTrue(described, described.contains("extras extra_secret notification_source"));
        for (String leak : new String[]{"some.person", "123", "PUSH", "c_user", "100012345678901", "https"}) {
            assertFalse(described + " carries " + leak, described.contains(leak));
        }
        assertEquals("Intent: action android.intent.action.MAIN, categories android.intent.category.LAUNCHER, "
                        + "flags 0x10200000, no link, extras none.",
                StartTabRoute.describe(StartTabRouteForTests.launcherStart()));
        assertEquals("No intent.", StartTabRoute.describe(null));
    }

    /** With Debug logging on, the capture on a phone can see the route and the tab bar. */
    @Test
    public void debugLoggingShowsTheRouteAndTheTabBar() {
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        FbMainTabActivity screen = created(StartTabRouteForTests.launcherStart(), null);
        screen.currentTab = new MarketplaceTab();
        StartTabRouteForTests.tabBar(screen, StartTabRouteForTests.tabs(new FeedTab(), new FriendRequestsTab(),
                new MarketplaceTab()), null);
        StartTabRoute.check(screen, StartTab.MARKETPLACE);
        created(StartTabRouteForTests.launcherStart(), new Bundle());

        // The exported report leaves out every number as long as an account's id, so most tab ids
        // read as omitted there. Logcat keeps them, and so does Home's, which is shorter.
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("Start tab: asked Facebook to open on marketplace (tab [id omitted]). "
                + "Intent: action android.intent.action.MAIN, categories android.intent.category.LAUNCHER"));
        assertTrue(report, report.contains("Start tab: Facebook opened MarketplaceTab [id omitted], as asked. "
                + "Tab bar: FeedTab " + FacebookTabs.HOME_ID + ", FriendRequestsTab [id omitted], MarketplaceTab [id omitted]"));
        assertTrue(report, report.contains("Start tab: left Facebook's own start alone: the screen is being restored."));
    }

    @Test
    public void theTabFacebookOpenedIsReadAMomentAfterTheScreenShows() {
        ActivityController<FbMainTabActivity> controller =
                Robolectric.buildActivity(FbMainTabActivity.class, StartTabRouteForTests.launcherStart());
        FbMainTabActivity screen = controller.get();
        StartTabRoute.onActivityCreate(screen, null);
        StartTabRouteForTests.tabBar(screen, StartTabRouteForTests.tabs(new FeedTab(), new MarketplaceTab()), null);
        screen.currentTab = new MarketplaceTab();

        // Then the screen's lifecycle, the way Android runs it after onCreate starts.
        controller.create().start().resume().visible();
        assertNull("the tab was read before the screen had shown for a moment", foundLine());
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(StartTabRoute.LANDING_CHECK_MS));
        assertEquals(FamilyNames.START_TAB + ": invoked 1, 1 found, 0 missing", statusLine());

        // Once only: a later resume in the same session reads nothing again.
        controller.pause().resume();
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(StartTabRoute.LANDING_CHECK_MS * 2));
        assertEquals(FamilyNames.START_TAB + ": invoked 1, 1 found, 0 missing", statusLine());
    }

    private static String foundLine() {
        String line = statusLine();
        return line != null && !line.contains(" 0 found") ? line : null;
    }

    @Test
    public void aTabThisAccountHasNotGotIsFacebooksFallBackNotAFault() {
        FbMainTabActivity screen = StartTabRouteForTests.screen(StartTabRouteForTests.launcherStart());
        screen.currentTab = new FeedTab();
        StartTabRouteForTests.tabBar(screen, StartTabRouteForTests.tabs(new FeedTab(), new FriendRequestsTab()), null);
        LogBufferManager.clearLogBuffer();
        StartTabRoute.check(screen, StartTab.MARKETPLACE);
        assertNull("the account's own tab bar counted against the build", statusLine());
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("Start tab: this tab bar has no marketplace tab, so Facebook opened FeedTab "
                + FacebookTabs.HOME_ID + "."));
    }

    @Test
    public void aTabTheBarHasThatFacebookDidNotOpenIsARouteNotTaken() {
        FbMainTabActivity screen = StartTabRouteForTests.screen(StartTabRouteForTests.launcherStart());
        screen.currentTab = new FeedTab();
        StartTabRouteForTests.tabBar(screen, StartTabRouteForTests.tabs(new FeedTab(), new MarketplaceTab()), null);
        StartTabRoute.check(screen, StartTab.MARKETPLACE);
        assertEquals(FamilyNames.START_TAB + ": invoked 0, 0 found, 1 missing. First missing: start on tab "
                + FacebookTabs.MAIN_TAB_ACTIVITY + "#marketplace", statusLine());
    }

    @Test
    public void theTabBarIsReadThroughTheNamesFacebookKeeps() {
        FbMainTabActivity screen = StartTabRouteForTests.screen(StartTabRouteForTests.launcherStart());
        assertNull("no delegate, no tab bar", StartTabRoute.TabBar.tabs(screen));

        // The shown list first: it leaves out the tabs hidden in Facebook's settings.
        List<Object> shown = StartTabRouteForTests.tabs(new FeedTab(), new MarketplaceTab());
        List<Object> configured = StartTabRouteForTests.tabs(new FeedTab(), new FriendRequestsTab(), new MarketplaceTab());
        FbMainTabActivityDelegate delegate = StartTabRouteForTests.tabBar(screen, shown, configured);
        assertEquals(Arrays.asList("FeedTab", "MarketplaceTab"), names(StartTabRoute.TabBar.tabs(screen)));

        // Without one, the configuration's.
        StartTabRouteForTests.tabBar(screen, null, configured);
        assertEquals(Arrays.asList("FeedTab", "FriendRequestsTab", "MarketplaceTab"),
                names(StartTabRoute.TabBar.tabs(screen)));

        // A delegate handed out inside a wrapper is found in it.
        screen.delegate = new StartTabRouteForTests.DelegateWrapper(delegate);
        assertEquals(Arrays.asList("FeedTab", "MarketplaceTab"), names(StartTabRoute.TabBar.tabs(screen)));

        // A tab bar state not built yet is left unbuilt.
        delegate.tabBarStateManager$delegate = new StartTabRouteForTests.Lazy(null, false);
        screen.delegate = delegate;
        assertNull(StartTabRoute.TabBar.tabs(screen));

        assertEquals(FacebookTabs.MARKETPLACE_ID, StartTabRoute.TabBar.tabId(new MarketplaceTab()));
        assertEquals(-1, StartTabRoute.TabBar.tabId(new Object()));
        assertEquals("no tab", StartTabRoute.TabBar.name(null));
        assertEquals("unreadable", StartTabRoute.TabBar.describe(null));
    }

    private static List<String> names(List<Object> tabs) {
        assertNotNull("the tab bar wasn't read", tabs);
        List<String> names = new java.util.ArrayList<>();
        for (Object tab : tabs) names.add(tab.getClass().getSimpleName());
        return names;
    }

    @Test
    public void aSettingsFileHoldsTheTabByAValueThatNeverChanges() {
        for (StartTab tab : StartTab.values()) {
            assertSame(tab, StartTab.fromFile(tab.fileValue));
        }
        assertEquals(Arrays.asList("home", "feeds", "video", "friends", "marketplace", "notifications", "menu"),
                fileValues());
        for (Object refused : new Object[]{"MARKETPLACE", "Marketplace", "market", "", null, 5, true}) {
            assertNull(String.valueOf(refused), StartTab.fromFile(refused));
        }
        assertTrue(StartTab.FEEDS.isTab(FacebookTabs.FEEDS_CLASS));
        assertTrue(StartTab.FEEDS.isTab(FacebookTabs.MOST_RECENT_CLASS));
        assertFalse(StartTab.FEEDS.isTab(FacebookTabs.HOME_CLASS));
        assertFalse(StartTab.MARKETPLACE.isTab(null));
    }

    private static List<String> fileValues() {
        List<String> values = new java.util.ArrayList<>();
        for (StartTab tab : StartTab.values()) values.add(tab.fileValue);
        return values;
    }
}
