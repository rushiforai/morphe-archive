package e.e.a;

import java.lang.reflect.Field;
import org.json.JSONObject;

/** Cached posting metadata and a conservative background-only comment rate guard. */
public final class Dev122 {
    private static final Object HISTORY_LOCK = new Object();
    private static final double BURST = 24.0;
    private static final double RESERVED = 5.0;
    private static final double REFILL_NANOS = 4_000_000_000.0;
    private static double tokens = BURST;
    private static long lastTick = System.nanoTime();

    private Dev122() { }

    /** Reuse only a verified same-video snapshot. A missing snapshot falls back to the original request. */
    public static JSONObject cachedWatch(String videoId) {
        if (videoId == null || videoId.isEmpty()) return null;
        try {
            Field field = Class.forName("e.e.a.ModernPlayback").getField("latestWatch");
            Object raw = field.get(null);
            if (!(raw instanceof JSONObject)) return null;
            JSONObject watch = (JSONObject) raw;
            JSONObject video = watch.optJSONObject("video");
            JSONObject client = watch.optJSONObject("client");
            boolean matches = video != null &&
                (videoId.equals(video.optString("id")) ||
                 client != null && videoId.equals(client.optString("watchId")));
            if (!matches) return null;
            JSONObject comment = watch.optJSONObject("comment");
            JSONObject nv = comment == null ? null : comment.optJSONObject("nvComment");
            if (nv == null || nv.optJSONObject("params") == null) return null;
            return watch;
        } catch (Exception ignored) {
            return null;
        }
    }

    /**
     * Background history only: burst cap and 1 request per 4 sec thereafter.
     * Keep 5 nominal slots in reserve for interactive actions such as posting.
     * The existing job cancellation check still runs immediately after this wait.
     */
    public static void throttleHistory() throws InterruptedException {
        while (true) {
            long waitMillis;
            synchronized (HISTORY_LOCK) {
                long now = System.nanoTime();
                long elapsed = Math.max(0L, now - lastTick);
                lastTick = now;
                tokens = Math.min(BURST, tokens + elapsed / REFILL_NANOS);
                if (tokens >= RESERVED + 1.0) {
                    tokens -= 1.0;
                    return;
                }
                waitMillis = Math.max(100L, Math.min(4000L,
                    (long) Math.ceil((RESERVED + 1.0 - tokens) * 4000.0)));
            }
            Thread.sleep(waitMillis);
        }
    }
}
