package app.hushmessenger.extension;

import android.content.Context;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * The words of messages someone unsent, kept past a restart (#70, #172).
 *
 * <p>{@link Settings#ROW_TEXT} holds every recent row's words while Messenger runs, and that is where an unsend finds
 * the words to put back. Swiping Messenger away empties it, so the chat's "deleted a message" row came back with
 * nothing to show and the message read as gone for good. Only a message already seen unsent is written here, never
 * every row that goes by, and the file is sealed with a key of its own, so clearing the message log leaves it alone.
 */
final class UnsentWords {
    static final String FILE = "hush_unsent_words.bin";
    /** The keystore key this file is sealed with, its own so the message log's Clear doesn't take it. */
    static final String KEY_ALIAS = "hushmessenger_unsent_words";
    /** The oldest words kept go first once there are this many. */
    static final int MAX_KEPT = 256;
    static final int MAX_KEY_CHARS = MessageLog.MAX_ID_CHARS;
    static final int MAX_TEXT_CHARS = 2_000;
    static final long MAX_FILE_BYTES = 1024L * 1024;

    private static final Object LOCK = new Object();

    /** Swapped by tests, like the message log's. */
    static volatile MessageLog.Vault vault;

    /** Keyed the way {@link Settings#ROW_TEXT} is, oldest first. Null until the file has been read. */
    private static Map<String, String> kept;
    /** Set once a read has been started, so the file is only read once a process. */
    private static final AtomicBoolean reading = new AtomicBoolean();
    /** Whether a write is already on its way. Guarded by {@link #LOCK}. */
    private static boolean saving;
    /** Whether the file has been read, so a write keeps what was already in it. Guarded by {@link #LOCK}. */
    private static boolean loaded;
    /** Words kept before the file had been read, waiting for the read to write them. Guarded by {@link #LOCK}. */
    private static boolean dirty;

    private UnsentWords() { }

    static MessageLog.Vault vault() {
        MessageLog.Vault current = vault;
        if (current == null) {
            synchronized (LOCK) {
                if (vault == null) vault = new MessageLog.KeystoreVault(KEY_ALIAS);
                current = vault;
            }
        }
        return current;
    }

    /** A thread of its own per piece of work, so nothing here is ever on the main thread. */
    static final java.util.concurrent.Executor OWN_THREAD = UnsentWords::onOwnThread;

    /** How the file is read and written. Tests swap it for one that runs on the caller's thread. */
    static volatile java.util.concurrent.Executor worker = OWN_THREAD;

    /**
     * Reads the file on a thread of its own, once a process, so neither the keystore nor the file costs the main thread
     * anything. A row that gets there first simply finds nothing, which is what it found before.
     */
    static void warmUp() {
        if (reading.getAndSet(true)) return;
        start(UnsentWords::load);
    }

    private static void onOwnThread(Runnable work) {
        Thread thread = new Thread(work, "hush-unsent-words");
        thread.setPriority(Thread.MIN_PRIORITY);
        thread.setDaemon(true);
        thread.start();
    }

    private static void start(Runnable work) {
        try {
            worker.execute(work);
        } catch (Throwable busy) {
            Settings.hookFailedPrivately("keep_unsent", "Can't keep unsent messages past a restart", busy);
        }
    }

    /** The words kept under [key], or null. Never touches the file, so any thread can ask. */
    static String words(String key) {
        if (key == null || key.isEmpty()) return null;
        synchronized (LOCK) {
            return kept == null ? null : kept.get(MessageLog.clip(key, MAX_KEY_CHARS));
        }
    }

    /** Keeps [text] under [key] for the next run of Messenger. Returns on the caller's thread; the file is written on another. */
    static void keep(String key, String text) {
        if (key == null || key.isEmpty() || text == null || text.isEmpty()) return;
        String id = MessageLog.clip(key, MAX_KEY_CHARS);
        String words = MessageLog.clip(text, MAX_TEXT_CHARS);
        synchronized (LOCK) {
            if (kept == null) kept = new LinkedHashMap<>();
            if (words.equals(kept.get(id))) return;
            kept.put(id, words);
            trim(kept);
            // Writing before the file has been read would drop the words already in it, so the read writes these.
            if (!loaded) {
                dirty = true;
                return;
            }
            if (saving) return;
            saving = true;
        }
        start(UnsentWords::save);
    }

    private static void trim(Map<String, String> words) {
        while (words.size() > MAX_KEPT) {
            Iterator<String> oldest = words.keySet().iterator();
            oldest.next();
            oldest.remove();
        }
    }

    static void load() {
        Context context = Settings.appContext;
        if (context == null) return;
        File file = new File(context.getFilesDir(), FILE);
        Map<String, String> read = new LinkedHashMap<>();
        try {
            byte[] plain = MessageLog.open(file, MAX_FILE_BYTES, vault());
            if (plain != null) {
                for (String line : new String(plain, StandardCharsets.UTF_8).split("\n", -1)) {
                    if (line.isEmpty()) continue;
                    String[] parts = line.split("\t", -1);
                    if (parts.length < 2) continue;
                    String key = MessageLog.clip(MessageLog.unescape(parts[0]), MAX_KEY_CHARS);
                    String words = MessageLog.clip(MessageLog.unescape(parts[1]), MAX_TEXT_CHARS);
                    if (!key.isEmpty() && !words.isEmpty()) read.put(key, words);
                }
            }
        } catch (MessageLog.Damaged damaged) {
            // A file this never wrote, or one its key no longer opens, is no use to anyone.
            if (file.exists() && !file.delete()) {
                Settings.hookFailedPrivately("keep_unsent", "Can't delete unsent words it can't read", damaged);
            }
            finish(read);
            return;
        } catch (Throwable failure) {
            Settings.hookFailedPrivately("keep_unsent", "Can't read the unsent messages' words", failure);
            finish(read);
            return;
        }
        finish(read);
    }

    /** Takes in what the file held, then writes the lot back if words were kept while it was being read. */
    private static void finish(Map<String, String> read) {
        boolean write;
        synchronized (LOCK) {
            if (kept == null) {
                kept = read;
            } else {
                // Words kept while the file was being read are the newer ones, so they stay as they are.
                for (Map.Entry<String, String> entry : read.entrySet()) kept.putIfAbsent(entry.getKey(), entry.getValue());
            }
            trim(kept);
            loaded = true;
            write = dirty && !saving;
            if (write) {
                dirty = false;
                saving = true;
            }
        }
        // Already on the thread the read ran on, so the write goes straight ahead.
        if (write) save();
    }

    private static void save() {
        Context context = Settings.appContext;
        Map<String, String> snapshot;
        synchronized (LOCK) {
            saving = false;
            if (kept == null || context == null) return;
            snapshot = new LinkedHashMap<>(kept);
        }
        StringBuilder plain = new StringBuilder();
        for (Map.Entry<String, String> entry : snapshot.entrySet()) {
            plain.append(MessageLog.escape(entry.getKey())).append('\t').append(MessageLog.escape(entry.getValue())).append('\n');
        }
        try {
            MessageLog.sealInto(context.getFilesDir(), FILE, plain.toString().getBytes(StandardCharsets.UTF_8), vault());
        } catch (Throwable failure) {
            Settings.hookFailedPrivately("keep_unsent", "Can't keep an unsent message's words", failure);
        }
    }

    /** Tests only: forgets what has been read so the next read starts over. */
    static void reset() {
        synchronized (LOCK) {
            kept = null;
            saving = false;
            loaded = false;
            dirty = false;
        }
        reading.set(false);
    }
}
