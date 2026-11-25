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
public class OpenChatSoundTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
    }

    @Test public void offKeepsTheOpenChatQuiet() {
        assertFalse(OpenChatSound.play(true));
        assertFalse(OpenChatSound.play(false));
        assertTrue(Settings.activeAt.isEmpty());
    }

    @Test public void onPlaysWhenMessengerWouldPlayInAppSounds() {
        Settings.preferences.edit().putBoolean(OpenChatSound.KEY, true).commit();
        assertTrue(OpenChatSound.play(true));
        assertTrue(Settings.activeAt.containsKey(OpenChatSound.KEY));
    }

    /** A silent phone or Messenger's In-app sounds turned off: still quiet, and not a use. */
    @Test public void messengersNoStaysANo() {
        Settings.preferences.edit().putBoolean(OpenChatSound.KEY, true).commit();
        assertFalse(OpenChatSound.play(false));
        assertTrue(Settings.activeAt.isEmpty());
    }

    @Test public void pauseAndSafeModeKeepItQuiet() {
        for (String state : new String[] {"paused", "safe"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(OpenChatSound.KEY, true)
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            Settings.activeAt.clear();
            assertFalse(state, OpenChatSound.play(true));
            assertTrue(state, Settings.activeAt.isEmpty());
        }
    }

    @Test public void theSwitchSitsUnderRestrictedChatsAndStartsOff() {
        int restricted = -1, own = -1;
        for (int i = 0; i < SettingsActivity.CONTROLS.length; i++) {
            if (SettingsActivity.CONTROLS[i][0].equals("restricted_notify")) restricted = i;
            if (SettingsActivity.CONTROLS[i][0].equals(OpenChatSound.KEY)) own = i;
        }
        assertEquals(restricted + 1, own);
        assertEquals("Sound in the open chat", SettingsActivity.CONTROLS[own][1]);
        assertEquals("notifications", SettingsActivity.CONTROLS[own][3]);
        assertTrue(Settings.installed.contains(OpenChatSound.KEY));
        assertTrue(SettingsActivity.EXPERIMENTAL.contains(OpenChatSound.KEY));
        assertFalse(Settings.preferences.getBoolean(OpenChatSound.KEY, false));
    }
}
