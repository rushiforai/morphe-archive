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
        Settings.hookErrors.clear();
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
        assertSame(Status.ACTIVE, Settings.presenceToOthers(Status.ACTIVE));
    }

    /** Messenger's PresenceStatus, under the names its own class gives them. */
    private enum Status { OFFLINE, ACTIVE, IDLE, DISABLED }

    /** An enum like PresenceStatus that's missing the status the switch swaps in. */
    private enum Lopsided { ACTIVE, OFFLINE }

    @Test public void theStreamWritesWhatMessengerPickedWithTheSwitchOff() {
        for (Status status : Status.values()) assertSame(status, Settings.presenceToOthers(status));
        assertNull(Settings.presenceToOthers(null));
        assertEquals(0, Settings.lastActive(KEY));
    }

    @Test public void withTheSwitchOnTheStreamSaysIdleInsteadOfActive() {
        Settings.preferences.edit().putBoolean(KEY, true).commit();
        assertSame(Status.IDLE, Settings.presenceToOthers(Status.ACTIVE));
        // That's a use, so the line under the switch stops waiting (#243).
        assertTrue(Settings.lastActive(KEY) > 0);
        Settings.activeAt.clear();
        for (Status status : new Status[] {Status.OFFLINE, Status.IDLE, Status.DISABLED}) {
            assertSame(status, Settings.presenceToOthers(status));
        }
        assertEquals(0, Settings.lastActive(KEY));
        assertEquals("not an enum", Settings.presenceToOthers("not an enum"));
    }

    @Test public void aStatusWithNothingToSwapInGoesOutAndSaysWhy() {
        Settings.preferences.edit().putBoolean(KEY, true).commit();
        assertSame(Lopsided.ACTIVE, Settings.presenceToOthers(Lopsided.ACTIVE));
        assertTrue(Settings.hookErrorAt(KEY) > 0);
    }

    @Test public void theSwitchShipsWithTheExtension() {
        assertTrue(Settings.installed.contains(KEY));
        assertFalse(Settings.SUB_SWITCHES.containsKey(KEY));
    }
}
