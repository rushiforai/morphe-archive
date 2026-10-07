package app.hushmessenger.extension;

import android.content.Context;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/**
 * A local log of the messages that reached a notification, kept so an unsend can't take them back. It's the only way to
 * cover end-to-end encrypted chats, which "Keep unsent messages" can't reach. The file and its key stay on the phone,
 * and the key lives in the Android keystore, so nothing here leaves the device and clearing the log throws the key away
 * with it. Writing happens off Messenger's notification thread, and any failure is swallowed into the control's
 * hook-error record the way the other controls handle theirs.
 */
public final class MessageLog {
    private MessageLog() {}

    static final String KEY = "message_log";
    static final String FILE = "hush_message_log.bin";
    static final String KEY_ALIAS = "hushmessenger_message_log";
    /** Keep the newest of these, or 30 days, whichever is smaller. */
    static final int MAX_ENTRIES = 500;
    static final long MAX_AGE_MS = 30L * 24 * 60 * 60 * 1000;
    private static final int IV_BYTES = 12;
    private static final int TAG_BITS = 128;

    private static final Executor WRITER = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "HushMessageLog");
        thread.setDaemon(true);
        return thread;
    });
    private static final Object LOCK = new Object();

    /** One stored message. The thread is whatever the notification carried, which may be a raw key or nothing. */
    public static final class Entry {
        public final long time;
        public final String thread;
        public final String text;
        Entry(long time, String thread, String text) {
            this.time = time;
            this.thread = thread;
            this.text = text;
        }
    }

    /**
     * Turns plaintext into a stored blob and back. The production path uses an AES-GCM key in the Android keystore. Tests
     * swap in a software key, since Robolectric has no keystore. The blob is the 12-byte GCM nonce followed by the
     * ciphertext and tag.
     */
    interface Vault {
        byte[] seal(byte[] plain) throws Exception;
        byte[] open(byte[] blob) throws Exception;
        void forget() throws Exception;
    }

    static volatile Vault vault;

    static Vault vault() {
        Vault current = vault;
        if (current == null) {
            synchronized (LOCK) {
                if (vault == null) vault = new KeystoreVault();
                current = vault;
            }
        }
        return current;
    }

    /** The hook calls this after it reads the message. It returns at once; the work runs on the log's own thread. */
    static void record(String text, String thread) {
        if (text == null) return;
        final String safeThread = thread == null ? "" : thread;
        WRITER.execute(() -> storeNow(text, safeThread));
    }

    static void storeNow(String text, String thread) {
        // The switch may have been turned off, paused or put in safe mode between the notification and this write.
        if (!Settings.wouldUse(KEY)) return;
        Context context = Settings.appContext;
        if (context == null) return;
        try {
            synchronized (LOCK) {
                List<Entry> entries = read(context);
                entries.add(new Entry(System.currentTimeMillis(), thread, text));
                prune(entries);
                write(context, entries);
            }
            Settings.activeAt.put(KEY, System.currentTimeMillis());
        } catch (Throwable failure) {
            Settings.hookFailedPrivately(KEY, "Can't keep the message log", failure);
        }
    }

    /** Newest first, for the viewer. Reads and decrypts off the main thread. */
    static List<Entry> entries() {
        Context context = Settings.appContext;
        if (context == null) return new ArrayList<>();
        try {
            synchronized (LOCK) {
                List<Entry> entries = read(context);
                prune(entries);
                List<Entry> newestFirst = new ArrayList<>(entries.size());
                for (int i = entries.size() - 1; i >= 0; i--) newestFirst.add(entries.get(i));
                return newestFirst;
            }
        } catch (Throwable failure) {
            Settings.hookFailedPrivately(KEY, "Can't read the message log", failure);
            return new ArrayList<>();
        }
    }

    /** Deletes the file and the key, so nothing stored before can be read again. */
    static void clear() {
        Context context = Settings.appContext;
        synchronized (LOCK) {
            if (context != null) {
                File file = new File(context.getFilesDir(), FILE);
                if (file.exists() && !file.delete()) file.deleteOnExit();
            }
            try {
                vault().forget();
            } catch (Throwable failure) {
                Settings.hookFailedPrivately(KEY, "Can't drop the message log key", failure);
            }
        }
    }

    private static void prune(List<Entry> entries) {
        long cutoff = System.currentTimeMillis() - MAX_AGE_MS;
        entries.removeIf(entry -> entry.time < cutoff);
        while (entries.size() > MAX_ENTRIES) entries.remove(0);
    }

    private static List<Entry> read(Context context) throws Exception {
        List<Entry> entries = new ArrayList<>();
        File file = new File(context.getFilesDir(), FILE);
        if (!file.exists()) return entries;
        byte[] blob = readAll(file);
        if (blob.length == 0) return entries;
        String plain = new String(vault().open(blob), StandardCharsets.UTF_8);
        for (String line : plain.split("\n", -1)) {
            if (line.isEmpty()) continue;
            String[] parts = line.split("\t", 3);
            if (parts.length < 3) continue;
            long time;
            try {
                time = Long.parseLong(parts[0]);
            } catch (NumberFormatException malformed) {
                continue;
            }
            entries.add(new Entry(time, unescape(parts[1]), unescape(parts[2])));
        }
        return entries;
    }

    static void write(Context context, List<Entry> entries) throws Exception {
        StringBuilder plain = new StringBuilder();
        for (Entry entry : entries) {
            plain.append(entry.time).append('\t').append(escape(entry.thread)).append('\t')
                .append(escape(entry.text)).append('\n');
        }
        byte[] blob = vault().seal(plain.toString().getBytes(StandardCharsets.UTF_8));
        File dir = context.getFilesDir();
        File temp = new File(dir, FILE + ".tmp");
        try (FileOutputStream out = new FileOutputStream(temp)) {
            out.write(blob);
            out.getFD().sync();
        }
        File file = new File(dir, FILE);
        if (!temp.renameTo(file)) {
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write(blob);
            }
            temp.delete();
        }
    }

    private static byte[] readAll(File file) throws IOException {
        try (java.io.FileInputStream in = new java.io.FileInputStream(file)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
            return out.toByteArray();
        }
    }

    private static String escape(String value) {
        return value.replace("\\", "\\\\").replace("\n", "\\n").replace("\t", "\\t");
    }

    private static String unescape(String value) {
        StringBuilder out = new StringBuilder(value.length());
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c == '\\' && i + 1 < value.length()) {
                char next = value.charAt(++i);
                out.append(next == 'n' ? '\n' : next == 't' ? '\t' : next);
            } else {
                out.append(c);
            }
        }
        return out.toString();
    }

    /** AES-GCM with a 256-bit key the Android keystore holds, so the key never leaves the phone. */
    static final class KeystoreVault implements Vault {
        private SecretKey key() throws Exception {
            KeyStore store = KeyStore.getInstance("AndroidKeyStore");
            store.load(null);
            KeyStore.Entry entry = store.getEntry(KEY_ALIAS, null);
            if (entry instanceof KeyStore.SecretKeyEntry) return ((KeyStore.SecretKeyEntry) entry).getSecretKey();
            KeyGenerator generator = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore");
            generator.init(new KeyGenParameterSpec.Builder(KEY_ALIAS,
                KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                .setKeySize(256)
                .build());
            return generator.generateKey();
        }

        @Override public byte[] seal(byte[] plain) throws Exception {
            Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
            cipher.init(Cipher.ENCRYPT_MODE, key());
            byte[] iv = cipher.getIV();
            byte[] body = cipher.doFinal(plain);
            byte[] blob = new byte[iv.length + body.length];
            System.arraycopy(iv, 0, blob, 0, iv.length);
            System.arraycopy(body, 0, blob, iv.length, body.length);
            return blob;
        }

        @Override public byte[] open(byte[] blob) throws Exception {
            Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
            byte[] iv = new byte[IV_BYTES];
            System.arraycopy(blob, 0, iv, 0, IV_BYTES);
            cipher.init(Cipher.DECRYPT_MODE, key(), new GCMParameterSpec(TAG_BITS, iv));
            return cipher.doFinal(blob, IV_BYTES, blob.length - IV_BYTES);
        }

        @Override public void forget() throws Exception {
            KeyStore store = KeyStore.getInstance("AndroidKeyStore");
            store.load(null);
            if (store.containsAlias(KEY_ALIAS)) store.deleteEntry(KEY_ALIAS);
        }
    }
}
