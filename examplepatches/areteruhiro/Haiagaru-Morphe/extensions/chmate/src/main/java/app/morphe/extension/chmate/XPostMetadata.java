package app.morphe.extension.chmate;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.LinkedHashMap;
import java.util.concurrent.FutureTask;

/** Shared, bounded public metadata cache for tweet text and existing media extraction. */
final class XPostMetadata {
    private static final LinkedHashMap<String, Entry> CACHE = new LinkedHashMap<>();
    private static XPostDiskCache disk;
    private static long generation;
    private static XPostDiskCache disk() {
        android.content.Context context = Haiagaru.applicationContextForExtension();
        if (disk == null && context != null) disk = new XPostDiskCache(new java.io.File(context.getCacheDir(), "haiagaru-x-posts"));
        return disk;
    }
    static void clear() {
        synchronized (CACHE) {
            ++generation;
            CACHE.clear();
            XPostDiskCache current = disk();
            if (current != null) current.clear();
        }
    }
    static String fetchPreview(String id) throws Exception {
        if (id == null || !id.matches("[0-9]{1,25}")) return null;
        XPostDiskCache cache; long ticket;
        synchronized (CACHE) { cache = disk(); ticket = generation; }
        if (cache != null) {
            String stored = cache.read(id, System.currentTimeMillis());
            if (stored != null) return stored;
        }
        String json = fetch(id);
        if (json != null && cache != null) synchronized (CACHE) {
            // Clearing while a request is in flight must not resurrect deleted disk entries.
            if (ticket == generation) cache.write(id, json, System.currentTimeMillis());
        }
        return json;
    }
    private static final class Entry {
        final FutureTask<String> task;
        volatile long expires = Long.MAX_VALUE;
        Entry(String id) { task = new FutureTask<>(() -> {
            try {
                String json = download(id);
                expires = android.os.SystemClock.elapsedRealtime() + (json == null ? 8_000 : 900_000);
                return json;
            } catch (Exception error) {
                expires = android.os.SystemClock.elapsedRealtime() + 8_000;
                throw error;
            }
        }); }
    }

    static String fetch(String id) throws Exception {
        if (id == null || !id.matches("[0-9]{1,25}")) return null;
        Entry entry;
        synchronized (CACHE) {
            entry = CACHE.get(id);
            long now = android.os.SystemClock.elapsedRealtime();
            if (entry != null && entry.task.isDone() && now >= entry.expires) {
                CACHE.remove(id);
                entry = null;
            }
            if (entry == null) {
                if (CACHE.size() >= 128) {
                    String remove = null;
                    for (java.util.Map.Entry<String, Entry> candidate : CACHE.entrySet()) {
                        if (candidate.getValue().task.isDone()) { remove = candidate.getKey(); break; }
                    }
                    if (remove == null) return null;
                    CACHE.remove(remove);
                }
                entry = new Entry(id);
                CACHE.put(id, entry);
            }
        }
        // Only the first worker runs this task. Others share the same response.
        entry.task.run();
        try {
            return entry.task.get();
        } catch (Exception error) {
            throw error;
        }
    }

    private static String download(String id) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(
                "https://cdn.syndication.twimg.com/tweet-result?id=" + id + "&lang=ja&token="+XEmbedToken.forPost(id)).openConnection();
        try {
            connection.setConnectTimeout(8_000);
            connection.setReadTimeout(8_000);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 Haiagaru");
            connection.setUseCaches(false);
            if (connection.getResponseCode() != 200) return null;
            try (InputStream input = connection.getInputStream();
                 ByteArrayOutputStream bytes = new ByteArrayOutputStream()) {
                long deadline = android.os.SystemClock.elapsedRealtime() + 20_000;
                byte[] buffer = new byte[8192];
                int count;
                while ((count = input.read(buffer)) != -1) {
                    if (bytes.size() + count > 512_000
                            || android.os.SystemClock.elapsedRealtime() > deadline) return null;
                    bytes.write(buffer, 0, count);
                }
                String json = bytes.toString("UTF-8");
                return id.equals(new org.json.JSONObject(json).optString("id_str")) ? json : null;
            }
        } finally { connection.disconnect(); }
    }
}
