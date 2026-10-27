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
public class ShareStoryTest {
    private static final Object RUN = new Object();
    private static final Object SKIP = new Object();

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void theSwitchDropsYourStoryFromBothLoaders() {
        assertTrue(Settings.keepShareStory(true));
        assertSame(RUN, Settings.shareStorySection(RUN, SKIP));
        assertEquals(0, Settings.lastActive("share_story"));
        Settings.preferences.edit().putBoolean("share_story", true).commit();
        assertFalse(Settings.keepShareStory(true));
        assertTrue(Settings.lastActive("share_story") > 0);
        Settings.activeAt.clear();
        assertSame(SKIP, Settings.shareStorySection(RUN, SKIP));
        assertTrue(Settings.lastActive("share_story") > 0);
        Settings.preferences.edit().putBoolean("share_story", false).commit();
        assertTrue("The next share after switching off offers the story again", Settings.keepShareStory(true));
        assertSame(RUN, Settings.shareStorySection(RUN, SKIP));
    }

    @Test public void messengersOwnNoStaysNoAndIsntCountedAsAUse() {
        Settings.preferences.edit().putBoolean("share_story", true).commit();
        assertFalse(Settings.keepShareStory(false));
        assertSame(SKIP, Settings.shareStorySection(SKIP, SKIP));
        assertEquals(0, Settings.lastActive("share_story"));
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepTheStory() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("share_story", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertTrue(state, Settings.keepShareStory(true));
            assertSame(state, RUN, Settings.shareStorySection(RUN, SKIP));
            assertEquals(state, 0, Settings.lastActive("share_story"));
        }
    }

    @Test public void theSwitchSitsUnderPhotosAndVideosAndStartsOff() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals("share_story")) spec = control;
        assertNotNull(spec);
        assertEquals("Hide Your story when sharing", spec[1]);
        assertEquals("photos_videos", spec[3]);
        assertTrue(Settings.installed.contains("share_story"));
        assertFalse(Settings.preferences.getBoolean("share_story", false));
        assertFalse("Checked on a phone, so it carries no Experimental tag", SettingsActivity.EXPERIMENTAL.contains("share_story"));
    }
}
