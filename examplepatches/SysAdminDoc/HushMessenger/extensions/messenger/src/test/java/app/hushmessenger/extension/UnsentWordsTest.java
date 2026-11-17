package app.hushmessenger.extension;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.io.File;
import java.io.FileOutputStream;

import static org.junit.Assert.*;

/**
 * #70 and #172: Keep unsent messages showed an unsent message's words again, until Messenger was closed from the
 * multitasking screen. The words lived only in memory, so the chat's "deleted a message" row came back with nothing.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class UnsentWordsTest {
    private static final long SENT = 1_700_000_000_123L;
    private static final long SENDER = 42;

    private MessageLogTest.SoftwareVault vault;

    @Before public void start() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        Settings.ROW_TEXT.clear();
        Settings.STAMP_OWNER.clear();
        CrashGuard.resetForTests();
        vault = new MessageLogTest.SoftwareVault();
        UnsentWords.vault = vault;
        UnsentWords.worker = Runnable::run;
        UnsentWords.reset();
        file().delete();
        Settings.preferences.edit().putBoolean("keep_unsent", true).commit();
    }

    @After public void stop() {
        Settings.ROW_TEXT.clear();
        Settings.STAMP_OWNER.clear();
        UnsentWords.reset();
        UnsentWords.vault = null;
        UnsentWords.worker = UnsentWords.OWN_THREAD;
        MessageLog.vault = null;
        file().delete();
    }

    private static File file() {
        return new File(Settings.appContext.getFilesDir(), UnsentWords.FILE);
    }

    /** Messenger swiped away and opened again: nothing is left in memory and the file is read afresh. */
    private static void restart() {
        Settings.ROW_TEXT.clear();
        Settings.STAMP_OWNER.clear();
        UnsentWords.reset();
        assertTrue(Settings.watchesUnsentRows());
    }

    /** A plain text row sent at {@link #SENT} by {@link #SENDER}. */
    private static String sentRow(String text, String messageId, String threadingId) {
        return Settings.labelKeptUnsentRow(text, messageId, threadingId, SENT, SENDER, 1, 0);
    }

    /** The "deleted a message" row 587 shows in the unsent message's place, at the same time and sender. */
    private static String deletedRow(String messageId, String threadingId) {
        return Settings.labelKeptUnsentRow("Ana deleted a message", messageId, threadingId, SENT, SENDER,
            Settings.UNSENT_PLACEHOLDER_TYPE, Settings.UNSENT_PLACEHOLDER_SUBTYPE);
    }

    /** The reported bug: the "deleted a message" row read as gone for good after Messenger was closed. */
    @Test public void theDeletedMessageRowKeepsItsWordsPastARestart() {
        assertTrue(Settings.watchesUnsentRows());
        assertEquals("see you at six", sentRow("see you at six", "mid.1", "8001"));
        assertEquals("[unsent] see you at six", deletedRow("mid.2", "8002"));
        restart();
        assertEquals("[unsent] see you at six", deletedRow("mid.2", "8002"));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** The same for the unsent message's own row, which comes back with no text at all. */
    @Test public void theRowWithNoTextKeepsItsWordsPastARestart() {
        assertTrue(Settings.watchesUnsentRows());
        assertEquals("on my way", sentRow("on my way", "mid.10", "8010"));
        Settings.recordUnsent("8010");
        assertEquals("[unsent] on my way", sentRow(null, "mid.10", "8010"));
        restart();
        assertEquals("[unsent] on my way", sentRow(null, "mid.10", "8010"));
    }

    /** A row keyed by its threading id while the notification kept the words by message id reads back either way. */
    @Test public void wordsKeptByMessageIdAreFoundByTheRowPastARestart() {
        assertTrue(Settings.watchesUnsentRows());
        UnsentWords.keep("mid.11", "bring the charger");
        Settings.recordUnsent("8011");
        restart();
        assertEquals("[unsent] bring the charger", sentRow(null, "mid.11", "8011"));
    }

    /** Only a message already seen unsent is written down, never every row that goes by. */
    @Test public void anOrdinaryRowIsNeverWrittenDown() {
        assertTrue(Settings.watchesUnsentRows());
        assertEquals("just chatting", sentRow("just chatting", "mid.20", "8020"));
        assertFalse(file().exists());
        restart();
        assertNull(UnsentWords.words("8020"));
    }

    /** Nothing is read or written until the control is on. */
    @Test public void theFileIsLeftAloneWhileTheControlIsOff() {
        Settings.preferences.edit().putBoolean("keep_unsent", false).commit();
        assertFalse(Settings.watchesUnsentRows());
        assertEquals("Ana deleted a message", deletedRow("mid.21", "8021"));
        assertFalse(file().exists());
    }

    /** Clearing the message log turns over its own key and its own files, so these words are still there. */
    @Test public void clearingTheMessageLogLeavesTheseWordsAlone() {
        MessageLog.vault = new MessageLogTest.SoftwareVault();
        assertTrue(Settings.watchesUnsentRows());
        assertEquals("the address", sentRow("the address", "mid.30", "8030"));
        Settings.recordUnsent("8030");
        assertEquals("[unsent] the address", sentRow(null, "mid.30", "8030"));
        MessageLog.clear();
        assertTrue(file().exists());
        restart();
        assertEquals("[unsent] the address", sentRow(null, "mid.30", "8030"));
    }

    /** Bounded, oldest words out first, so a long run can't grow the file without end. */
    @Test public void theWordsKeptAreBoundedOldestOutFirst() {
        assertTrue(Settings.watchesUnsentRows());
        for (int i = 0; i <= UnsentWords.MAX_KEPT; i++) UnsentWords.keep("id-" + i, "words " + i);
        restart();
        assertNull(UnsentWords.words("id-0"));
        assertEquals("words 1", UnsentWords.words("id-1"));
        assertEquals("words " + UnsentWords.MAX_KEPT, UnsentWords.words("id-" + UnsentWords.MAX_KEPT));
    }

    /** A long message is cut to a bound rather than kept whole. */
    @Test public void aVeryLongMessageIsCut() {
        assertTrue(Settings.watchesUnsentRows());
        StringBuilder words = new StringBuilder();
        while (words.length() < UnsentWords.MAX_TEXT_CHARS + 50) words.append('a');
        UnsentWords.keep("id-long", words.toString());
        restart();
        assertEquals(UnsentWords.MAX_TEXT_CHARS, UnsentWords.words("id-long").length());
        assertTrue(UnsentWords.words("id-long").startsWith("aaa"));
    }

    /**
     * Words kept in the moment between Messenger starting and the file being read are the newer ones, and the read
     * writes them down along with what the file already held.
     */
    @Test public void wordsKeptBeforeTheReadFinishesWin() {
        assertTrue(Settings.watchesUnsentRows());
        UnsentWords.keep("id-40", "first words");
        UnsentWords.keep("id-41", "kept too");
        UnsentWords.reset();
        Settings.ROW_TEXT.clear();
        UnsentWords.keep("id-40", "newer words");
        UnsentWords.load();
        assertEquals("newer words", UnsentWords.words("id-40"));
        assertEquals("kept too", UnsentWords.words("id-41"));
        // Both are on the file now, not only the one kept before the read.
        UnsentWords.reset();
        UnsentWords.load();
        assertEquals("newer words", UnsentWords.words("id-40"));
        assertEquals("kept too", UnsentWords.words("id-41"));
    }

    /** A file whose key no longer opens it is deleted instead of trusted, and reads as nothing. */
    @Test public void aFileItCannotOpenIsDeleted() {
        assertTrue(Settings.watchesUnsentRows());
        UnsentWords.keep("id-50", "hello");
        assertTrue(file().exists());
        vault.forget();
        restart();
        assertNull(UnsentWords.words("id-50"));
        assertFalse(file().exists());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Someone else's file in that name is deleted the same way, without throwing at the row that asked. */
    @Test public void aFileItNeverWroteIsDeleted() throws Exception {
        try (FileOutputStream out = new FileOutputStream(file())) {
            out.write("not ours".getBytes("UTF-8"));
        }
        restart();
        assertEquals("Ana deleted a message", deletedRow("mid.60", "8060"));
        assertFalse(file().exists());
    }

    /** Tabs and newlines in a message come back as they were sent. */
    @Test public void oddCharactersSurviveTheRoundTrip() {
        assertTrue(Settings.watchesUnsentRows());
        UnsentWords.keep("id-70", "two\tlines\nand a \\ slash");
        restart();
        assertEquals("two\tlines\nand a \\ slash", UnsentWords.words("id-70"));
    }
}
