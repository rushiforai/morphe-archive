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
}

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
