package app.hushmessenger.extension;

import android.content.Context;
import java.io.File;
import java.nio.file.Files;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/**
 * The store with a software key, since Robolectric has no AndroidKeyStore. The production path keeps the key in the
 * keystore; only the key's source changes here, not the format or the logic.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MessageLogTest {
    private SoftwareVault softwareVault;
    private java.util.function.LongConsumer retryLater;
    private final List<Long> retries = new ArrayList<>();

    @Before public void reset() throws Exception {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        // A failed write's retry is caught here, so none fires in the middle of a later test.
        retryLater = MessageLog.retryLater;
        retries.clear();
        MessageLog.retryLater = retries::add;
        // With the switch still off, this drops anything an earlier test left queued, and a retry left waiting.
        MessageLog.retry();
        MessageLog.forgetCaptures();
        Settings.hookErrors.clear();
        softwareVault = new SoftwareVault();
        MessageLog.vault = softwareVault;
        logFile().delete();
        damagedFile().delete();
        Settings.preferences.edit().putBoolean("message_log", true).commit();
    }

    @After public void tidy() {
        MessageLog.retryLater = retryLater;
        MessageLog.vault = null;
        logFile().delete();
        damagedFile().delete();
    }

    private File logFile() {
        return new File(Settings.appContext.getFilesDir(), MessageLog.FILE);
    }

    @Test public void aReadFailureIsDifferentFromAnEmptyLog() throws Exception {
        assertFalse(MessageLog.loadResult().failed);
        MessageLog.storeNow("kept", "t");
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception { return softwareVault.seal(plain); }
            @Override public byte[] open(byte[] blob) throws Exception { throw new java.io.IOException("unavailable"); }
            @Override public void forget() { softwareVault.forget(); }
        };
        MessageLog.LoadResult result = MessageLog.loadResult();
        assertTrue(result.failed);
        assertFalse(result.setAside);
        assertTrue(result.entries.isEmpty());
        assertTrue(logFile().exists());
        MessageLog.vault = softwareVault;
        assertFalse(MessageLog.loadResult().failed);
        assertEquals("kept", MessageLog.loadResult().entries.get(0).text);
    }

    @Test public void clearingReportsAFailedKeyRemovalAndCanBeRetried() throws Exception {
        MessageLog.storeNow("kept", "t");
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception { return softwareVault.seal(plain); }
            @Override public byte[] open(byte[] blob) throws Exception { return softwareVault.open(blob); }
            @Override public void forget() throws Exception { throw new java.io.IOException("key unavailable"); }
        };
        assertFalse(MessageLog.clear());
        assertFalse(logFile().exists());
        MessageLog.vault = softwareVault;
        assertTrue(MessageLog.clear());
        assertFalse(MessageLog.loadResult().failed);
    }

    /** A set-aside file stays reported, but as a notice: the log keeps working, so it isn't a read failure. */
    @Test public void aSetAsideLogIsReportedApartFromFailuresUntilRemoved() throws Exception {
        Files.write(logFile().toPath(), new byte[] {1, 2, 3});
        MessageLog.LoadResult first = MessageLog.loadResult();
        assertFalse(first.failed);
        assertTrue(first.setAside);
        assertTrue(damagedFile().exists());
        MessageLog.storeNow("after", "t");
        MessageLog.LoadResult later = MessageLog.loadResult();
        assertFalse(later.failed);
        assertTrue(later.setAside);
        assertEquals("after", later.entries.get(0).text);
        assertTrue(MessageLog.removeSetAside());
        assertFalse(damagedFile().exists());
        MessageLog.LoadResult removed = MessageLog.loadResult();
        assertFalse(removed.setAside);
        assertEquals("after", removed.entries.get(0).text);
        assertTrue(MessageLog.removeSetAside());

        Files.write(logFile().toPath(), new byte[] {1, 2, 3});
        assertTrue(MessageLog.loadResult().setAside);
        assertTrue(MessageLog.clear());
        assertFalse(MessageLog.loadResult().setAside);
    }

    @Test public void keepsAnEncryptedCopyThatAnUnsendCantTakeBack() throws Exception {
        MessageLog.storeNow("secret note", "ONE_TO_ONE:1:2");
        // Messenger unsending the message later can't touch this file; the copy is independent.
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(1, entries.size());
        assertEquals("secret note", entries.get(0).text);
        assertEquals("ONE_TO_ONE:1:2", entries.get(0).thread);
        // On disk it's ciphertext, not the words.
        byte[] raw = Files.readAllBytes(logFile().toPath());
        assertFalse(new String(raw, java.nio.charset.StandardCharsets.ISO_8859_1).contains("secret note"));
        assertTrue(raw.length > MessageLog.FILE.length());
        assertTrue(Settings.lastActive("message_log") > 0);
    }

    @Test public void tabsAndNewlinesInAMessageSurviveTheRoundTrip() throws Exception {
        MessageLog.storeNow("line one\nline\ttwo\\end", "t");
        assertEquals("line one\nline\ttwo\\end", MessageLog.entries().get(0).text);
    }

    @Test public void takesTheSenderAndTheGroupFromTheChatsNotification() throws Exception {
        Context context = Settings.appContext;
        android.app.NotificationManager manager = context.getSystemService(android.app.NotificationManager.class);
        android.app.Notification.MessagingStyle style = new android.app.Notification.MessagingStyle(new android.app.Person.Builder().setName("Me").build())
            .setConversationTitle("Climbing").setGroupConversation(true)
            .addMessage("earlier", 1, new android.app.Person.Builder().setName("Bo").build())
            .addMessage("see you at six", 2, new android.app.Person.Builder().setName("Ana").build());
        manager.notify("GROUP:77", 1, new android.app.Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setStyle(style).build());
        try {
            MessageLog.storeNow("see you at six", "GROUP:77");
            MessageLog.storeNow("no notification for this one", "ONE_TO_ONE:5:6");
            List<MessageLog.Entry> entries = MessageLog.entries();
            assertEquals("", entries.get(0).sender);
            assertEquals("", entries.get(0).chat);
            assertEquals("Ana", entries.get(1).sender);
            assertEquals("Climbing", entries.get(1).chat);
            assertEquals("GROUP:77", entries.get(1).thread);
        } finally {
            manager.cancelAll();
        }
    }

    @Test public void aOneToOneNotificationGivesTheSenderAndNoGroup() throws Exception {
        Context context = Settings.appContext;
        android.app.NotificationManager manager = context.getSystemService(android.app.NotificationManager.class);
        android.app.Notification.MessagingStyle style = new android.app.Notification.MessagingStyle(new android.app.Person.Builder().setName("Me").build())
            .addMessage("hi\tthere", 1, new android.app.Person.Builder().setName("Ana\tB").build());
        manager.notify("ADVANCED_CRYPTO_ONE_TO_ONE:9", 1, new android.app.Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentTitle("Ana\tB").setStyle(style).build());
        try {
            MessageLog.storeNow("hi\tthere", "ADVANCED_CRYPTO_ONE_TO_ONE:9");
            MessageLog.Entry entry = MessageLog.entries().get(0);
            // Tabs in a name or the text survive the five-column line.
            assertEquals("Ana\tB", entry.sender);
            assertEquals("", entry.chat);
            assertEquals("hi\tthere", entry.text);
            // A one-to-one chat has only one other person, so words the notification doesn't show are still theirs.
            MessageLog.storeNow("a photo", "ADVANCED_CRYPTO_ONE_TO_ONE:9", "mid.2");
            assertEquals("Ana\tB", MessageLog.entries().get(0).sender);
        } finally {
            manager.cancelAll();
        }
    }

    @Test public void aMessageWhoseNotificationIsBuiltTwiceIsKeptOnce() throws Exception {
        // The push and the sync copy of one message carry the same id.
        MessageLog.storeNow("same words", "ONE_TO_ONE:1:2", "mid.1");
        MessageLog.storeNow("same words", "ONE_TO_ONE:1:2", "mid.1");
        MessageLog.storeNow("same words", "ONE_TO_ONE:3:4", "mid.2");
        MessageLog.storeNow("other words", "ONE_TO_ONE:1:2", "mid.3");
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(3, entries.size());
        assertEquals("other words", entries.get(0).text);
        assertEquals("ONE_TO_ONE:3:4", entries.get(1).thread);
        assertEquals("ONE_TO_ONE:1:2", entries.get(2).thread);
    }

    /** Two messages that say the same thing are two messages. Only the id says a notification is the same one again. */
    @Test public void differentMessagesWithTheSameWordsAreAllKept() throws Exception {
        MessageLog.storeNow("ok", "GROUP:7", "mid.1");
        MessageLog.storeNow("ok", "GROUP:7", "mid.2");
        // Long messages that only differ past the part the log keeps.
        String start = "x".repeat(MessageLog.MAX_TEXT_CHARS);
        MessageLog.storeNow(start + "one", "GROUP:7", "mid.3");
        MessageLog.storeNow(start + "two", "GROUP:7", "mid.4");
        assertEquals(4, MessageLog.entries().size());
    }

    /**
     * When the hook has no id for a capture, its words are all there is: it pairs with the same words in that chat, with
     * or without an id, either way round. Different words or another chat stay separate.
     */
    @Test public void aCopyWithoutAnIdPairsWithTheSameWordsInItsChat() throws Exception {
        MessageLog.storeNow("on my way", "ONE_TO_ONE:1:2");
        MessageLog.storeNow("on my way", "ONE_TO_ONE:1:2", "mid.1");
        MessageLog.storeNow("see you", "ONE_TO_ONE:1:2", "mid.2");
        MessageLog.storeNow("see you", "ONE_TO_ONE:1:2");
        MessageLog.storeNow("ok", "GROUP:7");
        MessageLog.storeNow("ok", "GROUP:7");
        MessageLog.storeNow("ok", "GROUP:8");
        MessageLog.storeNow("okay", "GROUP:7");
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(5, entries.size());
        assertEquals("on my way", entries.get(4).text);
        assertEquals("see you", entries.get(3).text);
        assertEquals("GROUP:8", entries.get(1).thread);
    }

    /** A copy without an id pairs with one capture only, so the same words sent again in that minute are all kept. */
    @Test public void eachCopyWithoutAnIdPairsOnce() throws Exception {
        MessageLog.storeNow("ok", "GROUP:7");
        MessageLog.storeNow("ok", "GROUP:7", "mid.1");
        MessageLog.storeNow("ok", "GROUP:7", "mid.2");
        MessageLog.storeNow("ok", "GROUP:7", "mid.3");
        MessageLog.storeNow("lol", "GROUP:7", "mid.4");
        MessageLog.storeNow("lol", "GROUP:7");
        MessageLog.storeNow("lol", "GROUP:7");
        // Both copies of this one came with the id, so the copy without one after it is another message.
        MessageLog.storeNow("yes", "GROUP:7", "mid.5");
        MessageLog.storeNow("yes", "GROUP:7", "mid.5");
        MessageLog.storeNow("yes", "GROUP:7");
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(7, entries.size());
        assertEquals(3, entries.stream().filter(entry -> entry.text.equals("ok")).count());
        assertEquals(2, entries.stream().filter(entry -> entry.text.equals("lol")).count());
        assertEquals(2, entries.stream().filter(entry -> entry.text.equals("yes")).count());
    }

    /** "Aa" and "BB" share String.hashCode() and length, and they're still two messages, with or without ids. */
    @Test public void wordsThatShareAHashAreStillDifferentMessages() throws Exception {
        assertEquals("Aa".hashCode(), "BB".hashCode());
        // Times only move forward here: a capture from the future would be dropped as a clock set back.
        assertFalse(MessageLog.repeated("t", "", "Aa", 1_000));
        assertFalse(MessageLog.repeated("t", "", "BB", 1_001));
        assertFalse(MessageLog.repeated("u", "mid.1", "Aa", 1_002));
        assertFalse(MessageLog.repeated("u", null, "BB", 1_003));
        // The real second copies still pair, once each.
        assertTrue(MessageLog.repeated("t", null, "Aa", 1_004));
        assertTrue(MessageLog.repeated("t", null, "BB", 1_005));
        assertTrue(MessageLog.repeated("u", null, "Aa", 1_006));
        assertFalse(MessageLog.repeated("u", null, "Aa", 1_007));
        // A lone surrogate isn't folded into "?" on the way to the digest.
        assertFalse(MessageLog.repeated("v", null, "x\uD800", 1_008));
        assertFalse(MessageLog.repeated("v", null, "x?", 1_009));

        MessageLog.forgetCaptures();
        MessageLog.storeNow("Aa", "GROUP:7");
        MessageLog.storeNow("BB", "GROUP:7");
        MessageLog.storeNow("Aa", "GROUP:8", "mid.2");
        MessageLog.storeNow("BB", "GROUP:8");
        assertEquals(4, MessageLog.entries().size());
    }

    /** The recent record keeps at most 2 * MAX_ENTRIES keys and drops the oldest first. */
    @Test public void theRecentRecordDropsItsOldestCapturesPastItsBound() {
        int bound = 2 * MessageLog.MAX_ENTRIES;
        // A capture with an id holds two keys. With the rest of the record full, its second copy still pairs...
        assertFalse(MessageLog.repeated("t", "mid.old", "x", 1_000));
        for (int i = 0; i < bound - 2; i++) assertFalse(MessageLog.repeated("t", null, "filler " + i, 1_000));
        assertTrue(MessageLog.repeated("t", "mid.old", "x", 1_000));
        // ...and one capture more pushes it out, so it reads as new.
        MessageLog.forgetCaptures();
        assertFalse(MessageLog.repeated("t", "mid.old", "x", 1_000));
        for (int i = 0; i < bound - 1; i++) assertFalse(MessageLog.repeated("t", null, "filler " + i, 1_000));
        assertFalse(MessageLog.repeated("t", "mid.old", "x", 1_000));
    }

    /** Clear keeps the recent record, so the second copy of a message from before a Clear isn't logged after it. */
    @Test public void theSecondCopyOfAMessageFromBeforeAClearStaysOut() throws Exception {
        MessageLog.storeNow("on my way", "ONE_TO_ONE:1:2", "mid.1");
        MessageLog.storeNow("see you", "ONE_TO_ONE:1:2");
        assertTrue(MessageLog.clear());
        MessageLog.storeNow("on my way", "ONE_TO_ONE:1:2", "mid.1");
        MessageLog.storeNow("see you", "ONE_TO_ONE:1:2", "mid.2");
        MessageLog.storeNow("new after the clear", "ONE_TO_ONE:1:2", "mid.3");
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(1, entries.size());
        assertEquals("new after the clear", entries.get(0).text);
    }

    @Test public void theSameIdAfterTheWindowIsANewCapture() {
        long start = 1_000;
        assertFalse(MessageLog.repeated("t", "mid.1", "a", start));
        assertTrue(MessageLog.repeated("t", "mid.1", "b", start + MessageLog.DUPLICATE_WINDOW_MS));
        assertFalse(MessageLog.repeated("t", "mid.1", "a", start + MessageLog.DUPLICATE_WINDOW_MS + 1));
        // A clock moved back doesn't hide the next message behind a capture from the future.
        assertFalse(MessageLog.repeated("t", "mid.2", "c", 50_000));
        assertFalse(MessageLog.repeated("t", "mid.2", "c", 40_000));
        // Without an id the words decide, within the same window.
        assertFalse(MessageLog.repeated("t", "", "d", 40_000));
        assertTrue(MessageLog.repeated("t", null, "d", 40_000));
        assertFalse(MessageLog.repeated("t", null, "d", 40_000 + MessageLog.DUPLICATE_WINDOW_MS + 1));
    }

    /** The hook hands each id over just before its message, and the sink takes it, so the next message can't reuse it. */
    @Test public void eachHandedOverIdIsTakenOnceOnItsOwnThread() throws Exception {
        Settings.incomingMessageId("mid.1");
        assertEquals("mid.1", Settings.takeIncomingMessageId());
        assertNull(Settings.takeIncomingMessageId());
        Settings.incomingMessageId("mid.2");
        String[] other = {"unset"};
        Thread elsewhere = new Thread(() -> other[0] = Settings.takeIncomingMessageId());
        elsewhere.start();
        elsewhere.join();
        assertNull(other[0]);
        assertEquals("mid.2", Settings.takeIncomingMessageId());
    }

    /**
     * Two people send the same words in a group. The notification can't say whose line is whose, so neither capture is
     * named, and a capture whose words it no longer shows isn't given its newest sender either.
     */
    @Test public void aGroupSenderTheNotificationCantPlaceStaysUnknown() throws Exception {
        Context context = Settings.appContext;
        android.app.NotificationManager manager = context.getSystemService(android.app.NotificationManager.class);
        android.app.Notification.MessagingStyle style = new android.app.Notification.MessagingStyle(new android.app.Person.Builder().setName("Me").build())
            .setConversationTitle("Climbing").setGroupConversation(true)
            .addMessage("on my way", 1, new android.app.Person.Builder().setName("Ana").build())
            .addMessage("on my way", 2, new android.app.Person.Builder().setName("Bo").build());
        manager.notify("GROUP:77", 1, new android.app.Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentTitle("Bo").setStyle(style).build());
        try {
            MessageLog.storeNow("on my way", "GROUP:77", "mid.1");
            MessageLog.storeNow("on my way", "GROUP:77", "mid.2");
            MessageLog.storeNow("an older message", "GROUP:77", "mid.3");
            List<MessageLog.Entry> entries = MessageLog.entries();
            assertEquals(3, entries.size());
            for (MessageLog.Entry entry : entries) {
                assertEquals("", entry.sender);
                assertEquals("Climbing", entry.chat);
            }
        } finally {
            manager.cancelAll();
        }
    }

    @Test public void namesAutoReplyNotedOutliveTheNotificationItAnswered() throws Exception {
        android.app.Notification.MessagingStyle style = new android.app.Notification.MessagingStyle(new android.app.Person.Builder().setName("Me").build())
            .addMessage("ping test", 1, new android.app.Person.Builder().setName("Ana").build());
        android.app.Notification answered = new android.app.Notification.Builder(Settings.appContext, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentTitle("Ana").setStyle(style).build();
        // Auto reply read it, and the reply took it down before the log got to it, so it's never posted here.
        MessageLog.noteNames("ADVANCED_CRYPTO_ONE_TO_ONE:9", "mid.1", "ping test", answered);
        MessageLog.storeNow("ping test", "ADVANCED_CRYPTO_ONE_TO_ONE:9", "mid.1");
        assertEquals("Ana", MessageLog.entries().get(0).sender);
        // Kept for that message only: another message with the same words isn't named from it.
        MessageLog.noteNames("ADVANCED_CRYPTO_ONE_TO_ONE:9", "mid.2", "ping test", answered);
        MessageLog.storeNow("ping test", "ADVANCED_CRYPTO_ONE_TO_ONE:9", "mid.3");
        assertEquals("", MessageLog.entries().get(0).sender);
        MessageLog.storeNow("ping test", "ADVANCED_CRYPTO_ONE_TO_ONE:9", "mid.2");
        assertEquals("Ana", MessageLog.entries().get(0).sender);
    }

    @Test public void namesAreNotNotedForAMessageWithoutAnId() throws Exception {
        android.app.Notification answered = new android.app.Notification.Builder(Settings.appContext, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentTitle("Ana").build();
        MessageLog.noteNames("ONE_TO_ONE:1:2", null, "hello", answered);
        MessageLog.noteNames("ONE_TO_ONE:1:2", "", "hello", answered);
        synchronized (MessageLog.NOTED) {
            assertTrue(MessageLog.NOTED.isEmpty());
        }
        MessageLog.storeNow("hello", "ONE_TO_ONE:1:2");
        assertEquals("", MessageLog.entries().get(0).sender);
    }

    private static android.app.Notification answeredBy(String sender, String text) {
        android.app.Notification.MessagingStyle style = new android.app.Notification.MessagingStyle(new android.app.Person.Builder().setName("Me").build())
            .addMessage(text, 1, new android.app.Person.Builder().setName(sender).build());
        return new android.app.Notification.Builder(Settings.appContext, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentTitle(sender).setStyle(style).build();
    }

    /** Writing the message uses up Auto reply's note, so a write that fails tries again with the names it already had. */
    @Test public void notedNamesSurviveAWriteThatFails() throws Exception {
        String chat = "ADVANCED_CRYPTO_ONE_TO_ONE:9";
        MessageLog.noteNames(chat, "mid.1", "ping test", answeredBy("Ana", "ping test"));
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception { throw new java.io.IOException("disk full"); }
            @Override public byte[] open(byte[] blob) throws Exception { return softwareVault.open(blob); }
            @Override public void forget() { softwareVault.forget(); }
        };
        MessageLog.storeNow("ping test", chat, "mid.1");
        MessageLog.vault = softwareVault;
        MessageLog.storeNow("next one", chat, "mid.2");
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(2, entries.size());
        MessageLog.Entry retried = entries.stream().filter(entry -> "ping test".equals(entry.text)).findFirst().orElseThrow();
        assertEquals("Ana", retried.sender);
    }

    @Test public void clearForgetsNamesNotedForMessagesNotWrittenYet() {
        MessageLog.noteNames("ADVANCED_CRYPTO_ONE_TO_ONE:9", "mid.1", "ping test", answeredBy("Ana", "ping test"));
        synchronized (MessageLog.NOTED) {
            assertEquals(1, MessageLog.NOTED.size());
        }
        assertTrue(MessageLog.clear());
        synchronized (MessageLog.NOTED) {
            assertTrue(MessageLog.NOTED.isEmpty());
        }
    }

    @Test public void namesAreNotNotedWhileTheLogIsOff() throws Exception {
        Settings.preferences.edit().putBoolean("message_log", false).commit();
        android.app.Notification answered = new android.app.Notification.Builder(Settings.appContext, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentTitle("Ana").build();
        MessageLog.noteNames("ONE_TO_ONE:1:2", "mid.1", "hello", answered);
        Settings.preferences.edit().putBoolean("message_log", true).commit();
        MessageLog.storeNow("hello", "ONE_TO_ONE:1:2", "mid.1");
        assertEquals("", MessageLog.entries().get(0).sender);
    }

    @Test public void readsALogWrittenBeforeNamesWereKept() throws Exception {
        long now = System.currentTimeMillis();
        byte[] plain = (now + "\tONE_TO_ONE:1:2\told format\n").getBytes(java.nio.charset.StandardCharsets.UTF_8);
        Files.write(logFile().toPath(), MessageLog.vault().seal(plain));
        MessageLog.Entry entry = MessageLog.entries().get(0);
        assertEquals("old format", entry.text);
        assertEquals("ONE_TO_ONE:1:2", entry.thread);
        assertEquals("", entry.sender);
        assertEquals("", entry.chat);
    }

    @Test public void readsALogWrittenBeforeUnsendsWereMarked() throws Exception {
        long now = System.currentTimeMillis();
        byte[] plain = (now + "\tONE_TO_ONE:1:2\tnamed\tAna\t\n").getBytes(java.nio.charset.StandardCharsets.UTF_8);
        Files.write(logFile().toPath(), MessageLog.vault().seal(plain));
        MessageLog.Entry entry = MessageLog.entries().get(0);
        assertEquals("named", entry.text);
        assertEquals("Ana", entry.sender);
        assertEquals("", entry.id);
        assertFalse(entry.unsent);
    }

    @Test public void anUnsendMarksTheLoggedMessageByItsId() throws Exception {
        MessageLog.storeNow("see you at six", "ONE_TO_ONE:1:2", "mid.1");
        MessageLog.storeNow("see you at six", "ONE_TO_ONE:1:2", "mid.2");
        // The id is kept in the file, so the mark finds the message after it's written.
        assertTrue(MessageLog.markNow("mid.1", null, null));
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertFalse(entries.get(0).unsent);
        assertTrue(entries.get(1).unsent);
        assertEquals("mid.1", entries.get(1).id);
        // A second recall of the same message, and one for a message the log never saw, change nothing.
        assertFalse(MessageLog.markNow("mid.1", "ONE_TO_ONE:1:2", "see you at six"));
        assertFalse(MessageLog.markNow("mid.9", null, null));
        assertFalse(MessageLog.entries().get(0).unsent);
    }

    @Test public void anUnsendBeforeTheWriteMarksTheQueuedMessage() throws Exception {
        assertTrue(MessageLog.queue("quick one", "ONE_TO_ONE:1:2", "mid.3"));
        assertTrue(MessageLog.markNow("mid.3", null, null));
        MessageLog.drain();
        assertTrue(MessageLog.entries().get(0).unsent);
    }

    @Test public void anUnsendTheHookHadNoIdForIsFoundByItsNotificationLine() throws Exception {
        Context context = Settings.appContext;
        android.app.NotificationManager manager = context.getSystemService(android.app.NotificationManager.class);
        android.app.Person ana = new android.app.Person.Builder().setName("Ana").build();
        android.app.Notification.MessagingStyle.Message unsent = new android.app.Notification.MessagingStyle.Message("ok", 2, ana);
        unsent.getExtras().putString("msgId", "mid.5");
        android.app.Notification.MessagingStyle style = new android.app.Notification.MessagingStyle(new android.app.Person.Builder().setName("Me").build())
            .addMessage(unsent).addMessage("later", 3, ana);
        manager.notify("ADVANCED_CRYPTO_ONE_TO_ONE:9", 1, new android.app.Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setStyle(style).build());
        // A chat whose notification names only its newest message.
        android.os.Bundle newest = new android.os.Bundle();
        newest.putString("msgId", "mid.6");
        manager.notify("ONE_TO_ONE:3:4", 2, new android.app.Notification.Builder(context, "chats")
            .setSmallIcon(android.R.drawable.sym_def_app_icon).setContentText("on my way").addExtras(newest).build());
        try {
            assertArrayEquals(new String[] {"ADVANCED_CRYPTO_ONE_TO_ONE:9", "ok"}, ChatNotifications.showing(context, "mid.5"));
            assertArrayEquals(new String[] {"ONE_TO_ONE:3:4", "on my way"}, ChatNotifications.showing(context, "mid.6"));
            assertNull(ChatNotifications.showing(context, "mid.7"));
            MessageLog.storeNow("ok", "ADVANCED_CRYPTO_ONE_TO_ONE:9");
            MessageLog.forgetCaptures();
            MessageLog.storeNow("ok", "ADVANCED_CRYPTO_ONE_TO_ONE:9");
            MessageLog.storeNow("ok", "ONE_TO_ONE:3:4");
            String[] shown = ChatNotifications.showing(context, "mid.5");
            assertTrue(MessageLog.markNow("mid.5", shown[0], shown[1]));
            List<MessageLog.Entry> entries = MessageLog.entries();
            // Only the newest "ok" in that chat is marked, never the same words in another chat.
            assertFalse(entries.get(0).unsent);
            assertTrue(entries.get(1).unsent);
            assertFalse(entries.get(2).unsent);
            // Marked once, a second recall doesn't move on to the older "ok".
            assertFalse(MessageLog.markNow("mid.5", shown[0], shown[1]));
            assertFalse(MessageLog.entries().get(2).unsent);
        } finally {
            manager.cancelAll();
        }
    }

    @Test public void listsNewestFirst() throws Exception {
        MessageLog.storeNow("first", "t");
        MessageLog.storeNow("second", "t");
        MessageLog.storeNow("third", "t");
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals("third", entries.get(0).text);
        assertEquals("first", entries.get(2).text);
    }

    @Test public void keepsOnlyTheNewestFiveHundred() throws Exception {
        for (int i = 0; i < MessageLog.MAX_ENTRIES + 7; i++) MessageLog.storeNow("m" + i, "t");
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(MessageLog.MAX_ENTRIES, entries.size());
        assertEquals("m" + (MessageLog.MAX_ENTRIES + 6), entries.get(0).text);
        // The seven oldest are gone.
        for (MessageLog.Entry entry : entries) assertNotEquals("m0", entry.text);
    }

    @Test public void dropsEntriesOlderThanThirtyDays() throws Exception {
        long now = System.currentTimeMillis();
        List<MessageLog.Entry> seeded = new ArrayList<>();
        seeded.add(new MessageLog.Entry(now - MessageLog.MAX_AGE_MS - 60_000, "t", "stale"));
        seeded.add(new MessageLog.Entry(now, "t", "fresh"));
        MessageLog.write(Settings.appContext, seeded);
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(1, entries.size());
        assertEquals("fresh", entries.get(0).text);
    }

    @Test public void storesNothingWhileOffPausedInSafeModeOrUninstalled() throws Exception {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear()
                .putBoolean("message_log", !state.equals("off"))
                .putBoolean("paused", state.equals("paused"))
                .putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = java.util.Collections.emptySet();
            Settings.activeAt.clear();
            logFile().delete();
            MessageLog.storeNow("should not land", "t");
            assertFalse(state, logFile().exists());
            assertTrue(state, MessageLog.entries().isEmpty());
            assertEquals(state, 0, Settings.lastActive("message_log"));
        }
    }

    @Test public void clearDeletesTheFileAndThrowsAwayTheKey() throws Exception {
        MessageLog.storeNow("gone soon", "t");
        assertTrue(logFile().exists());
        int keyBefore = softwareVault.generation;
        MessageLog.clear();
        assertFalse(logFile().exists());
        assertTrue(MessageLog.entries().isEmpty());
        assertNotEquals(keyBefore, softwareVault.generation);
    }

    @Test public void expiryRemovesOldEntriesFromTheFileWithoutANewMessageEvenWhenOff() throws Exception {
        long now = System.currentTimeMillis();
        List<MessageLog.Entry> seeded = new ArrayList<>();
        seeded.add(new MessageLog.Entry(now - MessageLog.MAX_AGE_MS - 60_000, "t", "stale"));
        seeded.add(new MessageLog.Entry(now, "t", "fresh"));
        MessageLog.write(Settings.appContext, seeded);
        // Off keeps what's stored but doesn't keep it past 30 days.
        Settings.preferences.edit().putBoolean("message_log", false).commit();
        MessageLog.expireNow();
        List<MessageLog.Entry> onDisk = MessageLog.read(logFile());
        assertEquals(1, onDisk.size());
        assertEquals("fresh", onDisk.get(0).text);
        assertNull(Settings.hookErrors.get("message_log"));
    }

    @Test public void expiryDeletesTheFileOnceEverythingIsOld() throws Exception {
        List<MessageLog.Entry> seeded = new ArrayList<>();
        seeded.add(new MessageLog.Entry(System.currentTimeMillis() - MessageLog.MAX_AGE_MS - 1, "t", "stale"));
        MessageLog.write(Settings.appContext, seeded);
        MessageLog.expireNow();
        assertFalse(logFile().exists());
    }

    @Test public void viewingTheLogAlsoRemovesExpiredEntriesFromDisk() throws Exception {
        long now = System.currentTimeMillis();
        List<MessageLog.Entry> seeded = new ArrayList<>();
        seeded.add(new MessageLog.Entry(now - MessageLog.MAX_AGE_MS - 60_000, "t", "stale"));
        seeded.add(new MessageLog.Entry(now, "t", "fresh"));
        MessageLog.write(Settings.appContext, seeded);
        assertEquals(1, MessageLog.entries().size());
        assertEquals(1, MessageLog.read(logFile()).size());
    }

    @Test public void anEntryDatedInTheFutureStillExpires() throws Exception {
        List<MessageLog.Entry> seeded = new ArrayList<>();
        seeded.add(new MessageLog.Entry(System.currentTimeMillis() + 365L * 24 * 60 * 60 * 1000, "t", "clock was wrong"));
        MessageLog.write(Settings.appContext, seeded);
        long time = MessageLog.read(logFile()).get(0).time;
        assertTrue(time <= System.currentTimeMillis());
        assertTrue(MessageLog.repairedOnRead);
        // The moved time is written back, or the stored one would read as fresh on every run and never expire.
        assertEquals(1, MessageLog.entries().size());
        assertTrue(MessageLog.read(logFile()).get(0).time <= System.currentTimeMillis());
        assertFalse(MessageLog.repairedOnRead);
    }

    @Test public void longMessagesAreCutWithoutSplittingAnEmoji() throws Exception {
        String emoji = "😀";
        String value = "x".repeat(MessageLog.MAX_TEXT_CHARS - 2) + emoji + "tail";
        String clipped = MessageLog.clip(value, MessageLog.MAX_TEXT_CHARS);
        assertTrue(clipped.length() <= MessageLog.MAX_TEXT_CHARS);
        assertTrue(clipped.endsWith("…"));
        assertFalse(Character.isHighSurrogate(clipped.charAt(clipped.length() - 2)));
        MessageLog.storeNow("y".repeat(MessageLog.MAX_TEXT_CHARS * 3), "z".repeat(MessageLog.MAX_THREAD_CHARS * 3));
        MessageLog.Entry stored = MessageLog.entries().get(0);
        assertEquals(MessageLog.MAX_TEXT_CHARS, stored.text.length());
        assertEquals(MessageLog.MAX_THREAD_CHARS, stored.thread.length());
    }

    @Test public void theWholeLogStaysUnderItsByteBudgetKeepingTheNewest() throws Exception {
        long now = System.currentTimeMillis();
        List<MessageLog.Entry> seeded = new ArrayList<>();
        int big = MessageLog.MAX_PLAIN_BYTES / MessageLog.MAX_TEXT_CHARS + 50;
        for (int i = 0; i < big; i++) seeded.add(new MessageLog.Entry(now - big + i, "t", i + "w".repeat(MessageLog.MAX_TEXT_CHARS - 10)));
        MessageLog.write(Settings.appContext, seeded);
        MessageLog.storeNow("newest", "t");
        List<MessageLog.Entry> onDisk = MessageLog.read(logFile());
        long bytes = 0;
        for (MessageLog.Entry entry : onDisk) bytes += (entry.time + "\t" + entry.thread + "\t" + entry.text + "\n").getBytes(java.nio.charset.StandardCharsets.UTF_8).length;
        assertTrue(bytes <= MessageLog.MAX_PLAIN_BYTES);
        assertEquals("newest", onDisk.get(onDisk.size() - 1).text);
        assertFalse(onDisk.get(0).text.startsWith("0w"));
    }

    @Test public void aLogTheKeyNoLongerOpensIsSetAsideAndTheLogKeepsWorking() throws Exception {
        MessageLog.storeNow("before", "t");
        // The keystore lost the key, for example after a restore; the old file can't be read any more.
        softwareVault.forget();
        MessageLog.storeNow("after", "t");
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(1, entries.size());
        assertEquals("after", entries.get(0).text);
        assertTrue(damagedFile().exists());
        assertTrue(Settings.hookErrors.get("message_log").contains("Damaged"));
    }

    @Test public void aFileCutShorterThanItsTagIsSetAside() throws Exception {
        MessageLog.storeNow("before", "t");
        File log = new File(Settings.appContext.getFilesDir(), MessageLog.FILE);
        Files.write(log.toPath(), java.util.Arrays.copyOf(Files.readAllBytes(log.toPath()), 20));
        MessageLog.storeNow("after", "t");
        assertEquals("after", MessageLog.entries().get(0).text);
        assertTrue(damagedFile().exists());
    }

    @Test public void anOversizedFileIsSetAsideWithoutBeingRead() throws Exception {
        try (java.io.RandomAccessFile file = new java.io.RandomAccessFile(logFile(), "rw")) {
            file.setLength(MessageLog.MAX_FILE_BYTES + 1);
        }
        assertTrue(MessageLog.entries().isEmpty());
        assertFalse(logFile().exists());
        assertTrue(damagedFile().exists());
        MessageLog.storeNow("works again", "t");
        assertEquals("works again", MessageLog.entries().get(0).text);
    }

    @Test public void aFailedWriteLeavesTheOldLogAsItWas() throws Exception {
        MessageLog.storeNow("kept", "t");
        byte[] before = Files.readAllBytes(logFile().toPath());
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception { throw new java.io.IOException("disk full"); }
            @Override public byte[] open(byte[] blob) throws Exception { return softwareVault.open(blob); }
            @Override public void forget() { softwareVault.forget(); }
        };
        MessageLog.storeNow("lost", "t");
        MessageLog.vault = softwareVault;
        assertArrayEquals(before, Files.readAllBytes(logFile().toPath()));
        assertTrue(Settings.hookErrors.get("message_log").contains("IOException"));
        // A temporary file that can't be written (here a folder in its place) fails the same way.
        File temp = new File(Settings.appContext.getFilesDir(), MessageLog.FILE + ".tmp");
        assertTrue(temp.mkdir());
        try {
            MessageLog.storeNow("also lost", "t");
            assertArrayEquals(before, Files.readAllBytes(logFile().toPath()));
        } finally {
            temp.delete();
        }
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(1, entries.size());
        assertEquals("kept", entries.get(0).text);
        // The messages a failed write couldn't keep wait in the queue, and the next write keeps them in order.
        MessageLog.storeNow("retried", "t");
        entries = MessageLog.entries();
        assertEquals(List.of("retried", "also lost", "lost", "kept"), entries.stream().map(entry -> entry.text).toList());
    }

    @Test public void aLogLeftByARepatchWithoutTheControlIsDeletedWithItsKey() throws Exception {
        MessageLog.storeNow("left behind", "t");
        assertTrue(logFile().exists());
        int keyBefore = softwareVault.generation;
        java.util.concurrent.Future<?> dropped = MessageLog.dropLeftovers(Settings.appContext);
        assertNotNull(dropped);
        dropped.get(10, java.util.concurrent.TimeUnit.SECONDS);
        assertFalse(logFile().exists());
        assertNotEquals("the key goes too", keyBefore, softwareVault.generation);
        // Nothing to drop means nothing scheduled.
        assertNull(MessageLog.dropLeftovers(Settings.appContext));
    }

    @Test public void clearDropsMessagesStillWaitingToBeWritten() throws Exception {
        MessageLog.storeNow("old", "t");
        MessageLog.queue("arrived before clear", "t");
        MessageLog.clear();
        MessageLog.drain();
        assertFalse(logFile().exists());
        assertTrue(MessageLog.entries().isEmpty());
        MessageLog.queue("arrived after clear", "t");
        MessageLog.drain();
        assertEquals("arrived after clear", MessageLog.entries().get(0).text);
    }

    /** Messages a failed write put back get a write of their own, so they don't wait on a next notification that may not come. */
    @Test public void aFailedWriteIsTriedAgainWithoutAnotherMessage() throws Exception {
        MessageLog.storeNow("kept", "t");
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception { throw new java.io.IOException("disk full"); }
            @Override public byte[] open(byte[] blob) throws Exception { return softwareVault.open(blob); }
            @Override public void forget() { softwareVault.forget(); }
        };
        MessageLog.storeNow("waiting", "t");
        assertEquals(List.of(MessageLog.RETRY_MS), retries);
        // A write that fails while the retry waits doesn't set up a second one, and each failed retry waits twice as long.
        MessageLog.storeNow("also waiting", "t");
        assertEquals(1, retries.size());
        MessageLog.retry();
        assertEquals(List.of(MessageLog.RETRY_MS, 2 * MessageLog.RETRY_MS), retries);
        for (int i = 0; i < 8; i++) MessageLog.retry();
        assertEquals(MessageLog.RETRY_MAX_MS, (long) retries.get(retries.size() - 1));
        MessageLog.vault = softwareVault;
        int before = retries.size();
        MessageLog.retry();
        List<String> kept = new ArrayList<>();
        for (MessageLog.Entry entry : MessageLog.entries()) kept.add(entry.text);
        assertEquals(List.of("also waiting", "waiting", "kept"), kept);
        assertEquals("nothing left to retry", before, retries.size());
        // A good write starts the wait over.
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception { throw new java.io.IOException("disk full"); }
            @Override public byte[] open(byte[] blob) throws Exception { return softwareVault.open(blob); }
            @Override public void forget() { softwareVault.forget(); }
        };
        MessageLog.storeNow("later", "t");
        MessageLog.vault = softwareVault;
        assertEquals(MessageLog.RETRY_MS, (long) retries.get(retries.size() - 1));
    }

    /** Undo's copy holds the file and the queue, a message that arrives while the file is read included. */
    @Test public void aClearForUndoTakesWhatArrivesWhileTheLogIsRead() throws Exception {
        MessageLog.storeNow("in the file", "t");
        MessageLog.queue("queued", "t");
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception { return softwareVault.seal(plain); }
            @Override public byte[] open(byte[] blob) throws Exception {
                MessageLog.queue("arrived during the read", "t");
                return softwareVault.open(blob);
            }
            @Override public void forget() throws Exception { softwareVault.forget(); }
        };
        MessageLog.Cleared cleared = MessageLog.clearForUndo();
        MessageLog.vault = softwareVault;
        assertTrue(cleared.cleared);
        List<String> taken = new java.util.ArrayList<>();
        for (MessageLog.Entry entry : cleared.removed) taken.add(entry.text);
        assertEquals(List.of("in the file", "queued", "arrived during the read"), taken);
        assertTrue(MessageLog.restore(cleared.removed));
        assertEquals(3, MessageLog.entries().size());
    }

    @Test public void aLogThatCantBeReadIsClearedWithNothingForUndo() throws Exception {
        MessageLog.storeNow("unreadable", "t");
        MessageLog.queue("queued", "t");
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception { return softwareVault.seal(plain); }
            @Override public byte[] open(byte[] blob) throws Exception { throw new java.io.IOException("unavailable"); }
            @Override public void forget() { softwareVault.forget(); }
        };
        MessageLog.Cleared cleared = MessageLog.clearForUndo();
        MessageLog.vault = softwareVault;
        assertTrue(cleared.cleared);
        assertTrue(cleared.removed.isEmpty());
        assertFalse(logFile().exists());
    }

    /** A file that can't be the log's own gives Undo nothing, the same as one the key store won't open. */
    @Test public void aDamagedLogIsClearedWithNothingForUndo() throws Exception {
        Files.write(logFile().toPath(), new byte[] {1, 2, 3});
        MessageLog.queue("queued", "t");
        MessageLog.Cleared cleared = MessageLog.clearForUndo();
        assertTrue(cleared.cleared);
        assertTrue(cleared.removed.isEmpty());
        assertFalse(logFile().exists());
        assertFalse(damagedFile().exists());
    }

    /** Messages that keep failing to save during an outage don't push the next try out. Only failed tries do. */
    @Test public void failedWritesWhileATryWaitsDontStretchTheNextOne() throws Exception {
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception { throw new java.io.IOException("key store busy"); }
            @Override public byte[] open(byte[] blob) throws Exception { return softwareVault.open(blob); }
            @Override public void forget() { softwareVault.forget(); }
        };
        MessageLog.storeNow("first", "t");
        for (int i = 0; i < 6; i++) MessageLog.storeNow("during the outage " + i, "t");
        assertEquals(List.of(MessageLog.RETRY_MS), retries);
        MessageLog.retry();
        MessageLog.vault = softwareVault;
        assertEquals(List.of(MessageLog.RETRY_MS, 2 * MessageLog.RETRY_MS), retries);
    }

    @Test public void aTryThatCantBeSetUpIsSetUpByTheNextFailure() throws Exception {
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception { throw new java.io.IOException("key store busy"); }
            @Override public byte[] open(byte[] blob) throws Exception { return softwareVault.open(blob); }
            @Override public void forget() { softwareVault.forget(); }
        };
        MessageLog.retryLater = delay -> { throw new java.util.concurrent.RejectedExecutionException("shut down"); };
        MessageLog.storeNow("first", "t");
        MessageLog.retryLater = retries::add;
        MessageLog.storeNow("second", "t");
        MessageLog.vault = softwareVault;
        assertEquals(1, retries.size());
    }

    @Test public void aBurstIsWrittenOnceAndTheQueueIsBounded() throws Exception {
        assertTrue(MessageLog.queue("first", "t"));
        // Already scheduled: the next ones ride the same write.
        assertFalse(MessageLog.queue("second", "t"));
        for (int i = 0; i < MessageLog.MAX_ENTRIES; i++) MessageLog.queue("burst " + i, "t");
        MessageLog.drain();
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(MessageLog.MAX_ENTRIES, entries.size());
        assertEquals("burst " + (MessageLog.MAX_ENTRIES - 1), entries.get(0).text);
        assertNotEquals("first", entries.get(entries.size() - 1).text);
    }

    @Test public void capturingNeverWaitsForAWriteInProgress() throws Exception {
        java.util.concurrent.CountDownLatch writing = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.CountDownLatch release = new java.util.concurrent.CountDownLatch(1);
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception {
                writing.countDown();
                release.await(10, java.util.concurrent.TimeUnit.SECONDS);
                return softwareVault.seal(plain);
            }
            @Override public byte[] open(byte[] blob) throws Exception { return softwareVault.open(blob); }
            @Override public void forget() { softwareVault.forget(); }
        };
        try {
            MessageLog.record("slow write", "t", null);
            assertTrue(writing.await(10, java.util.concurrent.TimeUnit.SECONDS));
            // The writer holds the file now; a new notification must still return at once.
            Thread capture = new Thread(() -> MessageLog.record("during the write", "t", null));
            capture.start();
            capture.join(2_000);
            assertFalse(capture.isAlive());
        } finally {
            release.countDown();
        }
        long deadline = System.currentTimeMillis() + 10_000;
        while (MessageLog.entries().size() < 2 && System.currentTimeMillis() < deadline) Thread.sleep(20);
        assertEquals("during the write", MessageLog.entries().get(0).text);
    }

    private File damagedFile() {
        return new File(Settings.appContext.getFilesDir(), MessageLog.DAMAGED);
    }

    /** AES-GCM with a key held in memory, same blob layout as the keystore path: 12-byte nonce, then ciphertext. */
    static final class SoftwareVault implements MessageLog.Vault {
        int generation;
        private SecretKey key = freshKey();
        private final SecureRandom random = new SecureRandom();

        private static SecretKey freshKey() {
            try {
                KeyGenerator generator = KeyGenerator.getInstance("AES");
                generator.init(256);
                return generator.generateKey();
            } catch (Exception impossible) {
                throw new RuntimeException(impossible);
            }
        }

        @Override public byte[] seal(byte[] plain) throws Exception {
            byte[] iv = new byte[12];
            random.nextBytes(iv);
            Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
            cipher.init(Cipher.ENCRYPT_MODE, key, new GCMParameterSpec(128, iv));
            byte[] body = cipher.doFinal(plain);
            byte[] blob = new byte[iv.length + body.length];
            System.arraycopy(iv, 0, blob, 0, iv.length);
            System.arraycopy(body, 0, blob, iv.length, body.length);
            return blob;
        }

        @Override public byte[] open(byte[] blob) throws Exception {
            byte[] iv = new byte[12];
            System.arraycopy(blob, 0, iv, 0, 12);
            Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
            cipher.init(Cipher.DECRYPT_MODE, key, new GCMParameterSpec(128, iv));
            return cipher.doFinal(blob, 12, blob.length - 12);
        }

        @Override public void forget() {
            key = freshKey();
            generation++;
        }
    }
}
