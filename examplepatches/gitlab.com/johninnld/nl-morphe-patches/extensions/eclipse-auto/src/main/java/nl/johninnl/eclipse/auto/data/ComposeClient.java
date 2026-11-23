package nl.johninnl.eclipse.auto.data;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Fetches the compose feeds. The request is the app's own: {@code GET
 * https://api.eclipsemusic.app/api/compose/<feed>} with the bearer token, the device id and
 * {@code Accept: application/json}, 15 s to connect and 30 s to read. Certificate verification is
 * the platform's: nothing here touches trust managers or host name verifiers. The token is used for
 * the request and then forgotten; it is never logged, cached or put in a URL.
 */
public final class ComposeClient {
    static final String BASE = "https://api.eclipsemusic.app/api/compose/";
    static final int CONNECT_TIMEOUT_MS = 15000;
    static final int READ_TIMEOUT_MS = 30000;
    private static final int MAX_BODY_BYTES = 8 * 1024 * 1024;

    /** What came back. */
    public enum Status {
        /** 2xx with a body. */
        OK,
        /** 401 or 403: the token is not accepted; do not retry in a loop. */
        UNAUTHORIZED,
        /** 503: the server has compose switched off, which the app treats as "use the library". */
        DISABLED,
        /** Anything else, including no network. */
        FAILED
    }

    public static final class Response {
        public final Status status;
        public final String body;

        Response(Status status, String body) {
            this.status = status;
            this.body = body;
        }
    }

    /** Performs one GET. Tests replace it; the real one speaks HTTPS. */
    public interface Transport {
        /** Returns the HTTP status and body, or throws IOException when there is no answer. */
        RawResponse get(URL url, Map<String, String> headers) throws IOException;
    }

    public static final class RawResponse {
        public final int code;
        public final String body;

        public RawResponse(int code, String body) {
            this.code = code;
            this.body = body;
        }
    }

    private final Transport transport;

    public ComposeClient() { this(new HttpTransport()); }

    public ComposeClient(Transport transport) { this.transport = transport; }

    /**
     * The request URL: the storefront when it is not "auto", and the caps the phone's own Home request
     * sends (linked rows and linked playlists at version 2, which is what the app's linked-list loader reads).
     */
    static String url(String feed, String storefront) {
        StringBuilder query = new StringBuilder();
        // A storefront is a short code ("us", "nl"); anything else would need encoding, so it is simply not sent.
        if (storefront != null && !"auto".equals(storefront) && storefront.matches("[A-Za-z0-9_-]{1,16}")) {
            query.append("storefront=").append(storefront);
        }
        if ("home".equals(feed)) {
            if (query.length() > 0) query.append('&');
            query.append("caps=linkedRows:2,linkedPlaylists:2");
        }
        return BASE + feed + (query.length() == 0 ? "" : "?" + query);
    }

    static Map<String, String> headers(Model.ComposeAuth auth) {
        Map<String, String> headers = new LinkedHashMap<>();
        headers.put("Authorization", "Bearer " + auth.bearer());
        headers.put("X-Device-Id", auth.deviceId);
        headers.put("Accept", "application/json");
        return headers;
    }

    /** Blocking; call it off the main thread. */
    public Response fetch(String feed, Model.ComposeAuth auth) {
        if (!auth.signedIn()) return new Response(Status.UNAUTHORIZED, null);
        try {
            RawResponse raw = transport.get(new URL(url(feed, auth.storefront)), headers(auth));
            if (raw.code == 401 || raw.code == 403) return new Response(Status.UNAUTHORIZED, null);
            if (raw.code == 503) return new Response(Status.DISABLED, null);
            if (raw.code >= 200 && raw.code < 300 && raw.body != null) return new Response(Status.OK, raw.body);
            return new Response(Status.FAILED, null);
        } catch (IOException | RuntimeException unreachable) {
            return new Response(Status.FAILED, null);
        }
    }

    /** The real transport. It sets only timeouts and headers; the connection's own certificate checks stay on. */
    static final class HttpTransport implements Transport {
        @Override public RawResponse get(URL url, Map<String, String> headers) throws IOException {
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            try {
                connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
                connection.setReadTimeout(READ_TIMEOUT_MS);
                connection.setRequestMethod("GET");
                for (Map.Entry<String, String> header : headers.entrySet()) connection.setRequestProperty(header.getKey(), header.getValue());
                int code = connection.getResponseCode();
                if (code < 200 || code >= 300) return new RawResponse(code, null);
                try (InputStream stream = connection.getInputStream()) {
                    ByteArrayOutputStream out = new ByteArrayOutputStream();
                    byte[] buffer = new byte[8192];
                    int read;
                    while ((read = stream.read(buffer)) >= 0) {
                        out.write(buffer, 0, read);
                        if (out.size() > MAX_BODY_BYTES) throw new IOException("Compose response too large");
                    }
                    return new RawResponse(code, new String(out.toByteArray(), StandardCharsets.UTF_8));
                }
            } finally {
                connection.disconnect();
            }
        }
    }
}
