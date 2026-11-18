package app.hushmessenger.extension;

import android.content.Context;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class AppearOfflineTest {
    private static final String KEY = "appear_offline";

    @Before public void reset() {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
    }

    @Test public void withTheSwitchOffMessengerReportsWhatItWasGoingTo() {
        assertTrue(Settings.availableToOthers(true));
        assertFalse(Settings.availableToOthers(false));
    }

    @Test public void withTheSwitchOnAnAvailableStatusIsHeldBack() {
        Settings.preferences.edit().putBoolean(KEY, true).commit();
        assertFalse(Settings.availableToOthers(true));
        assertTrue(Settings.lastActive(KEY) > 0);
        // A status Messenger was already holding back stays held back, and asks nothing of the switch.
        Settings.activeAt.clear();
        assertFalse(Settings.availableToOthers(false));
        assertEquals(0, Settings.lastActive(KEY));
    }

    @Test public void pausingHandsMessengerItsOwnStatusBack() {
        Settings.preferences.edit().putBoolean(KEY, true).putBoolean("paused", true).commit();
        assertTrue(Settings.availableToOthers(true));
    }

    @Test public void theSwitchShipsWithTheExtension() {
        assertTrue(Settings.installed.contains(KEY));
        assertFalse(Settings.SUB_SWITCHES.containsKey(KEY));
    }
}
