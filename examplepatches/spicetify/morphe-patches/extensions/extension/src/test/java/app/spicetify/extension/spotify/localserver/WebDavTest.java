package app.spicetify.extension.spotify.localserver;

import static org.junit.Assert.*;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class WebDavTest {
    private HttpServer server;
    private ServerConnection config;
    private AtomicInteger requests;
    private final byte[] audio = new byte[1024];

    @Before public void setup() throws Exception {
        server = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        config = new ServerConnection("http://127.0.0.1:" + server.getAddress().getPort() + "/music/", "fake-user", "fake-password", true);
        requests = new AtomicInteger();
        for (int i = 0; i < audio.length; i++) audio[i] = (byte) i;
        server.start();
    }
    @After public void teardown() { if (server != null) server.stop(0); }
    private WebDav dav() { return new WebDav(config, () -> true); }
    private RemoteTrack track() { return new RemoteTrack(config, config.root.resolve("song.mp3"), audio.length, "\"v1\""); }
    private static byte[] bytes(String value) { return value.getBytes(StandardCharsets.UTF_8); }
    private static String listing(String href, String properties) {
        return "<d:multistatus xmlns:d=\"DAV:\"><d:response><d:href>" + href
                + "</d:href><d:propstat><d:prop>" + properties
                + "</d:prop><d:status>HTTP/1.1 200 OK</d:status></d:propstat></d:response></d:multistatus>";
    }
    private void respond(int status, String range, byte[] body) {
        server.createContext("/music/", exchange -> {
            requests.incrementAndGet();
            assertEquals(config.authorization(), exchange.getRequestHeaders().getFirst("Authorization"));
            if (range != null) exchange.getResponseHeaders().set("Content-Range", range);
            exchange.sendResponseHeaders(status, body.length);
            try (OutputStream out = exchange.getResponseBody()) { out.write(body); }
        });
    }

    @Test public void productionRejectsPlainHttp() {
        assertThrows(IllegalArgumentException.class, () -> new ServerConnection("http://127.0.0.1/music/", "u", "p"));
    }
    @Test public void missingSchemeDefaultsToHttps() {
        assertEquals("https://dav.example/music/", new ServerConnection("dav.example/music", "u", "p").root.toString());
        assertEquals("https://dav.example:8443/music/", new ServerConnection("dav.example:8443/music", "u", "p").root.toString());
        assertThrows(IllegalArgumentException.class, () -> new ServerConnection("http:/dav.example/music", "u", "p"));
        assertThrows(IllegalArgumentException.class, () -> new ServerConnection("http:443", "u", "p"));
    }
    @Test public void rejectsCrossOriginOrRootEscapesBeforeNetwork() {
        for (String href : List.of("https://other.example/song.mp3", "//other.example/song.mp3", "/outside/song.mp3",
                "../song.mp3", "%2e%2e/song.mp3", "dir%2fsong.mp3", "dir%5csong.mp3", "dir%252fsong.mp3", "song.mp3?token=1", "song.mp3#x")) {
            assertThrows(href, IllegalArgumentException.class, () -> config.resolve(config.root, href));
        }
        assertEquals(0, requests.get());
    }
    @Test public void credentialsAndFragmentsCannotHideInConfiguredUrl() {
        for (String url : List.of("https://user:pass@dav.example/music/", "https://dav.example/music/?x=y", "https://dav.example/music/#x", "https://dav.example/music/%2e%2e/")) {
            assertThrows(IllegalArgumentException.class, () -> new ServerConnection(url, "", ""));
        }
    }
    @Test public void resolvesRelativeListingInsideRoot() {
        assertEquals(config.root.resolve("album/song.mp3"), config.resolve(config.root.resolve("album/"), "song.mp3"));
    }
    @Test public void unicodeFoldersAndFilenamesUseEncodedRequestPaths() {
        ServerConnection unicode = new ServerConnection("https://dav.example/Música/", "", "");
        assertEquals("/M%C3%BAsica/", unicode.root.getRawPath());
        assertEquals("/M%C3%BAsica/can%C3%A7%C3%A3o.mp3",
                unicode.resolve(unicode.root, "canção.mp3").getRawPath());
    }
    @Test public void hostileListingNeverCreatesCrossOriginTracks() {
        String xml = listing("https://attacker.example/song.mp3", "<d:getcontentlength>1024</d:getcontentlength>");
        assertThrows(IOException.class, () -> dav().parseListing(bytes(xml), config.root));
        assertEquals(0, requests.get());
    }
    @Test public void rejectsXmlEntityDefinitions() {
        assertThrows(IOException.class, () -> dav().parseListing(bytes("<!DOCTYPE x [<!ENTITY x SYSTEM 'file:///etc/passwd'>]><x>&x;</x>"), config.root));
    }
    @Test public void rejectsOversizedListing() {
        assertThrows(IOException.class, () -> dav().parseListing(new byte[WebDav.MAX_LISTING_BYTES + 1], config.root));
    }
    @Test public void scanUsesPropfindAndKnownSize() throws Exception {
        byte[] body = bytes(listing("/music/song.mp3", "<d:getcontentlength>1024</d:getcontentlength><d:getetag>&quot;v1&quot;</d:getetag>"));
        server.createContext("/music/", exchange -> {
            requests.incrementAndGet();
            assertEquals("PROPFIND", exchange.getRequestMethod());
            assertEquals("1", exchange.getRequestHeaders().getFirst("Depth"));
            assertEquals(config.authorization(), exchange.getRequestHeaders().getFirst("Authorization"));
            while (exchange.getRequestBody().read() != -1) { }
            exchange.sendResponseHeaders(207, body.length);
            try (OutputStream out = exchange.getResponseBody()) { out.write(body); }
        });
        List<RemoteTrack> tracks = dav().scan();
        assertEquals(1, tracks.size()); assertEquals(1024, tracks.get(0).size); assertEquals(1, requests.get());
    }
    @Test public void rejectsUnknownAudioSize() {
        respond(207, null, bytes(listing("/music/song.mp3", "")));
        assertThrows(IOException.class, () -> dav().scan());
    }
    @Test public void repeatedCookieHeadersDoNotBreakValidListings() throws Exception {
        byte[] body = bytes(listing("/music/song.mp3", "<d:getcontentlength>1024</d:getcontentlength>"));
        server.createContext("/music/", exchange -> {
            exchange.getResponseHeaders().set("Set-Cookie", "first=1\r\nSet-Cookie: second=2");
            exchange.sendResponseHeaders(207, body.length);
            try (OutputStream out = exchange.getResponseBody()) { out.write(body); }
        });
        assertEquals(1, dav().scan().size());
    }
    @Test public void cycleDoesNotRecurse() throws Exception {
        respond(207, null, bytes(listing("/music/", "<d:resourcetype><d:collection/></d:resourcetype>")));
        assertTrue(dav().scan().isEmpty()); assertEquals(1, requests.get());
    }
    @Test public void rangeReadReturnsRequestedBytes() throws Exception {
        respond(206, "bytes 256-287/1024", Arrays.copyOfRange(audio, 256, 288));
        byte[] result = new byte[32];
        assertEquals(32, dav().read(track(), 256, 32, result));
        assertArrayEquals(Arrays.copyOfRange(audio, 256, 288), result);
    }
    @Test public void ignoredRangeNeverReturnsWrongOffset() {
        respond(200, null, audio);
        assertThrows(IOException.class, () -> dav().read(track(), 256, 32, new byte[32]));
    }
    @Test public void rejectsWrongStartEndAndTotal() {
        respond(206, "bytes 0-31/1024", Arrays.copyOfRange(audio, 0, 32));
        assertThrows(IOException.class, () -> dav().read(track(), 256, 32, new byte[32]));
    }
    @Test public void rejectsMissingContentRange() {
        respond(206, null, new byte[32]);
        assertThrows(IOException.class, () -> dav().read(track(), 0, 32, new byte[32]));
    }
    @Test public void crossOriginRedirectDoesNotReceiveCredentials() throws Exception {
        HttpServer other = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        AtomicInteger leaked = new AtomicInteger();
        other.createContext("/", exchange -> { leaked.incrementAndGet(); exchange.sendResponseHeaders(500, -1); exchange.close(); });
        other.start();
        try {
            server.createContext("/music/", exchange -> {
                exchange.getResponseHeaders().set("Location", "http://127.0.0.1:" + other.getAddress().getPort() + "/music/song.mp3");
                exchange.sendResponseHeaders(302, -1); exchange.close();
            });
            assertThrows(IOException.class, () -> dav().read(track(), 0, 32, new byte[32]));
            assertEquals(0, leaked.get());
        } finally { other.stop(0); }
    }
    @Test public void disabledConnectionDoesNotSendRequests() {
        WebDav disabled = new WebDav(config, () -> false);
        assertThrows(IOException.class, disabled::scan);
        assertThrows(IOException.class, () -> disabled.read(track(), 0, 1, new byte[1]));
        assertEquals(0, requests.get());
    }
    @Test public void disablingDuringListingReadDiscardsTheResponse() throws Exception {
        assertCancelledRead(true);
    }
    @Test public void disablingDuringAudioReadDiscardsTheResponse() throws Exception {
        assertCancelledRead(false);
    }
    private void assertCancelledRead(boolean listing) throws Exception {
        AtomicBoolean active = new AtomicBoolean(true);
        CountDownLatch headersSent = new CountDownLatch(1);
        CountDownLatch releaseBody = new CountDownLatch(1);
        byte[] body = listing
                ? bytes(listing("/music/song.mp3", "<d:getcontentlength>1024</d:getcontentlength>"))
                : Arrays.copyOfRange(audio, 0, 32);
        server.createContext("/music/", exchange -> {
            requests.incrementAndGet();
            if (!listing) exchange.getResponseHeaders().set("Content-Range", "bytes 0-31/1024");
            exchange.sendResponseHeaders(listing ? 207 : 206, body.length);
            headersSent.countDown();
            try { assertTrue("Response body was not released", releaseBody.await(5, TimeUnit.SECONDS)); }
            catch (InterruptedException ex) { throw new IOException(ex); }
            exchange.getResponseBody().write(body);
        });
        WebDav client = new WebDav(config, active::get);
        FutureTask<Object> result = new FutureTask<>(() -> listing
                ? client.scan() : client.read(track(), 0, 32, new byte[32]));
        Thread reader = new Thread(result, "cancelled-webdav-read");
        reader.start();
        try {
            assertTrue(headersSent.await(3, TimeUnit.SECONDS));
            long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(3);
            boolean readingBody = false;
            while (!readingBody && System.nanoTime() < deadline) {
                StackTraceElement[] stack = reader.getStackTrace();
                readingBody = Arrays.stream(stack).anyMatch(frame -> frame.getClassName().equals(WebDav.class.getName())
                        && frame.getMethodName().equals(listing ? "copy" : "read"))
                        && Arrays.stream(stack).anyMatch(frame -> frame.getClassName().startsWith("sun.nio.ch.")
                        && (frame.getMethodName().equals("read") || frame.getMethodName().equals("park")));
                if (!readingBody) Thread.sleep(1);
            }
            assertTrue("Client never blocked waiting for the response body", readingBody);
            active.set(false);
            releaseBody.countDown();
            ExecutionException failure = assertThrows(ExecutionException.class, () -> result.get(3, TimeUnit.SECONDS));
            assertTrue(failure.getCause() instanceof IOException);
            assertThrows(IOException.class, () -> client.read(track(), 0, 1, new byte[1]));
            assertEquals(1, requests.get());
        } finally {
            releaseBody.countDown();
            reader.join(3500);
            assertFalse("Cancelled reader did not stop", reader.isAlive());
        }
    }
    @Test public void existingWebDavIdentityIsStable() {
        ServerConnection fixed = new ServerConnection("https://dav.example/music/", "listener", "password");
        assertEquals("69c9982e3b9b594ac959b1dbe52ea983e51813b0859fcdd6b134f6214d4f9be1", new RemoteTrack(fixed, fixed.root.resolve("song.mp3"), 1024, null).id);
    }
    @Test public void oldHashCollisionProducesDifferentTrackIds() {
        RemoteTrack a = new RemoteTrack(config, config.root.resolve("Aa/song.mp3"), 1024, null);
        RemoteTrack b = new RemoteTrack(config, config.root.resolve("BB/song.mp3"), 1024, null);
        assertEquals(a.url.toString().hashCode(), b.url.toString().hashCode());
        assertNotEquals(a.id, b.id);
    }
    @Test public void fileVersionAndAccountChangeIdentity() {
        RemoteTrack a = track();
        assertNotEquals(a.id, new RemoteTrack(config, a.url, a.size, "\"v2\"").id);
        ServerConnection other = new ServerConnection(config.root.toString(), "another-user", "fake-password", true);
        assertNotEquals(a.id, new RemoteTrack(other, a.url, a.size, a.etag).id);
    }
    @Test public void endOfFileDoesNotMakeNetworkRequest() throws Exception {
        assertEquals(0, dav().read(track(), audio.length, 1, new byte[1])); assertEquals(0, requests.get());
    }
    @Test public void protobufMatchesNativeFieldNumbers() throws Exception {
        // QueryResult.files=1, LocalFile.path=1/metadata=2, metadata title/album/artist/duration=1/2/3/4.
        byte[] expected = {10, 16, 10, 1, 112, 18, 11, 10, 1, 116, 18, 1, 97, 26, 1, 114, 32, 42};
        assertArrayEquals(expected, ProtoWriter.encodeFileEntry("p", "t", "a", "r", 42));
    }

    /** Loopback-only fixture usable on the Android unit-test compilation classpath. */
    private static final class HttpServer {
        private final ServerSocket listener;
        private final Map<String, Handler> routes = new java.util.concurrent.ConcurrentHashMap<>();
        private final AtomicReference<Throwable> failure = new AtomicReference<>();
        private Thread worker;

        private HttpServer(InetSocketAddress address, int backlog) throws IOException {
            listener = new ServerSocket();
            listener.bind(address, backlog);
        }
        static HttpServer create(InetSocketAddress address, int backlog) throws IOException {
            return new HttpServer(address, backlog);
        }
        InetSocketAddress getAddress() { return (InetSocketAddress) listener.getLocalSocketAddress(); }
        void createContext(String path, Handler handler) { routes.put(path, handler); }
        void start() {
            worker = new Thread(() -> {
                while (!listener.isClosed()) {
                    try (Socket socket = listener.accept()) {
                        socket.setSoTimeout(3000);
                        Exchange exchange = new Exchange(socket);
                        Handler handler = routes.entrySet().stream()
                                .filter(route -> exchange.path.startsWith(route.getKey()))
                                .max(Comparator.comparingInt(route -> route.getKey().length()))
                                .map(Map.Entry::getValue).orElse(null);
                        if (handler == null) exchange.sendResponseHeaders(404, -1);
                        else handler.handle(exchange);
                    } catch (Throwable ex) {
                        if (!listener.isClosed()) failure.compareAndSet(null, ex);
                    }
                }
            }, "webdav-loopback-test");
            worker.setDaemon(true);
            worker.start();
        }
        void stop(int delay) {
            try {
                listener.close();
                if (worker != null) worker.join(3500);
            } catch (IOException | InterruptedException ex) {
                throw new AssertionError("Could not stop loopback fixture", ex);
            }
            if (worker != null && worker.isAlive()) throw new AssertionError("Loopback fixture did not stop");
            if (failure.get() != null) throw new AssertionError("Loopback fixture failed", failure.get());
        }
    }

    private interface Handler { void handle(Exchange exchange) throws IOException; }

    private static final class Headers extends TreeMap<String, String> {
        Headers() { super(String.CASE_INSENSITIVE_ORDER); }
        String getFirst(String name) { return get(name); }
        void set(String name, String value) { put(name, value); }
    }

    private static final class Exchange {
        private final Socket socket;
        private final String method;
        private final String path;
        private final Headers requestHeaders = new Headers();
        private final Headers responseHeaders = new Headers();
        private final InputStream body;

        Exchange(Socket socket) throws IOException {
            this.socket = socket;
            InputStream input = new BufferedInputStream(socket.getInputStream());
            String[] request = line(input).split(" ");
            if (request.length != 3) throw new IOException("Invalid fixture request line");
            method = request[0]; path = request[1];
            for (String header = line(input); !header.isEmpty(); header = line(input)) {
                int colon = header.indexOf(':');
                if (colon < 1) throw new IOException("Invalid fixture request header");
                requestHeaders.set(header.substring(0, colon), header.substring(colon + 1).trim());
            }
            int length = Integer.parseInt(requestHeaders.getOrDefault("Content-Length", "0"));
            if (length < 0 || length > 16384) throw new IOException("Fixture request body too large");
            byte[] bytes = new byte[length];
            new DataInputStream(input).readFully(bytes);
            body = new ByteArrayInputStream(bytes);
        }
        String getRequestMethod() { return method; }
        Headers getRequestHeaders() { return requestHeaders; }
        Headers getResponseHeaders() { return responseHeaders; }
        InputStream getRequestBody() { return body; }
        OutputStream getResponseBody() throws IOException { return socket.getOutputStream(); }
        void sendResponseHeaders(int status, long length) throws IOException {
            responseHeaders.set("Content-Length", Long.toString(Math.max(0, length)));
            responseHeaders.set("Connection", "close");
            StringBuilder response = new StringBuilder("HTTP/1.1 " + status + " Test\r\n");
            for (Map.Entry<String, String> header : responseHeaders.entrySet()) {
                response.append(header.getKey()).append(": ").append(header.getValue()).append("\r\n");
            }
            response.append("\r\n");
            socket.getOutputStream().write(response.toString().getBytes(StandardCharsets.ISO_8859_1));
            socket.getOutputStream().flush();
        }
        void close() throws IOException { socket.close(); }
        private static String line(InputStream input) throws IOException {
            ByteArrayOutputStream line = new ByteArrayOutputStream();
            while (line.size() < 8192) {
                int value = input.read();
                if (value < 0) throw new EOFException("Incomplete fixture request");
                if (value == '\r') {
                    if (input.read() != '\n') throw new IOException("Invalid fixture line ending");
                    return line.toString("ISO-8859-1");
                }
                line.write(value);
            }
            throw new IOException("Fixture request line too long");
        }
    }

}
