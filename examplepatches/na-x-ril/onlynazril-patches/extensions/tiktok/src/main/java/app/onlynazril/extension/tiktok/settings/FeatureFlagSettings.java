package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * The feature-flag overrides and the list of flags TikTok has asked for.
 * <p>
 * Both live in the same prefs file as every other switch, so the settings screen owns them: an
 * override is set from a row, not from a file on the device. The runtime side
 * ({@code flags.FeatureFlags}) reads the map on each getter and writes the seen list back, so the
 * list survives a restart without a per-read disk write.
 * <p>
 * Two strings, each a flat JSON object: {@code flag_overrides} maps a key to the override text, and
 * {@code flag_seen} maps a key to {@code <type>|<last value the app asked for>}. Reading is cached.
 * <p>
 * The seen list grows to thousands of keys, so writing it is not a main-thread job: the map is
 * copied and serialised on one background thread, at most every few seconds and only when
 * something changed. A read of a flag is a map update and never touches the disk.
 */
public final class FeatureFlagSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_OVERRIDES = "flag_overrides";
    private static final String KEY_SEEN = "flag_seen";

    private static final Map<String, String> OVERRIDES = new LinkedHashMap<>();
    private static final Map<String, String> SEEN = new LinkedHashMap<>();
    private static boolean loaded;
    private static long lastFlushAt;
    private static boolean seenDirty;
    /** One writer, so two flushes cannot interleave a longer and an older list. */
    private static final ExecutorService WRITER = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "tiktokhandle-flags");
        thread.setDaemon(true);
        return thread;
    });

    private FeatureFlagSettings() {}

    /** The override text for a key, or null when TikTok's own value stands. */
    public static synchronized String override(String key) {
        load();
        return key == null ? null : OVERRIDES.get(key);
    }

    /** Stores one override; the running app uses it from the next read on. */
    public static synchronized void setOverride(Context ctx, String key, String value) {
        load();
        if (key == null || key.isEmpty() || value == null) return;
        OVERRIDES.put(key, value);
        save(ctx, KEY_OVERRIDES, OVERRIDES);
        lastFlushAt = SystemClock.elapsedRealtime();
    }

    public static synchronized void removeOverride(Context ctx, String key) {
        load();
        if (key == null || OVERRIDES.remove(key) == null) return;
        save(ctx, KEY_OVERRIDES, OVERRIDES);
    }

    /** Replaces every override at once, which is what a settings import does. */
    public static synchronized void replaceOverrides(Context ctx, Map<String, String> values) {
        load();
        OVERRIDES.clear();
        if (values != null) OVERRIDES.putAll(values);
        save(ctx, KEY_OVERRIDES, OVERRIDES);
    }

    public static synchronized void clearOverrides(Context ctx) {
        load();
        if (OVERRIDES.isEmpty()) return;
        OVERRIDES.clear();
        save(ctx, KEY_OVERRIDES, OVERRIDES);
    }

    public static synchronized int overrideCount() {
        load();
        return OVERRIDES.size();
    }

    /** The flags seen this run, or in an earlier one, as {@code key -> "type|value"}. */
    public static synchronized Map<String, String> seen() {
        load();
        return new LinkedHashMap<>(SEEN);
    }

    public static synchronized int seenCount() {
        load();
        return SEEN.size();
    }

    /** The overrides in force, as {@code key -> value}, for a picker that renders many rows. */
    public static synchronized Map<String, String> overrides() {
        load();
        return new LinkedHashMap<>(OVERRIDES);
    }

    /**
     * Records a read for the picker. The map is updated on every call, but written to disk at most
     * every few seconds: a cold start asks for hundreds of flags, and one write per flag would be
     * a burst of disk work on the main thread.
     */
    public static synchronized void recordSeen(Context ctx, String type, String key, String value) {
        load();
        if (key == null || key.isEmpty()) return;
        seenDirty = true;
        SEEN.put(key, type + "|" + value);
        long now = SystemClock.elapsedRealtime();
        if (now - lastFlushAt < 15000L) return;
        lastFlushAt = now;
        writeSeenAsync(ctx);
    }

    /** Writes the seen list in the background; the picker reads the map, not the file. */
    public static synchronized void flushSeen(Context ctx) {
        load();
        writeSeenAsync(ctx);
    }

    public static synchronized void clearSeen(Context ctx) {
        load();
        SEEN.clear();
        seenDirty = true;
        writeSeenAsync(ctx);
    }

    /**
     * Copies the map and writes it on the writer thread. A flush with nothing new is skipped, so a
     * flap of reads does not rewrite a list of thousands of keys.
     */
    private static void writeSeenAsync(Context ctx) {
        if (ctx == null || !seenDirty) return;
        seenDirty = false;
        final SharedPreferences prefs = prefs(ctx);
        // The copy and the serialisation both happen off the caller's thread: a list of thousands
        // of keys is not something a frame should wait for.
        WRITER.execute(() -> {
            final String json;
            synchronized (FeatureFlagSettings.class) {
                json = json(SEEN);
            }
            if (json != null) prefs.edit().putString(KEY_SEEN, json).apply();
        });
    }

    /** Splits a stored entry into its type and value, or null when it has no type. */
    public static String[] split(String entry) {
        if (entry == null) return null;
        int bar = entry.indexOf('|');
        if (bar <= 0) return null;
        return new String[]{entry.substring(0, bar), entry.substring(bar + 1)};
    }

    private static void load() {
        if (loaded) return;
        Context ctx = appContext();
        if (ctx == null) return;
        loaded = true;
        read(ctx, KEY_OVERRIDES, OVERRIDES);
        read(ctx, KEY_SEEN, SEEN);
    }

    private static void read(Context ctx, String key, Map<String, String> into) {
        String raw = prefs(ctx).getString(key, "");
        if (raw == null || raw.isEmpty()) return;
        try {
            JSONObject object = new JSONObject(raw);
            Iterator<String> names = object.keys();
            while (names.hasNext()) {
                String name = names.next();
                String value = object.optString(name, null);
                if (value != null) into.put(name, value);
            }
        } catch (JSONException ignored) {
            // A damaged entry is dropped rather than copied into the next write.
        }
    }

    private static void save(Context ctx, String key, Map<String, String> from) {
        if (ctx == null) return;
        String json = json(from);
        if (json == null) return;
        prefs(ctx).edit().putString(key, json).apply();
    }

    /** The map as the one JSON string both entries use; null when it cannot be written. */
    private static String json(Map<String, String> from) {
        JSONObject object = new JSONObject();
        try {
            for (Map.Entry<String, String> entry : from.entrySet()) {
                object.put(entry.getKey(), entry.getValue());
            }
        } catch (JSONException ignored) {
            return null;
        }
        return object.toString();
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Context appContext() {
        return HandleSettings.appContext();
    }
}
