package app.hushmessenger.extension;

import android.content.Context;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import static org.junit.Assert.*;

/** #222: a chat read only on this phone still counted on the badge on Messenger's icon and its Chats tab. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class UnreadBadgeTest {
    private static final String READ_HERE = "read_chats_locally";
    private static final String MARK_HERE = "mark_read_locally";
    private static final String SOURCE = "unified_thread_count_cql";
    private static final int UNREAD = -1;
    private static final int READ = 0;
    private final ThreadKey chat = new ThreadKey("ONE_TO_ONE:100012345:678");
    private final ThreadKey other = new ThreadKey("GROUP:999:1");
    private final long newest = System.currentTimeMillis() - 1000L;

    /** Stands in for the patched count: the hook runs first thing, then the count posts what it got. */
    private static final class Calculator {
        final List<String> posted = new ArrayList<>();

        void count(String trigger, String source, int group, int total, int open, int e2ee, int extra) {
            int badge = UnreadBadge.total(this, trigger, source, group, total, open, e2ee, extra);
            synchronized (posted) {
                posted.add(trigger + " " + source + " " + group + " " + badge + " " + open + " " + e2ee + " " + extra);
            }
        }

        List<String> posted() {
            synchronized (posted) {
                return new ArrayList<>(posted);
            }
        }
    }

    /** Two methods of the count's shape, so the extension can't tell which one counts. */
    private static final class TwoCounts {
        int calls;

        void count(String trigger, String source, int group, int total, int open, int e2ee, int extra) {
            calls++;
            UnreadBadge.total(this, trigger, source, group, total, open, e2ee, extra);
        }

        void other(String trigger, String source, int group, int total, int open, int e2ee, int extra) {
            calls++;
        }
    }

    @Before public void reset() {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.localReadChats = null;
        Settings.resetLocalMarksForTests();
        UnreadBadge.resetForTests();
        // Only the one test that waits for it lets the worker count again on its own.
        UnreadBadge.recountDelayMillis = 60L * 60 * 1000;
    }

    @After public void restore() {
        UnreadBadge.recountDelayMillis = 300L;
        UnreadBadge.resetForTests();
    }

    private void turnOn(String key) {
        Settings.preferences.edit().putBoolean(key, true).commit();
    }

    private int badge(int total) {
        return UnreadBadge.total(null, "trigger", SOURCE, 0, total, 0, 0, total);
    }

    @Test public void aChatReadHereComesOffTheBadgeWhileMessengerHasItUnread() {
        turnOn(READ_HERE);
        Settings.markChatReadLocally(chat);
        assertEquals("a chat this phone never read keeps Messenger's answer", UNREAD, Settings.chatReadHere(other, null, newest, UNREAD));
        assertEquals(READ, Settings.chatReadHere(chat, null, newest, UNREAD));
        assertEquals(4, badge(5));
        // Messenger read it too, say from another phone, so it's on Messenger's count no more and nothing comes off.
        assertTrue(Settings.chatReadHere(chat, null, newest, 1) >= 0);
        assertEquals(5, badge(5));
    }

    @Test public void aNewerMessageBringsTheChatBackOnTheBadge() {
        turnOn(READ_HERE);
        Settings.markChatReadLocally(chat);
        Settings.chatReadHere(chat, null, newest, UNREAD);
        assertEquals(2, badge(3));
        assertEquals(UNREAD, Settings.chatReadHere(chat, null, System.currentTimeMillis() + 60_000L, UNREAD));
        assertEquals(3, badge(3));
    }

    @Test public void theBadgeIsMessengersOwnWithBothSwitchesOffAndNeverGoesBelowNothing() {
        turnOn(READ_HERE);
        Settings.markChatReadLocally(chat);
        Settings.chatReadHere(chat, null, newest, UNREAD);
        assertEquals("a held chat Messenger left out of its count", 0, badge(0));
        Settings.preferences.edit().putBoolean(READ_HERE, false).commit();
        assertEquals(5, badge(5));
        assertEquals(UNREAD, Settings.chatReadHere(chat, null, newest, UNREAD));
        assertEquals(UNREAD, Settings.chatReadHere(null, null, newest, UNREAD));
    }

    @Test public void heldChatsSurviveTheNextLaunchWhileTheirMarkDoes() {
        turnOn(READ_HERE);
        Settings.markChatReadLocally(chat);
        Settings.chatReadHere(chat, null, newest, UNREAD);
        Settings.localReadChats = null;
        UnreadBadge.held = null;
        assertEquals("Messenger counts again with no chat list on screen", 4, badge(5));
        Settings.preferences.edit().remove(Settings.LOCAL_READ_CHATS).commit();
        Settings.localReadChats = null;
        UnreadBadge.held = null;
        assertEquals("a chat whose mark is gone is Messenger's again", 5, badge(5));
    }

    @Test public void markAsUnreadPutsTheChatBackOnTheBadge() {
        turnOn(MARK_HERE);
        assertTrue(Settings.markedReadHere(chat));
        assertEquals(READ, Settings.chatReadHere(chat, null, newest, UNREAD));
        assertEquals(1, badge(2));
        Settings.markedUnreadHere(chat);
        assertEquals(2, badge(2));
        assertEquals(UNREAD, Settings.chatReadHere(chat, null, newest, UNREAD));
    }

    @Test public void theBadgeIsCountedAgainWithMessengersOwnTotal() {
        turnOn(READ_HERE);
        Calculator calculator = new Calculator();
        calculator.count("USER_ENTERED_APP", SOURCE, 1, 3, 2, 0, 3);
        Settings.markChatReadLocally(chat);
        Settings.chatReadHere(chat, null, newest, UNREAD);
        UnreadBadge.countAgain();
        List<String> posted = calculator.posted();
        assertEquals(2, posted.size());
        assertEquals("USER_ENTERED_APP " + SOURCE + " 1 3 2 0 3", posted.get(0));
        assertEquals("the same count, with the held chat off its total", "USER_ENTERED_APP " + SOURCE + " 1 2 2 0 3", posted.get(1));
    }

    @Test public void aChangeCountsTheBadgeAgainOnItsOwn() throws InterruptedException {
        turnOn(READ_HERE);
        UnreadBadge.recountDelayMillis = 0L;
        Calculator calculator = new Calculator();
        calculator.count("t", SOURCE, 0, 3, 0, 0, 3);
        Settings.markChatReadLocally(chat);
        Settings.chatReadHere(chat, null, newest, UNREAD);
        long deadline = System.currentTimeMillis() + 5000L;
        while (calculator.posted().size() < 2 && System.currentTimeMillis() < deadline) Thread.sleep(20L);
        assertEquals("t " + SOURCE + " 0 2 0 0 3", calculator.posted().get(1));
        // Asking about the chat again changes nothing, so the badge isn't counted again.
        Settings.chatReadHere(chat, null, newest, UNREAD);
        Thread.sleep(200L);
        assertEquals(2, calculator.posted().size());
    }

    @Test public void aCountTheExtensionCantTellApartIsLeftAlone() {
        turnOn(READ_HERE);
        TwoCounts counts = new TwoCounts();
        counts.count("t", SOURCE, 0, 3, 0, 0, 3);
        UnreadBadge.countAgain();
        assertEquals(1, counts.calls);
    }

    /** Messenger's ThreadKey prints the same key every time, which is all the extension keeps a chat under. */
    private static final class ThreadKey {
        private final String id;

        ThreadKey(String id) { this.id = id; }

        @Override public String toString() { return id; }
    }
}
