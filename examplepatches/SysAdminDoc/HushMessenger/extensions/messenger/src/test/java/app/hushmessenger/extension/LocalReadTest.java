package app.hushmessenger.extension;

import android.content.Context;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import static org.junit.Assert.*;

/** #178: with Hide read receipts on, a chat you opened still looked unread in the chat list. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class LocalReadTest {
    private static final String KEY = "read_chats_locally";
    private static final String RECEIPTS = "hide_read_receipts";
    private final Object session = new Object();
    private final ThreadKey chat = new ThreadKey("ONE_TO_ONE:100012345:678");

    @Before public void reset() {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.localReadChats = null;
        Settings.lastReply = null;
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
    }

    private void turnOn() {
        Settings.preferences.edit().putBoolean(KEY, true).putBoolean(RECEIPTS, true).commit();
    }

    @Test public void anOpenedChatReadsAsReadUntilANewerMessageArrives() {
        turnOn();
        long newest = System.currentTimeMillis() - 1000L;
        assertFalse(Settings.chatReadLocally(chat, newest));
        Settings.markChatReadLocally(chat);
        assertTrue(Settings.chatReadLocally(chat, newest));
        assertFalse(Settings.chatReadLocally(chat, System.currentTimeMillis() + 60_000L));
        assertFalse(Settings.chatReadLocally(new ThreadKey("GROUP:999:1"), newest));
    }

    @Test public void theMarkComesFromTheSeenThatWasHeldBack() {
        turnOn();
        long newest = System.currentTimeMillis() - 1000L;
        assertTrue(Settings.hideChatSeen(session, chat));
        assertFalse("a held Seen is what marks the chat", Settings.chatReadLocally(chat, newest));
        assertTrue(Settings.hideChatSeen(session, chat, null, "mid"));
        assertTrue(Settings.chatReadLocally(chat, newest));
    }

    @Test public void nothingIsKeptOrReadBackWhileTheSwitchIsOff() {
        Settings.preferences.edit().putBoolean(RECEIPTS, true).commit();
        long newest = System.currentTimeMillis() - 1000L;
        assertTrue(Settings.hideChatSeen(session, chat, null, "mid"));
        assertEquals(Collections.emptySet(), Settings.preferences.getStringSet(Settings.LOCAL_READ_CHATS, Collections.emptySet()));
        assertFalse(Settings.chatReadLocally(chat, newest));
        // Marked while on, the chat still answers unread once the switch goes off again.
        turnOn();
        Settings.markChatReadLocally(chat);
        assertTrue(Settings.chatReadLocally(chat, newest));
        Settings.preferences.edit().putBoolean(KEY, false).commit();
        assertFalse(Settings.chatReadLocally(chat, newest));
    }

    @Test public void theMarkSurvivesTheNextLaunch() {
        turnOn();
        long newest = System.currentTimeMillis() - 1000L;
        Settings.markChatReadLocally(chat);
        Set<String> stored = Settings.preferences.getStringSet(Settings.LOCAL_READ_CHATS, Collections.emptySet());
        assertEquals(1, stored.size());
        assertTrue(stored.iterator().next().startsWith("ONE_TO_ONE:100012345:678:"));
        Settings.localReadChats = null;
        assertTrue(Settings.chatReadLocally(chat, newest));
    }

    @Test public void staleAndMalformedEntriesAreDroppedOnTheWayBackIn() {
        turnOn();
        long now = System.currentTimeMillis();
        Set<String> stored = new HashSet<>();
        stored.add("ONE_TO_ONE:1:2:" + (now - Settings.LOCAL_READ_TTL - 1000L));
        stored.add("ONE_TO_ONE:3:4:" + (now - 1000L));
        stored.add("ONE_TO_ONE:5:6:not-a-time");
        stored.add("no-time-at-all");
        Settings.preferences.edit().putStringSet(Settings.LOCAL_READ_CHATS, stored).commit();
        Settings.localReadChats = null;
        assertFalse(Settings.chatReadLocally(new ThreadKey("ONE_TO_ONE:1:2"), now - 2000L));
        assertTrue(Settings.chatReadLocally(new ThreadKey("ONE_TO_ONE:3:4"), now - 2000L));
        assertFalse(Settings.chatReadLocally(new ThreadKey("ONE_TO_ONE:5:6"), now - 2000L));
        assertEquals(1, Settings.localReadMarks().size());
    }

    @Test public void onlyTheNewestMarksAreKept() {
        turnOn();
        for (int i = 0; i < Settings.LOCAL_READ_CHATS_MAX + 5; i++) Settings.markChatReadLocally(new ThreadKey("ONE_TO_ONE:" + i + ":0"));
        assertEquals(Settings.LOCAL_READ_CHATS_MAX, Settings.localReadMarks().size());
        assertEquals(Settings.LOCAL_READ_CHATS_MAX, Settings.preferences.getStringSet(Settings.LOCAL_READ_CHATS, Collections.emptySet()).size());
        assertTrue(Settings.chatReadLocally(new ThreadKey("ONE_TO_ONE:" + (Settings.LOCAL_READ_CHATS_MAX + 4) + ":0"), 0L));
    }

    @Test public void unknownChatsChangeNothing() {
        turnOn();
        Settings.markChatReadLocally(null);
        assertFalse(Settings.chatReadLocally(null, 0L));
        assertEquals(Collections.emptySet(), Settings.preferences.getStringSet(Settings.LOCAL_READ_CHATS, Collections.emptySet()));
    }

    private static final class ThreadKey {
        private final String id;

        ThreadKey(String id) { this.id = id; }

        @Override public String toString() { return id; }
    }
}
