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
        softwareVault = new SoftwareVault();
        MessageLog.vault = softwareVault;
        logFile().delete();
        Settings.preferences.edit().putBoolean("message_log", true).commit();
    }

    @After public void tidy() {
        MessageLog.vault = null;
        logFile().delete();
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
