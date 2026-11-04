package app.wordfeudwordfinder.extension.words;

import app.wordfeudwordfinder.extension.core.WfError;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * {@link HttpFetcher} on {@link HttpURLConnection}: connect time-out 15 s, read time-out 30 s, at most
 * {@link #MAX_BYTES} bytes. Only https is used, and only the host of the requested URL is contacted (the patch may
 * only talk to the hosts in {@link WordListSources}): redirects are followed (at most {@link #MAX_REDIRECTS}) only
 * to an https URL on that same host; any other redirect is reported as WL-HTTP-&lt;3xx status&gt;. A response
 * larger than {@link #MAX_BYTES}, a non-https start URL and an unreadable status line (code -1) are reported as
 * WL-NET. Nothing about the request or the content is logged.
 */
public final class UrlConnectionFetcher implements HttpFetcher {
    static final int CONNECT_TIMEOUT_MS = 15_000;
    static final int READ_TIMEOUT_MS = 30_000;
    static final int MAX_REDIRECTS = 5;
    static final long MAX_BYTES = 64L << 20;

    @Override
    public byte[] fetch(String url, ProgressListener progress) throws WfError {
        URL current;
        try {
            current = new URL(url);
        } catch (MalformedURLException e) {
            throw WfError.wlNet();
        }
        if (!"https".equalsIgnoreCase(current.getProtocol())) throw WfError.wlNet();
        final URL start = current;
        for (int hop = 0; ; hop++) {
            HttpURLConnection c = null;
            try {
                c = (HttpURLConnection) current.openConnection();
                c.setInstanceFollowRedirects(false);
                c.setConnectTimeout(CONNECT_TIMEOUT_MS);
                c.setReadTimeout(READ_TIMEOUT_MS);
                c.setUseCaches(false);
                int status = c.getResponseCode();
                if (status == -1) throw WfError.wlNet(); // not a valid HTTP response
                if (status >= 300 && status < 400) {
                    URL next = hop >= MAX_REDIRECTS ? null : redirectTarget(start, current, c.getHeaderField("Location"));
                    if (next == null) throw WfError.wlHttp(status);
                    current = next;
                    continue;
                }
                if (status < 200 || status >= 300) throw WfError.wlHttp(status);
                long total = c.getContentLengthLong();
                if (total > MAX_BYTES) throw WfError.wlNet();
                try (InputStream in = c.getInputStream()) {
                    return readAll(in, total, progress);
                }
            } catch (IOException | RuntimeException e) {
                // RuntimeException: e.g. a malformed response some HttpURLConnection versions report unchecked.
                throw WfError.wlNet();
            } finally {
                if (c != null) c.disconnect();
            }
        }
    }

    /**
     * The URL to follow for a redirect from {@code current} to {@code location}, or null when it must not be
     * followed: no or malformed Location, not https, or a host other than that of {@code start}.
     */
    static URL redirectTarget(URL start, URL current, String location) {
        if (location == null || location.isEmpty()) return null;
        URL next;
        try {
            next = new URL(current, location);
        } catch (MalformedURLException e) {
            return null;
        }
        if (!"https".equalsIgnoreCase(next.getProtocol())) return null;
        if (next.getHost() == null || !next.getHost().equalsIgnoreCase(start.getHost())) return null;
        if (next.getPort() != start.getPort()) return null;
        return next;
    }

    private static byte[] readAll(InputStream in, long total, ProgressListener progress)
            throws IOException, WfError {
        ByteArrayOutputStream out = new ByteArrayOutputStream(total > 0 ? (int) total : 1 << 16);
        byte[] buf = new byte[1 << 16];
        long read = 0;
        int n;
        while ((n = in.read(buf)) != -1) {
            read += n;
            if (read > MAX_BYTES) throw WfError.wlNet();
            out.write(buf, 0, n);
            if (progress != null) progress.onProgress(read, total);
        }
        return out.toByteArray();
    }
}
