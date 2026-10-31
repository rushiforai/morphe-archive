package app.bitchord.telegram;

import org.json.JSONObject;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;

/**
 * Listens to Telegram files, one at a time: whether a lossless file is really lossless ({@link
 * LosslessCheck}), and what a file without tags is ({@link Chromaprint} and {@link AcoustId}).
 *
 * <p>Songs that play are checked a minute later, when most of the file has been downloaded for
 * playing anyway. Going through the music chats in the background is an option of its own: it
 * downloads a few megabytes of each lossless file, so it keeps to the saved index's Wi-Fi and
 * charging switches and to a daily limit. What's found is kept in the saved index, and travels in
 * shared indexes.
 */
final class FileChecks {
    interface Host {
        /** Signed in, with the saved index open. */
        boolean ready();

        /** Why background work waits now ("Paused until this phone is on Wi-Fi"), or "". */
        String pause();

        /** The chats to go through in the background. */
        Collection<Long> chats();

        TelegramIndex index();

        /** Part of a Telegram file, downloading only that part. */
        byte[] range(int file, long offset, int length) throws Exception;

        /** The start of a file, decoded to mono. */
        Audio decode(String id, int seconds) throws Exception;

        /** AcoustID's answer to a lookup. */
        String lookup(String key, int seconds, String fingerprint) throws Exception;

        /** What's known about a file changed: its legend on screen can update. */
        void changed(JSONObject row);
    }

    interface Clock {
        long millis();
    }

    /** Mono samples from -1 to 1. */
    static final class Audio {
        final float[] samples;
        final int length, rate;

        Audio(float[] samples, int length, int rate) {
            this.samples = samples;
            this.length = length;
            this.rate = rate;
        }
    }

    /** What going through the chats may download in a day. */
    static final long DAILY_BYTES = 1_000_000_000L;

    /** AcoustID lookups in a day: well inside its limits for a free key. */
    static final int DAILY_LOOKUPS = 500;

    /** A song that played is checked this long after, so playing has downloaded most of it. */
    static final long PLAYED_DELAY = 60_000;

    static final int MAX_PLAYED = 50;

    /** After going through every chat, the next round starts this much later, for new posts. */
    static final long ROUND_MILLIS = 6 * 3600 * 1000L;

    /** A file AcoustID didn't know is asked about again after this long. */
    static final long RETRY_MILLIS = 30L * 24 * 3600 * 1000;

    /** A file that couldn't be read this time is left alone this long. */
    static final long FAILED_MILLIS = 24 * 3600 * 1000L;

    /** Set once the bridge has started; songs that play are handed to it. */
    static volatile FileChecks active;

    private final File file, keyFile;
    private final Host host;
    private final Clock clock;
    private JSONObject saved;
    private volatile String key = "";

    volatile boolean checkLossless = true, checkInBackground, recognize;

    // Songs that played, by id, with when.
    private final LinkedHashMap<String, Object[]> played = new LinkedHashMap<>();
    private final Map<String, Long> failed = new java.util.concurrent.ConcurrentHashMap<>();
    // Going through the chats: the chats left this round, the one being read, and how far.
    private final ArrayDeque<Long> chatsLeft = new ArrayDeque<>();
    private long chat, cursor = Long.MAX_VALUE;
    private final ArrayDeque<JSONObject> page = new ArrayDeque<>();
    private long roundDone = Long.MIN_VALUE / 2;
    private volatile String keyProblem = "";

    FileChecks(File file, File keyFile, Host host, Clock clock) {
        this.file = file;
        this.host = host;
        this.clock = clock;
        this.keyFile = keyFile;
        saved = read(file);
        key = read(keyFile).optString("acoustid");
    }

    private static JSONObject read(File file) {
        try {
            if (file != null && file.isFile())
                return new JSONObject(
                        new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8));
        } catch (Exception ignored) {
            // Counts start again.
        }
        return new JSONObject();
    }

    private static void write(File file, JSONObject json) {
        if (file == null) return;
        try {
            File part = new File(file.getPath() + ".part");
            Files.write(part.toPath(), json.toString().getBytes(StandardCharsets.UTF_8));
            if (!part.renameTo(file)) part.delete();
        } catch (Exception ignored) {
            // Only counts.
        }
    }

    // ── The AcoustID key ────────────────────────────────────────────────────

    /** The user's AcoustID application key, kept apart from the settings and out of backups. */
    String key() {
        return key;
    }

    /** Whether a key looks like one: AcoustID's are 8 to 64 letters and digits. */
    static boolean validKey(String key) {
        return key != null && key.matches("[A-Za-z0-9]{8,64}");
    }

    synchronized void setKey(String value) throws Exception {
        value = value == null ? "" : value.trim();
        if (!value.isEmpty() && !validKey(value))
            throw new java.io.IOException("That doesn’t look like an AcoustID application key.");
        key = value;
        keyProblem = "";
        write(keyFile, new JSONObject().put("acoustid", value));
    }

    /**
     * Signing out: counts and the songs waiting go. The AcoustID key isn't Telegram's, and stays.
     */
    synchronized void clear() {
        saved = new JSONObject();
        keyProblem = "";
        played.clear();
        failed.clear();
        if (file != null) file.delete();
    }

    // ── What to check ───────────────────────────────────────────────────────

    /** A song started playing: it's checked a minute from now. */
    synchronized void played(JSONObject row) {
        if (row == null || (!checkLossless && !recognize)) return;
        String id = row.optString("id");
        if (id.isEmpty() || !wanted(row)) return;
        played.remove(id);
        played.put(id, new Object[] {row, clock.millis()});
        while (played.size() > MAX_PLAYED) played.remove(played.keySet().iterator().next());
    }

    /** Whether there's anything to find out about a row. */
    boolean wanted(JSONObject row) {
        return needsCheck(row) || needsName(row);
    }

    boolean needsCheck(JSONObject row) {
        return checkLossless
                && row.optInt("file") != 0
                && !row.has("check")
                && LosslessCheck.checkable(row)
                && !failedRecently(LosslessCheck.key(row));
    }

    boolean needsName(JSONObject row) {
        if (!recognize || !validKey(key) || !keyProblem.isEmpty()) return false;
        if (row.optBoolean("tagged", true) || row.has("recognized") || row.optInt("file") == 0)
            return false;
        // Songs in zips and cue albums are named from their zip or sheet.
        if (row.has("zip") || row.has("cue")) return false;
        String id = row.optString("id");
        if (failedRecently(id)) return false;
        JSONObject tried = host.index().found("names", id);
        return tried == null || clock.millis() - tried.optLong("tried") > RETRY_MILLIS;
    }

    private boolean failedRecently(String key) {
        Long at = failed.get(key);
        return at != null && clock.millis() - at < FAILED_MILLIS;
    }

    // ── Doing it ────────────────────────────────────────────────────────────

    /** Does one file's worth of work. Returns how long to wait before the next. */
    long step() {
        if (!host.ready()) return 5000;
        JSONObject due = nextPlayed();
        if (due != null) {
            work(due, false);
            return 1000;
        }
        if (!checkInBackground && !(recognize && validKey(key))) return 60_000;
        if (!host.pause().isEmpty()) return 60_000;
        long now = clock.millis();
        if (now - roundDone < ROUND_MILLIS) return 60_000;
        if (spentToday("bytes") >= DAILY_BYTES) return 30 * 60_000;
        try {
            JSONObject next = nextInChats();
            if (next == null) {
                roundDone = now;
                return 60_000;
            }
            work(next, true);
            return 2000;
        } catch (Exception e) {
            return 60_000;
        }
    }

    private synchronized JSONObject nextPlayed() {
        long now = clock.millis();
        for (Iterator<Object[]> it = played.values().iterator(); it.hasNext(); ) {
            Object[] item = it.next();
            if (now - (Long) item[1] < PLAYED_DELAY) continue;
            it.remove();
            return (JSONObject) item[0];
        }
        return null;
    }

    /**
     * The next file in the chats that needs a check or a name, newest post first; null once a round
     * through every chat is done.
     */
    private JSONObject nextInChats() throws Exception {
        TelegramIndex index = host.index();
        if (chat == 0 && chatsLeft.isEmpty() && page.isEmpty())
            chatsLeft.addAll(new TreeSet<>(host.chats()));
        while (true) {
            JSONObject row;
            while ((row = page.poll()) != null)
                if ((checkInBackground && needsCheck(row)) || needsName(row)) return row;
            if (chat == 0) {
                Long next = chatsLeft.poll();
                if (next == null) return null;
                chat = next;
                cursor = Long.MAX_VALUE;
            }
            List<JSONObject> rows = index.before(chat, cursor, 100);
            if (rows == null || rows.isEmpty()) {
                chat = 0;
                continue;
            }
            for (JSONObject r : rows) cursor = Math.min(cursor, r.optLong("message"));
            page.addAll(rows);
        }
    }

    private void work(JSONObject row, boolean background) {
        if (needsCheck(row)) check(row, background);
        if (needsName(row)) name(row, background);
    }

    private void check(JSONObject row, boolean background) {
        String key = LosslessCheck.key(row);
        int file = row.optInt("file");
        long[] read = {0};
        try {
            JSONObject verdict =
                    LosslessCheck.check(
                            row,
                            (offset, length) -> {
                                byte[] bytes = host.range(file, offset, length);
                                read[0] += bytes.length;
                                return bytes;
                            });
            if (verdict == null)
                verdict =
                        new JSONObject().put("v", LosslessCheck.VERSION).put("verdict", "unknown");
            host.index().putFound(row, "check", verdict);
            row.put("check", verdict);
            count("checked", 1);
            if (LosslessCheck.fake(verdict)) count("fake", 1);
            host.changed(row);
            HostLog.d(
                    "Unofficial Telegram checked "
                            + row.optString("fileName")
                            + ": "
                            + verdict.optString("verdict")
                            + (verdict.has("cutoff")
                                    ? ", cut at " + verdict.optInt("cutoff") + " Hz"
                                    : ""));
        } catch (LiveSearch.RateLimited e) {
            failed.put(key, clock.millis());
        } catch (Exception e) {
            failed.put(key, clock.millis());
            HostLog.d(
                    "Unofficial Telegram couldn't check "
                            + row.optString("fileName")
                            + ": "
                            + e.getMessage());
        } finally {
            if (background) spend("bytes", read[0]);
        }
    }

    private void name(JSONObject row, boolean background) {
        String id = row.optString("id");
        if (spentToday("lookups") >= DAILY_LOOKUPS) return;
        try {
            int seconds = row.optInt("duration");
            Audio pcm = host.decode(id, Chromaprint.SECONDS);
            if (background) {
                long size = row.optLong("size");
                spend(
                        "bytes",
                        seconds > 0
                                ? size * Math.min(seconds, Chromaprint.SECONDS) / seconds
                                : size);
            }
            short[] samples = new short[pcm.length];
            for (int i = 0; i < pcm.length; i++)
                samples[i] =
                        (short)
                                Math.max(
                                        -32768,
                                        Math.min(32767, Math.round(pcm.samples[i] * 32767f)));
            if (seconds <= 0) seconds = pcm.length / Math.max(1, pcm.rate);
            String fingerprint =
                    Chromaprint.encode(Chromaprint.fingerprint(samples, pcm.length, pcm.rate));
            spend("lookups", 1);
            JSONObject best = AcoustId.best(host.lookup(key, seconds, fingerprint), seconds);
            JSONObject names = best != null ? best : new JSONObject().put("title", "");
            names.put("tried", clock.millis());
            host.index().putFound(row, "names", names);
            if (best != null) {
                count("recognized", 1);
                IndexStore.named(row, names);
                host.changed(row);
                HostLog.d(
                        "Unofficial Telegram recognised "
                                + row.optString("fileName")
                                + " as "
                                + best.optString("artist")
                                + " — "
                                + best.optString("title"));
            }
        } catch (AcoustId.BadKey e) {
            keyProblem = e.getMessage();
        } catch (Exception e) {
            failed.put(id, clock.millis());
            HostLog.d(
                    "Unofficial Telegram couldn't recognise "
                            + row.optString("fileName")
                            + ": "
                            + e.getMessage());
        }
    }

    // ── Counts ──────────────────────────────────────────────────────────────

    private synchronized long spentToday(String what) {
        long day = clock.millis() / (24 * 3600 * 1000L);
        return saved.optLong("day") == day ? saved.optLong(what) : 0;
    }

    private synchronized void spend(String what, long amount) {
        try {
            long day = clock.millis() / (24 * 3600 * 1000L);
            if (saved.optLong("day") != day)
                saved.put("day", day).put("bytes", 0).put("lookups", 0);
            saved.put(what, saved.optLong(what) + amount);
            write(file, saved);
        } catch (Exception ignored) {
            // Only counts.
        }
    }

    private synchronized void count(String what, int n) {
        try {
            saved.put(what, saved.optLong(what) + n);
            write(file, saved);
        } catch (Exception ignored) {
            // Only counts.
        }
    }

    /** "Checked 1,234 files · 56 not really lossless · 12 named by sound", or "". */
    synchronized String status() {
        List<String> parts = new ArrayList<>();
        long checked = saved.optLong("checked"), fake = saved.optLong("fake");
        long named = saved.optLong("recognized");
        if (checked > 0)
            parts.add(
                    Strings.f(
                            checked == 1 ? "Checked {0} file" : "Checked {0} files",
                            Strings.number(checked)));
        if (fake > 0) parts.add(Strings.f("{0} not really lossless", Strings.number(fake)));
        if (named > 0) parts.add(Strings.f("{0} named by sound", Strings.number(named)));
        if (!keyProblem.isEmpty())
            parts.add(Strings.f("AcoustID refused the key: {0}", keyProblem));
        return String.join(" · ", parts);
    }
}
