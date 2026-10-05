package e.e.a;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;

public final class CastRelayTest {
    static final String ROOT = "https://delivery.domand.nicovideo.jp/hls/master.m3u8?signature=private";
    static final Map<String, Fixture> fixtures = new ConcurrentHashMap<>();
    static final List<Mock> opened = Collections.synchronizedList(new ArrayList<>());
    static void check(boolean condition, String message) { if (!condition) throw new AssertionError(message); }
    static Fixture fixture(String url, String body, String type) {
        Fixture f = new Fixture(body.getBytes(StandardCharsets.UTF_8), type); fixtures.put(url, f); return f;
    }
    static class Fixture {
        byte[] body; String type; int status = 200; String location; CountDownLatch block;
        Fixture(byte[] body, String type) { this.body = body; this.type = type; }
    }
    static class Mock extends HttpURLConnection {
        final Fixture f;
        Mock(URL url) { super(url); f = fixtures.get(url.toString()); opened.add(this); }
        public void connect() { }
        public void disconnect() { }
        public boolean usingProxy() { return false; }
        public int getResponseCode() throws IOException {
            if (f == null) throw new IOException("Missing fixture");
            if (f.block != null) try {
                if (!f.block.await(5, TimeUnit.SECONDS)) throw new IOException("Blocked fixture timeout");
            } catch (InterruptedException e) { throw new IOException(e); }
            return getRequestProperty("Range") != null ? 206 : f.status;
        }
        public String getContentType() { return f.type; }
        public String getHeaderField(String key) {
            if (key.equals("Location")) return f.location;
            if (key.equals("Content-Length")) return Integer.toString(getRequestProperty("Range") == null ? f.body.length : 3);
            if (key.equals("Content-Range") && getRequestProperty("Range") != null) return "bytes 2-4/6";
            return null;
        }
        public InputStream getInputStream() { return new ByteArrayInputStream(getRequestProperty("Range") == null ? f.body : Arrays.copyOfRange(f.body, 2, 5)); }
    }
    public static class Server {
        public boolean k;
        public void a(BufferedOutputStream out) throws IOException { out.write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\n{}".getBytes(StandardCharsets.US_ASCII)); }
    }
    public static class Service { public Server n = new Server(); public String i = "http://192.0.2.1:52862/"; public String j = "legacy"; }
    public static class Callback { public Service a; Callback(Service service) { a = service; } }
    static String request(Server relay, String method, String path, String headers) throws Exception {
        try (ServerSocket listener = new ServerSocket(0); Socket client = new Socket("127.0.0.1", listener.getLocalPort()); Socket incoming = listener.accept()) {
            relay.k = true;
            check(CastRelay.dispatch(relay, incoming), "HLS socket handled");
            check(!relay.k, "accept loop gate released immediately");
            client.setSoTimeout(6000);
            client.getOutputStream().write((method + " " + path + " HTTP/1.1\r\nHost: localhost\r\n" + headers + "\r\n").getBytes(StandardCharsets.US_ASCII));
            ByteArrayOutputStream result = new ByteArrayOutputStream(); byte[] buffer = new byte[4096];
            for (int n; (n = client.getInputStream().read(buffer)) != -1;) result.write(buffer, 0, n);
            return new String(result.toByteArray(), StandardCharsets.UTF_8);
        }
    }
    static String body(String response) { return response.substring(response.indexOf("\r\n\r\n") + 4); }
    public static void main(String[] args) throws Exception {
        URL.setURLStreamHandlerFactory(protocol -> "https".equals(protocol) ? new URLStreamHandler() {
            protected URLConnection openConnection(URL url) { return new Mock(url); }
        } : null);
        CastHls hls = new CastHls("domand_bid=one; Path=/");
        String input = "#EXTM3U\n#EXT-X-MEDIA:TYPE=AUDIO,URI=\"/hls/audio.m3u8?q=1\"\n#EXT-X-I-FRAME-STREAM-INF:URI=\"//other.example/i.m3u8\",BANDWIDTH=1\n#EXT-X-STREAM-INF:BANDWIDTH=2\nvideo/main.m3u8\n";
        String changed = hls.rewrite(new URL(ROOT), input);
        check(!changed.contains("https:") && !changed.contains("?q=") && !changed.contains("video/main"), "all master URI forms opaque");
        String video = changed.split("\n")[4];
        check(hls.lookup(video).toString().equals("https://delivery.domand.nicovideo.jp/hls/video/main.m3u8"), "relative variant resolved");
        String media = "#EXTM3U\n#EXT-X-KEY:METHOD=AES-128,URI=\"../key.bin?sig=abc\"\n#EXT-X-MAP:URI=\"/init.mp4\",BYTERANGE=\"6@0\"\n#EXT-X-BYTERANGE:3@2\nhttps://cdn.example/data.m4s?sig=xyz\n#EXT-X-ENDLIST\n";
        String rewritten = hls.rewrite(hls.lookup(video), media);
        check(rewritten.contains("BYTERANGE=\"6@0\"") && rewritten.contains("#EXT-X-BYTERANGE:3@2"), "byte ranges preserved");
        check(!rewritten.contains("sig=") && !rewritten.contains("cdn.example"), "keys, init and absolute segments rewritten");
        check(hls.cookieFor(new URL(ROOT)).equals("domand_bid=one"), "snapshot credential stripped of attributes");
        check(hls.cookieFor(new URL("https://domand.nicovideo.jp/" )).equals("domand_bid=one"), "exact domain credential");
        for (String host : new String[]{"cdn.example", "domand.nicovideo.jp.evil", "evil-domand.nicovideo.jp"})
            check(hls.cookieFor(new URL("https://" + host + "/")).isEmpty(), "credential restricted: " + host);
        check(hls.rewrite(new URL(ROOT), "#EXTM3U\n#EXT-X-KEY:METHOD=AES-128,URI=\"data:text/plain;base64,QQ==\"\n").contains("data:text/plain"), "inline keys retained");
        try { hls.route(new URL("http://delivery.domand.nicovideo.jp/file")); throw new AssertionError("insecure route"); } catch (IOException expected) { }
        try { hls.rewrite(new URL(ROOT), "not a playlist"); throw new AssertionError("invalid playlist"); } catch (IOException expected) { }
        fixture(ROOT, "#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=1\n/hls/main.m3u8\n", "application/vnd.apple.mpegurl");
        fixture("https://delivery.domand.nicovideo.jp/hls/main.m3u8", "#EXTM3U\n#EXT-X-KEY:METHOD=AES-128,URI=\"key.bin\"\n#EXT-X-MAP:URI=\"init.mp4\"\n#EXTINF:1,\nseg.m4s\n#EXT-X-ENDLIST\n", "application/vnd.apple.mpegurl");
        fixture("https://delivery.domand.nicovideo.jp/hls/seg.m4s", "abcdef", "video/mp4");
        fixture("https://delivery.domand.nicovideo.jp/hls/key.bin", "secret-key", "application/octet-stream");
        fixture("https://delivery.domand.nicovideo.jp/hls/init.mp4", "init", "video/mp4");
        Service service = new Service(); Callback callback = new Callback(service);
        ModernPlayback.domandCookie = "domand_bid=snapshot";
        CastRelay.prepare(callback, ROOT); ModernPlayback.domandCookie = "domand_bid=different"; CastRelay.attach(callback);
        String rootPath = new URL(service.j).getPath();
        check(rootPath.startsWith("/cast/") && rootPath.endsWith(".m3u8"), "master route attached before start");
        String master = request(service.n, "GET", rootPath, "");
        check(master.contains("Access-Control-Allow-Origin: *") && master.contains("application/vnd.apple.mpegurl"), "playlist response headers");
        String variant = body(master).split("\n")[2];
        String variantResponse = request(service.n, "GET", variant, "");
        String playlist = body(variantResponse);
        String segment = playlist.split("\n")[4];
        java.util.regex.Matcher attributes = java.util.regex.Pattern.compile("URI=\"([^\"]+)\"").matcher(playlist);
        check(attributes.find() && body(request(service.n, "GET", attributes.group(1), "")).equals("secret-key"), "key transferred through authenticated route");
        check(attributes.find() && body(request(service.n, "GET", attributes.group(1), "")).equals("init"), "initialization transferred through authenticated route");
        String masterHead = request(service.n, "HEAD", rootPath, "");
        check(body(masterHead).isEmpty() && masterHead.contains("Content-Length: " + body(master).getBytes(StandardCharsets.UTF_8).length), "playlist HEAD matches rewritten GET length");
        check(body(request(service.n, "GET", segment, "Range: bytes=2-4\r\n")).equals("cde"), "bounded range transferred");
        String rangeReply = request(service.n, "GET", segment, "Range: bytes=2-4\r\n");
        check(rangeReply.startsWith("HTTP/1.1 206") && rangeReply.contains("Content-Range: bytes 2-4/6"), "partial status and range preserved");
        check(body(request(service.n, "HEAD", segment, "")).isEmpty(), "HEAD has no body");
        check(request(service.n, "OPTIONS", segment, "").startsWith("HTTP/1.1 204"), "CORS preflight");
        check(request(service.n, "GET", "/cast/not-registered", "").startsWith("HTTP/1.1 404"), "unknown route rejected");
        check(request(service.n, "GET", segment, "Range: bytes=1-2,4-5\r\n").startsWith("HTTP/1.1 416"), "unsupported multirange rejected");
        check(body(request(service.n, "GET", "/comment.json", "")).equals("{}"), "original comments preserved");
        for (Mock conn : opened) {
            check(conn.getRequestProperty("Cookie").equals("domand_bid=snapshot"), "per-session cookie used for every resource");
            check(conn.getRequestProperty("Origin").equals("https://www.nicovideo.jp"), "origin added");
        }
        String redirectUrl = "https://delivery.domand.nicovideo.jp/redirect.bin";
        Fixture redirect = fixture(redirectUrl, "", "application/octet-stream"); redirect.status = 302; redirect.location = "https://cdn.example/final.bin";
        fixture(redirect.location, "redirected", "application/octet-stream");
        CastRelay.Session direct = new CastRelay.Session(new URL(ROOT), "domand_bid=redirect");
        try {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream(); direct.transfer(new BufferedOutputStream(bytes), new URL(redirectUrl), false, null);
            check(body(bytes.toString("UTF-8")).equals("redirected"), "redirect followed by relay");
            check(opened.get(opened.size()-1).getRequestProperty("Cookie") == null, "cross-host redirect never leaks credential");
            // A blocked video resource must not prevent an independent audio/playlist request.
            Fixture slow = fixtures.get("https://delivery.domand.nicovideo.jp/hls/seg.m4s"); slow.block = new CountDownLatch(1);
            ExecutorService testWorker = Executors.newSingleThreadExecutor();
            try {
                Future<String> blocked = testWorker.submit(() -> request(service.n, "GET", segment, ""));
                check(request(service.n, "GET", rootPath, "").startsWith("HTTP/1.1 200"), "parallel playlist remains responsive");
                slow.block.countDown(); check(body(blocked.get(6, TimeUnit.SECONDS)).equals("abcdef"), "parallel transfer completes");
            } finally { slow.block.countDown(); testWorker.shutdownNow(); }
        } finally { direct.close(); }
        CastRelay.detach(service.n);
        try (Socket unused = new Socket()) { check(!CastRelay.dispatch(service.n, unused), "detached and legacy server retain original handler"); }
        check(!ModernDebug.messages.toString().contains("snapshot") && !ModernDebug.messages.toString().contains("signature="), "logs exclude credentials and signed URLs");
        System.out.println("Cast relay verified: master/audio/video/key/init URI rewriting, cookie isolation, redirects, GET/HEAD/Range/CORS, comments, concurrent requests and teardown");
    }
}
