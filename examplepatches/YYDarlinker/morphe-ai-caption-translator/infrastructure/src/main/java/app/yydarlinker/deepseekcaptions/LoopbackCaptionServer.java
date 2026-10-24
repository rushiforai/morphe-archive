package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.net.Uri;
import android.util.Base64;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Private loopback sink for the requests of YouTube's own auto-translated captions.
 *
 * <p>The native request is answered here and its text is never shown: the AI runtime fetches the
 * source track itself, translates around the play head and draws the translation in the overlay.
 * What the sink answers with is a track that has the format, cue count and timing of the real
 * source track (read from the source cache, where the AI runtime has put it; nothing is fetched
 * here) and an invisible character as the text of every cue. The native renderer is then
 * structurally satisfied at every cue boundary, and no source text stays painted under the overlay.
 * When the source is not in the cache yet, one long invisible cue of the requested format answers
 * at once; the next request uses the mirror as soon as the runtime has written it.
 */
final class LoopbackCaptionServer {
    private static final AtomicInteger THREAD_IDS = new AtomicInteger();
    private static final String INVISIBLE_CUE = "\u2060";
    private static final int MAX_LINE = 32 * 1024;
    private static final long MAX_BODY = 4L * 1024L * 1024L;
    private static final int MAX_ENCODED_URL = 24 * 1024;
    private static final String JSON_TYPE = "application/json; charset=utf-8";
    private static final String XML_TYPE = "application/xml; charset=utf-8";

    private static volatile LoopbackCaptionServer instance;

    private final Context context;
    private final ServerSocket server;
    private final String secret;
    private final ExecutorService workers =
            Executors.newCachedThreadPool(
                    runnable -> {
                        Thread thread =
                                new Thread(
                                        runnable,
                                        "DeepSeekCaptionSink-" + THREAD_IDS.incrementAndGet());
                        thread.setDaemon(true);
                        return thread;
                    });
    private volatile String lastMaskedSourceKey = "";
    private volatile String lastFallbackSourceKey = "";

    /** What the sink answers with. */
    private static final class Track {
        final String contentType;
        final byte[] body;

        Track(String contentType, byte[] body) {
            this.contentType = contentType;
            this.body = body;
        }

        static Track of(String contentType, String body) {
            return new Track(contentType, body.getBytes(StandardCharsets.UTF_8));
        }
    }

    static LoopbackCaptionServer get(Context context) throws IOException {
        LoopbackCaptionServer local = instance;
        if (local != null && !local.server.isClosed()) return local;
        synchronized (LoopbackCaptionServer.class) {
            local = instance;
            if (local == null || local.server.isClosed())
                instance = local = new LoopbackCaptionServer(context.getApplicationContext());
            return local;
        }
    }

    private LoopbackCaptionServer(Context context) throws IOException {
        this.context = context;
        byte[] random = new byte[16];
        new SecureRandom().nextBytes(random);
        secret = base64(random);
        server = new ServerSocket(0, 24, InetAddress.getByName("127.0.0.1"));
        CaptionDiagnostics.mark(
                context,
                "SERVER_STARTED",
                "Local empty-caption track port " + server.getLocalPort());
        Thread acceptor = new Thread(this::acceptLoop, "DeepSeekCaptionLoopback");
        acceptor.setDaemon(true);
        acceptor.start();
    }

    private static String base64(byte[] bytes) {
        return Base64.encodeToString(bytes, Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);
    }

    /** The address on which the sink answers instead of [originalUrl]. */
    String urlFor(String originalUrl) {
        return "http://127.0.0.1:"
                + server.getLocalPort()
                + "/"
                + secret
                + "/caption?u="
                + base64(originalUrl.getBytes(StandardCharsets.UTF_8));
    }

    private void acceptLoop() {
        while (!server.isClosed()) {
            try {
                Socket socket = server.accept();
                workers.execute(() -> handle(socket));
            } catch (Throwable failure) {
                if (!server.isClosed())
                    CaptionDiagnostics.mark(
                            context,
                            "SERVER_ACCEPT_ERROR",
                            CaptionDiagnostics.errorDetail(failure));
            }
        }
    }

    private void handle(Socket socket) {
        try (socket) {
            socket.setSoTimeout(5_000);
            try {
                answer(socket);
            } catch (Reject refused) {
                respond(
                        socket,
                        refused.status,
                        refused.reason,
                        Track.of("text/plain; charset=utf-8", refused.getMessage()),
                        refused.head);
            } catch (Throwable failure) {
                CaptionDiagnostics.mark(
                        context, "BRIDGE_ERROR", CaptionDiagnostics.errorDetail(failure));
                // Even an error answers with a real invisible cue: an empty list of events can
                // leave a source cue that was loaded earlier painted on some builds.
                respond(socket, 200, "OK", Track.of(JSON_TYPE, jsonTrack()), false);
            }
        } catch (IOException ignored) {
            // The caller is gone.
        }
    }

    private void answer(Socket socket) throws Exception {
        BufferedInputStream input = new BufferedInputStream(socket.getInputStream());
        String requestLine = readLine(input, MAX_LINE);
        if (requestLine == null || requestLine.isEmpty())
            throw new Reject(400, "Bad Request", "empty request", false);
        String[] parts = requestLine.split(" ", 3);
        if (parts.length < 2) throw new Reject(400, "Bad Request", "invalid request line", false);
        String method = parts[0].toUpperCase(Locale.ROOT);
        if (!method.equals("GET") && !method.equals("POST") && !method.equals("HEAD"))
            throw new Reject(405, "Method Not Allowed", "unsupported method", false);
        boolean head = method.equals("HEAD");

        Map<String, String> headers = readHeaders(input);
        if ("100-continue".equalsIgnoreCase(headers.get("expect"))) {
            OutputStream output = socket.getOutputStream();
            output.write("HTTP/1.1 100 Continue\r\n\r\n".getBytes(StandardCharsets.US_ASCII));
            output.flush();
        }
        drainBody(input, headers);

        String target = parts[1];
        int query = target.indexOf('?');
        String path = query >= 0 ? target.substring(0, query) : target;
        if (!path.equals("/" + secret + "/caption"))
            throw new Reject(404, "Not Found", "not found", head);
        String encoded = queryValue(query >= 0 ? target.substring(query + 1) : "", "u");
        if (encoded == null || encoded.length() > MAX_ENCODED_URL)
            throw new Reject(400, "Bad Request", "missing caption url", head);
        String url =
                new String(
                        Base64.decode(
                                URLDecoder.decode(encoded, "UTF-8"),
                                Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING),
                        StandardCharsets.UTF_8);
        if (!DeepSeekCaptionHook.isAutoTranslatedCaptionUrl(url))
            throw new Reject(403, "Forbidden", "invalid caption url", head);
        respond(socket, 200, "OK", trackFor(url), head);
    }

    /** A request that is refused with a plain-text answer. */
    private static final class Reject extends Exception {
        final int status;
        final String reason;
        final boolean head;

        Reject(int status, String reason, String text, boolean head) {
            super(text);
            this.status = status;
            this.reason = reason;
            this.head = head;
        }
    }

    /** The mirror of the real source track, or the fallback of the requested format. */
    private Track trackFor(String translatedUrl) {
        String sourceKey = "";
        String failure = "Source track mirror is not ready";
        try {
            sourceKey = SourceCaptionCache.key(CaptionUrls.sourceCaptionUrl(translatedUrl));
            SourceCaptionCache.Entry source = SourceCaptionCache.get(context, sourceKey);
            Track masked = source == null ? null : mask(source.body, source.contentType);
            if (masked != null) {
                if (!sourceKey.equals(lastMaskedSourceKey)) {
                    lastMaskedSourceKey = sourceKey;
                    CaptionDiagnostics.mark(
                            context,
                            "NATIVE_RENDERER_MASKED",
                            "Native renderer owns an invisible mirror track with matching format"
                                    + " and timing; source captions will not overlap AI captions");
                }
                return masked;
            }
        } catch (Throwable error) {
            failure = "Source-track mirror unavailable: " + CaptionDiagnostics.errorDetail(error);
        }
        if (!sourceKey.equals(lastFallbackSourceKey)) {
            lastFallbackSourceKey = sourceKey;
            CaptionDiagnostics.mark(
                    context,
                    "NATIVE_RENDERER_MASK_FALLBACK",
                    failure + "; falling back to invisible ownership track");
        }
        return fallbackTrack(translatedUrl);
    }

    /** The source track with the same cues and timing, every text replaced by the invisible one. */
    private static Track mask(byte[] body, String contentType) throws Exception {
        CaptionDocument.Parsed parsed = CaptionDocument.parse(body, contentType);
        int cues = parsed.texts().size();
        if (cues <= 0) return null;
        byte[] masked = parsed.render(Collections.nCopies(cues, INVISIBLE_CUE));
        // A JSON3 track of automatic captions also has incremental events that the document does
        // not count as cues. They belong to the native renderer as well, so no segment stays.
        return new Track(parsed.contentType(), maskJsonSegments(masked));
    }

    private static byte[] maskJsonSegments(byte[] body) {
        try {
            String text = new String(body, StandardCharsets.UTF_8);
            if (!text.trim().startsWith("{") || !text.contains("\"events\"")) return body;
            JSONObject root = new JSONObject(text);
            JSONArray events = root.optJSONArray("events");
            if (events == null) return body;
            boolean changed = false;
            for (int i = 0; i < events.length(); i++) {
                JSONObject event = events.optJSONObject(i);
                JSONArray segments = event == null ? null : event.optJSONArray("segs");
                if (segments == null || segments.length() == 0) continue;
                JSONObject first = segments.optJSONObject(0);
                if (first == null) segments.put(0, first = new JSONObject());
                first.put("utf8", INVISIBLE_CUE);
                for (int j = 1; j < segments.length(); j++) {
                    JSONObject segment = segments.optJSONObject(j);
                    if (segment != null) segment.put("utf8", "");
                }
                changed = true;
            }
            return changed ? root.toString().getBytes(StandardCharsets.UTF_8) : body;
        } catch (Throwable invalid) {
            return body;
        }
    }

    private static String jsonTrack() {
        return "{\"wireMagic\":\"pb3\",\"events\":[{\"tStartMs\":0,\"dDurationMs\":360000000,"
                + "\"segs\":[{\"utf8\":\"\\u2060\"}]}]}";
    }

    /** One invisible cue that lasts for the whole video, in the format the request asked for. */
    private static Track fallbackTrack(String translatedUrl) {
        String format = "";
        try {
            String value = Uri.parse(translatedUrl).getQueryParameter("fmt");
            if (value != null) format = value.toLowerCase(Locale.ROOT);
        } catch (RuntimeException ignored) {
            // The default format.
        }
        if (format.contains("json")) return Track.of(JSON_TYPE, jsonTrack());
        if (format.contains("vtt"))
            return Track.of(
                    "text/vtt; charset=utf-8",
                    "WEBVTT\n\n00:00.000 --> 99:59:59.999\n" + INVISIBLE_CUE + "\n\n");
        if (format.startsWith("srv") || format.contains("ttml"))
            return Track.of(
                    XML_TYPE,
                    "<?xml version=\"1.0\" encoding=\"utf-8\"?><timedtext format=\"3\"><body>"
                            + "<p t=\"0\" d=\"360000000\"><s>&#8288;</s></p></body></timedtext>");
        return Track.of(
                XML_TYPE,
                "<?xml version=\"1.0\" encoding=\"utf-8\"?><transcript><text start=\"0\""
                        + " dur=\"360000\">&#8288;</text></transcript>");
    }

    private static Map<String, String> readHeaders(BufferedInputStream input) throws IOException {
        Map<String, String> headers = new HashMap<>();
        for (int i = 0; i < 100; i++) {
            String line = readLine(input, MAX_LINE);
            if (line == null || line.isEmpty()) break;
            int colon = line.indexOf(':');
            if (colon > 0)
                headers.put(
                        line.substring(0, colon).trim().toLowerCase(Locale.ROOT),
                        line.substring(colon + 1).trim());
        }
        return headers;
    }

    /** Reads the body of the request and drops it. */
    private static void drainBody(BufferedInputStream input, Map<String, String> headers)
            throws IOException {
        String encoding = headers.get("transfer-encoding");
        if (encoding != null && encoding.toLowerCase(Locale.ROOT).contains("chunked")) {
            long total = 0;
            for (String size = readLine(input, 1024); size != null; size = readLine(input, 1024)) {
                int semicolon = size.indexOf(';');
                int chunk =
                        Integer.parseInt(
                                (semicolon >= 0 ? size.substring(0, semicolon) : size).trim(), 16);
                if (chunk == 0) {
                    String trailer;
                    do trailer = readLine(input, 4096);
                    while (trailer != null && !trailer.isEmpty());
                    return;
                }
                total += chunk;
                skip(input, chunk, total);
                readLine(input, 4);
            }
            return;
        }
        String length = headers.get("content-length");
        if (length != null && !length.isEmpty()) {
            long count = Long.parseLong(length);
            skip(input, count, count);
        }
    }

    private static void skip(BufferedInputStream input, long count, long total) throws IOException {
        if (count < 0 || total > MAX_BODY) throw new IOException("request body too large");
        byte[] buffer = new byte[8192];
        for (long left = count; left > 0; ) {
            int read = input.read(buffer, 0, (int) Math.min(buffer.length, left));
            if (read < 0) throw new IOException("unexpected end of request body");
            left -= read;
        }
    }

    /** A line of ASCII without its line end; null at the end of the stream. */
    private static String readLine(BufferedInputStream input, int maximum) throws IOException {
        ByteArrayOutputStream line = new ByteArrayOutputStream();
        while (line.size() < maximum) {
            int value = input.read();
            if (value < 0) return line.size() == 0 ? null : line.toString("US-ASCII");
            if (value == '\n') return line.toString("US-ASCII");
            if (value != '\r') line.write(value);
        }
        throw new IOException("HTTP line too long");
    }

    /** The raw, still encoded value of the query parameter [key]. */
    private static String queryValue(String query, String key) {
        for (String part : query.split("&", -1)) {
            int equals = part.indexOf('=');
            String name = equals < 0 ? part : part.substring(0, equals);
            try {
                name = URLDecoder.decode(name, "UTF-8");
            } catch (Exception undecodable) {
                // Compared as it is.
            }
            if (key.equals(name)) return equals < 0 ? "" : part.substring(equals + 1);
        }
        return null;
    }

    private static void respond(
            Socket socket, int status, String reason, Track track, boolean headOnly) {
        String type = track.contentType.replace("\r", "").replace("\n", "");
        String headers =
                "HTTP/1.1 "
                        + status
                        + " "
                        + reason
                        + "\r\nContent-Type: "
                        + type
                        + "\r\nContent-Length: "
                        + track.body.length
                        + "\r\nCache-Control: no-store\r\nConnection: close\r\n\r\n";
        try {
            OutputStream output = socket.getOutputStream();
            output.write(headers.getBytes(StandardCharsets.US_ASCII));
            if (!headOnly) output.write(track.body);
            output.flush();
        } catch (IOException ignored) {
            // The caller is gone.
        }
    }
}
