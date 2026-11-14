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
public class PinnedChatsTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void theLimitRisesOnlyWhileTheSwitchIsOnAndNeverDrops() {
        assertEquals("Messenger's own three stays while the switch is off", 3, Settings.pinnedChatLimit(3));
        assertEquals(0, Settings.lastActive("pinned_chats"));
        Settings.preferences.edit().putBoolean("mark_read_action", true).putBoolean("community_inbox", true).commit();
        assertEquals("The other inbox switches leave the limit alone", 3, Settings.pinnedChatLimit(3));

        Settings.preferences.edit().clear().putBoolean("pinned_chats", true).commit();
        assertEquals(20, Settings.pinnedChatLimit(3));
        assertEquals(20, Settings.pinnedChatLimit(0));
        assertEquals("A higher limit from Messenger itself is kept", 50, Settings.pinnedChatLimit(50));
        assertTrue(Settings.lastActive("pinned_chats") > 0);

        Settings.preferences.edit().putBoolean("pinned_chats", false).commit();
        assertEquals("The next check after switching off gets Messenger's number", 3, Settings.pinnedChatLimit(3));
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepMessengersLimit() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("pinned_chats", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertEquals(state, 3, Settings.pinnedChatLimit(3));
            assertEquals(state, 0, Settings.lastActive("pinned_chats"));
        }
    }

    @Test public void theSwitchSitsUnderInboxAndStartsOff() {
        assertTrue(Settings.installed.contains("pinned_chats"));
        String[] row = Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals("pinned_chats")).findFirst().orElseThrow();
        assertEquals("Pin more chats", row[1]);
        assertEquals("chat_menu", row[3]);
        assertFalse(Settings.preferences.contains("pinned_chats"));
        assertFalse(Settings.wouldUse("pinned_chats"));
    }
}
