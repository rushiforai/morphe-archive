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

    @Before public void reset() throws Exception {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        // With the switch still off, this drops anything an earlier test left queued.
        MessageLog.drain();
        Settings.hookErrors.clear();
        softwareVault = new SoftwareVault();
        MessageLog.vault = softwareVault;
        logFile().delete();
        damagedFile().delete();
        Settings.preferences.edit().putBoolean("message_log", true).commit();
    }

    @After public void tidy() {
        MessageLog.vault = null;
        logFile().delete();
        damagedFile().delete();
    }

    private File logFile() {
        return new File(Settings.appContext.getFilesDir(), MessageLog.FILE);
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
            MessageLog.record("slow write", "t");
            assertTrue(writing.await(10, java.util.concurrent.TimeUnit.SECONDS));
            // The writer holds the file now; a new notification must still return at once.
            Thread capture = new Thread(() -> MessageLog.record("during the write", "t"));
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
    private static final class SoftwareVault implements MessageLog.Vault {
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
