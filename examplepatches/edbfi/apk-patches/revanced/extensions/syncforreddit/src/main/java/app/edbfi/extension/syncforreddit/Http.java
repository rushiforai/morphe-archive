// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/** Plain HTTP requests on the calling thread, outside the app's own client and its Reddit headers. */
final class Http {
    static final int TIMEOUT_MS = 10_000;

    static final class Reply {
        final int status;
        final byte[] body;
        final Map<String, String> headers;

        Reply(int status, byte[] body, Map<String, String> headers) {
            this.status = status;
            this.body = body;
            this.headers = headers;
        }

        String header(String name) {
            return headers.get(name);
        }
    }

    private Http() {}

    /** The system's own User-Agent, for services other than Reddit, which must never get the one the app sends Reddit. */
    static String systemUserAgent() {
        return headerSafe(System.getProperty("http.agent"));
    }

    /**
     * The agent with every character a header value can't hold replaced by '?'. It holds the device's model name,
     * which on some phones has characters such as '™', and OkHttp refuses those.
     */
    static String headerSafe(String agent) {
        if (agent == null || agent.isEmpty()) return "Dalvik/2.1.0 (Linux; Android)";
        StringBuilder safe = new StringBuilder(agent.length());
        for (int i = 0; i < agent.length(); i++) {
            char c = agent.charAt(i);
            safe.append(c == '\t' || (c >= ' ' && c <= '~') ? c : '?');
        }
        return safe.toString();
    }

    static Reply send(String method, String url, Map<String, String> headers, byte[] body, boolean followRedirects)
            throws IOException {
        return send(method, url, headers, body, followRedirects, TIMEOUT_MS);
    }

    static Reply send(String method, String url, Map<String, String> headers, byte[] body, boolean followRedirects,
            int timeoutMs) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        try {
            connection.setRequestMethod(method);
            connection.setInstanceFollowRedirects(followRedirects);
            connection.setConnectTimeout(timeoutMs);
            connection.setReadTimeout(timeoutMs);
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

    private static byte[] readAll(InputStream in) throws IOException {
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
