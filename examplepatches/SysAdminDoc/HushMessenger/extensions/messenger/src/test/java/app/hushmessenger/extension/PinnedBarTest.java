package app.hushmessenger.extension;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class PinnedBarTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void offLeavesMessengersAnswer() {
        assertFalse(PinnedBar.show(false));
        assertTrue(PinnedBar.show(true));
        assertTrue(Settings.activeAt.isEmpty());
    }

    @Test public void onGivesEveryChatTheBar() {
        Settings.preferences.edit().putBoolean(PinnedBar.KEY, true).commit();
        assertTrue(PinnedBar.show(false));
        assertTrue(Settings.activeAt.containsKey(PinnedBar.KEY));
    }

    /** A chat Messenger already shows the bar in isn't the switch's doing. */
    @Test public void aChatMessengerPickedDoesntCountAsAUse() {
        Settings.preferences.edit().putBoolean(PinnedBar.KEY, true).commit();
        assertTrue(PinnedBar.show(true));
        assertTrue(Settings.activeAt.isEmpty());
    }

    @Test public void pauseAndSafeModeLeaveMessengersAnswer() {
        for (String state : new String[] {"paused", "safe"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(PinnedBar.KEY, true)
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            Settings.activeAt.clear();
            assertFalse(state, PinnedBar.show(false));
            assertTrue(state, Settings.activeAt.isEmpty());
        }
    }

    @Test public void theSwitchSitsWithTheChatSwitchesAndStartsOff() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals(PinnedBar.KEY)) spec = control;
        assertNotNull(spec);
        assertEquals("Show pinned messages", spec[1]);
        assertEquals("conversations", spec[3]);
        assertTrue(Settings.installed.contains(PinnedBar.KEY));
        assertFalse(Settings.preferences.getBoolean(PinnedBar.KEY, false));
    }
}
