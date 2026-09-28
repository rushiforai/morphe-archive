package app.morphe.extension.tiktok.download;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.util.Map;

/** Deterministic public-network stand-ins shared by media download tests. */
final class MediaTransportFixtures {
    private MediaTransportFixtures() { }

    static MediaTransport.Client publicClient(MediaTransport.ConnectionOpener opener) {
        return new MediaTransport.Client(host -> new InetAddress[]{
                InetAddress.getByAddress(host, new byte[]{8, 8, 8, 8})
        }, opener);
    }

    static HttpURLConnection response(URL url, int status, byte[] body) {
        return response(url, status, body, null, Map.of());
    }

    static HttpURLConnection response(
            URL url,
            int status,
            byte[] body,
            String contentType,
            Map<String, String> headers
    ) {
        return new HttpURLConnection(url) {
            @Override public int getResponseCode() {
                return status;
            }

            @Override public String getHeaderField(String name) {
                if ("Content-Length".equalsIgnoreCase(name)) {
                    return String.valueOf(body.length);
                }
                for (Map.Entry<String, String> header : headers.entrySet()) {
                    if (header.getKey().equalsIgnoreCase(name)) return header.getValue();
                }
                return null;
            }

            @Override public String getContentType() {
                return contentType;
            }

            @Override public InputStream getInputStream() {
                return new ByteArrayInputStream(body);
            }

            @Override public void connect() { }
            @Override public void disconnect() { }
            @Override public boolean usingProxy() { return false; }
        };
    }
}
