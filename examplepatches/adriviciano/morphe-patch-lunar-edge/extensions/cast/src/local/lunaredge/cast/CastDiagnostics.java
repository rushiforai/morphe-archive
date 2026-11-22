package local.lunaredge.cast;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

/** Informe acotado: nunca incluye direcciones, consultas, cabeceras privadas ni contenido. */
public final class CastDiagnostics {
    private CastDiagnostics() { }

    public static String probe(String label, String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URI(url).toURL().openConnection();
            connection.setConnectTimeout(6000);
            connection.setReadTimeout(6000);
            connection.setRequestProperty("Range", "bytes=0-4095");
            int code = connection.getResponseCode();
            String type = mime(connection.getContentType());
            String cors = connection.getHeaderField("Access-Control-Allow-Origin");
            InputStream stream = code >= 400 ? connection.getErrorStream() : connection.getInputStream();
            ByteArrayOutputStream sample = new ByteArrayOutputStream();
            if (stream != null) try (InputStream input = stream) {
                byte[] buffer = new byte[1024];
                int count;
                while (sample.size() < 4096 && (count = input.read(buffer, 0, Math.min(buffer.length, 4096 - sample.size()))) != -1) {
                    sample.write(buffer, 0, count);
                }
            }
            byte[] bytes = sample.toByteArray();
            String text = new String(bytes, StandardCharsets.UTF_8).trim();
            boolean hls = text.startsWith("#EXTM3U");
            String format = hls ? "HLS" : bytes.length >= 8 && bytes[4] == 'f' && bytes[5] == 't' && bytes[6] == 'y' && bytes[7] == 'p' ? "MP4" :
                    text.startsWith("<") ? "XML/HTML" : text.startsWith("{") ? "JSON" : "no identificado";
            String result = label + ": HTTP " + code + "; MIME " + type + "; muestra " + bytes.length + " B; formato " + format +
                    "; CORS " + (cors == null ? "ausente" : "*".equals(cors) ? "abierto" : "restringido");
            if (hls) result += "; referencias localhost " + (text.contains("127.0.0.1") || text.toLowerCase(Locale.ROOT).contains("localhost") ? "sí" : "no en la muestra") +
                    "; cifrado " + (text.contains("#EXT-X-KEY:") ? "declarado" : "no en la muestra");
            return result;
        } catch (Exception error) {
            return label + ": " + error.getClass().getSimpleName();
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static String mime(String value) {
        if (value == null) return "ausente";
        String type = value.split(";", 2)[0].trim().toLowerCase(Locale.ROOT);
        // Solo se muestran tipos reconocidos; un servidor no puede volcar texto arbitrario al informe.
        switch (type) {
            case "video/mp4": case "application/vnd.apple.mpegurl": case "application/x-mpegurl":
            case "video/mp2t": case "application/dash+xml": case "text/html": case "application/json":
            case "application/octet-stream": case "text/plain": return type;
            default: return "otro";
        }
    }
}
