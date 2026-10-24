import app.morphe.extension.chmate.HttpsTransport;
import java.net.Proxy;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;

/** No external traffic: only the loopback thumbnail regression actually connects. */
public class VerifyHttpsTransport {
    private static int checks;
    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }
    private static void rewrite(String input, String expected) {
        check(expected.equals(HttpsTransport.upgradeUrl(input)), "Unexpected rewrite: " + input);
    }
    public static void main(String[] args) throws Exception {
        URL original = new URL("http://example.com:80/a%2Fb?x=http://other/#fragment");
        HttpsTransport.setEnabled(false);
        check(HttpsTransport.upgrade(original) == original, "OFF must preserve URL object");
        rewrite(original.toString(), original.toString());
        check(!HttpsTransport.shouldUpgrade("http"), "OFF scheme");
        HttpsTransport.setEnabled(true);
        check(HttpsTransport.shouldUpgrade("HTTP"), "Case-insensitive HTTP");
        check(!HttpsTransport.shouldUpgrade("https"), "Already HTTPS");
        check(!HttpsTransport.shouldUpgrade(null), "Null scheme");
        check(HttpsTransport.upgradeUrl(null) == null, "Null URL");
        check(HttpsTransport.upgrade(new URL("http:relative")).toString().equals("https:relative"),
                "A URL without authority must not cause NullPointerException");
        rewrite(original.toString(), "https://example.com/a%2Fb?x=http://other/#fragment");
        rewrite("http://example.com", "https://example.com");
        rewrite("http://hissi.org/read.php/android/", "http://hissi.org/read.php/android/");
        rewrite("HTTP://HISSI.ORG:80/read.php/android/?a=%2F#f", "http://HISSI.ORG:80/read.php/android/?a=%2F#f");
        rewrite("http://www.hissi.org/read.php/android/", "http://www.hissi.org/read.php/android/");
        rewrite("http://hissi.org.evil/read.php/", "https://hissi.org.evil/read.php/");
        rewrite("https://hissi.org/read.php/android/", "https://hissi.org/read.php/android/");
        check(HttpsTransport.isHttpUpgradeExempt("hissi.org",80), "OkHttp Hissi exception");
        check(!HttpsTransport.isLocalThumbnailEndpoint("hissi.org",80), "Hissi must not bypass the configured proxy");
        check(!HttpsTransport.isHttpUpgradeExempt("hissi.org.evil",80), "Hissi lookalike must still upgrade");
        rewrite("HTTP://example.com:8080/a", "https://example.com:8080/a");
        rewrite("http://example.com:080/a", "https://example.com/a");
        rewrite("http://u:p%40ss@example.com:80/a", "https://u:p%40ss@example.com/a");
        rewrite("http://[::1]:80/a", "https://[::1]/a");
        rewrite("http://[::1]:8080/a", "https://[::1]:8080/a");
        rewrite("http://example.com/あ?x=%2F&y=1#f", "https://example.com/あ?x=%2F&y=1#f");
        rewrite(" \tHTTP://example.com/a", " \thttps://example.com/a");
        rewrite("https://example.com:80/a", "https://example.com:80/a");
        rewrite("file:///tmp/test", "file:///tmp/test");
        rewrite("content://media/1", "content://media/1");
        rewrite("/relative/path", "/relative/path");
        rewrite("//example.com/path", "//example.com/path");
        rewrite("http://example.com:invalid/a", "http://example.com:invalid/a");
        check(HttpsTransport.upgradePort(80) == -1, "Default HTTP port must reset");
        check(HttpsTransport.upgradePort(-1) == -1, "Unspecified port");
        check(HttpsTransport.upgradePort(8080) == 8080, "Custom port retained");
        check(HttpsTransport.openConnection(original) instanceof HttpsURLConnection,
                "Java connection must use TLS");
        check(HttpsTransport.openConnection(original, Proxy.NO_PROXY) instanceof HttpsURLConnection,
                "Proxy overload must use TLS");
        URL video = new URL("https://video.twimg.com/ext_tw_video/2104908394507411457/pu/vid/avc1/720x960/x6cfbDt22DoPXS7l.mp4");
        check(HttpsTransport.upgrade(video) == video, "Existing HTTPS video must remain unchanged");
        rewrite(video.toString().replace("https:", "http:"), video.toString());
        var local = com.sun.net.httpserver.HttpServer.create(new java.net.InetSocketAddress("127.0.0.1", 0), 0);
        var register = HttpsTransport.class.getDeclaredMethod("registerThumbnailServerPort", int.class);
        register.setAccessible(true);
        try {
            local.createContext("/frame.jpg", exchange -> {
                byte[] frame = {1, 2, 3};
                exchange.sendResponseHeaders(200, frame.length);
                try (var output = exchange.getResponseBody()) { output.write(frame); }
            });
            local.start();
            int port = local.getAddress().getPort();
            register.invoke(null, port);
            URL frame = new URL("http://127.0.0.1:" + port + "/frame.jpg");
            check(HttpsTransport.upgrade(frame) == frame, "Owned thumbnail must remain HTTP");
            rewrite(frame.toString(), frame.toString());
            check(HttpsTransport.isLocalThumbnailEndpoint("127.0.0.1", port), "OkHttp endpoint exception");
            check(!HttpsTransport.isLocalThumbnailEndpoint("127.0.0.1", port == 65535 ? port - 1 : port + 1), "Other local ports must not be exempt");
            check(!HttpsTransport.isLocalThumbnailEndpoint("video.twimg.com", port), "External host must not be exempt");
            check(!HttpsTransport.isLocalThumbnailEndpoint("127.0.0.1.evil", port), "Lookalike host must not be exempt");
            check(!HttpsTransport.isLocalThumbnailEndpoint(null, port), "Null host");
            check(!HttpsTransport.isLocalThumbnailEndpoint("127.0.0.1", -1), "No default-port exemption");
            check(!(HttpsTransport.openConnection(frame, Proxy.NO_PROXY) instanceof HttpsURLConnection), "Local proxy wrapper keeps HTTP");
            var connection = HttpsTransport.openConnection(frame);
            connection.setConnectTimeout(2000);
            connection.setReadTimeout(2000);
            try (var input = connection.getInputStream()) {
                check(java.util.Arrays.equals(input.readAllBytes(), new byte[]{1, 2, 3}), "HTTPS ON must download local thumbnail");
            }
            register.invoke(null, -1);
            check("https".equals(HttpsTransport.upgrade(frame).getProtocol()), "Unregistered local endpoint still upgrades");
        } finally {
            register.invoke(null, -1);
            local.stop(0);
        }
        HttpsTransport.setEnabled(false);
        check(!(HttpsTransport.openConnection(original) instanceof HttpsURLConnection),
                "OFF must restore HTTP");
        System.out.println("PASS: " + checks + " HTTPS transport checks (only loopback traffic)");
    }
}
