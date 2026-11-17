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
public class AttributionUploadsTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void onlyItsOwnSwitchSkipsTheJobAndEachRunAsksAgain() {
        assertFalse(Settings.stopAttributionUploads());
        assertEquals(0, Settings.lastActive("attribution_uploads"));
        Settings.preferences.edit().putBoolean("analytics_uploads", true).commit();
        assertFalse("The analytics switch leaves attribution alone", Settings.stopAttributionUploads());
        Settings.preferences.edit().putBoolean("attribution_uploads", true).putBoolean("analytics_uploads", false).commit();
        assertTrue(Settings.stopAttributionUploads());
        assertFalse("The attribution switch leaves analytics alone", Settings.stopAnalyticsUploads());
        assertTrue(Settings.lastActive("attribution_uploads") > 0);
        Settings.preferences.edit().putBoolean("attribution_uploads", false).commit();
        assertFalse("The next run after switching off goes ahead", Settings.stopAttributionUploads());
    }

    @Test public void offPauseSafeModeAndAMissingControlLetTheJobRun() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("attribution_uploads", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertFalse(state, Settings.stopAttributionUploads());
            assertEquals(state, 0, Settings.lastActive("attribution_uploads"));
        }
    }

    @Test public void theSwitchSitsUnderPrivacyAndStartsOff() {
        assertTrue(Settings.installed.contains("attribution_uploads"));
        String[] row = Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals("attribution_uploads")).findFirst().orElseThrow();
        assertEquals("Stop ad attribution uploads", row[1]);
        assertEquals("tracking", row[3]);
        assertFalse(Settings.preferences.contains("attribution_uploads"));
        assertFalse(Settings.wouldUse("attribution_uploads"));
    }
}
