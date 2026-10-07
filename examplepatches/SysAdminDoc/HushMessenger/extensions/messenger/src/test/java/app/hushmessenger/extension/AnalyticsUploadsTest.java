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
public class AnalyticsUploadsTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void onlyItsOwnSwitchStopsUploadsAndEachStartAsksAgain() {
        assertFalse(Settings.stopAnalyticsUploads());
        assertEquals(0, Settings.lastActive("analytics_uploads"));
        Settings.preferences.edit().putBoolean("analytics_uploads", true).commit();
        assertTrue(Settings.stopAnalyticsUploads());
        assertTrue(Settings.lastActive("analytics_uploads") > 0);
        Settings.preferences.edit().putBoolean("analytics_uploads", false).commit();
        assertFalse("The next upload after switching off runs as usual", Settings.stopAnalyticsUploads());
        assertEquals(Collections.singletonMap("analytics_uploads", false), Settings.preferences.getAll());
    }

    @Test public void offPauseSafeModeAndAMissingControlLetUploadsRun() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("analytics_uploads", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertFalse(state, Settings.stopAnalyticsUploads());
            assertEquals(state, 0, Settings.lastActive("analytics_uploads"));
        }
    }

    @Test public void pauseLetsTheNextUploadRunWithoutForgettingTheChoice() {
        Settings.preferences.edit().putBoolean("analytics_uploads", true).commit();
        assertTrue(Settings.stopAnalyticsUploads());
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(Settings.stopAnalyticsUploads());
        Settings.preferences.edit().putBoolean("paused", false).commit();
        assertTrue(Settings.stopAnalyticsUploads());
    }
}
