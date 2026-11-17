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
public class NearbyScansTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void theLoopIsHeldBackOnlyWhileTheSwitchIsOn() {
        assertFalse(Settings.stopNearbyScans());
        assertEquals(0, Settings.lastActive("nearby_scans"));
        Settings.preferences.edit().putBoolean("analytics_uploads", true).putBoolean("mqtt_telemetry", true).commit();
        assertFalse("The other privacy switches leave the scans alone", Settings.stopNearbyScans());

        Settings.preferences.edit().clear().putBoolean("nearby_scans", true).commit();
        assertTrue(Settings.stopNearbyScans());
        assertTrue(Settings.lastActive("nearby_scans") > 0);
        assertFalse("This switch leaves analytics alone", Settings.stopAnalyticsUploads());

        Settings.preferences.edit().putBoolean("nearby_scans", false).commit();
        assertFalse("The next time the loop is queued after switching off, it runs", Settings.stopNearbyScans());
    }

    @Test public void offPauseSafeModeAndAMissingControlLetTheLoopRun() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("nearby_scans", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertFalse(state, Settings.stopNearbyScans());
            assertEquals(state, 0, Settings.lastActive("nearby_scans"));
        }
    }

    @Test public void theConnectedNetworksNameAndAddressReadAsAndroidsHiddenValuesWhileOn() {
        assertEquals("\"Home\"", Settings.wifiName("\"Home\""));
        assertEquals("aa:bb:cc:dd:ee:ff", Settings.wifiBssid("aa:bb:cc:dd:ee:ff"));
        assertEquals("Reading them off counts as no use", 0, Settings.lastActive("nearby_scans"));

        Settings.preferences.edit().putBoolean("nearby_scans", true).commit();
        assertEquals("<unknown ssid>", Settings.wifiName("\"Home\""));
        assertEquals("02:00:00:00:00:00", Settings.wifiBssid("aa:bb:cc:dd:ee:ff"));
        assertTrue(Settings.lastActive("nearby_scans") > 0);
        // Not connected to Wi-Fi stays not connected, so Messenger's own null checks still see it.
        assertNull(Settings.wifiName(null));
        assertNull(Settings.wifiBssid(null));
        // Android's own hidden values pass through as they are.
        assertEquals("<unknown ssid>", Settings.wifiName("<unknown ssid>"));

        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertEquals("Pause gives Messenger the real network again", "\"Home\"", Settings.wifiName("\"Home\""));
        assertEquals("aa:bb:cc:dd:ee:ff", Settings.wifiBssid("aa:bb:cc:dd:ee:ff"));
    }

    @Test public void theSwitchSitsUnderPrivacyStartsOffAndStaysOutOfTheQuickSetups() {
        assertTrue(Settings.installed.contains("nearby_scans"));
        String[] row = Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals("nearby_scans")).findFirst().orElseThrow();
        assertEquals("Stop nearby scans", row[1]);
        assertEquals("tracking", row[3]);
        assertFalse(Settings.preferences.contains("nearby_scans"));
        assertFalse(Settings.wouldUse("nearby_scans"));
        // Location features may lean on these checks, so a one-tap setup doesn't turn them off for anyone.
        assertFalse(QuickSetups.PRIVACY.contains("nearby_scans"));
        assertFalse(QuickSetups.QUIET.contains("nearby_scans"));
    }
}
