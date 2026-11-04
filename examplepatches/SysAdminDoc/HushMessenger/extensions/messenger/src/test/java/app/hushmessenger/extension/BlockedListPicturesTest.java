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
public class BlockedListPicturesTest {
    private static final Object PICTURE = new Object();

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void onlyItsOwnSwitchDropsThePictureAndEachRowAsksAgain() {
        assertSame(PICTURE, Settings.blockedListPicture(PICTURE));
        assertEquals(0, Settings.lastActive("blocked_list_pictures"));
        Settings.preferences.edit().putBoolean("blocked_list_pictures", true).commit();
        assertNull(Settings.blockedListPicture(PICTURE));
        assertTrue(Settings.lastActive("blocked_list_pictures") > 0);
        Settings.preferences.edit().putBoolean("blocked_list_pictures", false).commit();
        assertSame("The next row after switching off keeps its picture", PICTURE, Settings.blockedListPicture(PICTURE));
        assertEquals(Collections.singletonMap("blocked_list_pictures", false), Settings.preferences.getAll());
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepThePicture() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("blocked_list_pictures", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertSame(state, PICTURE, Settings.blockedListPicture(PICTURE));
            assertEquals(state, 0, Settings.lastActive("blocked_list_pictures"));
        }
    }

    @Test public void theSwitchSitsUnderPrivacyAndStartsOff() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals("blocked_list_pictures")) spec = control;
        assertNotNull(spec);
        assertEquals("Hide pictures on the Blocked list", spec[1]);
        assertEquals("privacy", spec[3]);
        assertTrue(Settings.installed.contains("blocked_list_pictures"));
        assertFalse(Settings.preferences.getBoolean("blocked_list_pictures", false));
    }
}
