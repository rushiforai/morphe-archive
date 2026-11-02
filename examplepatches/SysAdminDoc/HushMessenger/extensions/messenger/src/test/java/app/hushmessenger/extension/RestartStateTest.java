package app.hushmessenger.extension;

import android.content.ClipboardManager;
import android.content.ComponentName;
import android.content.Intent;
import android.provider.MediaStore;
import android.view.View;
import android.widget.Switch;
import android.widget.TextView;
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

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class RestartStateTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        clearLatches();
    }

    @After public void clearLatches() {
        Settings.metaAiTab = null;
        Settings.oldEmojiDrawer = null;
        Settings.keptSearchBar = null;
        Settings.bottomTabs.clear();
    }

    @Test public void thePeopleAndNotificationsTabsEachHoldTheirFirstAnswerUntilARestart() {
        Settings.preferences.edit().putBoolean("tab_people", true).commit();
        assertTrue(Settings.hidePeopleTab());
        assertFalse("Each tab follows its own switch", Settings.hideNotificationsTab());
        Settings.preferences.edit().putBoolean("tab_people", false).putBoolean("tab_notifications", true).commit();
        assertTrue("The bar keeps the tabs it counted first", Settings.hidePeopleTab());
        assertFalse(Settings.hideNotificationsTab());
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart("tab_people"));
        assertEquals(Boolean.FALSE, Settings.heldUntilRestart("tab_notifications"));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            TextView people = root.findViewWithTag("active_tab_people");
            assertEquals("The People tab comes back after Messenger restarts", people.getText().toString());
            assertEquals("An off switch still shows the tab is hidden until a restart", View.VISIBLE, people.getVisibility());
            assertEquals("The Notifications tab is hidden after Messenger restarts",
                ((TextView) root.findViewWithTag("active_tab_notifications")).getText().toString());
        }

        Settings.bottomTabs.clear();
        assertNull("A restart asks again", Settings.heldUntilRestart("tab_people"));
        assertFalse(Settings.hidePeopleTab());
        assertTrue(Settings.hideNotificationsTab());
        Settings.preferences.edit().putBoolean("paused", true).commit();
        Settings.bottomTabs.clear();
        assertFalse("Pause shows every tab after the restart", Settings.hideNotificationsTab());
    }

    /**
     * A first asker that's waiting on settings to start doesn't hold the tab map, so another thread can store its answer
     * meanwhile, and that answer, stored first, is the one the waiting asker gets. computeIfAbsent held the map's lock
     * through the wait, so the other thread's store waited on a start that was waiting on it.
     */
    @Test public void aFirstAskerWaitingOnStartLeavesTheTabMapFree() throws Exception {
        android.app.Application app = RuntimeEnvironment.getApplication();
        HostScreens.applicationCreated(app);
        boolean[] hidden = new boolean[1];
        Thread asker = new Thread(() -> hidden[0] = Settings.hidePeopleTab());
        // The start the asker runs refreshes the text style entries and the launcher shortcuts. Doing both in place keeps
        // them inside this test.
        java.util.concurrent.Executor textStyleWork = TextStyleActivity.work, shortcutWork = HostScreens.shortcutWork;
        TextStyleActivity.work = Runnable::run;
        HostScreens.shortcutWork = Runnable::run;
        try {
            synchronized (HostScreens.class) {
                asker.start();
                long until = System.currentTimeMillis() + 5_000;
                while (asker.getState() != Thread.State.BLOCKED && System.currentTimeMillis() < until) Thread.sleep(1);
                assertEquals("The asker waits for settings to start", Thread.State.BLOCKED, asker.getState());
                Thread other = new Thread(() -> Settings.bottomTabs.put("tab_people", true));
                other.start();
                other.join(5_000);
                assertFalse("Another thread can store an answer meanwhile", other.isAlive());
            }
            asker.join(5_000);
            assertFalse(asker.isAlive());
            assertTrue("The answer stored first, not the off switch", hidden[0]);
            assertTrue("A hidden tab counts as a use", Settings.activeAt.containsKey("tab_people"));
        } finally {
            TextStyleActivity.work = textStyleWork;
            HostScreens.shortcutWork = shortcutWork;
            HostScreens.applicationCreated(null);
            Settings.initialize(app);
        }
    }

    @Test public void aHeldAnswerShowsUntilARestartThroughTheSwitchPauseAndSafeMode() {
        assertNull("Nothing is held before Messenger asks", Settings.heldUntilRestart("emoji_drawer"));
        Settings.preferences.edit().putBoolean("emoji_drawer", true).commit();
        assertFalse(Settings.redesignedEmojiDrawer(true));
        assertNull("The held answer matches the switch", Settings.heldUntilRestart("emoji_drawer"));

        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart("emoji_drawer"));
        Settings.preferences.edit().putBoolean("paused", false).putBoolean("emoji_drawer", false).commit();
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart("emoji_drawer"));
        Settings.preferences.edit().putBoolean("emoji_drawer", true).putBoolean("safe_mode", true).commit();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart("emoji_drawer"));

        Settings.oldEmojiDrawer = null;
        Settings.keptSearchBar = null;
        assertNull("A restart asks again", Settings.heldUntilRestart("emoji_drawer"));
        assertNull("Controls that follow the switch live never hold an answer", Settings.heldUntilRestart("people"));
    }

    @Test public void anAccountWithoutTheRedesignHoldsNothingSoItsRowNeverWaits() {
        Settings.preferences.edit().putBoolean("emoji_drawer", true).commit();
        assertFalse(Settings.redesignedEmojiDrawer(false));
        Settings.preferences.edit().putBoolean("emoji_drawer", false).commit();
        assertNull(Settings.heldUntilRestart("emoji_drawer"));
        assertTrue("A later redesigned read still holds the switch as it is then", Settings.redesignedEmojiDrawer(true));
        Settings.preferences.edit().putBoolean("emoji_drawer", true).commit();
        assertEquals(Boolean.FALSE, Settings.heldUntilRestart("emoji_drawer"));
    }

    @Test public void theRowSaysWhenTheMetaAiTabWaitsForARestartInEitherDirection() {
        assertFalse(Settings.hideMetaAiTab());
        Settings.preferences.edit().putBoolean("meta_ai", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            TextView label = root.findViewWithTag("active_meta_ai");
            assertEquals("The Meta AI tab is hidden after Messenger restarts", label.getText().toString());
            assertEquals(View.VISIBLE, label.getVisibility());
            Switch control = root.findViewWithTag("meta_ai");
            assertTrue(control.getContentDescription().toString().endsWith(label.getText().toString()));
            control.toggle();
            assertFalse(Settings.preferences.getBoolean("meta_ai", true));
            assertEquals("Off again matches the tab Messenger kept", View.GONE, label.getVisibility());
        }

        Settings.metaAiTab = null;
        Settings.preferences.edit().putBoolean("meta_ai", true).commit();
        assertTrue(Settings.hideMetaAiTab());
        Settings.preferences.edit().putBoolean("meta_ai", false).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            TextView label = root.findViewWithTag("active_meta_ai");
            assertFalse(((Switch) root.findViewWithTag("meta_ai")).isChecked());
            assertEquals("An off switch still shows the tab is hidden until a restart", View.VISIBLE, label.getVisibility());
            assertEquals("The Meta AI tab comes back after Messenger restarts", label.getText().toString());

            root.findViewWithTag("tab_app").performClick();
            root.findViewWithTag("copy_setup").performClick();
            String setup = screen.get().getSystemService(ClipboardManager.class).getPrimaryClip().getItemAt(0).getText().toString();
            assertTrue(setup.matches("(?s).*\nmeta_ai: installed=true, selected=false, active=false, last_active=[^,]+, until_restart=true, scope=.*"));
            assertFalse(setup.contains("emoji_drawer: installed=true, selected=false, active=false, last_active=none, until_restart"));
        }
    }

    @Test public void withoutTheCaptureScreenTheCameraSwitchSaysWhyAndMessengersCameraStays() {
        var app = RuntimeEnvironment.getApplication();
        assertTrue(Settings.available(CameraActivity.KEY));
        Shadows.shadowOf(app.getPackageManager()).removeActivity(new ComponentName(app, CameraActivity.class));
        assertFalse(Settings.available(CameraActivity.KEY));

        Settings.preferences.edit().putBoolean(CameraActivity.KEY, true).commit();
        Intent stock = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        assertSame(stock, Settings.systemCamera(stock));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Switch control = screen.get().getWindow().getDecorView().findViewWithTag(CameraActivity.KEY);
            assertFalse(control.isEnabled());
            assertTrue(control.isChecked());
            assertTrue(control.getContentDescription().toString().contains(SettingsText.english("camera_unsupported")));
        }
    }
}
