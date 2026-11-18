// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Plain HTTP requests on the calling thread, outside the app's OkHttp clients: no certificate pins, no cache, and
 * only the headers given.
 */
public final class Http {
    static final int TIMEOUT_MS = 20_000;

    public static final class Reply {
        public final int status;
        public final byte[] body;
        /** The first value of each header, by case-insensitive name. */
        public final Map<String, String> headers;

        Reply(int status, byte[] body, Map<String, String> headers) {
            this.status = status;
            this.body = body;
            this.headers = headers;
        }
    }

    private Http() {}

    /** The system's own User-Agent, for services other than Reddit, which must never get the one sent to Reddit. */
    public static String systemUserAgent() {
        return headerSafe(System.getProperty("http.agent"));
    }

    /** The agent with every character a header value can't hold replaced by '?', or a generic one for none. */
    static String headerSafe(String agent) {
        if (agent == null || agent.isEmpty()) return "Dalvik/2.1.0 (Linux; Android)";
        StringBuilder safe = new StringBuilder(agent.length());
        for (int i = 0; i < agent.length(); i++) {
            char c = agent.charAt(i);
            safe.append(c == '\t' || (c >= ' ' && c <= '~') ? c : '?');
        }
        return safe.toString();
    }

    /** Sends one request, following redirects only for GET. A null body sends none. */
    public static Reply send(String method, String url, Map<String, String> headers, byte[] body) throws IOException {
        return send(method, url, headers, body, "GET".equals(method));
    }

    /** Sends one request; a redirect that isn't followed comes back as the reply. */
    static Reply send(String method, String url, Map<String, String> headers, byte[] body, boolean followRedirects)
            throws IOException {
        return send(method, url, headers, body, followRedirects, TIMEOUT_MS);
    }

    /** As above, with {@code timeoutMs} for the connection and for each read. */
    static Reply send(String method, String url, Map<String, String> headers, byte[] body, boolean followRedirects,
            int timeoutMs) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        try {
            connection.setRequestMethod(method);
            connection.setInstanceFollowRedirects(followRedirects);
            connection.setConnectTimeout(timeoutMs);
            connection.setReadTimeout(timeoutMs);
            connection.setUseCaches(false);
            for (Map.Entry<String, String> header : headers.entrySet()) {
                connection.setRequestProperty(header.getKey(), header.getValue());
            }
            if (body != null) {
                connection.setDoOutput(true);
                try (OutputStream out = connection.getOutputStream()) {
                    out.write(body);
                }
            }
            int status = connection.getResponseCode();
            Map<String, String> replyHeaders = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
            for (Map.Entry<String, List<String>> header : connection.getHeaderFields().entrySet()) {
                if (header.getKey() != null && !header.getValue().isEmpty()) {
                    replyHeaders.put(header.getKey(), header.getValue().get(0));
                }
            }
            InputStream in = status >= 400 ? connection.getErrorStream() : connection.getInputStream();
            return new Reply(status, in == null ? new byte[0] : readAll(in), replyHeaders);
        } finally {
            connection.disconnect();
        }
    }

    public static byte[] readAll(InputStream in) throws IOException {
        try (InputStream stream = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[16 * 1024];
            for (int read; (read = stream.read(buffer)) != -1; ) {
                out.write(buffer, 0, read);
            }
            return out.toByteArray();
        }
    }
}
