package nl.johninnl.eclipse.auto.data;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Memory plus one JSON file per feed under {@code cacheDir/eclipse_auto/}, keyed on the account and
 * the UTC day. An entry is fresh for five minutes (Home) or ten (Discover), mirroring the app. A
 * stale entry is still returned so it can be shown while a refresh runs, and an entry from another
 * day is still used when the network is gone. Only the feed body is stored: never the token, and the
 * account appears only as a hash in the file name.
 */
public final class ComposeCache {
    public static final long HOME_FRESH_MS = 5L * 60L * 1000L;
    public static final long DISCOVER_FRESH_MS = 10L * 60L * 1000L;

    /** Time, injectable so freshness is testable. */
    public interface Clock {
        long now();

        /** Today's date in UTC, {@code yyyy-MM-dd}. */
        String utcDay();
    }

    /** A cached body and whether it is still fresh. */
    public static final class Lookup {
        public final String body;
        public final boolean fresh;

        Lookup(String body, boolean fresh) {
            this.body = body;
            this.fresh = fresh;
        }
    }

    private static final class Entry {
        final String body;
        final long storedAt;
        final String day;

        Entry(String body, long storedAt, String day) {
            this.body = body;
            this.storedAt = storedAt;
            this.day = day;
        }
    }

    private final File directory;
    private final Clock clock;
    private final Map<String, Entry> memory = new HashMap<>();

    /** {@code directory} may be null: the cache is then memory only. */
    public ComposeCache(File directory, Clock clock) {
        this.directory = directory;
        this.clock = clock;
    }

    public static long freshMs(String feed) { return "home".equals(feed) ? HOME_FRESH_MS : DISCOVER_FRESH_MS; }

    private static String key(String feed, String accountKey) { return feed + "|" + accountKey; }

    private File fileFor(String feed, String accountKey) {
        if (directory == null) return null;
        return new File(directory, feed + "-" + sha256(accountKey).substring(0, 24) + ".json");
    }

    static String sha256(String value) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder();
            for (byte b : digest) hex.append(String.format("%02x", b & 0xff));
            return hex.toString();
        } catch (NoSuchAlgorithmException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    /** The cached body for {@code feed}, fresh or stale, or null when there is none. Blocking (reads a file). */
    public synchronized Lookup lookup(String feed, String accountKey) {
        Entry entry = memory.get(key(feed, accountKey));
        if (entry == null) {
            entry = read(feed, accountKey);
            if (entry != null) memory.put(key(feed, accountKey), entry);
        }
        if (entry == null) return null;
        boolean fresh = entry.day.equals(clock.utcDay()) && clock.now() - entry.storedAt < freshMs(feed) && clock.now() >= entry.storedAt;
        return new Lookup(entry.body, fresh);
    }

    /** Remember a body that has just been fetched. Blocking (writes a file); failures to write are ignored. */
    public synchronized void put(String feed, String accountKey, String body) {
        Entry entry = new Entry(body, clock.now(), clock.utcDay());
        memory.put(key(feed, accountKey), entry);
        File file = fileFor(feed, accountKey);
        if (file == null) return;
        try {
            File parent = file.getParentFile();
            if (parent != null && !parent.isDirectory() && !parent.mkdirs()) return;
            JSONObject json = new JSONObject();
            json.put("storedAt", entry.storedAt);
            json.put("day", entry.day);
            json.put("body", entry.body);
            File temporary = new File(file.getPath() + ".tmp");
            try (FileOutputStream out = new FileOutputStream(temporary)) {
                out.write(json.toString().getBytes(StandardCharsets.UTF_8));
            }
            if (!temporary.renameTo(file)) temporary.delete();
        } catch (IOException | JSONException unwritable) {
            // The memory entry still serves this session.
        }
    }

    /** Forget everything held for an account, for example after a sign-out. */
    public synchronized void clear(String feed, String accountKey) {
        memory.remove(key(feed, accountKey));
        File file = fileFor(feed, accountKey);
        if (file != null) file.delete();
    }

    private Entry read(String feed, String accountKey) {
        File file = fileFor(feed, accountKey);
        if (file == null || !file.isFile()) return null;
        try (InputStream in = new FileInputStream(file)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) >= 0) out.write(buffer, 0, read);
            JSONObject json = new JSONObject(new String(out.toByteArray(), StandardCharsets.UTF_8));
            String body = json.optString("body", null);
            String day = json.optString("day", null);
            if (body == null || day == null) return null;
            return new Entry(body, json.optLong("storedAt", 0), day);
        } catch (IOException | JSONException unreadable) {
            return null;
        }
    }
}
