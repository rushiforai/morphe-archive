package e.e.a;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;

/** Reads guest watch metadata used by related-video search. */
final class SearchResponse212 {
    private static final int MAX_CHARS = 8 * 1024 * 1024;

    private SearchResponse212() {}

    static String read(HttpURLConnection connection) throws IOException {
        try {
            int status = connection.getResponseCode();
            if (status != HttpURLConnection.HTTP_OK) {
                throw new IOException("Video lookup HTTP " + status);
            }
            try (Reader reader = new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8)) {
                StringBuilder body = new StringBuilder();
                char[] buffer = new char[4096];
                int count;
                while ((count = reader.read(buffer)) != -1) {
                    if (count > MAX_CHARS - body.length()) {
                        throw new IOException("Video lookup response too large");
                    }
                    body.append(buffer, 0, count);
                }
                return body.toString();
            }
        } finally {
            connection.disconnect();
        }
    }
}
