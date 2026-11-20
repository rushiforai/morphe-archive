package e.e.a;

import java.io.*;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.HashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.security.MessageDigest;

/** Public ranking/search pages only. Refresh invalidates even responses still in flight. */
public final class PageCache {
    private PageCache() { }
    static final long TTL_NANOS = 30_000_000_000L;
    private static final LinkedHashMap<String, Entry> pages = new LinkedHashMap<>(16, .75f, true);
    private static long generation;
    private static int bytes;
    private static final Map<String, Flight> flights = new HashMap<>();
    private static final byte[] MARKER = "<meta name=\"server-response\" content=\"".getBytes(StandardCharsets.UTF_8);
    private static final class Flight {
        final long epoch;
        final CountDownLatch ready = new CountDownLatch(1);
        byte[] data;
        IOException error;
        Flight(long epoch) { this.epoch = epoch; }
    }
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
        String key = key(connection); long epoch; Flight flight = null; boolean leader = false; byte[] cached;
        synchronized (PageCache.class) {
            epoch = generation;
            cached = key == null ? null : lookup(key, System.nanoTime());
            if (cached == null && key != null) {
                flight = flights.get(key);
                if (flight != null && flight.epoch != epoch) flight = null;
                if (flight == null && flights.size() < 32) {
                    flight = new Flight(epoch); flights.put(key, flight); leader = true;
                }
            }
        }
        if (cached != null) { record("List page cache hit"); return new ByteArrayInputStream(cached); }
        if (flight != null && !leader) return await(flight, connection);
        byte[] data = null; IOException error = null;
        try {
            data = fetch(connection);
            if (key != null && containsMarker(data)) save(key, data, System.nanoTime(), epoch);
            return new ByteArrayInputStream(data);
        } catch (IOException failure) { error = failure; throw failure; }
        finally {
            if (flight != null) synchronized (PageCache.class) {
                flight.data = data;
                flight.error = error != null ? error : data == null ? new IOException("List page fetch failed") : null;
                if (flights.get(key) == flight) flights.remove(key);
                flight.ready.countDown();
            }
        }
    }
    // Distinct cookies, language and request headers never share a response.
    // Already-connected/custom requests bypass caching rather than guessing their scope.
    private static String key(HttpURLConnection connection) {
        try {
            if (!"GET".equals(connection.getRequestMethod())) return null;
            Map<String, java.util.List<String>> headers = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
            headers.putAll(connection.getRequestProperties());
            String url = connection.getURL().toExternalForm();
            if (headers.isEmpty()) return url;
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(headers.toString().getBytes(StandardCharsets.UTF_8));
            return url + "\n" + java.util.Arrays.toString(digest);
        } catch (IllegalStateException | java.security.NoSuchAlgorithmException error) { return null; }
    }
    private static InputStream await(Flight flight, HttpURLConnection connection) throws IOException {
        long timeout = Math.max(20000L, (long)connection.getConnectTimeout() + connection.getReadTimeout());
        try {
            if (!flight.ready.await(timeout, TimeUnit.MILLISECONDS)) {
                throw new java.net.SocketTimeoutException("List page wait timed out");
            }
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new InterruptedIOException("List page wait cancelled");
        }
        if (flight.error != null) throw flight.error;
        return new ByteArrayInputStream(flight.data);
    }
    private static boolean containsMarker(byte[] data) {
        outer: for (int i = 0; i <= data.length - MARKER.length; i++) {
            if (data[i] != MARKER[0]) continue;
            for (int n = 1; n < MARKER.length; n++) if (data[i+n] != MARKER[n]) continue outer;
            return true;
        }
        return false;
    }
    private static byte[] fetch(HttpURLConnection connection) throws IOException {
        try {
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
            record("List page fetched in " + ((System.nanoTime() - started) / 1000000) + " ms, " + data.length + " bytes");
            return data;
        } finally {
            connection.disconnect();
        }
    }
    private static void record(String message) {
        try { Class.forName("e.e.a.ModernDebug").getMethod("record", String.class).invoke(null, message); }
        catch (ReflectiveOperationException ignored) { }
    }
}
