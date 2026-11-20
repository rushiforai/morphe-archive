package e.e.a;

import com.sun.net.httpserver.HttpServer;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public final class LookupLifecycleTest {
    private static final String PAGE = "<meta name=\"server-response\" content=\"{}\">";

    public static void main(String[] args) throws Exception {
        PageCache.refresh();
        TestConnection page = new TestConnection(200, PAGE);
        try (InputStream input = PageCache.input(page)) {
            check(input.read() == '<', "cached resource is readable after network disconnect");
        }
        check(page.closed && page.disconnected, "successful network read releases resources");
        TestConnection repeated = new TestConnection(200, "wrong data");
        try (InputStream input = PageCache.input(repeated)) {
            check(input.read() == '<' && repeated.opens == 0, "cache hit avoids network");
        }
        PageCache.refresh();
        TestConnection unavailable = new TestConnection(404, "");
        expectFailure(() -> PageCache.input(unavailable), "mock HTTP 404");
        check(unavailable.disconnected, "ranking/search disconnects after stream-open failure");
        TestConnection recovery = new TestConnection(200, PAGE);
        try (InputStream input = PageCache.input(recovery)) {
            check(input.read() == '<' && recovery.opens == 1, "failure clears the in-flight page");
        }

        TestConnection response = new TestConnection(200, "日本語");
        check(SearchResponse212.read(response).equals("日本語") && response.closed && response.disconnected,
                "watch response decoded and closed");
        TestConnection redirect = new TestConnection(302, "");
        expectFailure(() -> SearchResponse212.read(redirect), "HTTP 302");
        check(redirect.opens == 0 && redirect.disconnected, "redirect does not consume a body");
        TestConnection excessive = new TestConnection(200, "");
        excessive.data = new byte[8 * 1024 * 1024 + 1];
        expectFailure(() -> SearchResponse212.read(excessive), "too large");
        check(excessive.closed && excessive.disconnected, "oversized response closes the stream");

        HttpServer server = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        byte[] body = "{\"data\":\"日本語\"}".getBytes(StandardCharsets.UTF_8);
        server.createContext("/watch", exchange -> {
            exchange.sendResponseHeaders(200, body.length);
            try (java.io.OutputStream output = exchange.getResponseBody()) {
                output.write(body);
            }
        });
        server.createContext("/missing", exchange -> {
            exchange.sendResponseHeaders(404, -1);
            exchange.close();
        });
        server.start();
        try {
            String root = "http://127.0.0.1:" + server.getAddress().getPort();
            check(SearchResponse212.read(open(root + "/watch")).contains("日本語"), "loopback HTTP 200");
            expectFailure(() -> SearchResponse212.read(open(root + "/missing")), "HTTP 404");
        } finally {
            server.stop(0);
        }
        System.out.println("PASS: guest watch HTTP/UTF-8, cache hit and retry, failure and oversized-response cleanup");
    }

    private static HttpURLConnection open(String address) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(address).openConnection();
        connection.setReadTimeout(3000);
        connection.setConnectTimeout(3000);
        return connection;
    }

    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    private static void expectFailure(Request request, String message) throws Exception {
        try {
            request.run();
            throw new AssertionError("Expected " + message);
        } catch (IOException failure) {
            check(failure.getMessage().contains(message), failure.toString());
        }
    }

    private interface Request { Object run() throws Exception; }

    private static final class TestConnection extends HttpURLConnection {
        private final int status;
        byte[] data;
        int opens;
        boolean closed, disconnected;

        TestConnection(int status, String body) throws Exception {
            super(new URL("https://fixture.invalid/search"));
            this.status = status;
            data = body.getBytes(StandardCharsets.UTF_8);
        }

        @Override public int getResponseCode() { return status; }
        @Override public InputStream getInputStream() throws IOException {
            opens++;
            if (status != 200) throw new IOException("mock HTTP " + status);
            return new ByteArrayInputStream(data) {
                @Override public void close() { closed = true; }
            };
        }
        @Override public void disconnect() { disconnected = true; }
        @Override public boolean usingProxy() { return false; }
        @Override public void connect() {}
    }
}
