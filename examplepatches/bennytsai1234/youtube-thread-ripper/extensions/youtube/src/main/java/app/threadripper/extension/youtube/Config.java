package app.threadripper.extension.youtube;

import android.content.Context;
import android.content.SharedPreferences;

import java.lang.reflect.Method;

/**
 * Runtime settings. Each value comes from the first source that has it:
 * <ol>
 * <li>system property {@code debug.tr.<name>}, so tests can switch modes instantly with adb
 * (for example {@code adb shell setprop debug.tr.threads 1}); properties reset on reboot;</li>
 * <li>the "Thread Ripper" screen in Morphe settings (stored in Morphe's shared preferences under
 * {@code tr_*} keys, added by the settings resource patch);</li>
 * <li>the default.</li>
 * </ol>
 *
 * <pre>
 * property       setting                                 default
 * enabled        tr_download_enabled                     true
 * threads        tr_download_threads                     8      concurrent requests per range
 * chunk_kib      -                                       1024   chunk size
 * min_split_kib  -                                       1024   smaller ranges stay with the app
 * log            -                                       false  per-request log lines (info level)
 * preload_s      tr_preload_enabled + tr_preload_seconds 900    keep loading until this much video
 *                (seconds of media time) is buffered; 0 leaves the app's LoadControl decision
 *                unchanged. Official "Playback buffer size" = Maximum reaches 657 s at 1080p
 *                (emulator, 128 MiB cap), so a lower target would buffer less than the official
 *                setting there
 * preload_mib    tr_preload_mib                          250    ...or until the player's buffer
 *                allocator holds this much. Whichever comes first: 4K hits the memory limit
 *                (~2 MiB per second of media), 1080p (~0.18 MiB/s) the time limit. App Java heap is
 *                512 MiB and the app itself uses 100-170 MiB; with 300 MiB the heap peaked at
 *                464 MiB, so 300 is the maximum
 * rebuffer_ms    tr_rebuffer_enabled + tr_rebuffer_ms    off    after a stall, resume playback once
 *                this much video is buffered instead of the app's 5000 ms (1600 ms when enabled:
 *                the app's own threshold for the first start); 0 = off. Never above 5000
 * warp           tr_warp_enabled                         false  route the app through Cloudflare
 *                WARP while it is in the foreground, see {@link Warp}
 * </pre>
 */
final class Config {
    private static final String PREFS_NAME = "morphe_prefs";

    final boolean enabled;
    final int threads;
    final int chunkBytes;
    final long minSplitBytes;
    final boolean log;
    final long preloadUs;
    final long preloadCapBytes;
    final long rebufferUs;
    final boolean warp;

    private static volatile Config last;
    private static volatile long lastReadMs;
    private static SharedPreferences prefs;

    private Config() {
        SharedPreferences p = prefs();
        enabled = bool("enabled", p, "tr_download_enabled", true);
        threads = clamp(integer("threads", p, "tr_download_threads", 8), 1, 32);
        chunkBytes = clamp(integer("chunk_kib", null, null, 1024), 64, 65536) * 1024;
        minSplitBytes = clamp(integer("min_split_kib", null, null, 1024), 0, 1 << 20) * 1024L;
        log = bool("log", null, null, false);
        int preloadS = bool(null, p, "tr_preload_enabled", true) ? integer(null, p, "tr_preload_seconds", 900) : 0;
        preloadUs = clamp(integer("preload_s", null, null, preloadS), 0, 3600) * 1_000_000L;
        preloadCapBytes = clamp(integer("preload_mib", p, "tr_preload_mib", 250), 16, 300) * 1024L * 1024L;
        int rebufferMs = bool(null, p, "tr_rebuffer_enabled", false) ? integer(null, p, "tr_rebuffer_ms", 1600) : 0;
        rebufferUs = clamp(integer("rebuffer_ms", null, null, rebufferMs), 0, 5000) * 1000L;
        warp = bool("warp", p, "tr_warp_enabled", false);
    }

    /**
     * Same as {@link #get()} but reads the settings at most once a second, for hooks the
     * player calls many times per second (LoadControl runs every playback loop iteration).
     */
    static Config cached() {
        long now = android.os.SystemClock.elapsedRealtime();
        Config c = last;
        if (c != null && now - lastReadMs < 1000) return c;
        lastReadMs = now;
        return get();
    }

    static Config get() {
        Config c = new Config();
        Config prev = last;
        if (prev == null || !c.equals(prev)) {
            last = c;
            Log.i("Config: " + c);
        }
        return c;
    }

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Config)) return false;
        Config c = (Config) o;
        return enabled == c.enabled && threads == c.threads && chunkBytes == c.chunkBytes
                && minSplitBytes == c.minSplitBytes && log == c.log
                && preloadUs == c.preloadUs && preloadCapBytes == c.preloadCapBytes
                && rebufferUs == c.rebufferUs && warp == c.warp;
    }

    @Override
    public int hashCode() {
        return threads;
    }

    @Override
    public String toString() {
        return "enabled=" + enabled + " threads=" + threads + " chunk=" + (chunkBytes / 1024)
                + "KiB minSplit=" + (minSplitBytes / 1024) + "KiB log=" + log
                + " preload=" + (preloadUs / 1_000_000) + "s/" + (preloadCapBytes >> 20) + "MiB"
                + " rebuffer=" + (rebufferUs / 1000) + "ms warp=" + warp;
    }

    private static final Method GET;

    static {
        Method m = null;
        try {
            m = Class.forName("android.os.SystemProperties").getMethod("get", String.class);
        } catch (Exception ex) {
            android.util.Log.e("ThreadRipper", "SystemProperties unavailable, using defaults", ex);
        }
        GET = m;
    }

    /** Morphe's shared preferences, or null before the application exists. */
    private static synchronized SharedPreferences prefs() {
        if (prefs == null) {
            try {
                Context app = (Context) Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication").invoke(null);
                if (app != null) prefs = app.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            } catch (Exception ex) {
                android.util.Log.e("ThreadRipper", "Settings unavailable, using defaults", ex);
            }
        }
        return prefs;
    }

    private static String prop(String key) {
        if (key == null || GET == null) return "";
        try {
            String v = (String) GET.invoke(null, "debug.tr." + key);
            return v == null ? "" : v.trim();
        } catch (Exception ex) {
            return "";
        }
    }

    /** Preference value as text (switches are stored as booleans, text fields as strings). */
    private static String setting(SharedPreferences p, String key) {
        if (p == null || key == null) return "";
        Object v = p.getAll().get(key);
        return v == null ? "" : v.toString().trim();
    }

    /** First source holding "true" or "false"; anything else falls through to the next source. */
    private static boolean bool(String prop, SharedPreferences p, String key, boolean def) {
        for (String v : new String[]{prop(prop), setting(p, key)}) {
            if (v.equalsIgnoreCase("true")) return true;
            if (v.equalsIgnoreCase("false")) return false;
        }
        return def;
    }

    private static int integer(String prop, SharedPreferences p, String key, int def) {
        for (String v : new String[]{prop(prop), setting(p, key)}) {
            if (v.isEmpty()) continue;
            try {
                return Integer.parseInt(v);
            } catch (NumberFormatException ex) {
                // Not a number: try the next source.
            }
        }
        return def;
    }

    private static int clamp(int v, int min, int max) {
        return Math.max(min, Math.min(max, v));
    }
}
