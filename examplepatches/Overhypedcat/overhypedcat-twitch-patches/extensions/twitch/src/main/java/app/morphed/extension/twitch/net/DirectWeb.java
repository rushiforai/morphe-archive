package app.morphed.extension.twitch.net;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPInputStream;

/** {@link Web} over the phone's normal connection (HttpURLConnection). */
public final class DirectWeb implements Web {
    @Override
    public Response send(Request request) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(request.url).openConnection();
        try {
            connection.setRequestMethod(request.method);
            connection.setConnectTimeout(request.timeoutMs);
            connection.setReadTimeout(request.timeoutMs);
            connection.setInstanceFollowRedirects(true);
            for (Map.Entry<String, String> header : request.headers.entrySet()) {
                connection.setRequestProperty(header.getKey(), header.getValue());
            }
            if (request.body != null) {
                connection.setDoOutput(true);
                connection.setFixedLengthStreamingMode(request.body.length);
                try (OutputStream out = connection.getOutputStream()) {
                    out.write(request.body);
                }
            }
            int status = connection.getResponseCode();
            Map<String, String> headers = new HashMap<>();
            for (Map.Entry<String, List<String>> entry : connection.getHeaderFields().entrySet()) {
                if (entry.getKey() != null && !entry.getValue().isEmpty()) headers.put(entry.getKey(), entry.getValue().get(0));
            }
            InputStream stream = status >= 400 ? connection.getErrorStream() : connection.getInputStream();
            byte[] body = stream == null ? new byte[0] : readAll(stream);
            if ("gzip".equalsIgnoreCase(connection.getContentEncoding()) && body.length > 0
                    && request.headers.containsKey("Accept-Encoding")) {
                body = readAll(new GZIPInputStream(new java.io.ByteArrayInputStream(body)));
            }
            return new Response(status, headers, body);
        } finally {
            connection.disconnect();
        }
    }

    static byte[] readAll(InputStream stream) throws IOException {
        try (InputStream in = stream) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[32768];
            int read;
            while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
            return out.toByteArray();
        }
    }
}
