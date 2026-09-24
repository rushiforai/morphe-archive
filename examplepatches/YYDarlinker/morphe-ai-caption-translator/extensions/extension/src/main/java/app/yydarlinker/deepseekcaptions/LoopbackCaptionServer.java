package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.net.Uri;
import android.os.SystemClock;
import android.util.Base64;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Private loopback sink for YouTube Auto-translate requests owned by the AI overlay.
 *
 * <p>The native request completes locally and its text is never used for AI output. The AI runtime
 * fetches the source-language track independently, translates around the play head and draws only
 * the translated text in the custom overlay.</p>
 *
 * <p>Renderer ownership is intentionally stronger than a generic empty document. When the source
 * track is available in the existing source cache, the sink mirrors that document's real format,
 * cue count and timing while replacing every cue payload with an invisible character. This gives
 * YouTube's native renderer a structurally valid replacement track at every real cue boundary and
 * evicts source-language text that some builds otherwise keep painted underneath the AI overlay.
 * No extra YouTube request is made here: the sink only waits briefly for the source fetch already
 * started by the AI runtime. If that source is not ready in time, the previous long-lived invisible
 * ownership track remains the closed fallback.</p>
 */
final class LoopbackCaptionServer {
    private static volatile LoopbackCaptionServer instance;
    private static final AtomicInteger THREAD_IDS = new AtomicInteger();
    private static final String INVISIBLE_CUE = "\u2060";
    private static final long STRUCTURAL_SINK_WAIT_MS = 1_600L;
    private static final long STRUCTURAL_SINK_POLL_MS = 35L;

    private final Context context;
    private final ServerSocket server;
    private final ExecutorService workers = Executors.newCachedThreadPool(new ThreadFactory() {
        @Override public Thread newThread(Runnable runnable) {
            Thread thread = new Thread(
                    runnable,
                    "DeepSeekCaptionSink-" + THREAD_IDS.incrementAndGet()
            );
            thread.setDaemon(true);
            return thread;
        }
    });
    private final String secret;
    private volatile String lastMaskedSourceKey = "";
    private volatile String lastFallbackSourceKey = "";

    static LoopbackCaptionServer get(Context context) throws Exception {
        LoopbackCaptionServer local = instance;
        if (local != null && !local.server.isClosed()) return local;
        synchronized (LoopbackCaptionServer.class) {
            local = instance;
            if (local == null || local.server.isClosed()) {
                instance = local = new LoopbackCaptionServer(context.getApplicationContext());
            }
            return local;
        }
    }

    private LoopbackCaptionServer(Context context) throws Exception {
        this.context = context;
        this.secret = randomSecret();
        this.server = new ServerSocket(0, 24, InetAddress.getByName("127.0.0.1"));
        CaptionDiagnostics.mark(context, "SERVER_STARTED", "本机空字幕轨端口 " + server.getLocalPort());
        Thread acceptThread = new Thread(this::acceptLoop, "DeepSeekCaptionLoopback");
        acceptThread.setDaemon(true);
        acceptThread.start();
    }

    String urlFor(String originalUrl) {
        String encoded = Base64.encodeToString(
                originalUrl.getBytes(StandardCharsets.UTF_8),
                Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING
        );
        return "http://127.0.0.1:" + server.getLocalPort() + "/" + secret +
                "/caption?u=" + encoded;
    }

    private void acceptLoop() {
        while (!server.isClosed()) {
            try {
                Socket socket = server.accept();
                workers.execute(() -> handle(socket));
            } catch (Throwable failure) {
                if (!server.isClosed()) {
                    CaptionDiagnostics.mark(
                            context,
                            "SERVER_ACCEPT_ERROR",
                            CaptionDiagnostics.errorDetail(failure)
                    );
                }
            }
        }
    }

    private void handle(Socket socket) {
        try {
            socket.setSoTimeout(5_000);
            BufferedInputStream input = new BufferedInputStream(socket.getInputStream());
            String requestLine = readAsciiLine(input, 32 * 1024);
            if (requestLine == null || requestLine.isEmpty()) {
                writeText(socket, 400, "Bad Request", "empty request", false);
                return;
            }

            String[] requestParts = requestLine.split(" ", 3);
            if (requestParts.length < 2) {
                writeText(socket, 400, "Bad Request", "invalid request line", false);
                return;
            }
            String method = requestParts[0].toUpperCase(Locale.ROOT);
            if (!("GET".equals(method) || "POST".equals(method) || "HEAD".equals(method))) {
                writeText(socket, 405, "Method Not Allowed", "unsupported method", false);
                return;
            }

            Map<String, String> headers = readHeaders(input);
            if ("100-continue".equalsIgnoreCase(headers.get("expect"))) {
                OutputStream output = socket.getOutputStream();
                output.write("HTTP/1.1 100 Continue\r\n\r\n".getBytes(StandardCharsets.US_ASCII));
                output.flush();
            }
            drainBody(input, headers);

            String target = requestParts[1];
            int queryIndex = target.indexOf('?');
            String path = queryIndex >= 0 ? target.substring(0, queryIndex) : target;
            if (!("/" + secret + "/caption").equals(path)) {
                writeText(socket, 404, "Not Found", "not found", "HEAD".equals(method));
                return;
            }

            String rawQuery = queryIndex >= 0 ? target.substring(queryIndex + 1) : "";
            String encoded = queryValue(rawQuery, "u");
            if (encoded == null || encoded.length() > 24 * 1024) {
                writeText(socket, 400, "Bad Request", "missing caption url", "HEAD".equals(method));
                return;
            }
            String translatedUrl = new String(
                    Base64.decode(
                            URLDecoder.decode(encoded, "UTF-8"),
                            Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING
                    ),
                    StandardCharsets.UTF_8
            );
            if (!DeepSeekCaptionHook.isAutoTranslatedCaptionUrl(translatedUrl)) {
                writeText(socket, 403, "Forbidden", "invalid caption url", "HEAD".equals(method));
                return;
            }

            EmptyTrack track = ownershipTrackFor(translatedUrl);
            write(socket, 200, "OK", track.contentType, track.body, "HEAD".equals(method));
        } catch (Throwable failure) {
            CaptionDiagnostics.mark(context, "BRIDGE_ERROR", CaptionDiagnostics.errorDetail(failure));
            // Stay closed even on errors. A real invisible cue is preferable to events=[] because
            // the latter can leave an already-loaded native source cue painted on some builds.
            try {
                byte[] body = jsonOwnershipTrack();
                write(socket, 200, "OK", "application/json; charset=utf-8", body, false);
            } catch (Throwable ignored) {
            }
        } finally {
            try { socket.close(); } catch (Throwable ignored) {}
        }
    }

    /**
     * Prefer a format- and timing-identical mirror of the real source track. The source is not
     * fetched here; DynamicCaptionController has already started RawCaptionSource.load(), which
     * writes the successful provider bytes to SourceCaptionCache before any AI request. Waiting on
     * that cache avoids a second YouTube request and keeps the renderer sink isolated from the
     * translation scheduler.
     */
    private EmptyTrack ownershipTrackFor(String translatedUrl) {
        String sourceKey = "";
        try {
            String sourceUrl = CaptionEngine.sourceCaptionUrl(translatedUrl);
            sourceKey = SourceCaptionCache.key(sourceUrl);
            SourceCaptionCache.Entry source = SourceCaptionCache.get(context, sourceKey);
            long deadline = SystemClock.elapsedRealtime() + STRUCTURAL_SINK_WAIT_MS;
            while (source == null && SystemClock.elapsedRealtime() < deadline) {
                try { Thread.sleep(STRUCTURAL_SINK_POLL_MS); }
                catch (InterruptedException interrupted) {
                    Thread.currentThread().interrupt();
                    break;
                }
                source = SourceCaptionCache.get(context, sourceKey);
            }

            if (source != null) {
                EmptyTrack masked = maskSourceTrack(source.body, source.contentType);
                if (masked != null) {
                    if (!sourceKey.equals(lastMaskedSourceKey)) {
                        lastMaskedSourceKey = sourceKey;
                        CaptionDiagnostics.mark(
                                context,
                                "NATIVE_RENDERER_MASKED",
                                "原生 renderer 已接管同格式、同时间轴的不可见镜像轨；源字幕不会与 AI 叠加"
                        );
                    }
                    return masked;
                }
            }
        } catch (Throwable failure) {
            if (!sourceKey.equals(lastFallbackSourceKey)) {
                lastFallbackSourceKey = sourceKey;
                CaptionDiagnostics.mark(
                        context,
                        "NATIVE_RENDERER_MASK_FALLBACK",
                        "原轨镜像不可用，退回不可见 ownership 轨：" +
                                CaptionDiagnostics.errorDetail(failure)
                );
            }
            return emptyTrackFor(translatedUrl);
        }

        if (!sourceKey.equals(lastFallbackSourceKey)) {
            lastFallbackSourceKey = sourceKey;
            CaptionDiagnostics.mark(
                    context,
                    "NATIVE_RENDERER_MASK_FALLBACK",
                    "原轨尚未在短等待窗口内就绪，退回不可见 ownership 轨"
            );
        }
        return emptyTrackFor(translatedUrl);
    }

    private static EmptyTrack maskSourceTrack(byte[] body, String contentType) throws Exception {
        CaptionDocument.Parsed parsed = CaptionDocument.parse(body, contentType);
        int cueCount = parsed.texts().size();
        if (cueCount <= 0) return null;

        List<String> invisible = Collections.nCopies(cueCount, INVISIBLE_CUE);
        byte[] masked = parsed.render(invisible);

        // JSON3 ASR tracks can carry incremental aAppend events that CaptionDocument deliberately
        // excludes from semantic translation. They still belong to YouTube's native renderer, so
        // scrub every segment after the ordinary cue render to ensure no source word can leak.
        masked = maskAllJsonSegments(masked);
        return new EmptyTrack(parsed.contentType(), masked);
    }

    private static byte[] maskAllJsonSegments(byte[] body) {
        if (body == null || body.length == 0) return body;
        try {
            String text = new String(body, StandardCharsets.UTF_8);
            String trimmed = text.trim();
            if (!trimmed.startsWith("{") || !trimmed.contains("\"events\"")) return body;

            JSONObject root = new JSONObject(text);
            JSONArray events = root.optJSONArray("events");
            if (events == null) return body;
            boolean changed = false;
            for (int i = 0; i < events.length(); i++) {
                JSONObject event = events.optJSONObject(i);
                if (event == null) continue;
                JSONArray segments = event.optJSONArray("segs");
                if (segments == null || segments.length() == 0) continue;
                JSONObject first = segments.optJSONObject(0);
                if (first == null) {
                    first = new JSONObject();
                    segments.put(0, first);
                }
                first.put("utf8", INVISIBLE_CUE);
                for (int j = 1; j < segments.length(); j++) {
                    JSONObject segment = segments.optJSONObject(j);
                    if (segment != null) segment.put("utf8", "");
                }
                changed = true;
            }
            return changed
                    ? root.toString().getBytes(StandardCharsets.UTF_8)
                    : body;
        } catch (Throwable ignored) {
            return body;
        }
    }

    private static EmptyTrack emptyTrackFor(String translatedUrl) {
        String format = "";
        try {
            String value = Uri.parse(translatedUrl).getQueryParameter("fmt");
            if (value != null) format = value.toLowerCase(Locale.ROOT);
        } catch (Throwable ignored) {
        }

        if (format.contains("json")) {
            return new EmptyTrack(
                    "application/json; charset=utf-8",
                    jsonOwnershipTrack()
            );
        }
        if (format.contains("vtt")) {
            return new EmptyTrack(
                    "text/vtt; charset=utf-8",
                    ("WEBVTT\n\n00:00.000 --> 99:59:59.999\n" + INVISIBLE_CUE + "\n\n")
                            .getBytes(StandardCharsets.UTF_8)
            );
        }
        if (format.startsWith("srv") || format.contains("ttml")) {
            return new EmptyTrack(
                    "application/xml; charset=utf-8",
                    ("<?xml version=\"1.0\" encoding=\"utf-8\"?>" +
                            "<timedtext format=\"3\"><body><p t=\"0\" d=\"360000000\">" +
                            "<s>&#8288;</s></p></body></timedtext>")
                            .getBytes(StandardCharsets.UTF_8)
            );
        }
        return new EmptyTrack(
                "application/xml; charset=utf-8",
                ("<?xml version=\"1.0\" encoding=\"utf-8\"?>" +
                        "<transcript><text start=\"0\" dur=\"360000\">&#8288;</text></transcript>")
                        .getBytes(StandardCharsets.UTF_8)
        );
    }

    private static byte[] jsonOwnershipTrack() {
        return ("{\"wireMagic\":\"pb3\",\"events\":[{" +
                "\"tStartMs\":0,\"dDurationMs\":360000000," +
                "\"segs\":[{\"utf8\":\"\\u2060\"}]}]}")
                .getBytes(StandardCharsets.UTF_8);
    }

    private static Map<String, String> readHeaders(BufferedInputStream input) throws Exception {
        Map<String, String> headers = new HashMap<>();
        for (int i = 0; i < 100; i++) {
            String line = readAsciiLine(input, 32 * 1024);
            if (line == null || line.isEmpty()) break;
            int colon = line.indexOf(':');
            if (colon <= 0) continue;
            headers.put(
                    line.substring(0, colon).trim().toLowerCase(Locale.ROOT),
                    line.substring(colon + 1).trim()
            );
        }
        return headers;
    }

    private static void drainBody(BufferedInputStream input, Map<String, String> headers)
            throws Exception {
        String transferEncoding = headers.get("transfer-encoding");
        if (transferEncoding != null && transferEncoding.toLowerCase(Locale.ROOT).contains("chunked")) {
            long total = 0;
            while (true) {
                String sizeLine = readAsciiLine(input, 1024);
                if (sizeLine == null) return;
                int semicolon = sizeLine.indexOf(';');
                int size = Integer.parseInt(
                        (semicolon >= 0 ? sizeLine.substring(0, semicolon) : sizeLine).trim(),
                        16
                );
                if (size == 0) {
                    while (true) {
                        String trailer = readAsciiLine(input, 4096);
                        if (trailer == null || trailer.isEmpty()) return;
                    }
                }
                total += size;
                if (total > 4L * 1024L * 1024L) throw new IllegalStateException("request body too large");
                skipFully(input, size);
                readAsciiLine(input, 4);
            }
        }

        String length = headers.get("content-length");
        if (length == null || length.isEmpty()) return;
        long count = Long.parseLong(length);
        if (count < 0 || count > 4L * 1024L * 1024L) {
            throw new IllegalStateException("request body too large");
        }
        skipFully(input, count);
    }

    private static void skipFully(BufferedInputStream input, long count) throws Exception {
        long remaining = count;
        byte[] buffer = new byte[8192];
        while (remaining > 0) {
            int read = input.read(buffer, 0, (int) Math.min(buffer.length, remaining));
            if (read < 0) throw new IllegalStateException("unexpected end of request body");
            remaining -= read;
        }
    }

    private static String readAsciiLine(BufferedInputStream input, int maximum) throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        while (output.size() < maximum) {
            int value = input.read();
            if (value < 0) return output.size() == 0 ? null : output.toString("US-ASCII");
            if (value == '\n') break;
            if (value != '\r') output.write(value);
        }
        if (output.size() >= maximum) throw new IllegalStateException("HTTP line too long");
        return output.toString("US-ASCII");
    }

    private static String queryValue(String rawQuery, String key) {
        for (String part : rawQuery.split("&", -1)) {
            int equals = part.indexOf('=');
            String rawKey = equals < 0 ? part : part.substring(0, equals);
            String decodedKey;
            try { decodedKey = URLDecoder.decode(rawKey, "UTF-8"); }
            catch (Throwable ignored) { decodedKey = rawKey; }
            if (key.equals(decodedKey)) return equals < 0 ? "" : part.substring(equals + 1);
        }
        return null;
    }

    private static void writeText(
            Socket socket,
            int status,
            String reason,
            String text,
            boolean headOnly
    ) throws Exception {
        write(
                socket,
                status,
                reason,
                "text/plain; charset=utf-8",
                text.getBytes(StandardCharsets.UTF_8),
                headOnly
        );
    }

    private static void write(
            Socket socket,
            int status,
            String reason,
            String contentType,
            byte[] body,
            boolean headOnly
    ) throws Exception {
        String headers = "HTTP/1.1 " + status + " " + reason + "\r\n" +
                "Content-Type: " + sanitizeHeader(contentType) + "\r\n" +
                "Content-Length: " + body.length + "\r\n" +
                "Cache-Control: no-store\r\n" +
                "Connection: close\r\n\r\n";
        OutputStream output = socket.getOutputStream();
        output.write(headers.getBytes(StandardCharsets.US_ASCII));
        if (!headOnly) output.write(body);
        output.flush();
    }

    private static String sanitizeHeader(String value) {
        if (value == null || value.isEmpty()) return "application/octet-stream";
        return value.replace("\r", "").replace("\n", "");
    }

    private static String randomSecret() {
        byte[] bytes = new byte[16];
        new SecureRandom().nextBytes(bytes);
        return Base64.encodeToString(bytes, Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);
    }

    private static final class EmptyTrack {
        final String contentType;
        final byte[] body;

        EmptyTrack(String contentType, byte[] body) {
            this.contentType = contentType;
            this.body = body;
        }
    }
}
