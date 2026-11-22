import com.sun.net.httpserver.HttpServer;
import java.net.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicInteger;
import local.lunaredge.cast.CastRelay;

/** Comprueba recargas HLS y fragmentos nuevos después de treinta segundos reales. */
public final class CastRelayStreamingTest {
    private static String read(String url) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setConnectTimeout(4000); c.setReadTimeout(4000);
        try (InputStream in = c.getInputStream()) { return new String(in.readAllBytes(), StandardCharsets.UTF_8); }
        finally { c.disconnect(); }
    }
    public static void main(String[] args) throws Exception {
        AtomicInteger generation = new AtomicInteger();
        HttpServer origin = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        origin.createContext("/stream.m3u8", e -> {
            int index = generation.incrementAndGet();
            byte[] body = ("#EXTM3U\n#EXT-X-TARGETDURATION:3\n#EXT-X-MEDIA-SEQUENCE:" + index + "\n#EXTINF:3,\nsegment/" + index + "\n").getBytes(StandardCharsets.UTF_8);
            e.getResponseHeaders().set("Content-Type", "application/vnd.apple.mpegurl");
            e.sendResponseHeaders(200, body.length); e.getResponseBody().write(body); e.close();
        });
        origin.createContext("/segment/", e -> {
            byte[] body = e.getRequestURI().getPath().getBytes(StandardCharsets.UTF_8);
            e.sendResponseHeaders(200, body.length); e.getResponseBody().write(body); e.close();
        });
        origin.start();
        long started = System.nanoTime();
        try (CastRelay relay = new CastRelay(InetAddress.getByName("127.0.0.1"), InetAddress.getByName("127.0.0.1"))) {
            String url = relay.url("http://127.0.0.1:" + origin.getAddress().getPort() + "/stream.m3u8");
            for (int i = 1; i <= 15; i++) {
                String playlist = read(url);
                String segment = playlist.lines().filter(s -> s.startsWith("http://")).findFirst().orElseThrow();
                if (!read(segment).equals("/segment/" + i)) throw new AssertionError("Lista congelada o segmento no actualizado");
                if (i < 15) Thread.sleep(3000);
            }
            long seconds = (System.nanoTime() - started) / 1000000000;
            if (seconds < 40 || generation.get() != 15) throw new AssertionError("Prueba demasiado corta");
            System.out.println("OK: " + seconds + " segundos, 15 listas actualizadas y 15 fragmentos nuevos. " + relay.report());
        } finally { origin.stop(0); }
    }
}
