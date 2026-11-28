package app.ayham.extension.music.addons;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * The real GET for {@link AddonClient}: HttpURLConnection, nothing else. Sends exactly the
 * request's headers (Protocol.api / Protocol.probe), no cache, and keeps the whole call within
 * its timeout (connect and every read get the time left; the body read checks the deadline).
 * Kept apart from the logic so the logic runs in JVM tests without a network.
 */
public final class HttpTransport implements AddonClient.Transport {
    /** A JSON answer bigger than this is not an addon's. */
    private static final int MAX_BODY = 8 << 20;
    private static final java.util.concurrent.ScheduledExecutorService WATCHDOG =
            java.util.concurrent.Executors.newSingleThreadScheduledExecutor(r -> {
                Thread t = new Thread(r, "addon-http-watchdog");
                t.setDaemon(true);
                return t;
            });

    @Override
    public AddonClient.Response get(Protocol.Request r) throws IOException {
        long deadline = System.currentTimeMillis() + r.timeoutMs;
        // the whole call, redirects included, ends at the deadline: connect and header reads each
        // get their own timeout, so a watchdog drops the connection (whichever hop is on) when the time is up
        java.util.concurrent.atomic.AtomicReference<HttpURLConnection> on = new java.util.concurrent.atomic.AtomicReference<>(open(r));
        java.util.concurrent.ScheduledFuture<?> watchdog = WATCHDOG.schedule(() -> on.get().disconnect(), r.timeoutMs, java.util.concurrent.TimeUnit.MILLISECONDS);
        HttpURLConnection c = on.get();
        try {
            c.setReadTimeout((int) Math.max(1, deadline - System.currentTimeMillis()));
            c = follow(c, r, on::set);
            int status = c.getResponseCode();
            // a redirect onto this device is refused like the link itself (extension audit M8)
            if (!Protocol.redirectAllowed(r.url, c.getURL().toString())) throw new IOException("redirected off https or to this device");
            Map<String, String> headers = new HashMap<>();
            for (Map.Entry<String, List<String>> e : c.getHeaderFields().entrySet()) {
                if (e.getKey() == null || e.getValue() == null || e.getValue().isEmpty()) continue;
                headers.put(e.getKey().toLowerCase(Locale.ROOT), e.getValue().get(e.getValue().size() - 1));
            }
            if (!r.readBody) return new AddonClient.Response(status, headers, "");
            InputStream in = status >= 400 ? c.getErrorStream() : c.getInputStream();
            if (in == null) return new AddonClient.Response(status, headers, "");
            ByteArrayOutputStream body = new ByteArrayOutputStream();
            byte[] buf = new byte[16 * 1024];
            try {
                for (int n; ; ) {
                    long left = deadline - System.currentTimeMillis();
                    if (left <= 0) throw new SocketTimeoutException("timed out");
                    c.setReadTimeout((int) Math.max(1, left));
                    n = in.read(buf);
                    if (n < 0) break;
                    body.write(buf, 0, n);
                    if (body.size() > MAX_BODY) throw new IOException("answer too large");
                }
            } finally {
                in.close();
            }
            return new AddonClient.Response(status, headers, new String(body.toByteArray(), StandardCharsets.UTF_8));
        } catch (IOException e) {
            if (System.currentTimeMillis() >= deadline) throw new SocketTimeoutException("timed out");
            throw e;
        } finally {
            watchdog.cancel(false);
            on.get().disconnect();
        }
    }

    /** At most this many redirects are followed. */
    static final int MAX_REDIRECTS = 5;

    /**
     * The answer to [c] (from {@link #open}), its redirects followed one by one: each hop's link is
     * checked before anything is sent to it (off https, or onto this device when the link wasn't:
     * refused, extension audit M8). The request's headers and timeouts go along, as they did when
     * HttpURLConnection followed them itself. [hop], when given, is told of each new connection.
     */
    public static HttpURLConnection follow(HttpURLConnection c, Protocol.Request r, java.util.function.Consumer<HttpURLConnection> hop) throws IOException {
        String at = c.getURL().toString();
        for (int hops = 0; ; hops++) {
            int code;
            try {
                code = c.getResponseCode();
            } catch (IOException e) {
                c.disconnect();
                throw e;
            }
            String loc = code == 301 || code == 302 || code == 303 || code == 307 || code == 308 ? c.getHeaderField("Location") : null;
            if (loc == null) return c;
            int connectMs = c.getConnectTimeout(), readMs = c.getReadTimeout();
            c.disconnect();
            if (hops >= MAX_REDIRECTS) throw new IOException("over " + MAX_REDIRECTS + " redirects");
            String next = new URL(new URL(at), loc).toString();
            if (!Protocol.redirectAllowed(r.url, next)) throw new IOException("redirected off https or to this device");
            c = (HttpURLConnection) new URL(next).openConnection();
            setUp(c, r);
            c.setConnectTimeout(connectMs);
            c.setReadTimeout(readMs);
            if (hop != null) hop.accept(c);
            at = next;
        }
    }

    public static HttpURLConnection follow(HttpURLConnection c, Protocol.Request r) throws IOException {
        return follow(c, r, null);
    }

    /**
     * A connection with the request's headers and timeouts, not yet connected, that doesn't follow
     * redirects: its user calls {@link #follow} for the answer. The audio file fetch uses it directly
     * (Protocol.audio) and streams the body itself.
     */
    public static HttpURLConnection open(Protocol.Request r) throws IOException {
        HttpURLConnection c = (HttpURLConnection) new URL(r.url).openConnection();
        setUp(c, r);
        c.setConnectTimeout(r.timeoutMs);
        c.setReadTimeout(r.timeoutMs);
        return c;
    }

    /** GET, no cache, the request's headers; redirects left to {@link #follow}, which checks each hop first. */
    private static void setUp(HttpURLConnection c, Protocol.Request r) throws IOException {
        c.setRequestMethod("GET");
        c.setUseCaches(false);
        c.setInstanceFollowRedirects(false);
        for (Map.Entry<String, String> h : r.headers.entrySet()) c.setRequestProperty(h.getKey(), h.getValue());
    }
}
