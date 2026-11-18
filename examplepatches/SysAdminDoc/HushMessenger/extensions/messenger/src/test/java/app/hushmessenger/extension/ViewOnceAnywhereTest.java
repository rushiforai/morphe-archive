package app.hushmessenger.extension;

import java.util.Collections;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class ViewOnceAnywhereTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void theSwitchOffersTheToggleWhereMessengerWouldnt() {
        assertFalse(Settings.viewOnceOffered(false));
        assertEquals(0, Settings.lastActive("view_once_anywhere"));
        Settings.preferences.edit().putBoolean("view_once_anywhere", true).commit();
        assertTrue(Settings.viewOnceOffered(false));
        assertTrue(Settings.lastActive("view_once_anywhere") > 0);
        Settings.preferences.edit().putBoolean("view_once_anywhere", false).commit();
        assertFalse("The next gallery after switching off asks Messenger again", Settings.viewOnceOffered(false));
        assertEquals(Collections.singletonMap("view_once_anywhere", false), Settings.preferences.getAll());
    }

    /** A chat Messenger already offers it in keeps the toggle whatever the switch says, and the switch stays idle there. */
    @Test public void aChatThatAlreadyHasItKeepsIt() {
        assertTrue(Settings.viewOnceOffered(true));
        assertEquals(0, Settings.lastActive("view_once_anywhere"));
        Settings.preferences.edit().putBoolean("view_once_anywhere", true).commit();
        assertTrue(Settings.viewOnceOffered(true));
    }

    @Test public void offPauseSafeModeAndAMissingControlGiveMessengersAnswerBack() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("view_once_anywhere", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertFalse(state, Settings.viewOnceOffered(false));
            assertTrue(state, Settings.viewOnceOffered(true));
            assertEquals(state, 0, Settings.lastActive("view_once_anywhere"));
        }
    }

    @Test public void theSwitchSitsUnderPhotosAndVideosAndStartsOff() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals("view_once_anywhere")) spec = control;
        assertNotNull(spec);
        assertEquals("Offer View once in every chat", spec[1]);
        assertEquals("photos_videos", spec[3]);
        assertTrue(Settings.installed.contains("view_once_anywhere"));
        assertFalse(Settings.preferences.getBoolean("view_once_anywhere", false));
    }
}
