package app.afterglow.extension.sponsorblock;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import app.afterglow.extension.settings.ThemeJson;

/** Read-only SponsorBlock API client: four-character hash prefixes, 128-video LRU, coalesced requests. */
public final class SponsorClient {
    public interface Callback { void complete(List<SponsorSegment> segments, Exception error); }
    public interface Transport { Response get(URI uri) throws Exception; }
    public static final class Response {
        public final int status;
        public final String body;
        public Response(int status, String body) { this.status = status; this.body = body; }
    }

    private final Executor worker, callbacks;
    private final Transport transport;
    private final Map<String, List<Callback>> pending = new LinkedHashMap<>();
    private final Map<String, List<SponsorSegment>> cache = new LinkedHashMap<String, List<SponsorSegment>>(16, 0.75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<String, List<SponsorSegment>> entry) { return size() > 128; }
    };

    public SponsorClient(Executor callbacks) { this(networkExecutor(), callbacks, SponsorClient::request); }

    /** Injectable executors/transport keep coalescing and error paths deterministic in JVM tests. */
    public SponsorClient(Executor worker, Executor callbacks, Transport transport) {
        this.worker = worker; this.callbacks = callbacks; this.transport = transport;
    }

    private static Executor networkExecutor() {
        ThreadPoolExecutor executor = new ThreadPoolExecutor(2, 2, 30, TimeUnit.SECONDS,
                new ArrayBlockingQueue<>(64), runnable -> {
                    Thread thread = new Thread(runnable, "Afterglow-SponsorBlock");
                    thread.setDaemon(true); return thread;
                });
        executor.allowCoreThreadTimeOut(true);
        return executor;
    }

    public static URI requestUri(String videoId) {
        if (videoId == null || videoId.isEmpty() || videoId.length() > 128)
            throw new IllegalArgumentException("Invalid video ID");
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(videoId.getBytes(StandardCharsets.UTF_8));
            char[] hex = "0123456789abcdef".toCharArray();
            String prefix = "" + hex[(digest[0] & 255) >>> 4] + hex[digest[0] & 15]
                    + hex[(digest[1] & 255) >>> 4] + hex[digest[1] & 15];
            List<String> categories = new ArrayList<>();
            for (SponsorCategory category : SponsorCategory.values()) categories.add(category.id);
            return URI.create("https://sponsor.ajay.app/api/skipSegments/" + prefix
                    + "?service=YouTube&categories=" + URLEncoder.encode(ThemeJson.write(categories), "UTF-8")
                    + "&actionTypes=" + URLEncoder.encode("[\"skip\"]", "UTF-8"));
        } catch (java.security.NoSuchAlgorithmException | java.io.UnsupportedEncodingException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    public void fetch(String videoId, Callback callback) {
        final URI uri;
        try { uri = requestUri(videoId); }
        catch (RuntimeException error) { deliver(callback, Collections.emptyList(), error); return; }
        List<SponsorSegment> cached;
        synchronized (this) {
            cached = cache.get(videoId);
            if (cached == null) {
                List<Callback> existing = pending.get(videoId);
                if (existing != null) { existing.add(callback); return; }
                List<Callback> waiting = new ArrayList<>(); waiting.add(callback); pending.put(videoId, waiting);
            }
        }
        if (cached != null) { deliver(callback, cached, null); return; }
        try {
            worker.execute(() -> {
                List<SponsorSegment> segments = Collections.emptyList();
                Exception failure = null;
                try {
                    Response response = transport.get(uri);
                    if (response.status == 404) segments = Collections.emptyList();
                    else if (response.status < 200 || response.status >= 300)
                        throw new IOException("SponsorBlock HTTP " + response.status);
                    else segments = SponsorSegment.parse(response.body, videoId);
                } catch (Exception error) { failure = error; }
                complete(videoId, segments, failure);
            });
        } catch (RuntimeException rejected) { complete(videoId, Collections.emptyList(), rejected); }
    }

    private void complete(String videoId, List<SponsorSegment> segments, Exception error) {
        List<Callback> waiting;
        synchronized (this) {
            waiting = pending.remove(videoId);
            if (error == null) cache.put(videoId, segments);
        }
        if (waiting != null) for (Callback callback : waiting) deliver(callback, segments, error);
    }

    private void deliver(Callback callback, List<SponsorSegment> segments, Exception error) {
        callbacks.execute(() -> callback.complete(segments, error));
    }

    private static Response request(URI uri) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) uri.toURL().openConnection();
        connection.setConnectTimeout(10000); connection.setReadTimeout(15000);
        connection.setUseCaches(false); connection.setInstanceFollowRedirects(false);
        connection.setRequestProperty("Accept", "application/json");
        connection.setRequestProperty("User-Agent", "YTAfterglow/1.0 SponsorBlockClient");
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(15);
        try {
            int status = connection.getResponseCode();
            if (status < 200 || status >= 300) return new Response(status, "");
            if (connection.getContentLengthLong() > ThemeJson.MAX_LENGTH) throw new IOException("SponsorBlock response is too large");
            try (InputStream input = connection.getInputStream(); ByteArrayOutputStream output = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[8192];
                while (true) {
                    long remaining = TimeUnit.NANOSECONDS.toMillis(deadline - System.nanoTime());
                    if (remaining <= 0) throw new java.net.SocketTimeoutException("SponsorBlock request timed out");
                    connection.setReadTimeout((int) Math.max(1, remaining));
                    int count = input.read(buffer);
                    if (count < 0) break;
                    if (output.size() + count > ThemeJson.MAX_LENGTH) throw new IOException("SponsorBlock response is too large");
                    output.write(buffer, 0, count);
                }
                return new Response(status, new String(output.toByteArray(), StandardCharsets.UTF_8));
            }
        } finally { connection.disconnect(); }
    }
}
