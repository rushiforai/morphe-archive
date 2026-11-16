package app.morphed.extension.twitch.net;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/**
 * An HTTP client for the patches' own requests (Shazam, YouTube, Twitch through the VPN). Two kinds: the phone's
 * normal connection, and the VPN tunnel.
 */
public interface Web {
    Response send(Request request) throws IOException;

    final class Request {
        public final String method;
        public final String url;
        public final Map<String, String> headers = new LinkedHashMap<>();
        public byte[] body;
        public int timeoutMs = 10_000;

        public Request(String method, String url) {
            this.method = method;
            this.url = url;
        }

        public static Request get(String url) {
            return new Request("GET", url);
        }

        public static Request post(String url, String body, String contentType) {
            Request request = new Request("POST", url);
            request.body = body.getBytes(StandardCharsets.UTF_8);
            request.headers.put("Content-Type", contentType);
            return request;
        }

        public Request header(String name, String value) {
            headers.put(name, value);
            return this;
        }

        public Request timeout(int ms) {
            timeoutMs = ms;
            return this;
        }
    }

    final class Response {
        public final int status;
        public final Map<String, String> headers; // lower-case names
        public final byte[] body;

        public Response(int status, Map<String, String> headers, byte[] body) {
            this.status = status;
            this.headers = new LinkedHashMap<>();
            for (Map.Entry<String, String> entry : headers.entrySet()) {
                if (entry.getKey() != null) this.headers.put(entry.getKey().toLowerCase(Locale.ROOT), entry.getValue());
            }
            this.body = body == null ? new byte[0] : body;
        }

        public boolean ok() {
            return status >= 200 && status < 300;
        }

        public String text() {
            return new String(body, StandardCharsets.UTF_8);
        }

        public String header(String name) {
            return headers.get(name.toLowerCase(Locale.ROOT));
        }
    }
}
