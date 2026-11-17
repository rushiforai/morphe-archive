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
public class AdEventsTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void onlyItsOwnSwitchDropsTheEventsAndEachEventAsksAgain() {
        assertFalse(Settings.stopAdEvents());
        assertEquals(0, Settings.lastActive("ad_events"));
        Settings.preferences.edit().putBoolean("analytics_uploads", true).putBoolean("attribution_uploads", true).commit();
        assertFalse("The upload switches leave ad events alone", Settings.stopAdEvents());
        Settings.preferences.edit().clear().putBoolean("ad_events", true).commit();
        assertTrue(Settings.stopAdEvents());
        assertFalse("The ad events switch leaves analytics alone", Settings.stopAnalyticsUploads());
        assertFalse("The ad events switch leaves attribution alone", Settings.stopAttributionUploads());
        assertTrue(Settings.lastActive("ad_events") > 0);
        Settings.preferences.edit().putBoolean("ad_events", false).commit();
        assertFalse("The next event after switching off is logged", Settings.stopAdEvents());
    }

    @Test public void offPauseSafeModeAndAMissingControlLetTheEventsThrough() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("ad_events", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertFalse(state, Settings.stopAdEvents());
            assertEquals(state, 0, Settings.lastActive("ad_events"));
        }
    }

    @Test public void theSwitchSitsUnderPrivacyAndStartsOff() {
        assertTrue(Settings.installed.contains("ad_events"));
        String[] row = Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals("ad_events")).findFirst().orElseThrow();
        assertEquals("Stop inbox and ad link logging", row[1]);
        assertEquals("tracking", row[3]);
        assertFalse(Settings.preferences.contains("ad_events"));
        assertFalse(Settings.wouldUse("ad_events"));
    }
}
