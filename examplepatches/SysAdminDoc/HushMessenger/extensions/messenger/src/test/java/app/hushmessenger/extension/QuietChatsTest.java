package app.hushmessenger.extension;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class QuietChatsTest {
    private static final String CHAT = "ONE_TO_ONE:1:2";
    private static final String OTHER = "ONE_TO_ONE:1:3";

    /** Named like Messenger's thread folder enum. */
    enum Folder { NONE, INBOX, OTHER, SPAM, RESTRICTED }

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        QuietChats.forget();
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).putBoolean(QuietChats.KEY, true).commit();
    }

    @After public void tidy() {
        QuietChats.forget();
        Settings.hookErrors.clear();
    }

    @Test public void aMutedChatGoesOnToTheLogAndItsNotificationIsDropped() {
        assertTrue(Settings.logQuietChats());
        assertTrue(Settings.quietChat(CHAT));
        assertTrue(QuietChats.isQuiet(CHAT));
        assertFalse(QuietChats.isQuiet(OTHER));
        assertTrue(Settings.dropQuiet(CHAT, "mid.1", "Ana"));
        assertFalse("A chat that was never let on keeps its notification", Settings.dropQuiet(OTHER, "mid.2", "Ana"));
        assertFalse(Settings.quietChat(null));
        assertFalse(Settings.dropQuiet(null, "mid.3", "Ana"));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aChatThatNotifiesAgainLosesItsMark() {
        assertTrue(Settings.quietChat(CHAT));
        Settings.notificationFolder(Folder.INBOX);
        Settings.loudChat(CHAT);
        assertFalse(QuietChats.isQuiet(CHAT));
        assertFalse(Settings.dropQuiet(CHAT, "mid.1", "Ana"));
    }

    @Test public void withTheSwitchOrTheLogOffAMutedChatStopsAsBefore() {
        for (String off : new String[] {QuietChats.KEY, MessageLog.KEY}) {
            reset();
            assertTrue(Settings.quietChat(CHAT));
            Settings.preferences.edit().putBoolean(off, false).commit();
            assertFalse(off, Settings.logQuietChats());
            assertFalse(off, Settings.quietChat(CHAT));
            assertFalse("The old mark goes with it", QuietChats.isQuiet(CHAT));
        }
    }

    @Test public void pauseAndSafeModeStopAMutedChatAsBefore() {
        for (String state : new String[] {"paused", "safe_mode"}) {
            reset();
            Settings.preferences.edit().putBoolean(state, true).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            assertFalse(state, Settings.logQuietChats());
            assertFalse(state, Settings.quietChat(CHAT));
        }
    }

    /** A restricted chat comes through as Inbox for the log and stays quiet even where its own setting notifies. */
    @Test public void aRestrictedChatIsLetOnForTheLogOnly() {
        assertSame(Folder.INBOX, Settings.notificationFolder(Folder.RESTRICTED));
        Settings.loudChat(CHAT);
        assertTrue(QuietChats.isQuiet(CHAT));
        assertTrue(Settings.dropQuiet(CHAT, "mid.1", "Ana"));
        // The mark is the restricted chat's alone: the next chat on the same thread that notifies isn't quiet.
        assertSame(Folder.INBOX, Settings.notificationFolder(Folder.INBOX));
        Settings.loudChat(OTHER);
        assertFalse(QuietChats.isQuiet(OTHER));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void notifyForRestrictedChatsWinsOverTheLog() {
        Settings.preferences.edit().putBoolean(Settings.RESTRICTED_NOTIFY, true).commit();
        assertSame(Folder.INBOX, Settings.notificationFolder(Folder.RESTRICTED));
        Settings.loudChat(CHAT);
        assertFalse(QuietChats.isQuiet(CHAT));
    }

    @Test public void withTheSwitchOffARestrictedChatKeepsItsFolder() {
        Settings.preferences.edit().putBoolean(QuietChats.KEY, false).commit();
        assertSame(Folder.RESTRICTED, Settings.notificationFolder(Folder.RESTRICTED));
        Settings.loudChat(CHAT);
        assertFalse(QuietChats.isQuiet(CHAT));
    }

    @Test public void withOnlyTheMessageLogOnAMutedChatStillStops() {
        Settings.preferences.edit().remove(QuietChats.KEY).commit();
        assertFalse(Settings.logQuietChats());
        assertFalse(Settings.quietChat(CHAT));
        assertSame(Folder.RESTRICTED, Settings.notificationFolder(Folder.RESTRICTED));
    }
}
