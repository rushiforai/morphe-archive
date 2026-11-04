package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.View;
import android.widget.Switch;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Function;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MessageLogButtonTest {
    private static final Object OURS = "clock";
    private static final Object FACEBOOK = "facebook";
    private static final Object COMPOSE = "compose";
    /** Stands in for the reader the patch writes: only Messenger's new message button has its id here. */
    private static final Function<Object, String> IDS = button -> button == COMPOSE ? MessageLogButton.COMPOSER : null;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
    }

    private static List<Object> placed(Object... held) {
        List<Object> buttons = new ArrayList<>(Arrays.asList(held));
        MessageLogButton.place(buttons, OURS, IDS);
        return buttons;
    }

    @Test public void theClockGoesRightInFrontOfTheNewMessageButtonOrItsPadding() {
        assertEquals(Arrays.asList(FACEBOOK, OURS, COMPOSE, null), placed(FACEBOOK, COMPOSE, null));
        // With the new message button off, the bar pads its end with nulls, and the clock takes the first one's place.
        assertEquals(Arrays.asList(FACEBOOK, OURS, null, null), placed(FACEBOOK, null, null));
        assertEquals(Arrays.asList(FACEBOOK, OURS), placed(FACEBOOK));
        assertEquals(Arrays.asList(OURS, COMPOSE), placed(COMPOSE));
    }

    @Test public void itShowsOnlyWhileTheLogAndItsButtonAreBothOn() {
        assertFalse(MessageLogButton.shown());
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).commit();
        assertFalse("the log alone keeps the bar as Messenger has it", MessageLogButton.shown());
        Settings.preferences.edit().putBoolean(MessageLogButton.KEY, true).commit();
        assertTrue(MessageLogButton.shown());
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(MessageLogButton.shown());
        Settings.preferences.edit().putBoolean("paused", false).putBoolean(MessageLog.KEY, false).commit();
        assertFalse(MessageLogButton.shown());

        // Off, the bar's list goes back untouched.
        List<Object> buttons = new ArrayList<>(Arrays.asList(FACEBOOK, COMPOSE));
        MessageLogButton.add(buttons, RuntimeEnvironment.getApplication(), new Object());
        assertEquals(Arrays.asList(FACEBOOK, COMPOSE), buttons);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aTapOnTheClockOpensTheLogAndMessengersOwnButtonsStayItsOwn() {
        Activity inbox = Robolectric.buildActivity(Activity.class).setup().get();
        View view = new View(inbox);
        assertFalse(MessageLogButton.clicked(view, MessageLogButton.COMPOSER));
        assertFalse(MessageLogButton.clicked(view, null));
        assertNull(Shadows.shadowOf(inbox).getNextStartedActivity());

        assertTrue(MessageLogButton.clicked(view, MessageLogButton.ID));
        Intent started = Shadows.shadowOf(inbox).getNextStartedActivity();
        assertNotNull(started);
        assertEquals(HostScreens.intentFor(inbox, HostScreens.SETTINGS).getComponent(), started.getComponent());
        assertTrue(started.getBooleanExtra(MessageLogSheet.OPEN_EXTRA, false));
    }

    private static ArrayList<Object> menu(SettingsTest.FolderRow settings) {
        ArrayList<Object> rows = new ArrayList<>(List.of(settings));
        Settings.addMenuSettingsEntry(rows);
        return rows;
    }

    /** #133: a Message log row in the Menu tab, right under the HushMessenger one, that opens the log. */
    @Test public void theMenuTabGetsAMessageLogRowUnderHushMessengerThatOpensTheLog() {
        var application = RuntimeEnvironment.getApplication();
        var settings = new SettingsTest.FolderRow(application, new SettingsTest.FakeSettingsFolderKey(), null, 4, "Settings");
        assertEquals("off until its switch is on", 2, menu(settings).size());
        Settings.preferences.edit().putBoolean(MessageLogButton.MENU_KEY, true).commit();
        assertEquals("and the log itself", 2, menu(settings).size());
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).commit();
        ArrayList<Object> rows = menu(settings);
        assertEquals(3, rows.size());
        assertSame(settings, rows.get(0));
        var hush = (SettingsTest.FolderRow) rows.get(1);
        var log = (SettingsTest.FolderRow) rows.get(2);
        assertEquals("HushMessenger", hush.title);
        assertEquals("Message log", log.title);
        assertNull(log.badge);
        assertNotSame(settings.key, log.key);
        assertNotSame(hush.key, log.key);

        // Messenger's own Settings row stays Messenger's, and so does a community that happens to have the same name.
        assertSame(settings, Settings.drawerFolderClicked(settings));
        var namesake = new SettingsTest.FolderRow(application, new SettingsTest.FakeDrawerFolderKey("community"), null, null, "Message log");
        assertSame(namesake, Settings.drawerFolderClicked(namesake));
        assertNull(Shadows.shadowOf(application).getNextStartedActivity());
        assertNull(Settings.drawerFolderClicked(log));
        Intent opened = Shadows.shadowOf(application).getNextStartedActivity();
        assertEquals(HostScreens.intentFor(application, HostScreens.SETTINGS).getComponent(), opened.getComponent());
        assertTrue(opened.getBooleanExtra(MessageLogSheet.OPEN_EXTRA, false));
        assertNull(Settings.drawerFolderClicked(hush));
        assertFalse("the HushMessenger row still opens plain settings",
            Shadows.shadowOf(application).getNextStartedActivity().getBooleanExtra(MessageLogSheet.OPEN_EXTRA, false));

        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertEquals("paused, it goes with the log", 2, menu(settings).size());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** The Menu tab reuses a row's holder as it scrolls, so the row is read at tap time. */
    @Test public void aBoundMessageLogRowOpensTheLogUntilItsHolderShowsAnotherRow() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            int[] stockTaps = {0};
            TextView row = new TextView(screen.get());
            View item = new View(screen.get());
            item.setOnClickListener(v -> stockTaps[0]++);
            row.setText("Message log");
            Settings.handleMenuItemBound(new HostScreensTest.MenuRowHolder(row, item));
            item.performClick();
            assertEquals(0, stockTaps[0]);
            assertTrue(Shadows.shadowOf(screen.get()).getNextStartedActivity().getBooleanExtra(MessageLogSheet.OPEN_EXTRA, false));
            row.setText("Marketplace");
            item.performClick();
            assertEquals(1, stockTaps[0]);
            assertNull(Shadows.shadowOf(screen.get()).getNextStartedActivity());
        }
    }

    @Test public void theMenuRowSwitchSitsUnderTheLogOnlyWhereTheMenuRowWasPatchedIn() throws Exception {
        for (boolean menuRow : new boolean[] {false, true}) {
            var app = RuntimeEnvironment.getApplication();
            var info = app.getPackageManager().getPackageInfo(app.getPackageName(), PackageManager.GET_META_DATA);
            info.applicationInfo.metaData = new Bundle();
            info.applicationInfo.metaData.putBoolean("hush.feature." + MessageLog.KEY, true);
            if (menuRow) info.applicationInfo.metaData.putBoolean("hush.feature.menu_row", true);
            Shadows.shadowOf(app.getPackageManager()).installPackage(info);
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                Switch inMenu = screen.get().getWindow().getDecorView().findViewWithTag(MessageLogButton.MENU_KEY);
                assertEquals(menuRow, inMenu != null);
                if (inMenu == null) continue;
                assertFalse(inMenu.isChecked());
                inMenu.performClick();
                assertTrue(Settings.preferences.getBoolean(MessageLogButton.MENU_KEY, false));
                assertEquals(MessageLog.KEY, Settings.SUB_SWITCHES.get(MessageLogButton.MENU_KEY));
            }
        }
    }
}
