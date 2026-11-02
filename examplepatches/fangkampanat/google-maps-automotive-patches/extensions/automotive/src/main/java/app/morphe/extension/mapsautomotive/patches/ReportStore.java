package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The problem report's files in this app's private storage (files/morphe_reports), removed with the
 * app: the installation id, copies of crash logs, queued report bodies, the list of reports and the
 * main process's last battery and window state. Crash copies are written by any process; the main
 * process and the report screen's process both use the list and the queue, so changes to them hold a
 * file lock, and small values are files rather than SharedPreferences, which keeps a copy per process.
 */
final class ReportStore {
    static final int MAX_QUEUED = 5, MAX_CRASHES = 3, DEFAULT_MAX_BYTES = 512 * 1024;
    static final long DAY_MS = 24L * 60 * 60 * 1000, QUEUE_MAX_AGE_MS = 7 * DAY_MS, CRASH_MAX_AGE_MS = 14 * DAY_MS;
    static final String QUEUED = "queued", SENT = "sent", FAILED = "failed", EXPIRED = "expired";
    private static final String PREFERENCES = "morphe_reports", KEY_INSTALL_ID = "install_id", KEY_MAX_BYTES = "max_bytes",
            KEY_CRASH_SEEN = "crash_seen", KEY_CRASH_TOASTED = "crash_toasted", KEY_NATIVE_CHECKED = "native_checked";
    private static final String LIST = "reports.json", QUEUE = "queue", CRASH = "crash", VALUES = "values",
            SNAPSHOT = "snapshot.json", START_LOGCAT = "start_logcat.json", LOCK = "lock", INDEX = "index.txt";
    private static final int MAX_INDEX_LINES = 100, MAX_INDEX_ENTRIES = 20, SUMMARY_READ_BYTES = 64 * 1024;
    private static final Pattern NATIVE_SIGNAL = Pattern.compile("signal (\\d+) \\((\\w+)\\)");
    // Guarded by the class: crash summaries by file name, with the file size they were read at.
    private static final Map<String, String[]> summaries = new HashMap<>();
    // Guarded by the class: the cross-process lock and how deep this process holds it.
    private static RandomAccessFile lockFile;
    private static FileLock lock;
    private static int lockDepth;

    private ReportStore() {
    }

    /** One report in the list: queued, sent (with its ID), failed (with the server's code) or expired. */
    static final class Entry {
        String key, state, error, id, deleteToken, receivedAt, expiresAt;
        long created, next;
        int attempts, bytes;
        boolean shrunk;
        /** The newest crash file in the report, marked seen once the report is queued. */
        String crash;

        JSONObject toJson() throws JSONException {
            JSONObject json = new JSONObject();
            json.put("key", key).put("state", state).put("created", created).put("next", next).put("attempts", attempts)
                    .put("bytes", bytes).put("shrunk", shrunk);
            json.putOpt("error", error).putOpt("id", id).putOpt("delete_token", deleteToken).putOpt("received_at", receivedAt)
                    .putOpt("expires_at", expiresAt).putOpt("crash", crash);
            return json;
        }

        static Entry of(JSONObject json) {
            Entry entry = new Entry();
            entry.key = json.optString("key");
            entry.state = json.optString("state");
            entry.created = json.optLong("created");
            entry.next = json.optLong("next");
            entry.attempts = json.optInt("attempts");
            entry.bytes = json.optInt("bytes");
            entry.shrunk = json.optBoolean("shrunk");
            entry.error = text(json, "error");
            entry.id = text(json, "id");
            entry.deleteToken = text(json, "delete_token");
            entry.receivedAt = text(json, "received_at");
            entry.expiresAt = text(json, "expires_at");
            entry.crash = text(json, "crash");
            return entry;
        }

        private static String text(JSONObject json, String name) {
            return json.isNull(name) ? null : json.optString(name, null);
        }
    }

    private static File root(Context context) {
        return new File(context.getFilesDir(), "morphe_reports");
    }

    // Small values, one file each. Until 0.1.0 they were SharedPreferences, read once and copied here.
    private static synchronized String value(Context context, String key) {
        File file = new File(new File(root(context), VALUES), key);
        if (file.isFile()) {
            try {
                return new String(readFile(file), StandardCharsets.UTF_8);
            } catch (IOException error) {
                return null;
            }
        }
        try {
            Object old = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).getAll().get(key);
            if (old == null) return null;
            setValue(context, key, String.valueOf(old));
            return String.valueOf(old);
        } catch (RuntimeException error) {
            return null;
        }
    }

    private static synchronized void setValue(Context context, String key, String value) {
        try {
            File dir = new File(root(context), VALUES);
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("no values folder");
            replaceFile(new File(dir, key), value.getBytes(StandardCharsets.UTF_8));
        } catch (IOException error) {
            ReportLog.w(ReportPatch.TAG, "report value " + key + " not saved", error);
        }
    }

    /** A random UUID for this installation, made on first use; no hardware identifier. */
    static synchronized String installId(Context context) {
        String id = value(context, KEY_INSTALL_ID);
        if (id == null) {
            id = UUID.randomUUID().toString().toLowerCase(Locale.ROOT);
            setValue(context, KEY_INSTALL_ID, id);
        }
        return id;
    }

    /** The body limit the server last named in a 413, else 512 KiB. */
    static int maxBytes(Context context) {
        try {
            String value = value(context, KEY_MAX_BYTES);
            int bytes = value != null ? Integer.parseInt(value.trim()) : DEFAULT_MAX_BYTES;
            return bytes > 0 ? bytes : DEFAULT_MAX_BYTES;
        } catch (NumberFormatException error) {
            return DEFAULT_MAX_BYTES;
        }
    }

    static void setMaxBytes(Context context, int value) {
        if (value > 0) setValue(context, KEY_MAX_BYTES, Integer.toString(value));
    }

    // The main process's last battery and window state, for reports built in the report screen's process,
    // and its last start's logcat lines (StartLogcat).

    static void saveSnapshot(Context context, JSONObject snapshot) {
        saveJson(context, SNAPSHOT, snapshot, "state for the report not saved");
    }

    static JSONObject snapshot(Context context) {
        return readJson(context, SNAPSHOT);
    }

    static void saveStartLogcat(Context context, JSONObject lines) {
        saveJson(context, START_LOGCAT, lines, "start log not saved");
    }

    static JSONObject startLogcat(Context context) {
        return readJson(context, START_LOGCAT);
    }

    private static void saveJson(Context context, String name, JSONObject json, String failure) {
        try {
            File dir = root(context);
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("no report folder");
            replaceFile(new File(dir, name), json.toString().getBytes(StandardCharsets.UTF_8));
        } catch (IOException error) {
            ReportLog.w(ReportPatch.TAG, failure, error);
        }
    }

    private static JSONObject readJson(Context context, String name) {
        File file = new File(root(context), name);
        if (!file.isFile()) return null;
        try {
            return new JSONObject(new String(readFile(file), StandardCharsets.UTF_8));
        } catch (IOException | JSONException error) {
            return null;
        }
    }

    // Crash copies. The public crash file in Documents can be read back only while this installation
    // owns it, so the report reads its own copy.

    /**
     * From the crashing thread, or the native crash check: a copy of the crash log and a line in the
     * crash index, then the kept copies are chosen again ({@link #crashes}).
     */
    static void saveCrash(Context context, String name, byte[] contents, long time) {
        File dir = new File(root(context), CRASH);
        if (!dir.isDirectory() && !dir.mkdirs()) return;
        try {
            writeFile(new File(dir, name), contents);
        } catch (IOException ignored) {
            // The public crash file is still written.
        }
        addToIndex(dir, time, summarize(name, new String(contents, StandardCharsets.UTF_8)));
        crashes(context);
    }

    /**
     * The kept crash copies, newest first: at most three different crashes of the last 14 days (the
     * newest copy of each), the main process's first, so a repeated crash does not push out another
     * one. The rest are deleted; the crash index keeps a line for each crash.
     */
    static synchronized List<File> crashes(Context context) {
        File[] files = new File(root(context), CRASH).listFiles(file -> file.isFile() && file.getName().startsWith("crash_"));
        List<File> kept = new ArrayList<>();
        if (files == null) return kept;
        // The names hold the UTC time after the package, so they sort by time.
        Arrays.sort(files, (a, b) -> b.getName().compareTo(a.getName()));
        long oldest = System.currentTimeMillis() - CRASH_MAX_AGE_MS;
        List<File> candidates = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        for (File file : files) {
            if (file.lastModified() < oldest || !seen.add(signature(summary(file)))) delete(file);
            else candidates.add(file);
        }
        for (File file : candidates) {
            if (kept.size() < MAX_CRASHES && context.getPackageName().equals(summary(file)[1])) kept.add(file);
        }
        for (File file : candidates) {
            if (kept.size() < MAX_CRASHES && !kept.contains(file)) kept.add(file);
        }
        for (File file : candidates) if (!kept.contains(file)) delete(file);
        kept.sort((a, b) -> b.getName().compareTo(a.getName()));
        return kept;
    }

    // Guarded by the class.
    private static void delete(File file) {
        summaries.remove(file.getName());
        //noinspection ResultOfMethodCallIgnored
        file.delete();
    }

    // Guarded by the class. Read once per file name and size.
    private static String[] summary(File file) {
        String size = Long.toString(file.length());
        String[] summary = summaries.get(file.getName());
        if (summary != null && summary[5].equals(size)) return summary;
        String text = "";
        try (InputStream in = new FileInputStream(file)) {
            byte[] head = new byte[(int) Math.min(file.length(), SUMMARY_READ_BYTES)];
            int read = 0;
            while (read < head.length) {
                int count = in.read(head, read, head.length - read);
                if (count < 0) break;
                read += count;
            }
            text = new String(head, 0, read, StandardCharsets.UTF_8);
        } catch (IOException ignored) {
            // An unreadable copy counts as a crash of its own.
        }
        summary = Arrays.copyOf(summarize(file.getName(), text), 6);
        summary[5] = size;
        summaries.put(file.getName(), summary);
        return summary;
    }

    private static String signature(String[] summary) {
        return summary[0] + "|" + summary[1] + "|" + summary[2] + "|" + summary[3] + "|" + summary[4];
    }

    /**
     * A crash file's kind ("java" or "native"), process, exception (or signal), top frame and root
     * cause with its top frame, which tell crashes apart. Plain Java, so it can be checked off the device.
     */
    static String[] summarize(String name, String text) {
        boolean nativeCrash = name.endsWith("_native.txt");
        String process = "", exception = "", frame = "", cause = "";
        boolean inTrace = false, causeFrame = false;
        for (String line : text.split("\n")) {
            if (line.startsWith("Process: ") && process.isEmpty()) {
                int end = line.indexOf(" (");
                process = (end > 9 ? line.substring(9, end) : line.substring(9)).trim();
            } else if (nativeCrash) {
                if (line.startsWith("Signal: ") && exception.isEmpty()) {
                    Matcher signal = NATIVE_SIGNAL.matcher(line);
                    exception = signal.find() ? "signal " + signal.group(1) + " (" + signal.group(2) + ")" : line.substring(8).trim();
                } else if (frame.isEmpty() && line.trim().startsWith("#00 pc ")) {
                    frame = line.trim().replaceAll("\\s+", " ");
                }
            } else if (line.equals("Stack trace:")) {
                inTrace = true;
            } else if (inTrace && exception.isEmpty()) {
                exception = className(line);
            } else if (inTrace && line.startsWith("\tat ")) {
                if (frame.isEmpty()) frame = line.substring(4).trim();
                if (causeFrame) {
                    cause += " at " + line.substring(4).trim();
                    causeFrame = false;
                }
            } else if (inTrace && line.startsWith("Caused by: ")) {
                cause = className(line.substring(11));
                causeFrame = true;
            } else if (inTrace && (line.isEmpty() || line.startsWith("Morphe logs:"))) {
                // The end of the stack trace: the Morphe logs or the logcat lines follow.
                inTrace = false;
            }
        }
        return new String[]{nativeCrash ? "native" : "java", process, exception, frame, cause};
    }

    // "java.lang.IllegalStateException: message" gives the class name.
    private static String className(String line) {
        String text = line.trim();
        int colon = text.indexOf(':');
        return (colon > 0 ? text.substring(0, colon) : text).trim();
    }

    private static synchronized void addToIndex(File dir, long time, String[] summary) {
        File file = new File(dir, INDEX);
        List<String> lines = new ArrayList<>();
        try {
            if (file.isFile()) {
                for (String line : new String(readFile(file), StandardCharsets.UTF_8).split("\n")) if (!line.isEmpty()) lines.add(line);
            }
        } catch (IOException ignored) {
            // A new index.
        }
        StringBuilder line = new StringBuilder(Long.toString(time));
        for (String field : summary) line.append('\t').append(field.replace('\t', ' ').replace('\n', ' '));
        lines.add(line.toString());
        while (lines.size() > MAX_INDEX_LINES) lines.remove(0);
        StringBuilder text = new StringBuilder();
        for (String kept : lines) text.append(kept).append('\n');
        try {
            replaceFile(file, text.toString().getBytes(StandardCharsets.UTF_8));
        } catch (IOException ignored) {
            // The crash copy is kept without its index line.
        }
    }

    /**
     * The report's crash_index: the crashes of the last 14 days, one entry per different crash with
     * its count and its first and last time, newest first, at most 20.
     */
    static synchronized JSONArray crashIndex(Context context) throws JSONException {
        Map<String, JSONObject> groups = new LinkedHashMap<>();
        File file = new File(new File(root(context), CRASH), INDEX);
        long oldest = System.currentTimeMillis() - CRASH_MAX_AGE_MS;
        try {
            if (file.isFile()) {
                List<String[]> rows = new ArrayList<>();
                for (String line : new String(readFile(file), StandardCharsets.UTF_8).split("\n")) {
                    String[] fields = line.split("\t", -1);
                    if (fields.length != 6) continue;
                    try {
                        if (Long.parseLong(fields[0]) >= oldest) rows.add(fields);
                    } catch (NumberFormatException ignored) {
                        // Not an index line.
                    }
                }
                // A native crash is indexed when it is found, after later crashes.
                rows.sort((a, b) -> Long.compare(Long.parseLong(a[0]), Long.parseLong(b[0])));
                for (String[] fields : rows) {
                    long time = Long.parseLong(fields[0]);
                    String key = fields[1] + "|" + fields[2] + "|" + fields[3] + "|" + fields[4] + "|" + fields[5];
                    JSONObject group = groups.remove(key);
                    if (group == null) {
                        group = new JSONObject().put("kind", fields[1]).put("process", fields[2]).put("exception", fields[3])
                                .put("frame", fields[4]).put("cause", fields[5].isEmpty() ? JSONObject.NULL : fields[5])
                                .put("count", 0).put("first_at", ReportBuilder.formatUtc(time));
                    }
                    group.put("count", group.getInt("count") + 1).put("last_at", ReportBuilder.formatUtc(time));
                    // Put back last, so the most recent crash comes last.
                    groups.put(key, group);
                }
            }
        } catch (IOException ignored) {
            // No index: an empty list.
        }
        List<JSONObject> list = new ArrayList<>(groups.values());
        JSONArray index = new JSONArray();
        for (int i = list.size() - 1; i >= 0 && index.length() < MAX_INDEX_ENTRIES; i--) index.put(list.get(i));
        return index;
    }

    /** The time up to which the crash log was checked for native crashes ({@link NativeCrashes}). */
    static long nativeChecked(Context context) {
        try {
            String value = value(context, KEY_NATIVE_CHECKED);
            return value != null ? Long.parseLong(value.trim()) : 0;
        } catch (NumberFormatException error) {
            return 0;
        }
    }

    static void setNativeChecked(Context context, long millis) {
        setValue(context, KEY_NATIVE_CHECKED, Long.toString(millis));
    }

    /** The newest crash copy not yet in a queued report, or null. */
    static String pendingCrash(Context context) {
        List<File> crashes = crashes(context);
        if (crashes.isEmpty()) return null;
        String newest = crashes.get(0).getName();
        return newest.equals(value(context, KEY_CRASH_SEEN)) ? null : newest;
    }

    static void markCrashSeen(Context context, String name) {
        if (name != null) setValue(context, KEY_CRASH_SEEN, name);
    }

    /** True once per new crash: whether the start after it shows its toast. */
    static boolean takeCrashToast(Context context) {
        String crash = pendingCrash(context);
        if (crash == null || crash.equals(value(context, KEY_CRASH_TOASTED))) return false;
        setValue(context, KEY_CRASH_TOASTED, crash);
        return true;
    }

    // The report list and the queue, under the cross-process lock.

    static synchronized void lock(Context context) {
        if (lockDepth++ > 0) return;
        try {
            File dir = root(context);
            if (!dir.isDirectory() && !dir.mkdirs()) return;
            lockFile = new RandomAccessFile(new File(dir, LOCK), "rw");
            lock = lockFile.getChannel().lock();
        } catch (IOException | RuntimeException error) {
            // Unlocked: the other process rarely changes the list at the same moment.
        }
    }

    static synchronized void unlock() {
        if (--lockDepth > 0) return;
        try {
            if (lock != null) lock.release();
            if (lockFile != null) lockFile.close();
        } catch (IOException ignored) {
            // Released with the file.
        }
        lock = null;
        lockFile = null;
    }

    /** The reports, newest first. Sent reports past their expiry and old finished ones are dropped. */
    static synchronized List<Entry> entries(Context context) {
        lock(context);
        try {
            return readEntries(context);
        } finally {
            unlock();
        }
    }

    private static List<Entry> readEntries(Context context) {
        List<Entry> entries = new ArrayList<>();
        File file = new File(root(context), LIST);
        if (!file.isFile()) return entries;
        boolean changed = false;
        try {
            JSONArray array = new JSONArray(new String(readFile(file), StandardCharsets.UTF_8));
            long now = System.currentTimeMillis();
            for (int i = 0; i < array.length(); i++) {
                Entry entry = Entry.of(array.getJSONObject(i));
                boolean expired = SENT.equals(entry.state) ? ReportBuilder.parseUtc(entry.expiresAt) < now
                        : !QUEUED.equals(entry.state) && now - entry.created > CRASH_MAX_AGE_MS;
                if (expired || entry.key.isEmpty()) {
                    deleteBody(context, entry.key);
                    changed = true;
                } else {
                    entries.add(entry);
                }
            }
        } catch (IOException | JSONException error) {
            ReportLog.w(ReportPatch.TAG, "report list unreadable, starting empty", error);
            changed = true;
        }
        if (changed) save(context, entries);
        return entries;
    }

    static synchronized int queuedCount(Context context) {
        int count = 0;
        for (Entry entry : entries(context)) if (QUEUED.equals(entry.state)) count++;
        return count;
    }

    /** Queues the exact bytes the user agreed to send. Null when the queue is full or cannot be written. */
    static synchronized Entry enqueue(Context context, byte[] body, String crash) {
        lock(context);
        try {
            List<Entry> entries = readEntries(context);
            int queued = 0;
            for (Entry entry : entries) if (QUEUED.equals(entry.state)) queued++;
            if (queued >= MAX_QUEUED) return null;
            Entry entry = new Entry();
            entry.key = UUID.randomUUID().toString().toLowerCase(Locale.ROOT);
            entry.state = QUEUED;
            entry.created = System.currentTimeMillis();
            entry.bytes = body.length;
            entry.crash = crash;
            try {
                File dir = new File(root(context), QUEUE);
                if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("no queue folder");
                writeFile(bodyFile(context, entry.key), body);
            } catch (IOException error) {
                ReportLog.w(ReportPatch.TAG, "report not queued", error);
                return null;
            }
            entries.add(0, entry);
            save(context, entries);
            return entry;
        } finally {
            unlock();
        }
    }

    static synchronized byte[] body(Context context, String key) {
        try {
            return readFile(bodyFile(context, key));
        } catch (IOException error) {
            return null;
        }
    }

    static synchronized boolean replaceBody(Context context, Entry entry, byte[] body) {
        try {
            writeFile(bodyFile(context, entry.key), body);
            entry.bytes = body.length;
            return true;
        } catch (IOException error) {
            return false;
        }
    }

    /** Stores the entry's new state; a report that is no longer queued loses its body. */
    static synchronized void update(Context context, Entry changed) {
        lock(context);
        try {
            List<Entry> entries = readEntries(context);
            for (int i = 0; i < entries.size(); i++) {
                if (!entries.get(i).key.equals(changed.key)) continue;
                entries.set(i, changed);
                if (!QUEUED.equals(changed.state)) deleteBody(context, changed.key);
                save(context, entries);
                return;
            }
        } finally {
            unlock();
        }
    }

    static synchronized void remove(Context context, String key) {
        lock(context);
        try {
            List<Entry> entries = readEntries(context);
            for (int i = 0; i < entries.size(); i++) {
                if (!entries.get(i).key.equals(key)) continue;
                entries.remove(i);
                deleteBody(context, key);
                save(context, entries);
                return;
            }
        } finally {
            unlock();
        }
    }

    private static void save(Context context, List<Entry> entries) {
        try {
            JSONArray array = new JSONArray();
            for (Entry entry : entries) array.put(entry.toJson());
            File dir = root(context);
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("no report folder");
            replaceFile(new File(dir, LIST), array.toString().getBytes(StandardCharsets.UTF_8));
        } catch (IOException | JSONException error) {
            ReportLog.w(ReportPatch.TAG, "report list not saved", error);
        }
    }

    /** Written whole, then renamed over the old file, so a reader in another process never sees half of it. */
    static void replaceFile(File file, byte[] contents) throws IOException {
        File temporary = new File(file.getParentFile(), file.getName() + ".tmp");
        writeFile(temporary, contents);
        if (!temporary.renameTo(file)) throw new IOException(file.getName() + " not replaced");
    }

    private static File bodyFile(Context context, String key) {
        return new File(new File(root(context), QUEUE), key + ".json");
    }

    private static void deleteBody(Context context, String key) {
        //noinspection ResultOfMethodCallIgnored
        bodyFile(context, key).delete();
    }

    private static void writeFile(File file, byte[] contents) throws IOException {
        try (OutputStream out = new FileOutputStream(file, false)) {
            out.write(contents);
        }
    }

    static byte[] readFile(File file) throws IOException {
        try (InputStream in = new FileInputStream(file)) {
            byte[] contents = new byte[(int) file.length()];
            int offset = 0;
            while (offset < contents.length) {
                int read = in.read(contents, offset, contents.length - offset);
                if (read < 0) break;
                offset += read;
            }
            return offset == contents.length ? contents : Arrays.copyOf(contents, offset);
        }
    }
}
