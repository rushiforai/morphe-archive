package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import javax.crypto.AEADBadTagException;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/**
 * A local log of the messages that reached a notification, kept so an unsend can't take them back. It's the only way to
 * keep an end-to-end encrypted chat's message past the notification, which is as far as "Keep unsent messages" reaches
 * there. The file and its key stay on the phone, and the key lives in the Android keystore, so nothing here leaves the
 * device and clearing the log throws the key away with it. Writing happens off Messenger's notification thread, and any failure is swallowed into the control's
 * hook-error record the way the other controls handle theirs. When the sender unsends a logged message, its entry is
 * marked Unsent, found by Messenger's id for it or by the notification that showed it.
 *
 * Retention: entries older than 30 days are removed from the file itself, by a check shortly after Messenger starts and
 * every six hours after, whether or not the switch is on. Turning the switch off, pausing or safe mode stop new entries
 * but keep the ones already stored until they expire or the log is cleared. With {@link #SAVE_EXPIRING} on, a message is
 * added to a file in Download/Messenger right before it's removed. That file isn't encrypted, so the switch starts off.
 */
public final class MessageLog {
    private MessageLog() {}

    static final String KEY = "message_log";
    static final String SAVE_EXPIRING = "message_log_save_expiring";
    static final String FILE = "hush_message_log.bin";
    static final String DAMAGED = FILE + ".damaged";
    static final String KEY_ALIAS = "hushmessenger_message_log";
    /** Keep the newest of these, or 30 days, whichever is smaller. */
    static final int MAX_ENTRIES = 500;
    static final long MAX_AGE_MS = 30L * 24 * 60 * 60 * 1000;
    /** One message keeps at most this much text, and the whole log at most this many bytes before encryption. */
    static final int MAX_TEXT_CHARS = 8_000;
    static final int MAX_THREAD_CHARS = 256;
    static final int MAX_ID_CHARS = 256;
    static final int MAX_PLAIN_BYTES = 2 * 1024 * 1024;
    /** A file bigger than this was never written by this log, so it's set aside without reading it. */
    static final long MAX_FILE_BYTES = 8L * 1024 * 1024;
    static final long EXPIRY_DELAY_MS = 30_000;
    static final long EXPIRY_PERIOD_MS = 6L * 60 * 60 * 1000;
    /** How long a capture waits for its notification before it's written. */
    static final long NAME_DELAY_MS = 2_000;
    static final int MAX_NAME_CHARS = 200;
    /**
     * Messenger can build one message's notification twice, from the push and again from the sync, so the same message id
     * in the same chat this soon after is that message again.
     */
    static final long DUPLICATE_WINDOW_MS = 60_000;
    /** Names auto reply read off a notification, kept for this many captures at most. */
    private static final int MAX_NOTED = 50;
    /** A clock moved back can leave entries in the future, which would never expire; they count from now instead. */
    private static final long FUTURE_SLACK_MS = 24L * 60 * 60 * 1000;
    private static final int IV_BYTES = 12;
    private static final int TAG_BITS = 128;

    private static final ScheduledExecutorService WRITER = Executors.newSingleThreadScheduledExecutor(runnable -> {
        Thread thread = new Thread(runnable, "HushMessageLog");
        thread.setDaemon(true);
        return thread;
    });
    private static final AtomicBoolean EXPIRY_SCHEDULED = new AtomicBoolean();
    /** Guards the file and the key. Taken before PENDING whenever both are needed. */
    private static final Object LOCK = new Object();
    /** Messages captured but not yet written, oldest first. Guarded by itself. */
    private static final ArrayDeque<Entry> PENDING = new ArrayDeque<>();
    private static boolean drainScheduled;
    /** How long after a failed write the queue is written again, doubled for each failure in a row up to RETRY_MAX_MS. */
    static final long RETRY_MS = 30_000, RETRY_MAX_MS = 30L * 60 * 1000;
    /** Sets up the write that follows a failed one. Tests take the delay here instead. */
    static java.util.function.LongConsumer retryLater = delay -> WRITER.schedule(MessageLog::retry, delay, TimeUnit.MILLISECONDS);
    /** Whether that write is set up, and how many writes failed in a row. Guarded by PENDING. */
    private static boolean retryScheduled;
    private static int failedWrites;
    /** When each recent capture came in, by chat and message id or a digest of its words, oldest first. Guarded by PENDING. */
    private static final LinkedHashMap<String, Long> RECENT = new LinkedHashMap<>();
    /** Sender and group name auto reply read before answering, by chat and message id. Guarded by itself. */
    static final LinkedHashMap<String, String[]> NOTED = new LinkedHashMap<>();

    /**
     * One stored message. The thread is Messenger's key for the chat, used only to group and match entries. The sender
     * and the group's name come from the notification that showed the message, and are empty when it named nobody.
     */
    public static final class Entry {
        public final long time;
        public final String thread;
        public final String text;
        public final String sender;
        public final String chat;
        /** Messenger's id for the message, empty when the hook had none. An unsend finds the message by it. */
        final String id;
        /** The sender unsent the message after it was logged. */
        public final boolean unsent;
        Entry(long time, String thread, String text) {
            this(time, thread, text, "", "");
        }
        Entry(long time, String thread, String text, String sender, String chat) {
            this(time, thread, text, sender, chat, "");
        }
        Entry(long time, String thread, String text, String sender, String chat, String id) {
            this(time, thread, text, sender, chat, id, false);
        }
        Entry(long time, String thread, String text, String sender, String chat, String id, boolean unsent) {
            this.time = time;
            this.thread = thread;
            this.text = text;
            this.sender = sender == null ? "" : sender;
            this.chat = chat == null ? "" : chat;
            this.id = id == null ? "" : id;
            this.unsent = unsent;
        }

        Entry markedUnsent() {
            return new Entry(time, thread, text, sender, chat, id, true);
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

    /**
     * The hook calls this after it reads the message. It only adds the message to a short in-memory queue and returns;
     * one write on the log's own thread takes everything queued, so a burst of notifications costs one rewrite.
     */
    static void record(String text, String thread, String id) {
        // The write waits a moment so Messenger has posted the notification the sender's name is read from.
        if (queue(text, thread, id)) WRITER.schedule(MessageLog::drain, NAME_DELAY_MS, TimeUnit.MILLISECONDS);
    }

    /** Queues and writes on the calling thread. Tests use it to skip the background thread. */
    static void storeNow(String text, String thread, String id) {
        queue(text, thread, id);
        drain();
    }

    /** A capture the hook had no id for. Tests use it where the id doesn't matter. */
    static void storeNow(String text, String thread) {
        storeNow(text, thread, null);
    }

    static boolean queue(String text, String thread) {
        return queue(text, thread, null);
    }

    /** Returns true when no write is scheduled for the queue yet. */
    static boolean queue(String text, String thread, String id) {
        if (text == null) return false;
        long now = System.currentTimeMillis();
        Entry entry = new Entry(now, clip(thread == null ? "" : thread, MAX_THREAD_CHARS), clip(text, MAX_TEXT_CHARS), "", "",
            clip(id == null ? "" : id, MAX_ID_CHARS));
        synchronized (PENDING) {
            if (repeated(entry.thread, entry.id, entry.text, now)) return false;
            if (PENDING.size() >= MAX_ENTRIES) PENDING.removeFirst();
            PENDING.addLast(entry);
            if (drainScheduled) return false;
            drainScheduled = true;
            return true;
        }
    }

    /**
     * Whether this chat had the same message id captured within DUPLICATE_WINDOW_MS, which means it's the second
     * notification Messenger built for one message. Otherwise remembers this capture and returns false. Keeps its record
     * across Clear, so the second half of a message that came in before a Clear can't land after it.
     *
     * A capture the hook had no id for falls back to its words: it pairs with one capture in the chat with the same text
     * that hasn't been paired yet, with or without an id, either way round. Each capture pairs once, so a third "ok" in
     * the minute is a new message, and a message whose two copies both had the id leaves nothing to pair with.
     */
    static boolean repeated(String thread, String id, String text, long now) {
        boolean hasId = id != null && !id.isEmpty();
        // Only a digest of the words is held, and only for the window.
        String words = text == null ? "" : digest(text);
        String loose = thread + '\u0001' + words;
        String unpaired = thread + '\u0002' + words + '\u0003';
        synchronized (PENDING) {
            // A clock moved back leaves times in the future, and those can't vouch for anything either.
            RECENT.values().removeIf(at -> now - at > DUPLICATE_WINDOW_MS || at > now);
            if (hasId) {
                String byId = thread + '\u0000' + id;
                if (RECENT.containsKey(byId)) {
                    RECENT.remove(unpaired + id);
                    return true;
                }
                remember(byId, now);
                if (RECENT.remove(loose) != null) return true;
                remember(unpaired + id, now);
                return false;
            }
            if (RECENT.remove(loose) != null) return true;
            for (Iterator<String> keys = RECENT.keySet().iterator(); keys.hasNext(); ) {
                if (keys.next().startsWith(unpaired)) {
                    keys.remove();
                    return true;
                }
            }
            remember(loose, now);
            return false;
        }
    }

    /**
     * SHA-256 of the words. A 32-bit hash let two different messages ("Aa" and "BB" share one) pass for the same message
     * and lose the second. It reads the UTF-16 code units as they are, since encoding to UTF-8 would turn a lone
     * surrogate into "?" and make two different texts one.
     */
    private static String digest(String text) {
        try {
            MessageDigest sha = MessageDigest.getInstance("SHA-256");
            for (int i = 0; i < text.length(); i++) {
                char unit = text.charAt(i);
                sha.update((byte) (unit >> 8));
                sha.update((byte) unit);
            }
            byte[] hash = sha.digest();
            StringBuilder hex = new StringBuilder(hash.length * 2);
            for (byte b : hash) hex.append(Character.forDigit((b >> 4) & 0xf, 16)).append(Character.forDigit(b & 0xf, 16));
            return hex.toString();
        } catch (NoSuchAlgorithmException e) {
            // Every Java and Android runtime must provide SHA-256.
            throw new IllegalStateException(e);
        }
    }

    private static void remember(String key, long now) {
        RECENT.put(key, now);
        while (RECENT.size() > 2 * MAX_ENTRIES) {
            Iterator<String> oldest = RECENT.keySet().iterator();
            oldest.next();
            oldest.remove();
        }
    }

    /** Forgets recent captures and noted names. Tests start each case from a clean record with it. */
    static void forgetCaptures() {
        synchronized (PENDING) {
            RECENT.clear();
        }
        synchronized (NOTED) {
            NOTED.clear();
        }
    }

    /**
     * Auto reply answers through the chat's notification, and Messenger takes that notification down once the reply goes,
     * often before the log reads the sender's name off it. Auto reply hands the names over just before it answers, keyed
     * by the message's id so they can only land on that message. Without an id nothing is noted.
     */
    static void noteNames(String thread, String id, String text, android.app.Notification notification) {
        if (thread == null || id == null || id.isEmpty() || text == null || notification == null || !Settings.wouldUse(KEY)) return;
        String sender = ChatNotifications.sender(notification, text, thread);
        String chat = ChatNotifications.conversation(notification);
        if (sender == null && chat == null) return;
        String key = clip(thread, MAX_THREAD_CHARS) + '\u0000' + clip(id, MAX_ID_CHARS);
        synchronized (NOTED) {
            NOTED.put(key, new String[] {sender, chat});
            while (NOTED.size() > MAX_NOTED) {
                Iterator<Map.Entry<String, String[]>> oldest = NOTED.entrySet().iterator();
                oldest.next();
                oldest.remove();
            }
        }
    }

    /**
     * Messenger is about to take [id] out of its notification because the sender unsent it. The notification is read
     * now, while it still shows the message, and the mark is written on the log's own thread: the entry with that id,
     * else the newest one in the same chat with the same text.
     */
    static void markUnsent(String id) {
        if (id == null || id.isEmpty()) return;
        String[] shown = null;
        try {
            shown = ChatNotifications.showing(Settings.appContext, id);
        } catch (RuntimeException unreadable) {
            // The id alone can still find it.
        }
        String thread = shown == null ? null : clip(shown[0], MAX_THREAD_CHARS);
        String text = shown == null ? null : clip(shown[1], MAX_TEXT_CHARS);
        String clipped = clip(id, MAX_ID_CHARS);
        WRITER.execute(() -> markNow(clipped, thread, text));
    }

    /** Marks the message on the calling thread. Tests use it to skip the background thread. Returns whether it found one. */
    static boolean markNow(String id, String thread, String text) {
        synchronized (LOCK) {
            synchronized (PENDING) {
                List<Entry> queued = new ArrayList<>(PENDING);
                Boolean marked = markIn(queued, id, thread, text);
                if (marked != null) {
                    PENDING.clear();
                    PENDING.addAll(queued);
                    return marked;
                }
            }
            Context context = Settings.appContext;
            if (context == null) return false;
            try {
                List<Entry> entries = load(context);
                if (!Boolean.TRUE.equals(markIn(entries, id, thread, text))) return false;
                save(context, entries);
                Settings.activeAt.put(KEY, System.currentTimeMillis());
                return true;
            } catch (Throwable failure) {
                Settings.hookFailedPrivately(KEY, "Can't mark an unsent message in the log", failure);
                return false;
            }
        }
    }

    /**
     * Marks the message in [entries]: true when it marked one, false when the message was already marked, null when
     * it isn't there. Only the newest entry with the same chat and text can stand in for it, marked or not, so a second
     * call for one unsend never marks an older message that happens to say the same thing.
     */
    private static Boolean markIn(List<Entry> entries, String id, String thread, String text) {
        int found = -1;
        for (int i = entries.size() - 1; i >= 0 && found < 0; i--) if (id.equals(entries.get(i).id)) found = i;
        for (int i = entries.size() - 1; i >= 0 && found < 0 && thread != null && text != null; i--) {
            Entry entry = entries.get(i);
            if (thread.equals(entry.thread) && text.equals(entry.text)) found = i;
        }
        if (found < 0) return null;
        if (entries.get(found).unsent) return false;
        entries.set(found, entries.get(found).markedUnsent());
        return true;
    }

    static void drain() {
        // Taking the queue under the file lock means a Clear either runs before this (and empties the queue) or after
        // it (and deletes what this wrote). A message that arrived before Clear can't land after it.
        synchronized (LOCK) {
            List<Entry> batch;
            synchronized (PENDING) {
                batch = new ArrayList<>(PENDING);
                PENDING.clear();
                drainScheduled = false;
            }
            if (batch.isEmpty()) return;
            // The switch may have been turned off, paused or put in safe mode between the notification and this write.
            if (!Settings.wouldUse(KEY)) return;
            Context context = Settings.appContext;
            if (context == null) return;
            List<Entry> retry = batch;
            try {
                List<Entry> entries = load(context);
                List<Entry> withNames = new ArrayList<>(batch.size());
                for (Entry entry : batch) withNames.add(named(context, entry));
                // Naming uses up Auto reply's notes, so a failed write retries these with their names.
                retry = withNames;
                entries.addAll(withNames);
                expire(context, entries, System.currentTimeMillis());
                save(context, entries);
                synchronized (PENDING) {
                    failedWrites = 0;
                }
                Settings.activeAt.put(KEY, System.currentTimeMillis());
            } catch (Throwable failure) {
                long delay = 0;
                // Back in front of the queue, so the next write tries them again. The cap still holds.
                synchronized (PENDING) {
                    for (int i = retry.size() - 1; i >= 0; i--) PENDING.addFirst(retry.get(i));
                    while (PENDING.size() > MAX_ENTRIES) PENDING.removeFirst();
                    // No other message may come to write them before the process ends, so they get a write of their own.
                    // Only the retries count toward the wait, so a burst of messages during an outage doesn't stretch it.
                    if (!retryScheduled) {
                        retryScheduled = true;
                        delay = Math.min(RETRY_MAX_MS, RETRY_MS << Math.min(failedWrites, 6));
                        failedWrites++;
                    }
                }
                Settings.hookFailedPrivately(KEY, "Can't keep the message log", failure);
                if (delay > 0) {
                    try {
                        retryLater.accept(delay);
                    } catch (RuntimeException rejected) {
                        // Otherwise no later failure would set one up either.
                        synchronized (PENDING) {
                            retryScheduled = false;
                        }
                        Settings.hookFailedPrivately(KEY, "Can't set up another try of the message log", rejected);
                    }
                }
            }
        }
    }

    /** The write set up after a failed one. */
    static void retry() {
        synchronized (PENDING) {
            retryScheduled = false;
        }
        drain();
    }

    /**
     * The entry with who sent it and the group's name, from the names auto reply noted before answering, else from the
     * notification Messenger put up for that chat. Unchanged when there's neither (the chat was open, say) or the
     * notification can't be read.
     */
    static Entry named(Context context, Entry entry) {
        if (!entry.sender.isEmpty()) return entry;
        String[] noted = null;
        if (!entry.id.isEmpty()) {
            synchronized (NOTED) {
                noted = NOTED.remove(entry.thread + '\u0000' + entry.id);
            }
        }
        try {
            String sender;
            String chat;
            if (noted != null) {
                sender = noted[0];
                chat = noted[1];
            } else {
                android.service.notification.StatusBarNotification shown = ChatNotifications.find(context, entry.thread);
                if (shown == null) return entry;
                sender = ChatNotifications.sender(shown.getNotification(), entry.text, entry.thread);
                chat = ChatNotifications.conversation(shown.getNotification());
            }
            if (sender == null && chat == null) return entry;
            return new Entry(entry.time, entry.thread, entry.text, clip(sender == null ? "" : sender, MAX_NAME_CHARS),
                clip(chat == null || chat.equals(sender) ? "" : chat, MAX_NAME_CHARS), entry.id, entry.unsent);
        } catch (RuntimeException unreadable) {
            return entry;
        }
    }

    /** Newest first, for the viewer. Reads and decrypts off the main thread, and removes expired entries from disk. */
    static List<Entry> entries() {
        return loadResult().entries;
    }

    static final class LoadResult {
        final List<Entry> entries;
        final boolean failed;
        /** An older file was moved aside as unreadable. The log itself works, so this isn't a failure. */
        final boolean setAside;
        LoadResult(List<Entry> entries, boolean failed, boolean setAside) {
            this.entries = entries;
            this.failed = failed;
            this.setAside = setAside;
        }
    }

    static LoadResult loadResult() {
        Context context = Settings.appContext;
        if (context == null) return new LoadResult(new ArrayList<>(), true, false);
        try {
            synchronized (LOCK) {
                List<Entry> entries = load(context);
                if (expire(context, entries, System.currentTimeMillis()) || repairedOnRead) save(context, entries);
                List<Entry> newestFirst = new ArrayList<>(entries.size());
                for (int i = entries.size() - 1; i >= 0; i--) newestFirst.add(entries.get(i));
                return new LoadResult(newestFirst, false, new File(context.getFilesDir(), DAMAGED).exists());
            }
        } catch (Throwable failure) {
            Settings.hookFailedPrivately(KEY, "Can't read the message log", failure);
            return new LoadResult(new ArrayList<>(), true, false);
        }
    }

    /** Deletes only the file {@link #load} set aside. Nothing can open it, and the live log stays as it is. */
    static boolean removeSetAside() {
        Context context = Settings.appContext;
        if (context == null) return false;
        synchronized (LOCK) {
            File aside = new File(context.getFilesDir(), DAMAGED);
            if (!aside.exists() || aside.delete()) return true;
            Settings.hookFailedPrivately(KEY, "Can't delete the set-aside message log", new IOException("delete failed: " + DAMAGED));
            return false;
        }
    }

    /** Starts the expiry check once per process. Settings calls it at startup when the control is installed. */
    static void scheduleExpiry() {
        if (EXPIRY_SCHEDULED.compareAndSet(false, true)) {
            WRITER.scheduleWithFixedDelay(MessageLog::expireNow, EXPIRY_DELAY_MS, EXPIRY_PERIOD_MS, TimeUnit.MILLISECONDS);
        }
    }

    /** Rewrites the file without its expired entries. Runs with the switch off too, since Off keeps but doesn't extend. */
    static void expireNow() {
        Context context = Settings.appContext;
        if (context == null) return;
        try {
            synchronized (LOCK) {
                if (!new File(context.getFilesDir(), FILE).exists()) return;
                List<Entry> entries = load(context);
                if (expire(context, entries, System.currentTimeMillis()) || repairedOnRead) save(context, entries);
            }
        } catch (Throwable failure) {
            // Caught here because a periodic task that throws is never run again.
            Settings.hookFailedPrivately(KEY, "Can't expire old messages in the log", failure);
        }
    }

    /**
     * A repatch without this control leaves the file and its key behind, and the settings screen can't clear them any
     * more. Settings calls this at startup then, so the log doesn't outlive the control. Returns the clear, or null.
     */
    static java.util.concurrent.Future<?> dropLeftovers(Context context) {
        for (String name : new String[] {FILE, FILE + ".tmp", DAMAGED}) {
            if (new File(context.getFilesDir(), name).exists()) return WRITER.submit(() -> { clear(); });
        }
        return null;
    }

    /** Deletes the file, anything set aside and the key, and drops messages still waiting to be written. */
    static boolean clear() {
        return clear(null);
    }

    /** {@link #clear} that adds the messages it drops from the queue to [taken], in the same step as dropping them. */
    private static boolean clear(List<Entry> taken) {
        Context context = Settings.appContext;
        boolean cleared = context != null;
        synchronized (LOCK) {
            synchronized (PENDING) {
                if (taken != null) taken.addAll(PENDING);
                PENDING.clear();
            }
            // Names Auto reply noted for messages not written yet go with them.
            synchronized (NOTED) {
                NOTED.clear();
            }
            if (context != null) {
                for (String name : new String[] {FILE, FILE + ".tmp", DAMAGED}) {
                    File file = new File(context.getFilesDir(), name);
                    if (file.exists() && !file.delete()) {
                        cleared = false;
                        Settings.hookFailedPrivately(KEY, "Can't delete the message log",
                            new IOException("delete failed: " + name));
                    }
                }
            }
            try {
                vault().forget();
            } catch (Throwable failure) {
                cleared = false;
                Settings.hookFailedPrivately(KEY, "Can't drop the message log key", failure);
            }
        }
        return cleared;
    }

    /** A clear's outcome, with what it took, oldest first. */
    static final class Cleared {
        final boolean cleared;
        final List<Entry> removed;
        Cleared(boolean cleared, List<Entry> removed) {
            this.cleared = cleared;
            this.removed = removed;
        }
    }

    /**
     * {@link #clear} that hands back what it took, the file's messages then the ones waiting to be written, for the
     * settings screen's Undo. The copy lives in memory only. A log that can't be read comes back with nothing to put back.
     */
    static Cleared clearForUndo() {
        Context context = Settings.appContext;
        List<Entry> removed = new ArrayList<>();
        synchronized (LOCK) {
            if (context != null) {
                try {
                    // read, not load: load sets a damaged file aside and answers with an empty log, which would put
                    // back only the queued few here.
                    removed.addAll(read(new File(context.getFilesDir(), FILE)));
                } catch (Throwable unreadable) {
                    // Putting back only the queued few would read as the whole log coming back.
                    return new Cleared(clear(), new ArrayList<>());
                }
            }
            // A message queued while the file was read is taken with the rest, never dropped unseen.
            return new Cleared(clear(removed), removed);
        }
    }

    /** Puts back what a clear took, ahead of anything logged since, within the usual limits and under a new key. */
    static boolean restore(List<Entry> removed) {
        Context context = Settings.appContext;
        if (context == null) return false;
        synchronized (LOCK) {
            try {
                List<Entry> entries = new ArrayList<>(removed);
                entries.addAll(load(context));
                expire(context, entries, System.currentTimeMillis());
                save(context, entries);
                return true;
            } catch (Throwable failure) {
                Settings.hookFailedPrivately(KEY, "Can't put the message log back", failure);
                return false;
            }
        }
    }

    /**
     * Drops expired entries, then the oldest until the count and the plaintext size fit, so the newest always stay.
     * Returns whether anything was dropped.
     */
    static boolean prune(List<Entry> entries, long now) {
        int before = entries.size();
        long cutoff = now - MAX_AGE_MS;
        entries.removeIf(entry -> entry.time < cutoff);
        trim(entries);
        return entries.size() != before;
    }

    /** Drops the oldest until the count and the plaintext size fit. Returns whether anything was dropped. */
    private static boolean trim(List<Entry> entries) {
        long bytes = 0;
        int first = 0;
        for (int i = entries.size() - 1; i >= 0; i--) {
            bytes += line(entries.get(i)).getBytes(StandardCharsets.UTF_8).length;
            if (bytes > MAX_PLAIN_BYTES || entries.size() - i > MAX_ENTRIES) {
                first = i + 1;
                break;
            }
        }
        if (first > 0) entries.subList(0, first).clear();
        return first > 0;
    }

    /**
     * {@link #prune}, with what it's about to drop added to the month's file first when that's been asked for. It copies with
     * the log's switch off too, since Off still lets stored messages expire. A file that can't be written leaves expired
     * messages for the next check, but the size limits still hold, because past them the log can't be read back at all. A
     * copy can land twice if the log's own write then fails, which beats not landing.
     */
    private static boolean expire(Context context, List<Entry> entries, long now) {
        SharedPreferences prefs = Settings.preferences;
        if (Build.VERSION.SDK_INT < 29 || prefs == null || !prefs.getBoolean(SAVE_EXPIRING, false)) return prune(entries, now);
        List<Entry> kept = new ArrayList<>(entries);
        if (!prune(kept, now)) return false;
        Set<Entry> staying = Collections.newSetFromMap(new IdentityHashMap<>());
        staying.addAll(kept);
        List<Entry> leaving = new ArrayList<>(entries);
        leaving.removeIf(staying::contains);
        try {
            MessageLogExport.saveExpiring(context, leaving, now);
        } catch (IOException | RuntimeException failure) {
            Settings.hookFailedPrivately(KEY, "Can't save expiring messages", failure);
            return trim(entries);
        }
        entries.clear();
        entries.addAll(kept);
        return true;
    }

    /** The log's file content could not have come from this log, or no longer opens with its key. */
    static final class Damaged extends Exception {
        Damaged(String why, Throwable cause) {
            super(why, cause);
        }
    }

    /**
     * Reads the log. A file that can't be the log's own, or that its key no longer opens, is moved aside (replacing any
     * earlier one) so the log keeps working instead of failing on every message. Other failures, like a busy keystore,
     * are thrown and the file stays where it is.
     */
    private static List<Entry> load(Context context) throws Exception {
        File file = new File(context.getFilesDir(), FILE);
        try {
            return read(file);
        } catch (Damaged damaged) {
            File aside = new File(context.getFilesDir(), DAMAGED);
            if (aside.exists()) aside.delete();
            if (!file.renameTo(aside)) file.delete();
            Settings.hookFailedPrivately(KEY, "Set aside a message log it can't read", damaged);
            return new ArrayList<>();
        }
    }

    /**
     * Set by {@link #read} when a stored time had to be moved. The callers hold {@link #LOCK}, and they write the file
     * back even when nothing expired, or a time the clock got wrong would read as fresh on every run and never expire.
     */
    static boolean repairedOnRead;

    static List<Entry> read(File file) throws Exception {
        List<Entry> entries = new ArrayList<>();
        repairedOnRead = false;
        if (!file.exists()) return entries;
        if (file.length() > MAX_FILE_BYTES) throw new Damaged("too large: " + file.length(), null);
        byte[] blob = readAll(file);
        if (blob.length == 0) return entries;
        // Shorter than an IV and a tag never reaches the tag check, and the keystore reports it as a size error instead.
        if (blob.length < IV_BYTES + TAG_BITS / 8) throw new Damaged("too short: " + blob.length, null);
        String plain;
        try {
            plain = new String(vault().open(blob), StandardCharsets.UTF_8);
        } catch (AEADBadTagException wrongKey) {
            throw new Damaged("doesn't open", wrongKey);
        }
        long latest = System.currentTimeMillis() + FUTURE_SLACK_MS;
        for (String line : plain.split("\n", -1)) {
            if (line.isEmpty()) continue;
            // Logs written before names were kept have three columns, and before unsends were marked five.
            String[] parts = line.split("\t", -1);
            if (parts.length < 3) continue;
            long time;
            try {
                time = Long.parseLong(parts[0]);
            } catch (NumberFormatException malformed) {
                continue;
            }
            if (time > latest) {
                time = System.currentTimeMillis();
                repairedOnRead = true;
            }
            entries.add(new Entry(time, clip(unescape(parts[1]), MAX_THREAD_CHARS), clip(unescape(parts[2]), MAX_TEXT_CHARS),
                parts.length > 3 ? clip(unescape(parts[3]), MAX_NAME_CHARS) : "",
                parts.length > 4 ? clip(unescape(parts[4]), MAX_NAME_CHARS) : "",
                parts.length > 5 ? clip(unescape(parts[5]), MAX_ID_CHARS) : "",
                parts.length > 6 && "1".equals(parts[6])));
        }
        return entries;
    }

    /** Writes the whole log, or deletes the file when nothing is left. */
    private static void save(Context context, List<Entry> entries) throws Exception {
        if (entries.isEmpty()) {
            File file = new File(context.getFilesDir(), FILE);
            if (file.exists() && !file.delete()) throw new IOException("delete failed: " + FILE);
            return;
        }
        write(context, entries);
    }

    /**
     * Writes to a temporary file, syncs it, then moves it over the log in one step. If the move fails the old log stays
     * as it was and the write counts as failed; it never writes into the log in place.
     */
    static void write(Context context, List<Entry> entries) throws Exception {
        StringBuilder plain = new StringBuilder();
        for (Entry entry : entries) plain.append(line(entry));
        byte[] blob = vault().seal(plain.toString().getBytes(StandardCharsets.UTF_8));
        File dir = context.getFilesDir();
        File temp = new File(dir, FILE + ".tmp");
        try (FileOutputStream out = new FileOutputStream(temp)) {
            out.write(blob);
            out.getFD().sync();
        }
        try {
            // An atomic move replaces the old file on Android (rename) and on the JVM the tests run on.
            Files.move(temp.toPath(), new File(dir, FILE).toPath(), StandardCopyOption.ATOMIC_MOVE);
        } catch (IOException failed) {
            temp.delete();
            throw failed;
        }
    }

    private static String line(Entry entry) {
        String start = entry.time + "\t" + escape(entry.thread) + "\t" + escape(entry.text);
        if (!entry.id.isEmpty() || entry.unsent) {
            return start + "\t" + escape(entry.sender) + "\t" + escape(entry.chat) + "\t" + escape(entry.id) + "\t" + (entry.unsent ? "1" : "") + "\n";
        }
        if (entry.sender.isEmpty() && entry.chat.isEmpty()) return start + "\n";
        return start + "\t" + escape(entry.sender) + "\t" + escape(entry.chat) + "\n";
    }

    /** Cuts long text, never between the two halves of an emoji, and marks the cut. */
    static String clip(String value, int max) {
        if (value.length() <= max) return value;
        int end = max - 1;
        if (Character.isHighSurrogate(value.charAt(end - 1))) end--;
        return value.substring(0, end) + "\u2026";
    }

    private static byte[] readAll(File file) throws IOException, Damaged {
        try (java.io.FileInputStream in = new java.io.FileInputStream(file)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) != -1) {
                out.write(buffer, 0, read);
                if (out.size() > MAX_FILE_BYTES) throw new Damaged("grew while reading", null);
            }
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
