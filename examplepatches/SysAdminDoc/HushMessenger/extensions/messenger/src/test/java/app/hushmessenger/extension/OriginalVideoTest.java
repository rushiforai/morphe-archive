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
public class OriginalVideoTest {
    static final long TEN_MB = 10L * 1024 * 1024;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void onlyItsOwnSwitchSendsAVideoThroughUntouched() {
        assertEquals(1, Settings.videoPassthrough(1, TEN_MB));
        assertEquals(0, Settings.videoPassthrough(0, TEN_MB));
        assertEquals(0, Settings.lastActive("original_video"));
        Settings.preferences.edit().putBoolean("original_video", true).commit();
        assertEquals(-1, Settings.videoPassthrough(1, TEN_MB));
        assertEquals(-1, Settings.videoPassthrough(0, TEN_MB));
        assertTrue(Settings.lastActive("original_video") > 0);
        Settings.preferences.edit().putBoolean("original_video", false).commit();
        assertEquals("The next video after switching off is re-encoded as usual", 1, Settings.videoPassthrough(1, TEN_MB));
        assertEquals(Collections.singletonMap("original_video", false), Settings.preferences.getAll());
    }

    @Test public void bigFilesUnknownSizesAndMessengersOwnPassthroughKeepTheStockAnswer() {
        Settings.preferences.edit().putBoolean("original_video", true).commit();
        assertEquals(-1, Settings.videoPassthrough(1, Settings.ORIGINAL_VIDEO_MAX_BYTES));
        assertEquals(1, Settings.videoPassthrough(1, Settings.ORIGINAL_VIDEO_MAX_BYTES + 1));
        assertEquals(1, Settings.videoPassthrough(1, 0));
        assertEquals(1, Settings.videoPassthrough(1, -1));
        Settings.activeAt.clear();
        assertEquals(-1, Settings.videoPassthrough(-1, TEN_MB));
        assertEquals("A video Messenger passes through anyway doesn't count as a use", 0, Settings.lastActive("original_video"));
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepMessengersAnswer() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("original_video", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertEquals(state, 1, Settings.videoPassthrough(1, TEN_MB));
            assertEquals(state, 0, Settings.lastActive("original_video"));
        }
    }
}
