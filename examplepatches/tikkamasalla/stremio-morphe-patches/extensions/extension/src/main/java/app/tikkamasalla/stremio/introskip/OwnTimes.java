package app.tikkamasalla.stremio.introskip;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Pure decision for the "Own times" source (no Android classes), unit tested
 * standalone: one small JSON per show from our own skip-data branch,
 * {"v":1,"s":{"3":{"8":[{"t":"intro","a":71196,"b":161036,"d":1511977}]}}}
 * (season, then episode, then entries; a/b/d in ms; d is the file length the
 * times were measured on). An entry is used only when its d is within
 * {@link #TOLERANCE_MS} of the file's runtime; an unknown runtime holds every
 * entry, because other releases have other timings.
 */
final class OwnTimes {
    static final String SOURCE = "Own times";
    static final String BASE_URL =
            "https://raw.githubusercontent.com/tikkamasalla/stremio-morphe-patches/skip-data/times/";
    static final long TOLERANCE_MS = 2000L;
    static final long CACHE_MS = 24L * 60L * 60L * 1000L;
    /** A failed fetch (not a 404) is tried again after this long, not after a day. */
    static final long RETRY_MS = 5L * 60L * 1000L;

    /** Fetches the raw body for one show ("" = no file / failure); tests count calls. */
    interface Fetcher {
        String get(String imdbId) throws Exception;
    }

    static final class Entry {
        final String label; // "OP", "recap", "credits" or "preview"
        final long startMs;
        final long endMs;
        final long fileMs;

        Entry(String label, long startMs, long endMs, long fileMs) {
            this.label = label;
            this.startMs = startMs;
            this.endMs = endMs;
            this.fileMs = fileMs;
        }
    }

    private static final class Cached {
        final String body;
        final long atMs;

        Cached(String body, long atMs) {
            this.body = body;
            this.atMs = atMs;
        }
    }

    private static final Map<String, Cached> CACHE = new ConcurrentHashMap<String, Cached>();
    private static final Object FETCH_LOCK = new Object();

    private OwnTimes() {
    }

    static boolean isOwn(String source) {
        return source != null && source.startsWith(SOURCE);
    }

    /** Episode entries of one show body; empty on bad JSON or a missing episode. */
    static List<Entry> parse(String body, int season, int episode) {
        List<Entry> out = new ArrayList<Entry>();
        try {
            if (body == null) return out;
            JSONObject seasons = new JSONObject(body).optJSONObject("s");
            JSONObject episodes = seasons == null ? null
                    : seasons.optJSONObject(String.valueOf(season));
            JSONArray items = episodes == null ? null
                    : episodes.optJSONArray(String.valueOf(episode));
            if (items == null) return out;
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.optJSONObject(i);
                if (item == null || item.isNull("a") || item.isNull("b") || item.isNull("d")) continue;
                String label = labelFor(item.optString("t", ""));
                long a = item.optLong("a", -1L);
                long b = item.optLong("b", -1L);
                long d = item.optLong("d", -1L);
                if (label == null || a < 0 || b <= a || d <= 0) continue;
                out.add(new Entry(label, a, b, d));
            }
        } catch (Exception badJson) {
            out.clear();
        }
        return out;
    }

    /**
     * Entries measured on this file: |d - runtime| within tolerance, one per
     * type (the closest d wins). Runtime <= 0 holds everything (judged later).
     */
    static List<Entry> select(List<Entry> entries, long runtimeMs) {
        List<Entry> out = new ArrayList<Entry>();
        if (entries == null || runtimeMs <= 0) return out;
        for (Entry e : entries) {
            if (Math.abs(e.fileMs - runtimeMs) > TOLERANCE_MS) continue;
            // Never let an entry positional sanity would drop replace a valid online segment.
            if (!"preview".equals(e.label) && e.endMs - e.startMs > 600000L) continue;
            if ("OP".equals(e.label) && e.startMs > runtimeMs * 0.60) continue;
            if ("credits".equals(e.label) && e.startMs < runtimeMs * 0.40) continue;
            if (e.endMs > runtimeMs) { // measured to the end of a slightly longer cut
                if (e.startMs >= runtimeMs) continue;
                e = new Entry(e.label, e.startMs, runtimeMs, e.fileMs);
            }
            int at = -1;
            for (int i = 0; i < out.size(); i++) {
                if (out.get(i).label.equals(e.label)) {
                    at = i;
                    break;
                }
            }
            if (at < 0) {
                out.add(e);
            } else if (Math.abs(e.fileMs - runtimeMs) < Math.abs(out.get(at).fileMs - runtimeMs)) {
                out.set(at, e);
            }
        }
        return out;
    }

    /** Matched entries for one episode; the show body is fetched once per 24 h (404 cached too). */
    static List<Entry> forEpisode(Fetcher fetcher, String imdbId, int season, int episode,
                                  long runtimeMs, long nowMs) {
        if (fetcher == null || imdbId == null || !imdbId.startsWith("tt")) return new ArrayList<Entry>();
        String body;
        Cached cached = CACHE.get(imdbId);
        if (cached != null && nowMs - cached.atMs < CACHE_MS) {
            body = cached.body;
        } else {
            synchronized (FETCH_LOCK) { // one GET per show, also across concurrent lookups
                cached = CACHE.get(imdbId);
                if (cached != null && nowMs - cached.atMs < CACHE_MS) {
                    body = cached.body;
                } else {
                    try {
                        body = fetcher.get(imdbId);
                    } catch (Exception failed) {
                        body = null;
                    }
                    // null = the fetch failed: empty for now, asked again soon. "" = 404: a real answer.
                    CACHE.put(imdbId, new Cached(body == null ? "" : body, body == null ? nowMs - CACHE_MS + RETRY_MS : nowMs));
                    if (body == null) body = "";
                }
            }
        }
        return select(parse(body, season, episode), runtimeMs);
    }

    static void clearCache() {
        CACHE.clear();
    }

    private static String labelFor(String type) {
        if ("intro".equals(type)) return "OP";
        if ("recap".equals(type)) return "recap";
        if ("credits".equals(type)) return "credits";
        if ("preview".equals(type)) return "preview";
        return null;
    }
}
