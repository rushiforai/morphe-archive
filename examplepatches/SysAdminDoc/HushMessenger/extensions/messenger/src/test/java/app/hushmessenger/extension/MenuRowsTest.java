package app.hushmessenger.extension;

import android.app.Application;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** #189: the rows Messenger puts in its Menu tab, the ones picked in settings staying out of it. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MenuRowsTest {
    private Context context;

    private final MenuTabRow settings = new MenuTabRow(new SettingsFolderKey(), 3, "Settings");
    private final MenuTabRow communities = new MenuTabRow(new CommunityDrawerFolderKey(), null, "Communities");
    private final MenuTabRow invites = new MenuTabRow(new PublicChannelsInvitesDrawerFolderKey(), 2, "Channel invites");
    private final MenuTabRow requests = new MenuTabRow(new ShortcutFolderKey("friend_requests"), null, "Friend requests");
    private final MenuTabRow marketplace = new MenuTabRow(new ShortcutFolderKey("marketplace"), null, "Marketplace");

    /**
     * The settings screen reads the capabilities out of the app's own manifest when it opens, so the Menu row patch
     * goes in there rather than on {@link Settings#installed}, which that read would throw away.
     */
    @Before public void reset() {
        Application app = RuntimeEnvironment.getApplication();
        context = app;
        PackageInfo info = Shadows.shadowOf(app.getPackageManager())
            .getInternalMutablePackageInfo(app.getPackageName());
        info.applicationInfo.metaData = new Bundle();
        info.applicationInfo.metaData.putBoolean("hush.feature.menu_row", true);
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
        Settings.hookErrors.clear();
    }

    @After public void restore() {
        Settings.hookErrors.clear();
    }

    /** The Menu tab's rows as Messenger hands them over, run through the hook that reads them. */
    private static List<String> menu(Object... rows) {
        ArrayList<Object> list = new ArrayList<>(Arrays.asList(rows));
        Settings.addMenuSettingsEntry(list);
        List<String> titles = new ArrayList<>(list.size());
        for (Object row : list) titles.add(((MenuTabRow) row).title);
        return titles;
    }

    @Test public void everyRowButTheSettingsOneIsOfferedUnderTheWordsMessengerShowed() {
        assertEquals(Arrays.asList("Settings", "HushMessenger", "Communities", "Channel invites", "Friend requests"),
            menu(settings, communities, invites, requests));
        assertEquals("The Settings row and HushMessenger's copy of it aren't rows to hide",
            Arrays.asList("CommunityDrawerFolderKey", "PublicChannelsInvitesDrawerFolderKey", "ShortcutFolderKey#friend_requests"),
            MenuRows.seen());
        assertEquals("Communities", MenuRows.label("CommunityDrawerFolderKey"));
        assertEquals("Channel invites", MenuRows.label("PublicChannelsInvitesDrawerFolderKey"));
        // A row shows up once, and the words follow whatever Messenger calls it now.
        menu(settings, new MenuTabRow(new CommunityDrawerFolderKey(), null, "Communities and groups"), marketplace);
        assertEquals(Arrays.asList("CommunityDrawerFolderKey", "PublicChannelsInvitesDrawerFolderKey",
            "ShortcutFolderKey#friend_requests", "ShortcutFolderKey#marketplace"), MenuRows.seen());
        assertEquals("Communities and groups", MenuRows.label("CommunityDrawerFolderKey"));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aPickedRowLeavesTheMenuTabAndTheRestStayWhereTheyWere() {
        menu(settings, communities, invites, requests);
        MenuRows.setHidden("CommunityDrawerFolderKey", true);
        assertEquals(Arrays.asList("Settings", "HushMessenger", "Channel invites", "Friend requests"),
            menu(settings, communities, invites, requests));
        assertEquals("Still listed in settings, so it can come back", 3, MenuRows.seen().size());
        MenuRows.setHidden("CommunityDrawerFolderKey", false);
        assertEquals(Arrays.asList("Settings", "HushMessenger", "Communities", "Channel invites", "Friend requests"),
            menu(settings, communities, invites, requests));
    }

    @Test public void twoShortcutsOfTheSameKindAreToldApart() {
        menu(settings, requests, marketplace);
        MenuRows.setHidden("ShortcutFolderKey#marketplace", true);
        assertEquals(Arrays.asList("Settings", "HushMessenger", "Friend requests"), menu(settings, requests, marketplace));
        assertEquals("Shortcut", MenuRows.label("ShortcutFolderKey#games"));
    }

    @Test public void theMenuTabNeverComesBackWithEveryRowPicked() {
        menu(settings, communities, invites);
        MenuRows.setHidden("CommunityDrawerFolderKey", true);
        MenuRows.setHidden("PublicChannelsInvitesDrawerFolderKey", true);
        assertEquals(Arrays.asList("Settings", "HushMessenger", "Communities", "Channel invites"),
            menu(settings, communities, invites));
        // One row left to show, so the picked ones go.
        assertEquals(Arrays.asList("Settings", "HushMessenger", "Friend requests"),
            menu(settings, communities, invites, requests));
    }

    @Test public void pausedOrInSafeModeTheMenuTabIsMessengersOwnAgain() {
        menu(settings, communities, invites);
        MenuRows.setHidden("CommunityDrawerFolderKey", true);
        for (String state : new String[] {"paused", "safe"}) {
            Settings.preferences.edit().putBoolean("paused", state.equals("paused"))
                .putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(context);
            try {
                assertEquals(state, Arrays.asList("Settings", "HushMessenger", "Communities", "Channel invites"),
                    menu(settings, communities, invites));
            } finally {
                Settings.preferences.edit().putBoolean("paused", false).putBoolean("safe_mode", false).commit();
                CrashGuard.resetForTests();
                CrashGuard.onProcessStart(context);
            }
            assertTrue(state + " keeps the choice", MenuRows.hidden().contains("CommunityDrawerFolderKey"));
        }
    }

    @Test public void rowsWithNothingToGoOnAreLeftAlone() {
        // No folder key of its own, two titles, or no title at all: nothing to offer and nothing to hide.
        MenuRows.setHidden("CommunityDrawerFolderKey", true);
        ArrayList<Object> odd = new ArrayList<>(Arrays.asList(new Object(), new UnknownShapeRow(), null));
        Settings.addMenuSettingsEntry(odd);
        assertEquals(3, odd.size());
        assertTrue(MenuRows.seen().isEmpty());
        assertNull(MenuRows.title(new MenuTabRow(new CommunityDrawerFolderKey(), null, "  ")));
        assertNull(MenuRows.name(null));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void logOutStaysOutOfTheMenuUntilTheBuildHandsItsOwnOver() {
        Settings.preferences.edit().putBoolean(MenuRows.LOG_OUT, true).commit();
        assertFalse("This build has no Log out to start, so no row for it", MenuRows.logOutInMenu());
        assertEquals(Arrays.asList("Settings", "HushMessenger", "Communities"), menu(settings, communities));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            assertNotNull(root.findViewWithTag("menu_log_out_unavailable"));
            assertNull(root.findViewWithTag(MenuRows.LOG_OUT));
        }
    }

    @Test public void settingsListsTheRowsSeenAndTheButtonHidesAndShowsEach() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            assertNotNull(root.findViewWithTag("menu_rows_empty"));
            assertNull(root.findViewWithTag("menu_rows_row_CommunityDrawerFolderKey"));

            // Settings stays open under Messenger, the Menu tab gets opened, then Back returns here.
            screen.pause().stop();
            menu(settings, communities, invites);
            screen.restart().resume();

            assertNull(root.findViewWithTag("menu_rows_empty"));
            assertNotNull(root.findViewWithTag("menu_rows_row_CommunityDrawerFolderKey"));
            assertNotNull(root.findViewWithTag("menu_rows_row_PublicChannelsInvitesDrawerFolderKey"));

            root.findViewWithTag("menu_rows_toggle_CommunityDrawerFolderKey").performClick();
            assertEquals(Collections.singleton("CommunityDrawerFolderKey"), MenuRows.hidden());
            View row = root.findViewWithTag("menu_rows_row_CommunityDrawerFolderKey");
            assertEquals(new SettingsText(context).get("message_actions_hidden_label", "Communities"),
                ((TextView) ((ViewGroup) row).getChildAt(0)).getText().toString());
            assertEquals(Arrays.asList("Settings", "HushMessenger", "Channel invites"), menu(settings, communities, invites));

            root.findViewWithTag("menu_rows_toggle_CommunityDrawerFolderKey").performClick();
            assertTrue(MenuRows.hidden().isEmpty());
            assertEquals("Communities", ((TextView) ((ViewGroup) root.findViewWithTag(
                "menu_rows_row_CommunityDrawerFolderKey")).getChildAt(0)).getText().toString());
        }
    }

    // #207: some accounts get a side menu in place of the Menu tab, with the same rows in it.

    private final SideMenuRow sideSettings = new SideMenuRow(new SettingsFolderKey(), null, "Settings", null);
    private final SideMenuRow sideCommunities = new SideMenuRow(new CommunityDrawerFolderKey(), 4, "Communities", null);
    private final SideMenuRow sideInvites = new SideMenuRow(new PublicChannelsInvitesDrawerFolderKey(), null, "Channel invites", null);
    private final SideMenuRow sideRequests = new SideMenuRow(new ShortcutFolderKey("friend_requests"), null, "Friend requests", null);
    private final SideMenuRow sideMarketplace = new SideMenuRow(new ShortcutFolderKey("marketplace"), null, "Marketplace", null);

    /** Messenger's own lists, which it may never let anyone change. */
    private static List<Object> stock(Object... rows) {
        return Collections.unmodifiableList(Arrays.asList(rows));
    }

    /** The side menu's sections as Messenger hands them over, run through the hook that reads them. */
    private List<?> sideMenu(Object... sections) {
        return Settings.addLegacyDrawerEntry(new SideMenuHost(context), new ArrayList<>(Arrays.asList(sections)));
    }

    /** What the side menu shows: each section's heading and its rows, with the rows under a row in brackets. */
    private static String shown(List<?> sections) {
        List<String> out = new ArrayList<>();
        for (Object section : sections)
            out.add(((SideMenuSection) section).heading + ": " + shownRows(((SideMenuSection) section).rows));
        return String.join(" | ", out);
    }

    private static String shownRows(List<?> rows) {
        List<String> titles = new ArrayList<>();
        for (Object item : rows) {
            SideMenuRow row = (SideMenuRow) item;
            titles.add(row.under == null ? row.title : row.title + " (" + shownRows(row.under) + ")");
        }
        return String.join(", ", titles);
    }

    @Test public void aPickedRowLeavesTheSideMenuToo() {
        List<Object> rows = stock(sideSettings, sideCommunities, sideInvites);
        SideMenuSection top = new SideMenuSection("Top", 0, rows);
        assertEquals("Top: Settings, Communities, Channel invites", shown(sideMenu(top)));
        assertEquals("Settings offers the side menu's rows, its Settings row aside",
            Arrays.asList("CommunityDrawerFolderKey", "PublicChannelsInvitesDrawerFolderKey"), MenuRows.seen());
        assertEquals("Channel invites", MenuRows.label("PublicChannelsInvitesDrawerFolderKey"));

        MenuRows.setHidden("CommunityDrawerFolderKey", true);
        assertEquals("Top: Settings, Channel invites", shown(sideMenu(top)));
        assertEquals("And again the next time Messenger builds it", "Top: Settings, Channel invites", shown(sideMenu(top)));
        assertEquals(Arrays.asList(sideSettings, sideCommunities, sideInvites), rows);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aSectionLeftWithNoRowsLeavesTheSideMenu() {
        SideMenuSection top = new SideMenuSection("Top", 0, stock(sideInvites));
        SideMenuSection yours = new SideMenuSection("Your communities", 1, stock(sideCommunities));
        MenuRows.setHidden("CommunityDrawerFolderKey", true);
        assertEquals("Top: Channel invites", shown(sideMenu(top, yours)));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aRowUnderAnotherRowCanBeHiddenToo() {
        SideMenuRow more = new SideMenuRow(new MoreDrawerFolderKey(), null, "More", stock(sideRequests, sideMarketplace));
        SideMenuSection top = new SideMenuSection("Top", 0, stock(sideInvites, more));
        assertEquals("Top: Channel invites, More (Friend requests, Marketplace)", shown(sideMenu(top)));
        assertTrue("Offered in settings", MenuRows.seen().contains("ShortcutFolderKey#marketplace"));
        assertEquals("Marketplace", MenuRows.label("ShortcutFolderKey#marketplace"));

        MenuRows.setHidden("ShortcutFolderKey#marketplace", true);
        assertEquals("Top: Channel invites, More (Friend requests)", shown(sideMenu(top)));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aRowPutBackShowsInTheSideMenuAgain() {
        List<Object> topRows = stock(sideCommunities, sideInvites);
        List<Object> moreRows = stock(sideRequests, sideMarketplace);
        SideMenuRow more = new SideMenuRow(new MoreDrawerFolderKey(), null, "More", moreRows);
        SideMenuSection top = new SideMenuSection("Top", 0, topRows);
        SideMenuSection shortcuts = new SideMenuSection("Shortcuts", 1, stock(more));
        MenuRows.setHidden("CommunityDrawerFolderKey", true);
        MenuRows.setHidden("ShortcutFolderKey#marketplace", true);
        assertEquals("Top: Channel invites | Shortcuts: More (Friend requests)", shown(sideMenu(top, shortcuts)));

        MenuRows.setHidden("CommunityDrawerFolderKey", false);
        MenuRows.setHidden("ShortcutFolderKey#marketplace", false);
        assertEquals("Top: Communities, Channel invites | Shortcuts: More (Friend requests, Marketplace)",
            shown(sideMenu(top, shortcuts)));
        assertSame("Messenger's own list goes back", topRows, top.rows);
        assertSame(moreRows, more.under);
    }

    @Test public void theSideMenuNeverLosesEveryRow() {
        SideMenuSection top = new SideMenuSection("Top", 0, stock(sideSettings, sideCommunities, sideInvites));
        MenuRows.setHidden("CommunityDrawerFolderKey", true);
        MenuRows.setHidden("PublicChannelsInvitesDrawerFolderKey", true);
        assertEquals("Top: Settings, Communities, Channel invites", shown(sideMenu(top)));
        // One row left to show, so the picked ones go.
        SideMenuSection more = new SideMenuSection("More", 1, stock(sideRequests));
        assertEquals("Top: Settings | More: Friend requests", shown(sideMenu(top, more)));
    }

    @Test public void pausedOrInSafeModeTheSideMenuIsMessengersOwnAgain() {
        List<Object> rows = stock(sideCommunities, sideInvites);
        SideMenuSection top = new SideMenuSection("Top", 0, rows);
        MenuRows.setHidden("CommunityDrawerFolderKey", true);
        for (String state : new String[] {"paused", "safe"}) {
            assertEquals(state, "Top: Channel invites", shown(sideMenu(top)));
            Settings.preferences.edit().putBoolean("paused", state.equals("paused"))
                .putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(context);
            try {
                assertEquals(state, "Top: Communities, Channel invites", shown(sideMenu(top)));
                assertSame(state, rows, top.rows);
            } finally {
                Settings.preferences.edit().putBoolean("paused", false).putBoolean("safe_mode", false).commit();
                CrashGuard.resetForTests();
                CrashGuard.onProcessStart(context);
            }
        }
    }

    @Test public void sideMenusOfAnotherShapeAreLeftAlone() {
        // Two lists in one section, rows that aren't a list, a plain object and a gap: nothing to go on.
        MenuRows.setHidden("CommunityDrawerFolderKey", true);
        TwoListSection two = new TwoListSection(stock(sideCommunities, sideInvites), stock(sideCommunities));
        List<Object> source = new ArrayList<>(Arrays.asList(two, new SideMenuSection("Top", 0, null), new Object(), null));
        assertSame(source, Settings.addLegacyDrawerEntry(new SideMenuHost(context), source));
        assertEquals(2, two.first.size());
        assertTrue(MenuRows.seen().isEmpty());
        assertTrue(Settings.hookErrors.isEmpty());
        assertTrue(MenuRows.drawer(Collections.emptyList()).isEmpty());
        assertNull(MenuRows.drawer(null));
    }

    /** The side menu's screen: the hook reads the context it shows in. */
    public static final class SideMenuHost {
        private final Context context;

        SideMenuHost(Context context) {
            this.context = context;
        }

        public Context getContext() {
            return context;
        }
    }
}

/** Shaped like a section of Messenger's side menu (588's IqS): a heading and a number of its own, and one list of rows. */
final class SideMenuSection {
    final String heading;
    final Integer order;
    final List<?> rows;

    SideMenuSection(String heading, Integer order, List<?> rows) {
        this.heading = heading;
        this.order = order;
        this.rows = rows;
    }
}

/** Shaped like a side menu row (588's Hte): one folder key, its badge, one title and the rows under it. */
final class SideMenuRow {
    final DrawerFolderKey key;
    final Integer badge;
    final String title;
    final List<?> under;

    SideMenuRow(DrawerFolderKey key, Integer badge, String title, List<?> under) {
        this.key = key;
        this.badge = badge;
        this.title = title;
        this.under = under;
    }
}

/** Not a side menu section: with two lists in it there's no telling which holds the rows. */
final class TwoListSection {
    final List<?> first;
    final List<?> second;

    TwoListSection(List<?> first, List<?> second) {
        this.first = first;
        this.second = second;
    }
}

final class MoreDrawerFolderKey extends DrawerFolderKey { }

/** Shaped like Messenger's Menu tab row: one folder key, its unseen badge and one title. */
final class MenuTabRow {
    final DrawerFolderKey key;
    final Integer badge;
    final String title;

    MenuTabRow(DrawerFolderKey key, Integer badge, String title) {
        this.key = key;
        this.badge = badge;
        this.title = title;
    }
}

/** The key classes name the row, and they're named the way Messenger's build 587 names its own. */
class DrawerFolderKey { }

final class SettingsFolderKey extends DrawerFolderKey { }

final class CommunityDrawerFolderKey extends DrawerFolderKey { }

final class PublicChannelsInvitesDrawerFolderKey extends DrawerFolderKey { }

/** One class for several rows, so the shortcut it stands for has to come into the name. */
final class ShortcutFolderKey extends DrawerFolderKey {
    final String shortcut;

    ShortcutFolderKey(String shortcut) {
        this.shortcut = shortcut;
    }
}

/** Not the shape the Menu tab builds: settings can't tell which String is the row's words. */
final class UnknownShapeRow {
    final DrawerFolderKey key = new CommunityDrawerFolderKey();
    final String first = "Communities";
    final String second = "3 new";
}
