package app.wordfeudwordfinder.extension.play;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Map;

/**
 * {@link Poster} on {@link HttpURLConnection}: POST, UTF-8 body, connect and read time-out 15 s, no redirects, no
 * caches, responses of at most {@link #MAX_BYTES}. Only https URLs under {@link #ALLOWED_PREFIX} on host
 * {@code api.wordfeud.com} are allowed; anything else is refused with an IOException before connecting. Nothing
 * is logged.
 */
public final class UrlConnectionPoster implements Poster {
    static final String ALLOWED_PREFIX = "https://api.wordfeud.com/wf/";
    static final int TIMEOUT_MS = 15_000;
    static final int MAX_BYTES = 4 << 20;

    static boolean isAllowed(String url) {
        if (url == null || !url.startsWith(ALLOWED_PREFIX)) return false;
        try {
            URL u = new URL(url);
            return "https".equals(u.getProtocol()) && "api.wordfeud.com".equals(u.getHost())
                    && u.getPort() == -1 && u.getUserInfo() == null;
        } catch (IOException e) {
            return false;
        }
    }

    @Override
    public String post(String url, String body, Map<String, String> headers) throws IOException {
        if (!isAllowed(url)) throw new IOException("url not allowed");
        byte[] payload = body.getBytes(StandardCharsets.UTF_8);
        HttpURLConnection c = null;
        try {
            c = (HttpURLConnection) new URL(url).openConnection();
            c.setInstanceFollowRedirects(false);
            c.setConnectTimeout(TIMEOUT_MS);
            c.setReadTimeout(TIMEOUT_MS);
            c.setUseCaches(false);
            c.setRequestMethod("POST");
            c.setDoOutput(true);
            for (Map.Entry<String, String> h : headers.entrySet()) c.setRequestProperty(h.getKey(), h.getValue());
            c.setFixedLengthStreamingMode(payload.length);
            try (OutputStream out = c.getOutputStream()) {
                out.write(payload);
            }
            int status = c.getResponseCode();
            if (status == -1) throw new IOException("invalid response");
            if (status < 200 || status >= 300) {
                String err = null;
                try (InputStream es = c.getErrorStream()) {
                    if (es != null) err = readAll(es);
                } catch (IOException e) {
                    err = null;
                }
                throw new HttpStatusException(status, err);
            }
            try (InputStream in = c.getInputStream()) {
                return readAll(in);
            }
        } catch (RuntimeException e) {
            // e.g. a malformed response some HttpURLConnection versions report unchecked
            throw new IOException("request failed");
        } finally {
            if (c != null) c.disconnect();
        }
    }

    private static String readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = in.read(buf)) != -1) {
            if (out.size() + n > MAX_BYTES) throw new IOException("response too large");
            out.write(buf, 0, n);
        }
        return new String(out.toByteArray(), StandardCharsets.UTF_8);
    }
}
