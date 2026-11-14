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
public class ChatPreviewTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void aLongPressOpensThePreviewOnlyWhileTheSwitchIsOn() {
        assertFalse(Settings.chatPreview(false));
        assertTrue("Meta's own yes stays a yes", Settings.chatPreview(true));
        assertEquals(0, Settings.lastActive("chat_preview"));

        Settings.preferences.edit().putBoolean("chat_preview", true).commit();
        assertTrue(Settings.chatPreview(false));
        assertTrue(Settings.chatPreview(true));
        assertTrue(Settings.lastActive("chat_preview") > 0);

        Settings.preferences.edit().putBoolean("chat_preview", false).commit();
        assertFalse("The next long press after switching off gets the plain menu", Settings.chatPreview(false));
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepMetasAnswer() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("chat_preview", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertFalse(state, Settings.chatPreview(false));
            assertTrue(state, Settings.chatPreview(true));
            assertEquals(state, 0, Settings.lastActive("chat_preview"));
        }
    }

    @Test public void theSwitchSitsUnderInboxStartsOffIsExperimentalAndStaysOutOfTheQuickSetups() {
        assertTrue(Settings.installed.contains("chat_preview"));
        String[] row = Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals("chat_preview")).findFirst().orElseThrow();
        assertEquals("Preview chats on long press", row[1]);
        assertEquals("chat_menu", row[3]);
        assertTrue(SettingsActivity.EXPERIMENTAL.contains("chat_preview"));
        assertFalse(Settings.preferences.contains("chat_preview"));
        assertFalse(Settings.wouldUse("chat_preview"));
        assertFalse(QuickSetups.PRIVACY.contains("chat_preview"));
        assertFalse(QuickSetups.QUIET.contains("chat_preview"));
    }
}
