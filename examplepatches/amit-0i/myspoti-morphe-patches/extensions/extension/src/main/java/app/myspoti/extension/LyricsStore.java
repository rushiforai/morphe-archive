package app.myspoti.extension;

import android.content.Context;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Bridge to MySpoti 2.3.0's own LyricsApi and its private offline cache.
 *
 * APK mappings verified against the 2.3.0 source and release DEX:
 * LyricsApi = Lal4; LyricsApi.Track = Lnk4; cache = Lal4.b;
 * in-flight requests = Lal4.c; prefetch(Track) = Lal4.x(Lnk4;).
 * The release build has R8-rewritten coroutine continuation types, so invoking the public
 * prefetch entry point and waiting on its cache/in-flight state is safer than synthesizing
 * a Continuation with the source-level Kotlin type name.
 *
 * The private JSON schema and SHA-1 filename match LyricsApi.LyricsDisk, while
 * portable JSON and LRC sidecars make lyrics survive uninstall and work in other players.
 */
final class LyricsStore {
    private static final String TAG = "MyspotiStoragePatch";
    private static final String API_CLASS = "al4";
    private static final String TRACK_CLASS = "nk4";
    private static final String LYRICS_ENTITY = "com.music.spotui.data.entity.Lyrics";
    private static final long FETCH_WAIT_MS = 30_000L;
    private static final long NATIVE_CACHE_MAX_AGE_MS = 14L * 24L * 60L * 60L * 1000L;

    private LyricsStore() {}


    /**
     * Start MySpoti's native lyrics fetch without waiting for the network result. Export sync
     * must not block for up to FETCH_WAIT_MS for every song that has no lyrics yet; the native
     * cache observer can archive the result once MySpoti finishes the request.
     */
    static boolean requestPrefetch(Context context, String trackId, String title, String artist,
                                   String album, long durationMs, String coverUrl, boolean retryMiss) {
        if (trackId == null || trackId.trim().isEmpty()) return false;
        String key = trackId.trim();
        try {
            if (readNativeCache(context, key) != null) return false;
            Class<?> api = Class.forName(API_CLASS);
            Class<?> trackType = Class.forName(TRACK_CLASS);
            Object track = createTrack(trackType, key, title, artist, album, durationMs, coverUrl);
            Object apiInstance = singletonInstance(api);
            Map<?, ?> cache = objectMap(api, "b", apiInstance);
            Map<?, ?> inFlight = objectMap(api, "c", apiInstance);
            // A player-initiated request is already doing the work; count it as queued so
            // the sync status accurately reports the outstanding background lookup.
            if (inFlight != null && inFlight.containsKey(key)) return true;
            Object cached = cache == null ? null : cache.get(key);
            if (cached != null && isLyrics(cached)) {
                JSONObject encoded = encodeRuntimeLyrics(cached, key);
                if (encoded != null) writeNativeCache(context, key, encoded);
                return false;
            }
            if (cached != null && !retryMiss) return false;
            if (retryMiss && cache != null && cached != null) {
                try { cache.remove(key); } catch (Throwable ignored) {}
            }
            Method prefetch = findPrefetchMethod(api, trackType);
            prefetch.invoke(Modifier.isStatic(prefetch.getModifiers()) ? null : apiInstance, track);
            return true;
        } catch (Throwable error) {
            Log.w(TAG, "Could not request non-blocking lyrics lookup for " + safe(title), error);
            return false;
        }
    }

    /** Obtain lyrics by scheduling MySpoti's native fetch and waiting for its result. */
    static JSONObject obtain(Context context, String trackId, String title, String artist,
                             String album, long durationMs, String coverUrl) {
        return obtain(context, trackId, title, artist, album, durationMs, coverUrl, false);
    }

    /** Manual sync may explicitly clear MySpoti's short-lived negative cache and retry a miss. */
    static JSONObject obtain(Context context, String trackId, String title, String artist,
                             String album, long durationMs, String coverUrl, boolean retryMiss) {
        if (trackId == null || trackId.trim().isEmpty()) return null;
        String key = trackId.trim();
        try {
            JSONObject disk = readNativeCache(context, key);
            if (disk != null) return disk;

            Class<?> api = Class.forName(API_CLASS);
            Class<?> trackType = Class.forName(TRACK_CLASS);
            Object track = createTrack(trackType, key, title, artist, album, durationMs, coverUrl);
            Object apiInstance = singletonInstance(api);
            Map<?, ?> cache = objectMap(api, "b", apiInstance);
            Map<?, ?> inFlight = objectMap(api, "c", apiInstance);
            Object cached = cache == null ? null : cache.get(key);
            if (cached != null && isLyrics(cached)) {
                JSONObject encoded = encodeRuntimeLyrics(cached, key);
                if (encoded != null) {
                    writeNativeCache(context, key, encoded);
                    return encoded;
                }
            }

            // The native resolver caches a negative result briefly. Keep that behavior during
            // auto-sync, while an explicit Sync now may clear the negative entry and retry.
            if (retryMiss && cache != null && cached != null && !isLyrics(cached)
                    && (inFlight == null || !inFlight.containsKey(key))) {
                try { cache.remove(key); } catch (Throwable ignored) {}
            }

            Object resolved = awaitNativePrefetch(context, api, apiInstance, trackType, track, key);
            // LyricsDisk is the source of truth for the app's persistent, complete synced lyrics.
            JSONObject persisted = readNativeCache(context, key);
            if (persisted != null) return persisted;
            if (isLyrics(resolved)) {
                JSONObject encoded = encodeRuntimeLyrics(resolved, key);
                if (encoded != null) {
                    // Keep complete static/extension lyrics too, even when the app's native
                    // disk cache intentionally only persists synced lyrics.
                    writeNativeCache(context, key, encoded);
                    return encoded;
                }
            }
            Object afterFetch = cache == null ? null : cache.get(key);
            if (isLyrics(afterFetch)) {
                JSONObject encoded = encodeRuntimeLyrics(afterFetch, key);
                if (encoded != null) {
                    writeNativeCache(context, key, encoded);
                    return encoded;
                }
            }
            Log.i(TAG, "Lyrics unavailable for " + safe(title) + " after waiting for MySpoti's native lyrics lookup");
        } catch (Throwable t) {
            Log.w(TAG, "Could not obtain lyrics for " + safe(title), t);
        }
        return null;
    }

    /**
     * Call the confirmed 2.3.0 prefetch(Track) method. It launches MySpoti's own suspend fetch
     * job, shares any request already in flight, and fills the same memory/disk cache used by
     * the player. Wait for that real job to populate the cache instead of assuming the prefetch
     * call itself has completed the work.
     */
    private static Object awaitNativePrefetch(Context context, Class<?> api, Object apiInstance,
                                               Class<?> trackType, Object track, String key) throws Exception {
        Method prefetch = findPrefetchMethod(api, trackType);
        prefetch.invoke(Modifier.isStatic(prefetch.getModifiers()) ? null : apiInstance, track);

        Map<?, ?> cache = objectMap(api, "b", apiInstance);
        Map<?, ?> inFlight = objectMap(api, "c", apiInstance);
        long startedAt = System.currentTimeMillis();
        long deadline = startedAt + FETCH_WAIT_MS;
        boolean observedInFlight = inFlight != null && inFlight.containsKey(key);
        while (System.currentTimeMillis() < deadline) {
            JSONObject disk = readNativeCache(context, key);
            if (disk != null) return disk;

            Object cached = cache == null ? null : cache.get(key);
            if (isLyrics(cached)) return cached;
            boolean pending = inFlight != null && inFlight.containsKey(key);
            if (pending) {
                observedInFlight = true;
            } else if (cached != null || observedInFlight) {
                // A cached non-Lyrics value is MySpoti's completed negative result. If a job
                // was observed and has now left inFlight, its cache/disk write is complete.
                return null;
            } else if (inFlight != null && System.currentTimeMillis() - startedAt > 2_000L) {
                // The coroutine had time to start but never registered a request.
                return null;
            }

            try { Thread.sleep(100L); }
            catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                throw interrupted;
            }
        }
        Log.w(TAG, "Timed out waiting for MySpoti's native lyrics prefetch");
        return null;
    }

    private static Method findPrefetchMethod(Class<?> api, Class<?> trackType) throws Exception {
        Method prefetch;
        try {
            prefetch = api.getDeclaredMethod("x", trackType);
        } catch (NoSuchMethodException renamed) {
            prefetch = null;
            for (Method candidate : api.getDeclaredMethods()) {
                Class<?>[] parameters = candidate.getParameterTypes();
                if (parameters.length == 1 && parameters[0] == trackType
                        && candidate.getReturnType() == void.class) {
                    prefetch = candidate;
                    break;
                }
            }
            if (prefetch == null) throw renamed;
        }
        prefetch.setAccessible(true);
        return prefetch;
    }

    private static boolean isLyrics(Object value) {
        return value != null && LYRICS_ENTITY.equals(value.getClass().getName());
    }

    private static Object createTrack(Class<?> trackType, String id, String title, String artist,
                                      String album, long durationMs, String coverUrl) throws Exception {
        try {
            Constructor<?> constructor = trackType.getDeclaredConstructor(String.class, String.class,
                    String.class, String.class, long.class, String.class);
            constructor.setAccessible(true);
            return constructor.newInstance(id, safe(title), safe(artist), safe(album),
                    Math.max(0L, durationMs), safe(coverUrl));
        } catch (NoSuchMethodException currentModelNotFound) {
            Constructor<?> constructor = trackType.getDeclaredConstructor(long.class, String.class,
                    String.class, String.class, String.class, String.class);
            constructor.setAccessible(true);
            return constructor.newInstance(Math.max(0L, durationMs), id, safe(title),
                    safe(artist), safe(album), safe(coverUrl));
        }
    }

    /** Find the Kotlin object receiver without relying on the name of its obfuscated INSTANCE field. */
    private static Object singletonInstance(Class<?> owner) {
        try {
            for (Field field : owner.getDeclaredFields()) {
                if (!Modifier.isStatic(field.getModifiers()) || field.getType() != owner) continue;
                field.setAccessible(true);
                Object instance = field.get(null);
                if (instance != null) return instance;
            }
        } catch (Throwable ignored) {}
        return null; // Also supports a future build where the API methods/fields are truly static.
    }

    private static Map<?, ?> objectMap(Class<?> owner, String name, Object instance) {
        try {
            Field field = owner.getDeclaredField(name);
            field.setAccessible(true);
            Object value = field.get(Modifier.isStatic(field.getModifiers()) ? null : instance);
            return value instanceof Map ? (Map<?, ?>) value : null;
        } catch (Throwable ignored) { return null; }
    }

    private static JSONObject encodeRuntimeLyrics(Object value, String key) throws Exception {
        if (!booleanProperty(value, "uncapped")) return null; // Never export a preview as complete lyrics.
        Object rawLines = property(value, "lines");
        if (!(rawLines instanceof Iterable)) return null;
        JSONArray lines = new JSONArray();
        for (Object line : (Iterable<?>) rawLines) {
            if (line == null) continue;
            long time = longProperty(line, "timeMs");
            String text = stringProperty(line, "text");
            if (text.trim().isEmpty()) continue;
            JSONObject item = new JSONObject().put("t", time).put("x", text);
            JSONArray words = encodeWords(property(line, "words"));
            if (words != null) item.put("w", words);

            // MySpoti 2.3.0 added source translations, romanization, singer labels and
            // backing vocals to each line. Preserve them in both the portable archive and
            // the native cache so a restore does not silently strip the new lyric features.
            Object translation = property(line, "translation");
            if (translation != null) item.put("tr", String.valueOf(translation));
            Object romanization = property(line, "romanization");
            if (romanization != null) item.put("ro", String.valueOf(romanization));
            Object voice = property(line, "voice");
            if (voice instanceof Number) item.put("v", ((Number) voice).intValue());
            Object background = property(line, "background");
            if (background != null) item.put("bg", String.valueOf(background));
            JSONArray backgroundWords = encodeWords(property(line, "backgroundWords"));
            if (backgroundWords != null) item.put("bw", backgroundWords);
            lines.put(item);
        }
        if (lines.length() == 0) return null;

        JSONObject encoded = new JSONObject();
        encoded.put("synced", booleanProperty(value, "synced"));
        Object language = property(value, "language");
        Object provider = property(value, "provider");
        encoded.put("language", language == null ? JSONObject.NULL : String.valueOf(language));
        encoded.put("provider", provider == null ? JSONObject.NULL : String.valueOf(provider));
        Object translationLanguage = property(value, "translationLanguage");
        encoded.put("trl", translationLanguage == null ? JSONObject.NULL : String.valueOf(translationLanguage));
        Object colors = property(value, "colors");
        if (colors != null) {
            encoded.put("colors", new JSONArray().put(intProperty(colors, "background"))
                    .put(intProperty(colors, "text")).put(intProperty(colors, "highlight")));
        } else encoded.put("colors", JSONObject.NULL);
        encoded.put("lines", lines);
        encoded.put("key", key);
        encoded.put("at", System.currentTimeMillis());
        return encoded;
    }


    private static JSONArray encodeWords(Object rawWords) throws Exception {
        if (!(rawWords instanceof Iterable)) return null;
        JSONArray words = new JSONArray();
        for (Object word : (Iterable<?>) rawWords) {
            if (word == null) continue;
            words.put(new JSONArray().put(longProperty(word, "startMs"))
                    .put(longProperty(word, "endMs")).put(stringProperty(word, "text")));
        }
        return words.length() == 0 ? null : words;
    }

    private static Object property(Object owner, String name) throws Exception {
        try {
            Field field = owner.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.get(owner);
        } catch (NoSuchFieldException ignored) {
            String getter = "get" + Character.toUpperCase(name.charAt(0)) + name.substring(1);
            Method method = owner.getClass().getMethod(getter);
            method.setAccessible(true);
            return method.invoke(owner);
        }
    }

    private static String stringProperty(Object owner, String name) throws Exception {
        Object value = property(owner, name);
        return value == null ? "" : String.valueOf(value);
    }

    private static long longProperty(Object owner, String name) throws Exception {
        Object value = property(owner, name);
        return value instanceof Number ? ((Number) value).longValue() : 0L;
    }

    private static int intProperty(Object owner, String name) throws Exception {
        Object value = property(owner, name);
        return value instanceof Number ? ((Number) value).intValue() : 0;
    }

    private static boolean booleanProperty(Object owner, String name) throws Exception {
        return Boolean.TRUE.equals(property(owner, name));
    }

    static JSONObject readNativeCache(Context context, String key) {
        try {
            File file = nativeCacheFile(context, key);
            if (!file.isFile() || file.length() <= 0L || file.length() > 8L * 1024L * 1024L) return null;
            JSONObject object = new JSONObject(readText(file));
            long savedAt = object.optLong("at", 0L);
            if (savedAt <= 0L || System.currentTimeMillis() - savedAt > NATIVE_CACHE_MAX_AGE_MS) {
                file.delete();
                return null;
            }
            return key.equals(object.optString("key", "")) && validLyricsJson(object) ? object : null;
        } catch (Throwable ignored) { return null; }
    }

    static boolean restoreNativeCache(Context context, String key, JSONObject portable) {
        if (portable == null || key == null || key.trim().isEmpty()) return false;
        try {
            JSONObject copy = new JSONObject(portable.toString());
            copy.put("key", key);
            copy.put("at", System.currentTimeMillis());
            if (!validLyricsJson(copy)) return false;
            writeNativeCache(context, key, copy);
            invalidateMemoryCache(key);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "Could not restore native lyrics for " + key, t);
            return false;
        }
    }

    private static void invalidateMemoryCache(String key) {
        try {
            Class<?> api = Class.forName(API_CLASS);
            Object apiInstance = singletonInstance(api);
            Map<?, ?> inFlight = objectMap(api, "c", apiInstance);
            Object pending = inFlight == null ? null : inFlight.remove(key);
            if (pending != null) {
                try {
                    for (Method method : pending.getClass().getMethods()) {
                        if (!"cancel".equals(method.getName())) continue;
                        Class<?>[] parameters = method.getParameterTypes();
                        method.setAccessible(true);
                        if (parameters.length == 0) {
                            method.invoke(pending);
                            break;
                        }
                        if (parameters.length == 1 && java.util.concurrent.CancellationException.class
                                .isAssignableFrom(parameters[0])) {
                            method.invoke(pending, new java.util.concurrent.CancellationException("Lyrics restored from portable archive"));
                            break;
                        }
                    }
                } catch (Throwable ignored) {}
            }
            Map<?, ?> cache = objectMap(api, "b", apiInstance);
            if (cache != null) cache.remove(key);
        } catch (Throwable t) {
            Log.w(TAG, "Could not invalidate the in-memory lyrics entry for " + key, t);
        }
    }

    static JSONObject fromLrc(String key, String lrc, String provider) {
        if (lrc == null || lrc.trim().isEmpty()) return null;
        try {
            JSONArray lines = new JSONArray();
            boolean anyTimed = false;
            String[] rawLines = lrc.replace("\r", "").split("\n");
            java.util.regex.Pattern timestamp = java.util.regex.Pattern.compile("\\[(\\d{1,3}):(\\d{2})(?:[.:](\\d{1,3}))?]");
            for (String raw : rawLines) {
                String line = raw.trim();
                if (line.isEmpty()) continue;
                if (line.matches("(?i)^\\[(ti|ar|al|by|la|length|re|ve):.*")) continue;
                java.util.regex.Matcher matcher = timestamp.matcher(line);
                List<Long> times = new java.util.ArrayList<>();
                int end = 0;
                while (matcher.find()) {
                    long minutes = Long.parseLong(matcher.group(1));
                    long seconds = Long.parseLong(matcher.group(2));
                    String fraction = matcher.group(3);
                    long millis = 0L;
                    if (fraction != null) {
                        if (fraction.length() == 1) millis = Long.parseLong(fraction) * 100L;
                        else if (fraction.length() == 2) millis = Long.parseLong(fraction) * 10L;
                        else millis = Long.parseLong(fraction.substring(0, 3));
                    }
                    times.add(minutes * 60_000L + seconds * 1_000L + millis);
                    end = matcher.end();
                }
                String text = times.isEmpty() ? line : line.substring(end).trim();
                if (text.isEmpty()) continue;
                if (times.isEmpty()) lines.put(new JSONObject().put("t", 0L).put("x", text));
                else {
                    anyTimed = true;
                    for (Long time : times) lines.put(new JSONObject().put("t", time).put("x", text));
                }
            }
            if (lines.length() == 0) return null;
            return new JSONObject().put("synced", anyTimed)
                    .put("language", JSONObject.NULL)
                    .put("provider", safe(provider).isEmpty() ? "LRC" : provider)
                    .put("colors", JSONObject.NULL).put("lines", lines)
                    .put("key", safe(key)).put("at", System.currentTimeMillis());
        } catch (Throwable t) {
            Log.w(TAG, "Could not parse portable LRC lyrics", t);
            return null;
        }
    }

    static String toLrc(JSONObject lyrics, String title, String artist, String album) {
        if (!validLyricsJson(lyrics)) return "";
        StringBuilder out = new StringBuilder();
        appendHeader(out, "ti", title);
        appendHeader(out, "ar", artist);
        appendHeader(out, "al", album);
        appendHeader(out, "by", lyrics.optString("provider", "MySpoti"));
        JSONArray lines = lyrics.optJSONArray("lines");
        boolean synced = lyrics.optBoolean("synced", false);
        if (lines != null) for (int i = 0; i < lines.length(); i++) {
            JSONObject line = lines.optJSONObject(i);
            if (line == null) continue;
            String text = line.optString("x", "").replace('\r', ' ').replace('\n', ' ').trim();
            if (text.isEmpty()) continue;
            if (synced) out.append(formatTimestamp(Math.max(0L, line.optLong("t", 0L))));
            out.append(text).append('\n');
        }
        return out.toString();
    }

    static String toPlainText(JSONObject lyrics) {
        if (!validLyricsJson(lyrics)) return "";
        StringBuilder out = new StringBuilder();
        JSONArray lines = lyrics.optJSONArray("lines");
        if (lines != null) for (int i = 0; i < lines.length(); i++) {
            JSONObject line = lines.optJSONObject(i);
            if (line == null) continue;
            String text = line.optString("x", "").trim();
            if (!text.isEmpty()) out.append(text).append('\n');
        }
        return out.toString().trim();
    }

    static boolean validLyricsJson(JSONObject object) {
        if (object == null) return false;
        JSONArray lines = object.optJSONArray("lines");
        if (lines == null || lines.length() == 0) return false;
        for (int i = 0; i < lines.length(); i++) {
            JSONObject line = lines.optJSONObject(i);
            if (line != null && !line.optString("x", "").trim().isEmpty()) return true;
        }
        return false;
    }

    private static void appendHeader(StringBuilder out, String key, String value) {
        if (value == null || value.trim().isEmpty()) return;
        out.append('[').append(key).append(':').append(value.replace('\n', ' ').replace('\r', ' ').replace("]", "")).append("]\n");
    }

    private static String formatTimestamp(long ms) {
        long totalCentiseconds = Math.max(0L, ms) / 10L;
        long minutes = totalCentiseconds / 6_000L;
        long seconds = (totalCentiseconds / 100L) % 60L;
        long centiseconds = totalCentiseconds % 100L;
        return String.format(Locale.ROOT, "[%02d:%02d.%02d]", minutes, seconds, centiseconds);
    }

    private static File nativeCacheFile(Context context, String key) throws Exception {
        File directory = new File(context.getApplicationContext().getFilesDir(), "lyrics_cache2");
        if (!directory.exists() && !directory.mkdirs()) throw new IllegalStateException("Cannot create MySpoti lyrics cache");
        return new File(directory, sha1(key) + ".json");
    }

    private static void writeNativeCache(Context context, String key, JSONObject object) throws Exception {
        JSONObject copy = new JSONObject(object.toString());
        copy.put("key", key);
        copy.put("at", System.currentTimeMillis());
        File destination = nativeCacheFile(context, key);
        File temporary = new File(destination.getParentFile(), destination.getName() + ".tmp");
        try (FileOutputStream output = new FileOutputStream(temporary)) {
            output.write(copy.toString().getBytes(StandardCharsets.UTF_8));
            output.getFD().sync();
        }
        if (!temporary.renameTo(destination)) {
            if (destination.exists() && !destination.delete()) throw new IllegalStateException("Cannot replace MySpoti lyrics cache file");
            if (!temporary.renameTo(destination)) throw new IllegalStateException("Cannot activate MySpoti lyrics cache file");
        }
    }

    private static String readText(File file) throws Exception {
        if (file.length() > 8L * 1024L * 1024L) throw new IllegalArgumentException("Lyrics cache file is too large");
        try (FileInputStream input = new FileInputStream(file)) {
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int count;
            while ((count = input.read(buffer)) != -1) if (count > 0) output.write(buffer, 0, count);
            return new String(output.toByteArray(), StandardCharsets.UTF_8);
        }
    }

    private static String sha1(String value) throws Exception {
        byte[] bytes = MessageDigest.getInstance("SHA-1").digest(value.getBytes(StandardCharsets.UTF_8));
        StringBuilder hex = new StringBuilder(bytes.length * 2);
        for (byte b : bytes) hex.append(String.format(Locale.ROOT, "%02x", b & 0xff));
        return hex.toString();
    }

    private static String safe(String value) { return value == null ? "" : value; }
}
