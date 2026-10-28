package app.hushmessenger.extension;

import android.content.Context;
import android.os.SystemClock;
import java.time.Duration;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import org.robolectric.shadows.ShadowSystemClock;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class ReadReceiptsTest {
    private static final String KEY = "hide_read_receipts";
    private final Object session = new String("account");
    private final ThreadKey thread = new ThreadKey("chat");

    @Before public void reset() {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
        Settings.lastReply = null;
    }

    @Test public void anOpenChatSkipsItsSeenJobOnlyWhileTheSwitchIsInEffect() {
        assertFalse(Settings.hideChatSeen(session, thread));
        Settings.preferences.edit().putBoolean(KEY, true).commit();
        assertTrue(Settings.hideChatSeen(session, thread));
        assertTrue(Settings.lastActive(KEY) > 0);
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(Settings.hideChatSeen(session, thread));
    }

    @Test public void aReplyReleasesOnlyAnEqualThreadInTheIdenticalSession() {
        Settings.preferences.edit().putBoolean(KEY, true).commit();
        Settings.noteMessageSent(session, thread);
        assertFalse(Settings.hideChatSeen(session, new ThreadKey("chat")));
        assertTrue(Settings.hideChatSeen(session, new ThreadKey("another-chat")));
        Object anotherSession = new String("account");
        assertEquals(session, anotherSession);
        assertTrue(Settings.hideChatSeen(anotherSession, new ThreadKey("chat")));
    }

    @Test public void unknownInputsCannotCreateOrUseAReplyWindow() {
        Settings.preferences.edit().putBoolean(KEY, true).commit();
        Settings.noteMessageSent(null, thread);
        Settings.noteMessageSent(session, null);
        Settings.noteMessageSent(null, null);
        assertNull(Settings.lastReply);
        assertTrue(Settings.hideChatSeen(session, thread));
        Settings.noteMessageSent(session, thread);
        assertTrue(Settings.hideChatSeen(null, thread));
        assertTrue(Settings.hideChatSeen(session, null));
        assertTrue(Settings.hideChatSeen(null, null));
        assertFalse(Settings.hideChatSeen(session, thread));
    }

    @Test public void inactiveRepliesDoNotOpenAWindowWhenTheControlResumes() {
        Context context = RuntimeEnvironment.getApplication();
        for (String inactive : new String[] {"off", "paused", "safe_mode"}) {
            Settings.lastReply = null;
            Settings.preferences.edit().clear().putBoolean(KEY, !"off".equals(inactive))
                    .putBoolean("paused", "paused".equals(inactive))
                    .putBoolean("safe_mode", "safe_mode".equals(inactive)).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(context);
            Settings.noteMessageSent(session, thread);
            assertNull(inactive, Settings.lastReply);
            assertFalse(inactive, Settings.hideChatSeen(session, thread));
            assertFalse(inactive, Settings.hideChatSeen(null, null));
            Settings.preferences.edit().putBoolean(KEY, true).putBoolean("paused", false)
                    .putBoolean("safe_mode", false).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(context);
            assertTrue(inactive, Settings.hideChatSeen(session, thread));
        }
    }

    @Test public void theReplyWindowExpiresAtFiveSeconds() {
        Settings.preferences.edit().putBoolean(KEY, true).commit();
        Settings.noteMessageSent(session, thread);
        assertFalse(Settings.hideChatSeen(session, thread));
        ShadowSystemClock.advanceBy(Duration.ofMillis(Settings.REPLY_READ_MS - 1));
        assertFalse(Settings.hideChatSeen(session, thread));
        ShadowSystemClock.advanceBy(Duration.ofMillis(1));
        assertTrue(Settings.hideChatSeen(session, thread));
    }

    @Test public void expiryDoesNotDependOnTheWallClockAdvancing() {
        Settings.preferences.edit().putBoolean(KEY, true).commit();
        Settings.noteMessageSent(session, thread);
        long wallClock = System.currentTimeMillis();
        // Robolectric's wall clock follows uptime, so deep sleep advances only elapsed real time here. It can
        // still tick a millisecond on its own (seen once in a full gate run), so hold it under the window
        // rather than at exactly zero: a wall-clock expiry couldn't have fired either way.
        ShadowSystemClock.simulateDeepSleep(Duration.ofMillis(Settings.REPLY_READ_MS));
        assertTrue(System.currentTimeMillis() - wallClock < Settings.REPLY_READ_MS / 2);
        assertTrue(Settings.hideChatSeen(session, thread));
    }

    @Test public void aFutureMarkerCannotOpenAReplyWindow() {
        Settings.preferences.edit().putBoolean(KEY, true).commit();
        Settings.lastReply = new Settings.ReplyMarker(session, thread, SystemClock.elapsedRealtime() + 60_000);
        assertTrue(Settings.hideChatSeen(session, thread));
    }

    @Test public void collectedSessionOrThreadCannotReleaseSeen() {
        Settings.preferences.edit().putBoolean(KEY, true).commit();
        Settings.noteMessageSent(session, thread);
        Settings.lastReply.session.clear();
        assertTrue(Settings.hideChatSeen(session, thread));
        Settings.noteMessageSent(session, thread);
        Settings.lastReply.thread.clear();
        assertTrue(Settings.hideChatSeen(session, thread));
    }

    @Test public void theMostRecentReplyConservativelyReplacesThePreviousChat() {
        Settings.preferences.edit().putBoolean(KEY, true).commit();
        ThreadKey anotherThread = new ThreadKey("another-chat");
        Settings.noteMessageSent(session, thread);
        Settings.noteMessageSent(session, anotherThread);
        assertTrue(Settings.hideChatSeen(session, thread));
        assertFalse(Settings.hideChatSeen(session, new ThreadKey("another-chat")));
        Object anotherSession = new Object();
        Settings.noteMessageSent(anotherSession, anotherThread);
        assertTrue(Settings.hideChatSeen(session, anotherThread));
        assertFalse(Settings.hideChatSeen(anotherSession, anotherThread));
    }

    private static final class ThreadKey {
        private final String id;

        ThreadKey(String id) { this.id = id; }

        @Override public boolean equals(Object other) {
            return other instanceof ThreadKey && id.equals(((ThreadKey) other).id);
        }

        @Override public int hashCode() { return id.hashCode(); }
    }
}
