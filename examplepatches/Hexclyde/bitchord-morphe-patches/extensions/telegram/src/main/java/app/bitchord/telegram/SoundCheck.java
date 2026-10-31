package app.bitchord.telegram;

import org.json.JSONObject;

import java.io.File;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.Executor;

/**
 * Checks by sound whether a Telegram file turned down for its length is the song that's playing.
 *
 * <p>A file with the song's title but a length more than a few seconds off is usually another
 * recording, but sometimes it's the same one with a longer fade or a few seconds of silence. While
 * the song plays from elsewhere, this listens to its first seconds as BitChord's player outputs
 * them, decodes the start of the Telegram file, and compares their {@link Fingerprint}s. A file
 * that's the same recording, starting at the same point, is reported with the song's length from
 * then on, so BitChord takes it the next time the song plays.
 */
final class SoundCheck {
    /** The start of a Telegram file as mono samples. */
    static final class Pcm {
        final float[] samples;
        final int length, rate;
        // Where in the file the first sample is.
        final long startUs;

        Pcm(float[] samples, int length, int rate) {
            this(samples, length, rate, 0);
        }

        Pcm(float[] samples, int length, int rate, long startUs) {
            this.samples = samples;
            this.length = length;
            this.rate = rate;
            this.startUs = startUs;
        }
    }

    interface Reference {
        Pcm load(String telegramId, int seconds) throws Exception;
    }

    interface Notice {
        void sameRecording(String title);
    }

    interface Clock {
        long millis();
    }

    /** Set while the option is on; the player's hooks do nothing while it's null. */
    static volatile SoundCheck active;

    static final int CAPTURE_SECONDS = 15, REFERENCE_SECONDS = 45, MAX_DRIFT_SEC = 60;

    /** Only songs heard from their first few seconds are compared. */
    static final long START_WITHIN_MS = 3000;

    /** A capture that hasn't filled by then (paused, skipped) is dropped. */
    static final long CAPTURE_MILLIS = 120_000;

    /** How far the Telegram file's start may sit from the song's, in seconds. */
    static final double EARLY = 0.75, LATE = 1.75;

    /** A file that couldn't be decoded isn't tried again for a week. */
    static final long RETRY_MILLIS = 7 * 24 * 3600 * 1000L;

    private static final int MAX_PENDING = 50;

    static final class Candidate {
        final String id, title, artist, key;
        final int seconds;

        Candidate(String id, String title, String artist, int seconds) {
            this.id = id;
            this.title = title;
            this.artist = artist == null ? "" : artist;
            this.seconds = seconds;
            this.key = key(title, seconds);
        }
    }

    private final File file;
    private final Reference reference;
    private final Notice notice;
    private final Executor work;
    private final Clock clock;
    private final LinkedHashMap<String, List<Candidate>> pending = new LinkedHashMap<>();
    private JSONObject results;
    private volatile Capture capture;

    SoundCheck(File file, Reference reference, Notice notice, Executor work, Clock clock) {
        this.file = file;
        this.reference = reference;
        this.notice = notice;
        this.work = work;
        this.clock = clock;
        try {
            results =
                    file != null && file.isFile()
                            ? new JSONObject(
                                    new String(
                                            Files.readAllBytes(file.toPath()),
                                            StandardCharsets.UTF_8))
                            : new JSONObject();
        } catch (Exception e) {
            results = new JSONObject();
        }
    }

    static String key(String title, int seconds) {
        return String.join(" ", TrackNames.words(TelegramMatch.core(title))) + "|" + seconds;
    }

    /** A Telegram file BitChord's lookup turned down only for its length. */
    synchronized void consider(String title, String artist, int seconds, String telegramId) {
        Candidate c = new Candidate(telegramId, title, artist, seconds);
        JSONObject done = results.optJSONObject(telegramId);
        if (done != null
                && c.key.equals(done.optString("key"))
                && (done.has("same") || clock.millis() - done.optLong("at") < RETRY_MILLIS)) return;
        List<Candidate> list = pending.computeIfAbsent(c.key, k -> new ArrayList<>());
        for (Candidate known : list) if (known.id.equals(telegramId)) return;
        list.add(c);
        while (pending.size() > MAX_PENDING) pending.remove(pending.keySet().iterator().next());
        HostLog.d(
                "Unofficial Telegram will check by sound whether "
                        + telegramId
                        + " is '"
                        + title
                        + "' the next time it plays from its start");
    }

    synchronized int pendingCount() {
        int n = 0;
        for (List<Candidate> list : pending.values()) n += list.size();
        return n;
    }

    /** A song started playing from another source. */
    void playing(String title, String artist, long durationMs, long positionMs) {
        Capture current = capture;
        if (current != null && clock.millis() - current.startedAt < CAPTURE_MILLIS) return;
        if (positionMs > START_WITHIN_MS || durationMs <= 0) return;
        int seconds = (int) Math.round(durationMs / 1000.0);
        List<Candidate> due = new ArrayList<>();
        synchronized (this) {
            for (int s = seconds - 2; s <= seconds + 2; s++) {
                List<Candidate> list = pending.get(key(title, s));
                if (list != null) due.addAll(list);
            }
        }
        capture = due.isEmpty() ? null : new Capture(due, positionMs / 1000.0, clock.millis());
    }

    // ── Listening ───────────────────────────────────────────────────────────

    private static final Map<Object, int[]> formats =
            Collections.synchronizedMap(new WeakHashMap<>());

    /** The PCM format a player's audio sink was set up for: rate, channels, encoding. */
    static void format(Object sink, int rate, int channels, int encoding) {
        if (rate > 0 && channels > 0 && Downmix.bytesPerSample(encoding) > 0)
            formats.put(sink, new int[] {rate, channels, encoding});
        else formats.remove(sink);
    }

    /** The PCM format a sink was set up for: {rate, channels, encoding}, or null. */
    static int[] formatOf(Object sink) {
        return formats.get(sink);
    }

    /** Every buffer the player hands its audio sink. Cheap unless a capture is running. */
    static void tap(Object sink, ByteBuffer buffer, long timeUs) {
        SoundCheck check = active;
        if (check == null) return;
        Capture c = check.capture;
        if (c == null) return;
        try {
            int[] format = formats.get(sink);
            if (format == null) return;
            if (c.add(sink, buffer, timeUs, format)) {
                check.capture = null;
                check.work.execute(() -> check.compare(c));
            } else if (check.clock.millis() - c.startedAt > CAPTURE_MILLIS) check.capture = null;
        } catch (Throwable ignored) {
            // Listening must never get in the way of playback.
        }
    }

    /** Audio as each sink received it, as mono at the sink's rate. */
    static final class Capture {
        final List<Candidate> candidates;
        final double startSeconds;
        final long startedAt;
        final Map<Object, Heard> sinks = new IdentityHashMap<>();

        Capture(List<Candidate> candidates, double startSeconds, long startedAt) {
            this.candidates = candidates;
            this.startSeconds = startSeconds;
            this.startedAt = startedAt;
        }

        /** True once one sink has heard enough. */
        synchronized boolean add(Object sink, ByteBuffer buffer, long timeUs, int[] format) {
            int rate = format[0], channels = format[1], encoding = format[2];
            Heard heard = sinks.get(sink);
            if (heard == null || heard.rate != rate) {
                heard = new Heard(rate);
                sinks.put(sink, heard);
            }
            // The sink is handed the same buffer again until it has taken all of it.
            if (heard.lastBuffer == buffer && heard.lastTimeUs == timeUs) return false;
            heard.lastBuffer = buffer;
            heard.lastTimeUs = timeUs;
            ByteBuffer b = buffer.duplicate().order(ByteOrder.LITTLE_ENDIAN);
            int frame = Downmix.bytesPerSample(encoding) * channels;
            while (b.remaining() >= frame && heard.length < heard.samples.length) {
                float sum = 0;
                for (int c = 0; c < channels; c++) sum += Downmix.read(b, encoding);
                heard.samples[heard.length++] = sum / channels;
            }
            return heard.length >= heard.samples.length;
        }
    }

    static final class Heard {
        final int rate;
        final float[] samples;
        int length;
        ByteBuffer lastBuffer;
        long lastTimeUs = Long.MIN_VALUE;

        Heard(int rate) {
            this.rate = rate;
            samples = new float[rate * CAPTURE_SECONDS];
        }
    }

    // ── Comparing ───────────────────────────────────────────────────────────

    /** Compares what was heard with each candidate's start. Runs off the audio thread. */
    void compare(Capture c) {
        List<Fingerprint> heard = new ArrayList<>();
        for (Heard h : c.sinks.values())
            if (h.length >= h.rate * 10) heard.add(Fingerprint.of(h.samples, h.length, h.rate));
        if (heard.isEmpty()) return;
        for (Candidate candidate : c.candidates) {
            Pcm start;
            try {
                start = reference.load(candidate.id, REFERENCE_SECONDS);
            } catch (Exception e) {
                record(candidate, null, null, c.startSeconds);
                HostLog.d(
                        "Unofficial Telegram couldn't read "
                                + candidate.id
                                + " to check it by sound: "
                                + e.getMessage());
                continue;
            }
            Fingerprint file = Fingerprint.of(start.samples, start.length, start.rate);
            Fingerprint.Match best = null;
            for (Fingerprint f : heard) {
                Fingerprint.Match m = Fingerprint.match(file, f);
                if (best == null || m.score > best.score) best = m;
            }
            boolean same = isSame(best, c.startSeconds);
            record(candidate, same, best, c.startSeconds);
            HostLog.d(
                    "Unofficial Telegram sound check: "
                            + candidate.id
                            + (same ? " is " : " isn't ")
                            + "'"
                            + candidate.title
                            + "' ("
                            + best
                            + ", song heard from "
                            + String.format(Locale.US, "%.1f", c.startSeconds)
                            + " s)");
            if (same) notice.sameRecording(candidate.title);
        }
    }

    /** The same recording, starting where the song does, give or take the player's buffering. */
    static boolean isSame(Fingerprint.Match m, double startSeconds) {
        if (m == null || !m.same()) return false;
        double shift = m.offset - startSeconds;
        return shift >= -EARLY && shift <= LATE;
    }

    private synchronized void record(
            Candidate c, Boolean same, Fingerprint.Match m, double startSeconds) {
        try {
            JSONObject result =
                    new JSONObject()
                            .put("key", c.key)
                            .put("title", c.title)
                            .put("artist", c.artist)
                            .put("seconds", c.seconds)
                            .put("at", clock.millis());
            if (same != null) result.put("same", same);
            if (m != null) result.put("score", m.score).put("offset", m.offset - startSeconds);
            results.put(c.id, result);
            List<Candidate> list = pending.get(c.key);
            if (list != null) {
                list.removeIf(k -> k.id.equals(c.id));
                if (list.isEmpty()) pending.remove(c.key);
            }
            save();
        } catch (Exception ignored) {
            // A lost result just means checking again.
        }
    }

    /**
     * The length to report for a Telegram file in a search: the song's, when the file was found to
     * be the same recording of a song this search is for; otherwise null.
     */
    synchronized Integer seconds(String telegramId, String query) {
        JSONObject r = results.optJSONObject(telegramId);
        if (r == null || !r.optBoolean("same")) return null;
        List<String> wanted = TrackNames.words(TelegramMatch.core(r.optString("title")));
        return !wanted.isEmpty() && TrackNames.words(query).containsAll(wanted)
                ? r.optInt("seconds")
                : null;
    }

    synchronized int confirmed() {
        int n = 0;
        for (Iterator<String> it = results.keys(); it.hasNext(); )
            if (results.optJSONObject(it.next()).optBoolean("same")) n++;
        return n;
    }

    /** Forgets everything: on sign-out. */
    synchronized void clear() {
        pending.clear();
        capture = null;
        results = new JSONObject();
        if (file != null) file.delete();
    }

    private void save() throws Exception {
        if (file == null) return;
        File tmp = new File(file.getPath() + ".tmp");
        Files.write(tmp.toPath(), results.toString().getBytes(StandardCharsets.UTF_8));
        if (!tmp.renameTo(file)) tmp.delete();
    }
}
