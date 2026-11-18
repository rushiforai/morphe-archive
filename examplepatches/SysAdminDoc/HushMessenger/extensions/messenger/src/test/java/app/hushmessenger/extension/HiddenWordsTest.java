package app.hushmessenger.extension;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.io.File;
import java.util.List;

import static org.junit.Assert.*;

/**
 * #196: a message that arrives with one of your own words shows as [hidden] in the chat and puts up no notification,
 * while the messages you send go out as they always did. It rides hooks Keep unsent messages and Keep a message log
 * already have, so each of these checks that it works with those switches off and leaves them alone when they're on.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class HiddenWordsTest {
    private static final String CHAT = "ONE_TO_ONE:1:2";
    private static final String OTHER = "ONE_TO_ONE:1:3";
    private static final long SENT = 1_700_000_000_123L;
    private static final long SENDER = 42;

    private MessageLogTest.SoftwareVault vault;
    private java.util.function.LongConsumer retryLater;

    @Before public void start() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        Settings.ROW_TEXT.clear();
        Settings.STAMP_OWNER.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        HiddenWords.resetForTests();
        QuietChats.forget();
        // With the log's switch still off, this drops anything an earlier test left queued.
        retryLater = MessageLog.retryLater;
        MessageLog.retryLater = delay -> { };
        MessageLog.retry();
        MessageLog.forgetCaptures();
        vault = new MessageLogTest.SoftwareVault();
        MessageLog.vault = vault;
        UnsentWords.vault = vault;
        UnsentWords.worker = Runnable::run;
        UnsentWords.reset();
        logFile().delete();
        unsentFile().delete();
    }

    @After public void stop() {
        MessageLog.retryLater = retryLater;
        MessageLog.vault = null;
        UnsentWords.reset();
        UnsentWords.vault = null;
        UnsentWords.worker = UnsentWords.OWN_THREAD;
        HiddenWords.resetForTests();
        Settings.ROW_TEXT.clear();
        Settings.STAMP_OWNER.clear();
        logFile().delete();
        unsentFile().delete();
    }

    private static File logFile() {
        return new File(Settings.appContext.getFilesDir(), MessageLog.FILE);
    }

    private static File unsentFile() {
        return new File(Settings.appContext.getFilesDir(), UnsentWords.FILE);
    }

    /** The switch on with [typed] in the words field, every other control still off. */
    private static void hiding(String typed) {
        Settings.preferences.edit().putBoolean(HiddenWords.KEY, true).putString(HiddenWords.WORDS, typed).commit();
    }

    /** A chat row in an ordinary chat, which reads its text through Keep unsent messages' getter. */
    private static String chatRow(String text, String messageId) {
        return Settings.labelKeptUnsent(text, messageId);
    }

    /** The same row in an encrypted chat, where the text comes with the row's own time and sender. */
    private static String secretRow(String text, String messageId, String threadingId, long sent) {
        return Settings.labelKeptUnsentRow(text, messageId, threadingId, sent, SENDER, 1, 0);
    }

    /** The "deleted a message" row an encrypted chat shows in an unsent message's place. */
    private static String deletedRow(String messageId, String threadingId, long sent) {
        return Settings.labelKeptUnsentRow("Ana deleted a message", messageId, threadingId, sent, SENDER,
            Settings.UNSENT_PLACEHOLDER_TYPE, Settings.UNSENT_PLACEHOLDER_SUBTYPE);
    }

    /** The reported ask: a message with one of the words shows [hidden], and every other message is untouched. */
    @Test public void aMessageWithOneOfYourWordsShowsHiddenInstead() {
        hiding("cake, surprise party");
        assertTrue(Settings.watchesUnsentRows());
        assertEquals(HiddenWords.MASK, chatRow("the cake is ordered", "mid.1"));
        assertEquals(HiddenWords.MASK, chatRow("it's a surprise party", "mid.2"));
        assertEquals("dinner at eight", chatRow("dinner at eight", "mid.3"));
        // Encrypted chats read their rows through the same getter, so they're hidden the same way.
        assertEquals(HiddenWords.MASK, secretRow("the cake is ordered", "mid.4", "8004", SENT));
        assertEquals("dinner at eight", secretRow("dinner at eight", "mid.5", "8005", SENT + 1000));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** What the words field says under it: a whole word has to match, and capital letters don't matter. */
    @Test public void wholeWordsOnlyAndCapitalLettersDontMatter() {
        hiding("ok, rent");
        assertEquals(HiddenWords.MASK, chatRow("ok", "mid.1"));
        assertEquals(HiddenWords.MASK, chatRow("Ok, see you then", "mid.2"));
        assertEquals(HiddenWords.MASK, chatRow("the RENT is due", "mid.3"));
        assertEquals("okay then", chatRow("okay then", "mid.4"));
        assertEquals("renting a van", chatRow("renting a van", "mid.5"));
        assertEquals("broken", chatRow("broken", "mid.6"));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Words written with the switch off, and the switch on with nothing written, both leave every message alone. */
    @Test public void theSwitchOffOrNoWordsWrittenHidesNothing() {
        Settings.preferences.edit().putBoolean(HiddenWords.KEY, false).putString(HiddenWords.WORDS, "cake").commit();
        assertFalse(HiddenWords.wanted());
        assertFalse(Settings.watchesUnsentRows());
        assertFalse(Settings.logReceivedMessages());
        assertFalse(Settings.logQuietChats());
        assertEquals("the cake is ordered", chatRow("the cake is ordered", "mid.1"));

        hiding("  ,  ");
        assertFalse(HiddenWords.wanted());
        assertFalse(Settings.watchesUnsentRows());
        assertFalse(Settings.logReceivedMessages());
        assertEquals("the cake is ordered", chatRow("the cake is ordered", "mid.2"));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Pause and safe mode show every message as Messenger would, the way they do for every other control. */
    @Test public void pauseAndSafeModeShowEveryMessageAsBefore() {
        for (String state : new String[] {"paused", "safe_mode"}) {
            start();
            hiding("cake");
            assertEquals(state, HiddenWords.MASK, chatRow("the cake is ordered", "mid.1"));
            Settings.preferences.edit().putBoolean(state, true).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            assertFalse(state, HiddenWords.wanted());
            assertFalse(state, Settings.logReceivedMessages());
            assertEquals(state, "the cake is ordered", chatRow("the cake is ordered", "mid.2"));
        }
    }

    /** The other half of the report: no notification goes up for a message that was hidden. */
    @Test public void aHiddenMessagePutsUpNoNotification() {
        hiding("cake");
        assertTrue(Settings.logReceivedMessages());
        assertTrue(Settings.logQuietChats());

        Settings.incomingMessageId("mid.1");
        Settings.recordReceivedMessage("the cake is ordered", CHAT);
        assertTrue(Settings.dropQuiet(CHAT, "mid.1", "Ana"));
        // The push and the sync copy of one message share its id, so the second one is kept down too.
        assertTrue(Settings.dropQuiet(CHAT, "mid.1", "Ana"));

        Settings.incomingMessageId("mid.2");
        Settings.recordReceivedMessage("dinner at eight", CHAT);
        assertFalse(Settings.dropQuiet(CHAT, "mid.2", "Ana"));
        assertFalse(Settings.dropQuiet(OTHER, "mid.3", "Ana"));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Keep a message log is a separate switch: with it off, a hidden message leaves nothing behind. */
    @Test public void theMessageLogKeepsNothingWhileItsOwnSwitchIsOff() {
        hiding("cake");
        assertFalse(Settings.wouldUse(MessageLog.KEY));
        Settings.incomingMessageId("mid.1");
        Settings.incomingMessageMedia(new Object());
        Settings.recordReceivedMessage("the cake is ordered", CHAT);
        Settings.incomingMessageId("mid.2");
        Settings.recordReceivedMessage("dinner at eight", CHAT);

        // Turning the log on afterwards writes whatever it was holding, and it was holding nothing.
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).commit();
        MessageLog.drain();
        assertTrue(MessageLog.loadResult().entries.isEmpty());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** With the log on as well, a hidden message is still logged: nothing is deleted, it's only kept off the screen. */
    @Test public void theLogStillKeepsAHiddenMessageWhenItsOn() {
        hiding("cake");
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).commit();
        Settings.incomingMessageId("mid.1");
        Settings.recordReceivedMessage("the cake is ordered", CHAT);
        MessageLog.drain();
        List<MessageLog.Entry> entries = MessageLog.loadResult().entries;
        assertEquals(1, entries.size());
        assertEquals("the cake is ordered", entries.get(0).text);
        assertTrue(Settings.dropQuiet(CHAT, "mid.1", "Ana"));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Keep unsent messages is left as it was: rows reach the getter for hiding alone, and nothing else happens. */
    @Test public void keepUnsentMessagesIsLeftAloneWhileItsOwnSwitchIsOff() {
        hiding("cake");
        assertFalse(Settings.wouldUse("keep_unsent"));
        assertTrue(Settings.watchesUnsentRows());
        assertEquals("dinner at eight", secretRow("dinner at eight", "mid.1", "8001", SENT));
        assertTrue("No row's words are kept while the switch is off", Settings.ROW_TEXT.isEmpty());
        assertEquals("Ana deleted a message", deletedRow("mid.2", "8001", SENT));
        assertFalse(unsentFile().exists());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Both on: an unsent message whose words are hidden shows [hidden], and any other one still comes back. */
    @Test public void aHiddenUnsentMessageShowsHiddenRatherThanItsWords() {
        hiding("cake");
        Settings.preferences.edit().putBoolean("keep_unsent", true).commit();
        assertTrue(Settings.watchesUnsentRows());
        assertEquals(HiddenWords.MASK, secretRow("the cake is ordered", "mid.1", "8001", SENT));
        assertEquals("dinner at eight", secretRow("dinner at eight", "mid.2", "8002", SENT + 1000));
        assertEquals(HiddenWords.MASK, deletedRow("mid.3", "8003", SENT));
        assertEquals("[unsent] dinner at eight", deletedRow("mid.4", "8004", SENT + 1000));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Log chats that don't notify keeps working next to it: a quiet chat's notification is still the one dropped. */
    @Test public void logChatsThatDontNotifyStillDropsWhatItAlwaysDid() {
        hiding("cake");
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).putBoolean(QuietChats.KEY, true).commit();
        assertTrue(Settings.logQuietChats());
        assertTrue(Settings.quietChat(CHAT));
        assertTrue(QuietChats.isQuiet(CHAT));
        assertTrue(Settings.dropQuiet(CHAT, "mid.1", "Ana"));
        assertFalse("A chat that notifies keeps its notification", Settings.dropQuiet(OTHER, "mid.2", "Ana"));
        assertTrue(Settings.hookErrors.isEmpty());
    }
}
