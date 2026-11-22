import com.sun.net.httpserver.HttpServer;
import java.net.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.regex.*;
import local.lunaredge.cast.CastRelay;

public final class CastRelayTest {
    private static void require(boolean ok) { if (!ok) throw new AssertionError(); }
    private static String read(HttpURLConnection c) throws Exception { try (InputStream in = c.getInputStream()) { return new String(in.readAllBytes(), StandardCharsets.UTF_8); } }
    private static HttpURLConnection get(String url) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setRequestProperty("Origin", "https://www.gstatic.com");
        return c;
    }
    public static void main(String[] args) throws Exception {
        System.setProperty("sun.net.http.allowRestrictedHeaders", "true");
        HttpServer origin = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        final String root = "http://127.0.0.1:" + origin.getAddress().getPort();
        origin.createContext("/master.m3u8", e -> {
            byte[] data = ("#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=1\nvideo.m3u8?token=PRIVATE_TOKEN\n").getBytes(StandardCharsets.UTF_8);
            e.getResponseHeaders().set("Content-Type", "application/vnd.apple.mpegurl");
            e.sendResponseHeaders(206, data.length); e.getResponseBody().write(data); e.close();
        });
        origin.createContext("/video.m3u8", e -> {
            byte[] data = ("#EXTM3U\n#EXT-X-KEY:METHOD=AES-128,URI=\"" + root + "/key\"\n#EXT-X-MAP:URI=\"init.mp4\"\n#EXTINF:2,\nsegment.ts?token=PRIVATE_TOKEN\n").getBytes(StandardCharsets.UTF_8);
            e.getResponseHeaders().set("Content-Type", "application/vnd.apple.mpegurl");
            e.sendResponseHeaders(200, data.length); e.getResponseBody().write(data); e.close();
        });
        origin.createContext("/segment.ts", e -> {
            if (!"token=PRIVATE_TOKEN".equals(e.getRequestURI().getRawQuery())) throw new AssertionError("Consulta perdida");
            if ("HEAD".equals(e.getRequestMethod())) { e.getResponseHeaders().set("Content-Length", "4"); e.sendResponseHeaders(200, -1); e.close(); return; }
            byte[] data = new byte[]{1,2,3,4};
            if ("bytes=1-2".equals(e.getRequestHeaders().getFirst("Range"))) {
                data = new byte[]{2,3}; e.getResponseHeaders().set("Content-Range", "bytes 1-2/4");
                e.sendResponseHeaders(206, 2);
            } else e.sendResponseHeaders(200, 4);
            e.getResponseBody().write(data); e.close();
        });
        origin.createContext("/key", e -> { e.sendResponseHeaders(200, 16); e.getResponseBody().write(new byte[16]); e.close(); });
        origin.createContext("/denied", e -> { e.sendResponseHeaders(403, -1); e.close(); });
        origin.start();
        try (CastRelay relay = new CastRelay(InetAddress.getByName("127.0.0.1"), InetAddress.getByName("127.0.0.1"))) {
            HttpURLConnection direct = get(root + "/master.m3u8");
            require(direct.getHeaderField("Access-Control-Allow-Origin") == null); direct.disconnect();
            String url = relay.url(root + "/master.m3u8");
            HttpURLConnection master = get(url);
            require("https://www.gstatic.com".equals(master.getHeaderField("Access-Control-Allow-Origin")));
            require(master.getResponseCode() == 200);
            String playlist = read(master); master.disconnect();
            require(!playlist.contains("PRIVATE_TOKEN") && !playlist.contains("video.m3u8?"));
            String child = playlist.lines().filter(s -> s.startsWith("http")).findFirst().orElseThrow();
            String video = read(get(child));
            require(!video.contains("PRIVATE_TOKEN") && !video.contains(root));
            Matcher key = Pattern.compile("URI=\"([^\"]+)\"").matcher(video);
            require(key.find()); require(read(get(key.group(1))).length() == 16);
            require(key.find() && !key.group(1).contains("init.mp4"));
            String segment = video.lines().filter(s -> s.startsWith("http")).findFirst().orElseThrow();
            HttpURLConnection partial = get(segment); partial.setRequestProperty("Range", "bytes=1-2");
            require(partial.getResponseCode() == 206 && "bytes 1-2/4".equals(partial.getHeaderField("Content-Range")));
            require(read(partial).equals("\u0002\u0003")); partial.disconnect();
            HttpURLConnection options = get(url); options.setRequestMethod("OPTIONS");
            require(options.getResponseCode() == 204 && options.getHeaderField("Access-Control-Allow-Headers").contains("Range")); options.disconnect();
            HttpURLConnection head = get(segment); head.setRequestMethod("HEAD"); require(head.getResponseCode() == 200); head.disconnect();
            HttpURLConnection unknown = get(url.replace("/r0", "/unknown")); require(unknown.getResponseCode() == 404); unknown.disconnect();
            HttpURLConnection denied = get(relay.url(root + "/denied"));
            require(denied.getResponseCode() == 403 && denied.getHeaderField("Access-Control-Allow-Origin") != null); denied.disconnect();
            require(relay.report().contains("listas 2") && !relay.report().contains("PRIVATE_TOKEN"));
            require(relay.report().contains("último fallo HTTP_403"));
            // Una preconexión de la TV sin HTTP no equivale a un error del flujo de vídeo.
            try (Socket idle = new Socket("127.0.0.1", new URL(url).getPort())) { }
            long deadline = System.nanoTime() + 2000000000L;
            while (relay.report().contains("conexiones sin petición 0") && System.nanoTime() < deadline) Thread.sleep(10);
            require(!relay.report().contains("conexiones sin petición 0") && relay.report().contains("fallos 1;"));
            try (CastRelay restricted = new CastRelay(InetAddress.getByName("127.0.0.1"), InetAddress.getByName("127.0.0.2"))) {
                HttpURLConnection blocked = get(restricted.url(root + "/master.m3u8"));
                try { blocked.getResponseCode(); throw new AssertionError("Aceptó otro dispositivo"); }
                catch (IOException expected) { } finally { blocked.disconnect(); }
            }
            System.out.println("OK: origen HLS sin CORS; relay añade CORS, reescribe listas/URI/consultas, sirve claves, Range, OPTIONS y HEAD.");
        } finally { origin.stop(0); }
    }
}
