import com.sun.net.httpserver.HttpServer;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;
import local.lunaredge.cast.CastDiagnostics;

public final class CastDiagnosticsTest {
    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress("127.0.0.1", 0), 0);
        server.createContext("/hls", exchange -> {
            byte[] body = "#EXTM3U\n#EXT-X-KEY:METHOD=AES-128,URI=\"http://127.0.0.1/key?secret=PRIVATE_TOKEN\"\nsegment.ts\n".getBytes(StandardCharsets.UTF_8);
            exchange.getResponseHeaders().set("Content-Type", "application/vnd.apple.mpegurl");
            exchange.getResponseHeaders().set("Access-Control-Allow-Origin", "*");
            exchange.sendResponseHeaders(206, body.length);
            exchange.getResponseBody().write(body);
            exchange.close();
        });
        server.createContext("/denied", exchange -> {
            byte[] body = "{\"secret\":\"PRIVATE_TOKEN\"}".getBytes(StandardCharsets.UTF_8);
            exchange.getResponseHeaders().set("Content-Type", "application/json");
            exchange.sendResponseHeaders(403, body.length);
            exchange.getResponseBody().write(body);
            exchange.close();
        });
        server.createContext("/large", exchange -> {
            byte[] body = new byte[8192];
            body[4] = 'f'; body[5] = 't'; body[6] = 'y'; body[7] = 'p';
            exchange.getResponseHeaders().set("Content-Type", "video/mp4; token=PRIVATE_TOKEN");
            exchange.sendResponseHeaders(200, body.length);
            exchange.getResponseBody().write(body);
            exchange.close();
        });
        server.start();
        try {
            String root = "http://127.0.0.1:" + server.getAddress().getPort();
            String hls = CastDiagnostics.probe("Fuente", root + "/hls?secret=PRIVATE_TOKEN");
            require(hls.contains("HTTP 206") && hls.contains("formato HLS") && hls.contains("localhost sí") && hls.contains("cifrado declarado") && hls.contains("CORS abierto"));
            String denied = CastDiagnostics.probe("Fuente", root + "/denied");
            require(denied.contains("HTTP 403") && denied.contains("formato JSON"));
            String mp4 = CastDiagnostics.probe("Fuente", root + "/large");
            require(mp4.contains("muestra 4096 B") && mp4.contains("formato MP4"));
            for (String report : new String[]{hls, denied, mp4}) require(!report.contains("PRIVATE_TOKEN") && !report.contains("http://"));
            System.out.println("OK: diagnóstico HTTP/HLS/MP4, rechazo 403, muestra acotada y ausencia de URL/tokens.");
        } finally { server.stop(0); }
    }
    private static void require(boolean condition) { if (!condition) throw new AssertionError(); }
}
