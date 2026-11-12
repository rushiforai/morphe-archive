package io.github.bryceaspringfield.morphe.extension.youtube;


import org.json.JSONObject;

import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

/**
 * Each video's YouTube category (e.g., "Music", "News &amp; Politics", "Gaming"), read from the player API's
 * microformat, since feed buffers state none. A lookup runs once a video; a feed item waits for its answer for at
 * most {@link #WAIT_MS} the first time, and is shown when the answer comes later; a caller can then ask to hear the
 * late answer ({@link #onLate}), e.g., to send Not interested for a video of a hidden category shown in the meantime.
 */
final class Categories {

    /** YouTube's categories, in English as the API states them (hl=en). */
    static final String[] ALL = {"Film & Animation", "Autos & Vehicles", "Music", "Pets & Animals", "Sports",
            "Travel & Events", "Gaming", "People & Blogs", "Comedy", "Entertainment", "News & Politics",
            "Howto & Style", "Education", "Science & Technology", "Nonprofits & Activism"};

    private static final long WAIT_MS = 400;
    private static final int MAX_CACHED = 4000;

    private static final ExecutorService POOL = Executors.newFixedThreadPool(6);
    private static final Map<String, Future<String>> PENDING = new ConcurrentHashMap<>();
    private static final Map<String, String> CACHE = Collections.synchronizedMap(
            new LinkedHashMap<String, String>(256, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> e) {
                    return size() > MAX_CACHED;
                }
            });

    /** Callbacks waiting for a lookup still running, by video ID. */
    private static final Map<String, java.util.function.Consumer<String>> LATE = new ConcurrentHashMap<>();

    private static volatile String parsedSetting;
    private static volatile Set<String> hidden = Collections.emptySet();

    private Categories() {
    }

    static Set<String> hidden() {
        String s = XSettings.HIDDEN_CATEGORIES.get();
        //noinspection StringEquality
        if (s != parsedSetting) {
            Set<String> out = new HashSet<>();
            for (String p : s.split(",")) if (!p.trim().isEmpty()) out.add(p.trim().toLowerCase(Locale.ROOT));
            hidden = out;
            parsedSetting = s;
        }
        return hidden;
    }

    /** The video's category, waiting briefly for a first lookup; null while unknown. */
    
    static String get(String videoId) {
        String c = CACHE.get(videoId);
        if (c != null) return c;
        Future<String> f = PENDING.computeIfAbsent(videoId, id -> POOL.submit(() -> fetch(id)));
        try {
            return f.get(WAIT_MS, TimeUnit.MILLISECONDS);
        } catch (Exception e) {
            return null;
        }
    }

    /** Whether a lookup for the video is still running. */
    static boolean pending(String videoId) {
        return PENDING.containsKey(videoId) && !CACHE.containsKey(videoId);
    }

    /** Runs the callback with the video's category once its running lookup answers (one callback a video). */
    static void onLate(String videoId, java.util.function.Consumer<String> callback) {
        LATE.put(videoId, callback);
        // The lookup may have ended between pending() and put().
        String c = CACHE.get(videoId);
        if (c != null) {
            java.util.function.Consumer<String> cb = LATE.remove(videoId);
            if (cb != null) cb.accept(c);
        }
    }

    private static String fetch(String videoId) {
        try {
            JSONObject body = new JSONObject().put("videoId", videoId)
                    .put("context", new JSONObject().put("client", new JSONObject()
                            .put("clientName", "WEB").put("clientVersion", "2.20251101.00.00").put("hl", "en")));
            JSONObject r = Http.innertube("player", body, null);
            String cat = r == null ? "" : r.optJSONObject("microformat") == null ? ""
                    : r.getJSONObject("microformat").optJSONObject("playerMicroformatRenderer") == null ? ""
                    : r.getJSONObject("microformat").getJSONObject("playerMicroformatRenderer").optString("category", "");
            CACHE.put(videoId, cat);
            return cat;
        } catch (Exception e) {
            return "";
        } finally {
            PENDING.remove(videoId);
            java.util.function.Consumer<String> cb = LATE.remove(videoId);
            String c = CACHE.get(videoId);
            if (cb != null && c != null && !c.isEmpty()) {
                try {
                    cb.accept(c);
                } catch (Throwable ignored) {
                }
            }
        }
    }
}
