package app.hushmessenger.extension;

import java.util.Arrays;
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
public class PhoneIdSyncTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void theListAndTheRequestAreSkippedOnlyWhileTheSwitchIsOn() {
        assertFalse(Settings.stopPhoneIdSync());
        assertEquals(0, Settings.lastActive("phone_id_sync"));
        Settings.preferences.edit().putBoolean("nearby_scans", true).putBoolean("analytics_uploads", true).commit();
        assertFalse("The other privacy switches leave the device ID alone", Settings.stopPhoneIdSync());

        Settings.preferences.edit().clear().putBoolean("phone_id_sync", true).commit();
        assertTrue(Settings.stopPhoneIdSync());
        assertTrue(Settings.lastActive("phone_id_sync") > 0);
        assertFalse("This switch leaves the scans alone", Settings.stopNearbyScans());

        Settings.preferences.edit().putBoolean("phone_id_sync", false).commit();
        assertFalse("The next sync after switching off runs", Settings.stopPhoneIdSync());
    }

    @Test public void offPauseSafeModeAndAMissingControlLetTheSyncRun() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("phone_id_sync", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertFalse(state, Settings.stopPhoneIdSync());
            assertEquals(state, 0, Settings.lastActive("phone_id_sync"));
        }
    }

    @Test public void theSwitchSitsUnderPrivacyStartsOffIsExperimentalAndStaysOutOfTheQuickSetups() {
        assertTrue(Settings.installed.contains("phone_id_sync"));
        String[] row = Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals("phone_id_sync")).findFirst().orElseThrow();
        assertEquals("Stop app list and device ID sharing", row[1]);
        assertEquals("tracking", row[3]);
        assertTrue(SettingsActivity.EXPERIMENTAL.contains("phone_id_sync"));
        assertFalse(Settings.preferences.contains("phone_id_sync"));
        assertFalse(Settings.wouldUse("phone_id_sync"));
        // Not seen on a phone yet, and sign-in between Meta's apps may lean on the ID, so no one-tap setup turns it on.
        assertFalse(QuickSetups.PRIVACY.contains("phone_id_sync"));
        assertFalse(QuickSetups.QUIET.contains("phone_id_sync"));
    }
}
