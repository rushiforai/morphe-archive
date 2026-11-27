package app.ayham.extension.music.automix;

import android.content.Context;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import static app.ayham.extension.music.automix.Automix.TAG;

/**
 * Where a song is sung, from its synced lyrics (versions.md "Where a song is sung"): each line's
 * shape (start, end when given, word count, word times), never its text, turned into sung spans by
 * {@link Planner#sungSpansFromLines}; the planner carves them with the vocal mask.
 * <p>
 * Lyrics come from Morphe's own providers, in the user's order (its "Third-party lyrics"
 * setting), asked by title / artist / length. Only synced lyrics that match the song well are
 * taken; providers keyed by video id are skipped, since they answer for the song on screen, not
 * the one asked about. Kept per song in {@code files/automix/lyrics}, "none" included.
 */
final class SungLyrics {
    private static final String LYRICS = "app.morphe.extension.music.patches.lyrics.";

    /** Known answers: spans, or an empty array for "no synced lyrics". */
    private static final Map<String, double[][]> known = new ConcurrentHashMap<>();
    /** The same lines read as the loop mix reads them (Planner.loopSpansFromLines, the baseline's). */
    private static final Map<String, double[][]> knownLoop = new ConcurrentHashMap<>();
    private static final Map<String, Boolean> asking = new ConcurrentHashMap<>();
    /** A lookup that failed (network) is asked again a minute later. */
    private static final Map<String, Long> failedAt = new ConcurrentHashMap<>();
    /** When a song's saved answer was last looked for and not found: the file is checked every 5 s at most. */
    private static final Map<String, Long> missingAt = new ConcurrentHashMap<>();

    private SungLyrics() {
    }

    /**
     * The user's PC extension lyrics order (its settings, 2026-11-24) in Morphe's provider ids: lrc.red,
     * Better Lyrics Unison, Better Lyrics, then BiniLyrics, Musixmatch, LRCLIB, Paxsenix (Morphe's
     * Apple), SimpMusic, YouTube captions, Spotify and Genius last (the user moved it, 2026-11-25). LyricsPlus has no Morphe source of its
     * own (BiniLyrics asks it). The rest are off. Both Morphe's lyrics panel and Automix read it.
     */
    static final String PC_ORDER = "LrcRed,Unison,bLyrics,BiniLyrics,Musixmatch,LRCLIB,Apple,SimpMusic,Captions,Spotify,Genius,"
            + "-YTMusic,-QQ,-NetEase,-KuGou,-Luna,-PetitLyrics,-AMLL,-LunaBeat,-Lyricify,-Deezer,-RMM,";

    /**
     * The PC's order, set once over whatever was there (the user asked for the PC extension's order,
     * 2026-11-24, Genius last 2026-11-25); later changes in Morphe's lyrics settings are the user's and stay.
     */
    static void defaultToPcOrder(Context c) {
        try {
            android.content.SharedPreferences prefs = c.getSharedPreferences("ayham_lyrics", Context.MODE_PRIVATE);
            if (prefs.getBoolean("pc_order_set_2026_11c", false)) return;
            Object source = Class.forName("app.morphe.extension.music.settings.Settings").getField("LYRICS_SOURCE").get(null);
            Class<?> t = source.getClass();
            Object was = t.getMethod("get").invoke(source);
            t.getMethod("save", Object.class).invoke(source, PC_ORDER);
            Log.i(TAG, "lyrics order: the PC extension's now (was " + was + ")");
            prefs.edit().putBoolean("pc_order_set_2026_11c", true).apply();
        } catch (Throwable t) {
            Log.w(TAG, "lyrics order: not set", t);
        }
    }

    /** The spans if already known: null while unknown, empty when the song has no synced lyrics. */
    static double[][] cached(Context c, String id) {
        if (id == null) return null;
        double[][] s = known.get(id);
        if (s != null) return s;
        // called from the player's tick on the main thread: not a file check on every tick
        Long missing = missingAt.get(id);
        long now = System.currentTimeMillis();
        if (missing != null && now - missing < 5000) return null;
        List<Planner.LineShape> lines = load(c, id);
        if (lines != null) {
            s = keep(id, lines);
            missingAt.remove(id);
        } else {
            if (missingAt.size() > 200) missingAt.clear();
            missingAt.put(id, now);
        }
        return s;
    }

    /** The loop mix's spans if known (after {@link #cached}): null while unknown, empty without synced lyrics. */
    static double[][] cachedLoop(Context c, String id) {
        if (id == null) return null;
        cached(c, id);
        return knownLoop.get(id);
    }

    /** Both readings of [lines] kept for [id]; the blend's returned. */
    private static double[][] keep(String id, List<Planner.LineShape> lines) {
        double[][] s = Planner.sungSpansFromLines(lines);
        knownLoop.put(id, Planner.loopSpansFromLines(lines));
        known.put(id, s);
        return s;
    }

    static boolean pending(String id) {
        return id != null && asking.containsKey(id);
    }

    /** Asks for [id]'s lyrics on a background thread, once. */
    static void request(Context c, String id, String title, String artist, double durationSec) {
        if (id == null || title == null || title.isEmpty() || cached(c, id) != null) return;
        Long failed = failedAt.get(id);
        if (failed != null && android.os.SystemClock.elapsedRealtime() - failed < 60_000) return;
        if (asking.putIfAbsent(id, true) != null) return;
        new Thread(() -> {
            try {
                List<Planner.LineShape> lines = fetch(title, artist == null ? "" : artist, durationSec);
                if (lines != null) {
                    double[][] s = keep(id, lines);
                    save(c, id, lines);
                    Log.i(TAG, String.format("%s: %s", id, s.length == 0 ? "no synced lyrics, the vocal mask decides where it is sung"
                            : s.length + " synced lyric lines decide where it is sung"));
                } else {
                    failedAt.put(id, android.os.SystemClock.elapsedRealtime());
                }
            } catch (Throwable t) {
                failedAt.put(id, android.os.SystemClock.elapsedRealtime());
                Log.w(TAG, id + ": lyrics lookup failed", t);
            } finally {
                asking.remove(id);
            }
        }, "Automix-lyrics").start();
    }

    /** Null on a lookup error (asked again later), empty when no provider has synced lines. */
    private static List<Planner.LineShape> fetch(String title, String artist, double durationSec) throws Exception {
        Class<?> settings = Class.forName("app.morphe.extension.music.settings.Settings");
        Object source = settings.getField("LYRICS_SOURCE").get(null);
        String order = (String) source.getClass().getMethod("get").invoke(source);
        @SuppressWarnings("unchecked")
        List<Object> providers = (List<Object>) Class.forName(LYRICS + "LyricsProviders")
                .getMethod("providersInOrder", String.class).invoke(null, order);
        Class<?> trackType = Class.forName(LYRICS + "model.TrackInfo");
        Object track = trackType.getConstructor(String.class, String.class, String.class, int.class)
                .newInstance(title, artist, "", (int) Math.round(durationSec));
        Method fetch = Class.forName(LYRICS + "requests.LyricsProvider").getMethod("fetch", trackType);
        boolean errors = false;
        for (Object p : providers) {
            Object r;
            try {
                r = fetch.invoke(p, track);
            } catch (Throwable t) {
                errors = true;
                continue;
            }
            if (r == null) continue;
            Class<?> rt = r.getClass();
            if ((boolean) rt.getMethod("videoIdKeyed").invoke(r)) continue;
            if (!(boolean) rt.getMethod("isHighMatch", trackType).invoke(r, track)) continue;
            Object lyrics = rt.getMethod("lyrics").invoke(r);
            if (lyrics == null || !(boolean) lyrics.getClass().getMethod("synced").invoke(lyrics)) continue;
            List<?> lines = (List<?>) lyrics.getClass().getMethod("lines").invoke(lyrics);
            List<Planner.LineShape> shapes = shapes(lines, title, artist);
            if (!shapes.isEmpty()) return shapes;
        }
        return errors ? null : new ArrayList<>();
    }

    /**
     * The extension's lineShapes: a line with no text and no timed words is a gap and left out; a
     * credit or tag line (Planner.creditLine) is kept, marked, and the loop mix leaves it out.
     */
    private static List<Planner.LineShape> shapes(List<?> lines, String title, String artist) throws Exception {
        List<Planner.LineShape> out = new ArrayList<>();
        for (Object l : lines) {
            Class<?> t = l.getClass();
            long start = (long) t.getMethod("startTimeMs").invoke(l), end = (long) t.getMethod("endTimeMs").invoke(l);
            if (start < 0) continue;
            String text = (String) t.getMethod("text").invoke(l);
            text = text == null ? "" : text.trim();
            List<double[]> timed = new ArrayList<>();
            if ((boolean) t.getMethod("hasWordTimings").invoke(l)) {
                List<?> words = (List<?>) t.getMethod("words").invoke(l);
                if (words != null) for (Object w : words) {
                    long ws = ((Number) w.getClass().getMethod("startMs").invoke(w)).longValue();
                    long we = ((Number) w.getClass().getMethod("endMs").invoke(w)).longValue();
                    if (ws >= 0 && we >= ws) timed.add(new double[]{ws / 1000.0, we / 1000.0});
                }
            }
            if (text.isEmpty() && timed.isEmpty()) continue;
            out.add(new Planner.LineShape(start / 1000.0, end > start ? end / 1000.0 : Double.NaN,
                    text.isEmpty() ? timed.size() : text.split("\\s+").length, timed.isEmpty() ? null : timed.toArray(new double[0][]),
                    !text.isEmpty() && Planner.creditLine(text, title, artist)));
        }
        out.sort((a, b) -> Double.compare(a.start, b.start));
        return out;
    }

    /** The saved file's format: 2 marks credit lines; 4 was asked in the PC's lyrics order (the user's list); 5 with Genius last. */
    private static final int SAVED_VERSION = 5;

    private static File file(Context c, String id) {
        return new File(new File(c.getFilesDir(), "automix/lyrics"), id + ".json");
    }

    /**
     * The saved line shapes; a file from before the line shapes ("spans") or before credit lines were
     * marked or before the PC's order (a "v" under 4) counts as missing, so the song is asked again.
     */
    private static List<Planner.LineShape> load(Context c, String id) {
        try {
            File f = file(c, id);
            if (!f.exists()) return null;
            JSONObject o = new JSONObject(new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8));
            if (!o.has("lines") || o.optInt("v") != SAVED_VERSION) {
                //noinspection ResultOfMethodCallIgnored
                f.delete();
                return null;
            }
            JSONArray a = o.getJSONArray("lines");
            List<Planner.LineShape> lines = new ArrayList<>();
            for (int i = 0; i < a.length(); i++) {
                JSONObject l = a.getJSONObject(i);
                double[][] wt = null;
                JSONArray w = l.optJSONArray("wordTimes");
                if (w != null) {
                    wt = new double[w.length()][];
                    for (int k = 0; k < wt.length; k++) wt[k] = new double[]{w.getJSONArray(k).getDouble(0), w.getJSONArray(k).getDouble(1)};
                }
                lines.add(new Planner.LineShape(l.getDouble("start"), l.isNull("end") ? Double.NaN : l.getDouble("end"), l.getInt("words"), wt,
                        l.optBoolean("credit")));
            }
            return lines;
        } catch (Throwable t) {
            return null;
        }
    }

    private static void save(Context c, String id, List<Planner.LineShape> lines) {
        try {
            JSONArray a = new JSONArray();
            for (Planner.LineShape l : lines) {
                JSONObject o = new JSONObject().put("start", l.start).put("end", Double.isNaN(l.end) ? JSONObject.NULL : l.end).put("words", l.words);
                if (l.wordTimes != null) {
                    JSONArray w = new JSONArray();
                    for (double[] x : l.wordTimes) w.put(new JSONArray().put(x[0]).put(x[1]));
                    o.put("wordTimes", w);
                }
                if (l.credit) o.put("credit", true);
                a.put(o);
            }
            File f = file(c, id);
            //noinspection ResultOfMethodCallIgnored
            f.getParentFile().mkdirs();
            Files.write(f.toPath(), new JSONObject().put("v", SAVED_VERSION).put("lines", a).toString().getBytes(StandardCharsets.UTF_8));
        } catch (Throwable t) {
            Log.w(TAG, id + ": lyrics not saved", t);
        }
    }

    static void clear(Context c) {
        known.clear();
        knownLoop.clear();
        failedAt.clear();
        missingAt.clear();
        File[] fs = new File(c.getFilesDir(), "automix/lyrics").listFiles();
        if (fs != null) for (File f : fs) f.delete();
    }
}
