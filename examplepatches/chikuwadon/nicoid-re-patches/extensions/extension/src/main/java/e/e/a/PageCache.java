package e.e.a;

import java.io.*;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;

/** Public ranking/search pages only. Refresh invalidates even responses still in flight. */
public final class PageCache {
    private PageCache() { }
    static final long TTL_NANOS = 30_000_000_000L;
    private static final LinkedHashMap<String, Entry> pages = new LinkedHashMap<>(16, .75f, true);
    private static long generation;
    private static int bytes;
    private static final class Entry {
        final byte[] data; final long at;
        Entry(byte[] data, long at) { this.data = data; this.at = at; }
    }
    public static synchronized void refresh() { generation++; pages.clear(); bytes = 0; }
    static synchronized byte[] lookup(String key, long now) {
        Entry entry = pages.get(key);
        if (entry == null) return null;
        if (now - entry.at >= TTL_NANOS) { pages.remove(key); bytes -= entry.data.length; return null; }
        return entry.data;
    }
    static synchronized void save(String key, byte[] data, long at, long epoch) {
        if (epoch != generation || data.length > 2 * 1024 * 1024) return;
        Entry old = pages.put(key, new Entry(data, at)); if (old != null) bytes -= old.data.length;
        bytes += data.length;
        while (pages.size() > 8 || bytes > 8 * 1024 * 1024) {
            Map.Entry<String, Entry> first = pages.entrySet().iterator().next();
            bytes -= first.getValue().data.length; pages.remove(first.getKey());
        }
    }
    public static InputStream input(HttpURLConnection connection) throws IOException {
        String key = connection.getURL().toExternalForm(); long epoch;
        byte[] cached;
        synchronized (PageCache.class) { epoch = generation; cached = lookup(key, System.nanoTime()); }
        if (cached != null) { record("List page cache hit"); return new ByteArrayInputStream(cached); }
        long started = System.nanoTime();
        byte[] data;
        try (InputStream input = connection.getInputStream(); ByteArrayOutputStream body = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            for (int n; (n = input.read(buffer)) != -1;) {
                if (body.size() + n > 8 * 1024 * 1024) throw new IOException("Oversized list page");
                body.write(buffer, 0, n);
            }
            data = body.toByteArray();
        }
        String text = new String(data, StandardCharsets.UTF_8);
        if (text.contains("<meta name=\"server-response\" content=\"")) save(key, data, System.nanoTime(), epoch);
        record("List page fetched in " + ((System.nanoTime() - started) / 1000000) + " ms, " + data.length + " bytes");
        return new ByteArrayInputStream(data);
    }
    private static void record(String message) {
        try { Class.forName("e.e.a.ModernDebug").getMethod("record", String.class).invoke(null, message); }
        catch (ReflectiveOperationException ignored) { }
    }
}
