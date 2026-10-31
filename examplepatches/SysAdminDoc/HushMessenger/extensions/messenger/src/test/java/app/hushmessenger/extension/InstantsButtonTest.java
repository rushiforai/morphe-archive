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
public class InstantsButtonTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void onlyItsOwnSwitchHidesTheButtonAndEachAttachAsksAgain() {
        assertFalse(Settings.hideInstantsButton());
        assertEquals(0, Settings.lastActive("instants_button"));
        Settings.preferences.edit().putBoolean("instants_button", true).commit();
        assertTrue(Settings.hideInstantsButton());
        assertTrue(Settings.lastActive("instants_button") > 0);
        Settings.preferences.edit().putBoolean("instants_button", false).commit();
        assertFalse("The next attach after switching off shows the button again", Settings.hideInstantsButton());
        assertEquals(Collections.singletonMap("instants_button", false), Settings.preferences.getAll());
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepTheButton() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("instants_button", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertFalse(state, Settings.hideInstantsButton());
            assertEquals(state, 0, Settings.lastActive("instants_button"));
        }
    }

    @Test public void theSwitchSitsUnderInboxAndStartsOff() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals("instants_button")) spec = control;
        assertNotNull(spec);
        assertEquals("Hide the Instants button", spec[1]);
        assertEquals("inbox", spec[3]);
        assertTrue(Settings.installed.contains("instants_button"));
        assertFalse(Settings.preferences.getBoolean("instants_button", false));
    }
}
