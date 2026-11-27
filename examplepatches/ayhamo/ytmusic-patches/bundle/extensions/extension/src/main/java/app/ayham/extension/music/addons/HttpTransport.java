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
        HttpURLConnection c = open(r);
        // the whole call, redirects included, ends at the deadline: connect and header reads each
        // get their own timeout, so a watchdog drops the connection when the time is up
        final HttpURLConnection conn = c;
        java.util.concurrent.ScheduledFuture<?> watchdog = WATCHDOG.schedule(conn::disconnect, r.timeoutMs, java.util.concurrent.TimeUnit.MILLISECONDS);
        try {
            c.connect();
            c.setReadTimeout((int) Math.max(1, deadline - System.currentTimeMillis()));
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
            c.disconnect();
        }
    }

    /**
     * A connection with the request's headers and timeouts, not yet connected. The audio file
     * fetch uses it directly (Protocol.audio) and streams the body itself.
     */
    public static HttpURLConnection open(Protocol.Request r) throws IOException {
        HttpURLConnection c = (HttpURLConnection) new URL(r.url).openConnection();
        c.setRequestMethod("GET");
        c.setUseCaches(false);
        c.setInstanceFollowRedirects(true);   // (never https to http: HttpURLConnection doesn't cross schemes)
        c.setConnectTimeout(r.timeoutMs);
        c.setReadTimeout(r.timeoutMs);
        for (Map.Entry<String, String> h : r.headers.entrySet()) c.setRequestProperty(h.getKey(), h.getValue());
        return c;
    }
}
