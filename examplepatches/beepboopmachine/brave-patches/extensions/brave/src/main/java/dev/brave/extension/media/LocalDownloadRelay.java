package dev.brave.extension.media;

import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.net.Uri;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.function.BiConsumer;
import java.util.function.Consumer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Authenticated loopback-only HTTP relay allowing Brave's native C++ content::DownloadManager
 * (J.N.VOO 0x13) to download Referer/Cookie-protected CDN streams & images with optional
 * WebP->PNG conversion, verified completion reporting, Range support, and adaptive MP4+M4A muxing.
 */
public final class LocalDownloadRelay {
    private static final String TAG = "Brave_DownloadRelay";
    private static final int MAX_WEBP_CONVERT_BYTES = 25 * 1024 * 1024; // 25 MB cap
    private static final int MAX_MUX_SAMPLE_BUFFER_BYTES = 16 * 1024 * 1024; // 16 MB max sample growth
    private static final Pattern CONTENT_RANGE_PATTERN = Pattern.compile("bytes\\s+(\\d+)-(\\d+)/(\\d+|\\*)", Pattern.CASE_INSENSITIVE);
    private static final Pattern REQ_RANGE_PATTERN = Pattern.compile("bytes=(\\d*)-(\\d*)", Pattern.CASE_INSENSITIVE);

    private static final ExecutorService RELAY_POOL = NetworkSafety.newBoundedPool(12, 64, "BraveLocalRelay");
    private static final ExecutorService MUX_DOWNLOAD_POOL = NetworkSafety.newBoundedPool(8, 32, "BraveMuxDl");
    private static final ConcurrentHashMap<String, ServerSocket> ACTIVE_RELAYS = new ConcurrentHashMap<>();

    private LocalDownloadRelay() {}

    public static void stopRelay(final String relayUrl) {
        if (relayUrl == null || relayUrl.isEmpty()) return;
        ServerSocket ss = ACTIVE_RELAYS.remove(relayUrl);
        if (ss != null) {
            try { ss.close(); } catch (Throwable ignored) {}
        }
    }

    public static String startRelay(final MediaItem item, final String filename, final String resolvedMime, final Consumer<Boolean> onComplete) {
        return startRelay(item, filename, resolvedMime, false, onComplete);
    }

    public static String startRelay(
            final MediaItem item,
            final String filename,
            final String resolvedMime,
            final boolean convertWebpToPng,
            final Consumer<Boolean> onComplete
    ) {
        return startRelay(
                item,
                filename,
                resolvedMime,
                convertWebpToPng,
                onComplete != null ? (ok, actualName) -> onComplete.accept(ok) : null
        );
    }

    public static String startRelay(
            final MediaItem item,
            final String filename,
            final String resolvedMime,
            final boolean convertWebpToPng,
            final BiConsumer<Boolean, String> onComplete
    ) {
        return startRelay(item, filename, resolvedMime, convertWebpToPng, null, onComplete);
    }

    public static String startRelay(
            final MediaItem item,
            final String filename,
            final String resolvedMime,
            final boolean convertWebpToPng,
            final Runnable onAuthFallback,
            final BiConsumer<Boolean, String> onComplete
    ) {
        if (item == null || item.url == null || item.url.isEmpty()) return null;
        ServerSocket server = null;
        try {
            server = new ServerSocket(0, 8, InetAddress.getLoopbackAddress());
            server.setSoTimeout(45000);
            final ServerSocket boundServer = server;
            final int port = boundServer.getLocalPort();
            final String authToken = NetworkSafety.generateRandomTokenHex(16);
            final String origSafeName = sanitizePathSegment(filename);
            final String pngCandidateName = (convertWebpToPng && origSafeName.toLowerCase(Locale.ROOT).endsWith(".webp"))
                    ? origSafeName.substring(0, origSafeName.length() - 5) + ".png"
                    : origSafeName;
            final String relayUrl = "http://127.0.0.1:" + port + "/" + authToken + "/" + Uri.encode(pngCandidateName);
            ACTIVE_RELAYS.put(relayUrl, boundServer);

            try {
                RELAY_POOL.execute(() -> {
                    boolean transferSucceeded = false;
                    boolean authFallbackTriggered = false;
                    final String[] finalServedName = new String[]{ origSafeName };
                    try (ServerSocket ss = boundServer) {
                        for (int attempt = 0; attempt < 64; attempt++) {
                            Socket client = null;
                            NetworkSafety.SafeConnection sc = null;
                            boolean finishedTransfer = false;
                            try {
                                client = ss.accept();
                                if (!client.getInetAddress().isLoopbackAddress()) {
                                    client.close();
                                    continue;
                                }
                                client.setSoTimeout(45000);

                                BufferedReader reqReader = new BufferedReader(new InputStreamReader(client.getInputStream(), StandardCharsets.US_ASCII));
                                String reqLine = reqReader.readLine();
                                if (reqLine == null) {
                                    client.close();
                                    continue;
                                }

                                String rangeHeader = null;
                                String line;
                                while ((line = reqReader.readLine()) != null && !line.isEmpty()) {
                                    if (line.toLowerCase(Locale.ROOT).startsWith("range:")) {
                                        rangeHeader = line.substring(6).trim();
                                    }
                                }

                                OutputStream out = client.getOutputStream();
                                String[] parts = reqLine.split(" ");
                                if (parts.length < 2) {
                                    writeSimpleResponse(out, 400, "Bad Request");
                                    continue;
                                }
                                String reqMethod = parts[0].toUpperCase(Locale.ROOT);
                                String reqPath = parts[1];
                                if ((!"GET".equals(reqMethod) && !"HEAD".equals(reqMethod))
                                        || !verifyRelayPathToken(reqPath, authToken)) {
                                    writeSimpleResponse(out, 403, "Forbidden");
                                    continue;
                                }

                                boolean isHead = "HEAD".equals(reqMethod);
                                String targetUpstreamUrl = item.url.replace("\\u0026", "&").replace("\\/", "/");
                                Log.i(TAG, "Chromium connected (" + reqMethod + ") -> " + targetUpstreamUrl);

                                String refPage = (item.pageUrl != null && !item.pageUrl.isEmpty()) ? item.pageUrl : item.referer;
                                sc = NetworkSafety.openSafeConnection(
                                        targetUpstreamUrl,
                                        isHead ? "HEAD" : "GET",
                                        item.userAgent,
                                        item.cookie,
                                        item.cookieSourceUrl,
                                        refPage,
                                        refPage,
                                        (!convertWebpToPng ? rangeHeader : null),
                                        false,
                                        15000,
                                        45000
                                );

                                int code = sc.responseCode;
                                if (code == 200 || code == 206) {
                                    String safeFallbackMime = NetworkSafety.sanitizeMimeType(resolvedMime, "application/octet-stream");
                                    String rawCt = sc.conn.getContentType();
                                    String ct;
                                    if (rawCt == null || rawCt.isEmpty() || rawCt.toLowerCase(Locale.ROOT).contains("octet-stream")) {
                                        ct = safeFallbackMime;
                                    } else {
                                        ct = NetworkSafety.sanitizeMimeType(rawCt, safeFallbackMime);
                                    }

                                    boolean shouldConvert = convertWebpToPng && !isHead
                                            && (ct.toLowerCase(Locale.ROOT).contains("webp")
                                            || targetUpstreamUrl.toLowerCase(Locale.ROOT).contains(".webp"));

                                    if (shouldConvert) {
                                        byte[] rawBytes = NetworkSafety.readBytesBounded(sc.conn.getInputStream(), MAX_WEBP_CONVERT_BYTES);
                                        if (rawBytes == null || rawBytes.length == 0) {
                                            writeSimpleResponse(out, 502, "Empty Upstream Body");
                                            Log.w(TAG, "Relay upstream returned empty body for " + item.url);
                                            break;
                                        }
                                        String outMime = ct;
                                        // Default fallback name preserves original extension (NOT .png!)
                                        String outName = origSafeName;
                                        File pngTempFile = File.createTempFile("webp_png_", ".png");
                                        boolean convertedToFile = false;
                                        try {
                                            convertedToFile = ThumbnailLoader.convertWebpBytesToPngFile(rawBytes, pngTempFile);
                                            if (convertedToFile) {
                                                rawBytes = null; // Release source bytes before streaming PNG file
                                                outMime = "image/png";
                                                outName = pngCandidateName;
                                                if (!outName.toLowerCase(Locale.ROOT).endsWith(".png")) {
                                                    outName = outName + ".png";
                                                }
                                            }
                                            outName = sanitizePathSegment(outName);
                                            long payloadLen = convertedToFile ? pngTempFile.length() : rawBytes.length;
                                            String headers = "HTTP/1.1 200 OK\r\n"
                                                    + "Content-Type: " + NetworkSafety.sanitizeMimeType(outMime, "image/webp") + "\r\n"
                                                    + "Content-Disposition: attachment; filename=\"" + outName + "\"\r\n"
                                                    + "Content-Length: " + payloadLen + "\r\n"
                                                    + "Connection: close\r\n\r\n";
                                            out.write(headers.getBytes(StandardCharsets.UTF_8));
                                            if (convertedToFile) {
                                                try (InputStream pin = new BufferedInputStream(new FileInputStream(pngTempFile), 32 * 1024)) {
                                                    byte[] buf = new byte[32 * 1024];
                                                    int r;
                                                    while ((r = pin.read(buf)) != -1) {
                                                        out.write(buf, 0, r);
                                                    }
                                                }
                                            } else {
                                                out.write(rawBytes);
                                            }
                                            out.flush();
                                            finishedTransfer = true;
                                            transferSucceeded = true;
                                            finalServedName[0] = outName;
                                            Log.i(TAG, "Relay WebP->PNG complete for " + outName + " (" + payloadLen + " bytes)");
                                        } finally {
                                            if (pngTempFile.exists()) pngTempFile.delete();
                                        }
                                    } else {
                                        long contentLength = sc.conn.getContentLengthLong();
                                        if (!isHead && contentLength == 0) {
                                            writeSimpleResponse(out, 502, "Empty Upstream Body");
                                            Log.w(TAG, "Relay upstream Content-Length 0 for " + item.url);
                                            break;
                                        }
                                        String contentRange = NetworkSafety.stripControlChars(sc.conn.getHeaderField("Content-Range"));
                                        boolean rangeCoversEnd = false;
                                        long expectedSliceLen = -1;
                                        if (code == 206) {
                                            Matcher crm = CONTENT_RANGE_PATTERN.matcher(contentRange);
                                            if (!crm.find()) {
                                                writeSimpleResponse(out, 502, "Invalid Content-Range");
                                                Log.w(TAG, "Relay upstream 206 missing/invalid Content-Range: " + contentRange);
                                                break;
                                            }
                                            long crStart = Long.parseLong(crm.group(1));
                                            long crEnd = Long.parseLong(crm.group(2));
                                            if (crEnd < crStart) {
                                                writeSimpleResponse(out, 502, "Invalid Content-Range");
                                                break;
                                            }
                                            expectedSliceLen = (crEnd - crStart) + 1L;
                                            if (contentLength >= 0 && contentLength != expectedSliceLen) {
                                                writeSimpleResponse(out, 502, "Range Length Mismatch");
                                                break;
                                            }
                                            long crTotal = -1;
                                            if (!"*".equals(crm.group(3))) {
                                                crTotal = Long.parseLong(crm.group(3));
                                                if (crEnd >= crTotal) {
                                                    writeSimpleResponse(out, 502, "Range Exceeds Total");
                                                    break;
                                                }
                                                rangeCoversEnd = (crEnd == crTotal - 1);
                                            }
                                            // Validate returned 206 range matches what Chromium actually requested
                                            if (rangeHeader != null && !rangeHeader.isEmpty()) {
                                                Matcher reqM = REQ_RANGE_PATTERN.matcher(rangeHeader.trim());
                                                if (!reqM.matches()) {
                                                    writeSimpleResponse(out, 502, "Unsupported Range Request");
                                                    break;
                                                }
                                                String rs = reqM.group(1);
                                                String re = reqM.group(2);
                                                if (!rs.isEmpty()) {
                                                    long reqStart = Long.parseLong(rs);
                                                    if (crStart != reqStart) {
                                                        writeSimpleResponse(out, 502, "Content-Range Start Mismatch");
                                                        break;
                                                    }
                                                    if (!re.isEmpty()) {
                                                        long reqEnd = Long.parseLong(re);
                                                        if (crEnd > reqEnd) {
                                                            writeSimpleResponse(out, 502, "Content-Range End Mismatch");
                                                            break;
                                                        }
                                                    }
                                                } else if (!re.isEmpty() && crTotal >= 0) {
                                                    long suffix = Long.parseLong(re);
                                                    long expectedSuffixStart = Math.max(0L, crTotal - suffix);
                                                    if (crStart != expectedSuffixStart || crEnd != crTotal - 1) {
                                                        writeSimpleResponse(out, 502, "Content-Range Suffix Mismatch");
                                                        break;
                                                    }
                                                }
                                            }
                                        }

                                        String statusLine = (code == 206) ? "HTTP/1.1 206 Partial Content\r\n" : "HTTP/1.1 200 OK\r\n";
                                        StringBuilder headers = new StringBuilder();
                                        headers.append(statusLine);
                                        headers.append("Content-Type: ").append(ct).append("\r\n");
                                        headers.append("Content-Disposition: attachment; filename=\"").append(origSafeName).append("\"\r\n");
                                        headers.append("Accept-Ranges: bytes\r\n");
                                        if (contentLength >= 0) {
                                            headers.append("Content-Length: ").append(contentLength).append("\r\n");
                                        }
                                        if (!contentRange.isEmpty()) {
                                            headers.append("Content-Range: ").append(contentRange).append("\r\n");
                                        }
                                        headers.append("Connection: close\r\n\r\n");
                                        out.write(headers.toString().getBytes(StandardCharsets.UTF_8));

                                        if (!isHead) {
                                            long totalWritten = 0;
                                            try (InputStream in = new BufferedInputStream(sc.conn.getInputStream(), 64 * 1024)) {
                                                byte[] buf = new byte[64 * 1024];
                                                int n;
                                                while ((n = in.read(buf)) != -1) {
                                                    out.write(buf, 0, n);
                                                    totalWritten += n;
                                                }
                                                out.flush();
                                            }
                                            boolean lengthOk = (code == 206)
                                                    ? (totalWritten == expectedSliceLen && (contentLength < 0 || totalWritten == contentLength))
                                                    : (totalWritten > 0 && (contentLength < 0 || totalWritten == contentLength));
                                            if (lengthOk) {
                                                if (code == 200 || rangeCoversEnd) {
                                                    finishedTransfer = true;
                                                    transferSucceeded = true;
                                                    Log.i(TAG, "Relay stream complete for " + origSafeName + " (" + totalWritten + " bytes)");
                                                } else {
                                                    // Partial 206 chunk delivered; keep relay open for subsequent range requests
                                                    ss.setSoTimeout(45000);
                                                    Log.d(TAG, "Relay served 206 chunk for " + origSafeName + " (" + contentRange + ")");
                                                }
                                            } else {
                                                Log.w(TAG, "Relay length mismatch for " + origSafeName + ": wrote=" + totalWritten
                                                        + " cl=" + contentLength + " expectedSlice=" + expectedSliceLen);
                                                transferSucceeded = false;
                                                break;
                                            }
                                        } else {
                                            out.flush();
                                        }
                                    }
                                } else {
                                    writeSimpleResponse(out, (code == 204) ? 502 : code, "Upstream Error");
                                    Log.w(TAG, "Upstream returned HTTP " + code + " for " + item.url);
                                    if ((code == 401 || code == 403) && onAuthFallback != null) {
                                        authFallbackTriggered = true;
                                    }
                                    break;
                                }
                            } finally {
                                if (sc != null && sc.conn != null) sc.conn.disconnect();
                                if (client != null) {
                                    try { client.close(); } catch (Throwable ignored) {}
                                }
                            }
                            if (finishedTransfer) break;
                        }
                    } catch (Throwable t) {
                        Log.w(TAG, "Relay error for " + item.url + ": " + t.getMessage());
                    } finally {
                        ACTIVE_RELAYS.remove(relayUrl, boundServer);
                        if (authFallbackTriggered && onAuthFallback != null) {
                            try {
                                onAuthFallback.run();
                            } catch (Throwable t) {
                                if (onComplete != null) onComplete.accept(false, finalServedName[0]);
                            }
                        } else if (onComplete != null) {
                            onComplete.accept(transferSucceeded, finalServedName[0]);
                        }
                    }
                });
            } catch (RejectedExecutionException rex) {
                ACTIVE_RELAYS.remove(relayUrl, boundServer);
                try { boundServer.close(); } catch (Throwable ignored) {}
                if (onComplete != null) onComplete.accept(false, origSafeName);
                Log.w(TAG, "Relay pool saturated; rejected download for " + item.url);
                return null;
            }

            return relayUrl;
        } catch (Throwable t) {
            if (server != null) {
                try { server.close(); } catch (Throwable ignored) {}
            }
            Log.e(TAG, "Failed starting local download relay", t);
            return null;
        }
    }

    private static boolean verifyRelayPathToken(String reqPath, String expectedToken) {
        if (reqPath == null || !reqPath.startsWith("/")) return false;
        int secondSlash = reqPath.indexOf('/', 1);
        if (secondSlash <= 1) return false;
        String provided = reqPath.substring(1, secondSlash);
        return MessageDigest.isEqual(
                expectedToken.getBytes(StandardCharsets.UTF_8),
                provided.getBytes(StandardCharsets.UTF_8)
        );
    }

    private static void writeSimpleResponse(OutputStream out, int code, String reason) throws IOException {
        String resp = "HTTP/1.1 " + code + " " + reason + "\r\nContent-Length: 0\r\nConnection: close\r\n\r\n";
        out.write(resp.getBytes(StandardCharsets.UTF_8));
        out.flush();
    }

    private static String sanitizePathSegment(String name) {
        if (name == null || name.isEmpty()) return "media.bin";
        return name.replaceAll("[^a-zA-Z0-9._-]", "_");
    }

    /**
     * Downloads adaptive HD video + M4A audio in parallel, muxes them losslessly via Android's
     * built-in MediaMuxer (with dynamic sample buffer growth), and serves the finished HD MP4
     * over an authenticated loopback HTTP relay with full Range/206/416 support.
     */
    public static void startMuxedDownload(
            final File cacheDir,
            final MediaItem item,
            final String filename,
            final Runnable onRelayReadyTrigger,
            final Consumer<String> onRelayUrlReady,
            final Consumer<Boolean> onComplete
    ) {
        try {
            RELAY_POOL.execute(() -> {
                File tmpVideo = null;
                File tmpAudio = null;
                File tmpMuxed = null;
                Future<Boolean> vFut = null;
                Future<Boolean> aFut = null;
                try {
                    tmpVideo = File.createTempFile("yt_v_", ".mp4", cacheDir);
                    tmpAudio = File.createTempFile("yt_a_", ".m4a", cacheDir);
                    tmpMuxed = File.createTempFile("yt_mux_", ".mp4", cacheDir);

                    final File fVid = tmpVideo;
                    final File fAud = tmpAudio;
                    final String pageCtx = (item.pageUrl != null && !item.pageUrl.isEmpty()) ? item.pageUrl : item.referer;
                    vFut = MUX_DOWNLOAD_POOL.submit(() -> downloadToFile(item.url, item.userAgent, pageCtx, fVid));
                    aFut = MUX_DOWNLOAD_POOL.submit(() -> downloadToFile(item.audioUrl, item.userAgent, pageCtx, fAud));

                    boolean vOk = vFut.get(15, TimeUnit.MINUTES);
                    boolean aOk = aFut.get(15, TimeUnit.MINUTES);
                    if (!vOk || !aOk || fVid.length() <= 0 || fAud.length() <= 0) {
                        Log.w(TAG, "Mux download failed: vOk=" + vOk + " (" + fVid.length() + ") aOk=" + aOk + " (" + fAud.length() + ")");
                        try { fVid.delete(); } catch (Throwable ignored) {}
                        try { fAud.delete(); } catch (Throwable ignored) {}
                        try { tmpMuxed.delete(); } catch (Throwable ignored) {}
                        if (onComplete != null) onComplete.accept(false);
                        return;
                    }

                    muxMp4(fVid, fAud, tmpMuxed);
                    Log.i(TAG, "Muxed HD MP4 ready: " + tmpMuxed.length() + " bytes -> serving to Brave DownloadManager");

                    final File finalMuxed = tmpMuxed;
                    final File delV = tmpVideo;
                    final File delA = tmpAudio;
                    tmpMuxed = null; // ownership transferred to relay server cleanup

                    final ServerSocket server = new ServerSocket(0, 8, InetAddress.getLoopbackAddress());
                    server.setSoTimeout(45000);
                    final int port = server.getLocalPort();
                    final String authToken = NetworkSafety.generateRandomTokenHex(16);
                    final String safeName = sanitizePathSegment(filename);
                    final String relayUrl = "http://127.0.0.1:" + port + "/" + authToken + "/" + Uri.encode(safeName);
                    ACTIVE_RELAYS.put(relayUrl, server);

                    try {
                        RELAY_POOL.execute(() -> {
                            boolean transferSucceeded = false;
                            try (ServerSocket ss = server) {
                                final long fileLength = finalMuxed.length();
                                for (int attempt = 0; attempt < 64; attempt++) {
                                    Socket client = null;
                                    boolean servedComplete = false;
                                    try {
                                        client = ss.accept();
                                        if (!client.getInetAddress().isLoopbackAddress()) {
                                            client.close();
                                            continue;
                                        }
                                        client.setSoTimeout(30000);
                                        BufferedReader br = new BufferedReader(new InputStreamReader(client.getInputStream(), StandardCharsets.US_ASCII));
                                        String reqLine = br.readLine();
                                        if (reqLine == null) continue;

                                        String rangeHeader = null;
                                String l;
                                while ((l = br.readLine()) != null && !l.isEmpty()) {
                                    if (l.toLowerCase(Locale.ROOT).startsWith("range:")) {
                                        rangeHeader = l.substring(6).trim();
                                    }
                                }

                                OutputStream out = client.getOutputStream();
                                String[] parts = reqLine.split(" ");
                                if (parts.length < 2) {
                                    writeSimpleResponse(out, 400, "Bad Request");
                                    continue;
                                }
                                String reqMethod = parts[0].toUpperCase(Locale.ROOT);
                                String reqPath = parts[1];
                                if ((!"GET".equals(reqMethod) && !"HEAD".equals(reqMethod))
                                        || !verifyRelayPathToken(reqPath, authToken)) {
                                    writeSimpleResponse(out, 403, "Forbidden");
                                    continue;
                                }
                                boolean isHead = "HEAD".equals(reqMethod);

                                long rangeStart = 0;
                                long rangeEnd = fileLength - 1;
                                boolean isPartial = false;

                                if (rangeHeader != null && !rangeHeader.isEmpty()) {
                                    Matcher rm = REQ_RANGE_PATTERN.matcher(rangeHeader);
                                    if (rm.find()) {
                                        String startStr = rm.group(1);
                                        String endStr = rm.group(2);
                                        if (startStr.isEmpty() && !endStr.isEmpty()) {
                                            long suffix = Long.parseLong(endStr);
                                            rangeStart = Math.max(0, fileLength - suffix);
                                            rangeEnd = fileLength - 1;
                                        } else {
                                            rangeStart = startStr.isEmpty() ? 0 : Long.parseLong(startStr);
                                            rangeEnd = endStr.isEmpty() ? (fileLength - 1) : Math.min(Long.parseLong(endStr), fileLength - 1);
                                        }
                                        if (rangeStart < 0 || rangeStart >= fileLength || rangeStart > rangeEnd) {
                                            String r416 = "HTTP/1.1 416 Range Not Satisfiable\r\n"
                                                    + "Content-Range: bytes */" + fileLength + "\r\n"
                                                    + "Content-Length: 0\r\n"
                                                    + "Connection: close\r\n\r\n";
                                            out.write(r416.getBytes(StandardCharsets.UTF_8));
                                            out.flush();
                                            continue;
                                        }
                                        isPartial = true;
                                    }
                                }

                                long sendLength = (rangeEnd - rangeStart) + 1;
                                StringBuilder headers = new StringBuilder();
                                headers.append(isPartial ? "HTTP/1.1 206 Partial Content\r\n" : "HTTP/1.1 200 OK\r\n");
                                headers.append("Content-Type: video/mp4\r\n");
                                headers.append("Content-Disposition: attachment; filename=\"").append(safeName).append("\"\r\n");
                                headers.append("Accept-Ranges: bytes\r\n");
                                headers.append("Content-Length: ").append(sendLength).append("\r\n");
                                if (isPartial) {
                                    headers.append("Content-Range: bytes ").append(rangeStart).append("-").append(rangeEnd).append("/").append(fileLength).append("\r\n");
                                }
                                headers.append("Connection: close\r\n\r\n");
                                out.write(headers.toString().getBytes(StandardCharsets.UTF_8));

                                if (!isHead) {
                                    long remaining = sendLength;
                                    try (RandomAccessFile raf = new RandomAccessFile(finalMuxed, "r")) {
                                        raf.seek(rangeStart);
                                        byte[] buf = new byte[64 * 1024];
                                        while (remaining > 0) {
                                            int toRead = (int) Math.min(buf.length, remaining);
                                            int n = raf.read(buf, 0, toRead);
                                            if (n == -1) break;
                                            out.write(buf, 0, n);
                                            remaining -= n;
                                        }
                                        out.flush();
                                    }
                                    if (remaining == 0 && rangeEnd == fileLength - 1) {
                                        servedComplete = true;
                                        transferSucceeded = true;
                                        Log.i(TAG, "Served muxed HD MP4 to Chromium: " + safeName);
                                    }
                                } else {
                                    out.flush();
                                }
                            } finally {
                                if (client != null) {
                                    try { client.close(); } catch (Throwable ignored) {}
                                }
                            }
                            if (servedComplete) break;
                        }
                    } catch (Throwable t) {
                        Log.w(TAG, "Muxed relay error: " + t.getMessage());
                    } finally {
                        try { finalMuxed.delete(); } catch (Throwable ignored) {}
                        try { delV.delete(); } catch (Throwable ignored) {}
                        try { delA.delete(); } catch (Throwable ignored) {}
                        ACTIVE_RELAYS.remove(relayUrl, server);
                        if (onComplete != null) onComplete.accept(transferSucceeded);
                    }
                });
                    } catch (RejectedExecutionException rex) {
                        ACTIVE_RELAYS.remove(relayUrl, server);
                        try { server.close(); } catch (Throwable ignored) {}
                        try { finalMuxed.delete(); } catch (Throwable ignored) {}
                        try { delV.delete(); } catch (Throwable ignored) {}
                        try { delA.delete(); } catch (Throwable ignored) {}
                        if (onComplete != null) onComplete.accept(false);
                        return;
                    }

                if (onRelayUrlReady != null) onRelayUrlReady.accept(relayUrl);
            } catch (Throwable t) {
                if (vFut != null && !vFut.isDone()) vFut.cancel(true);
                if (aFut != null && !aFut.isDone()) aFut.cancel(true);
                Log.e(TAG, "startMuxedDownload failed", t);
                if (tmpVideo != null) try { tmpVideo.delete(); } catch (Throwable ignored) {}
                if (tmpAudio != null) try { tmpAudio.delete(); } catch (Throwable ignored) {}
                if (tmpMuxed != null) try { tmpMuxed.delete(); } catch (Throwable ignored) {}
                if (onComplete != null) onComplete.accept(false);
            }
        });
        } catch (RejectedExecutionException rex) {
            Log.w(TAG, "Mux relay pool saturated; rejected " + item.url);
            if (onComplete != null) onComplete.accept(false);
        }
    }

    /**
     * Downloads a URL to a file using 4 MB Range chunks when supported.
     * Validates Content-Range alignment on HTTP 206 and truncates/restarts cleanly if HTTP 200
     * arrives after partial progress so two copies can never be concatenated.
     */
    private static boolean downloadToFile(String urlStr, String ua, String pageContextUrl, File outFile) {
        final long CHUNK_SIZE = 4L * 1024L * 1024L;
        try (RandomAccessFile raf = new RandomAccessFile(outFile, "rw")) {
            raf.setLength(0);
            long offset = 0;
            long totalLength = -1;

            while (totalLength < 0 || offset < totalLength) {
                long end = (totalLength > 0) ? Math.min(offset + CHUNK_SIZE - 1, totalLength - 1) : (offset + CHUNK_SIZE - 1);
                NetworkSafety.SafeConnection sc = null;
                try {
                    sc = NetworkSafety.openSafeConnection(
                            urlStr, "GET", ua, "", "",
                            "", pageContextUrl, "bytes=" + offset + "-" + end,
                            false, 15000, 45000
                    );
                    int code = sc.responseCode;
                    if (code == 206) {
                        String cr = sc.conn.getHeaderField("Content-Range");
                        if (cr == null) {
                            Log.w(TAG, "HTTP 206 missing Content-Range header");
                            return false;
                        }
                        Matcher m = CONTENT_RANGE_PATTERN.matcher(cr.trim());
                        if (!m.find()) {
                            Log.w(TAG, "Malformed Content-Range header: " + cr);
                            return false;
                        }
                        long respStart = Long.parseLong(m.group(1));
                        long respEnd = Long.parseLong(m.group(2));
                        if (respStart != offset || respEnd < respStart || respEnd > end) {
                            Log.w(TAG, "Content-Range bounds invalid: expected " + offset + ".." + end + " got " + respStart + "-" + respEnd);
                            return false;
                        }
                        long expectedChunkLen = (respEnd - respStart) + 1L;
                        String totalStr = m.group(3);
                        boolean reachedWildcardEnd = false;
                        if (!"*".equals(totalStr)) {
                            long parsedTotal = Long.parseLong(totalStr);
                            if (parsedTotal <= respEnd || (totalLength >= 0 && parsedTotal != totalLength)) {
                                Log.w(TAG, "Inconsistent Content-Range total: " + parsedTotal + " (prev=" + totalLength + ", end=" + respEnd + ")");
                                return false;
                            }
                            totalLength = parsedTotal;
                        } else if (respEnd < end) {
                            reachedWildcardEnd = true;
                        }

                        long chunkRead = 0;
                        try (InputStream in = new BufferedInputStream(sc.conn.getInputStream(), 64 * 1024)) {
                            byte[] buf = new byte[64 * 1024];
                            int n;
                            while ((n = in.read(buf)) != -1) {
                                if (chunkRead + n > expectedChunkLen) {
                                    Log.w(TAG, "HTTP 206 body exceeded Content-Range length: " + (chunkRead + n) + " > " + expectedChunkLen);
                                    return false;
                                }
                                raf.write(buf, 0, n);
                                chunkRead += n;
                            }
                        }
                        if (chunkRead != expectedChunkLen) {
                            Log.w(TAG, "HTTP 206 chunk truncated: read " + chunkRead + " != expected " + expectedChunkLen);
                            return false;
                        }
                        offset += chunkRead;
                        if (reachedWildcardEnd) {
                            totalLength = offset;
                            break;
                        }
                    } else if (code == 416 && totalLength < 0 && offset > 0) {
                        // Upstream with Content-Range: bytes .../* ended cleanly on exact chunk boundary
                        String cr = sc.conn.getHeaderField("Content-Range");
                        if (cr != null && cr.trim().equalsIgnoreCase("bytes */" + offset)) {
                            totalLength = offset;
                            break;
                        }
                        Log.w(TAG, "downloadToFile HTTP 416 (" + cr + ") at offset=" + offset);
                        return false;
                    } else if (code == 200) {
                        // Server ignored Range and returned the full resource from byte 0: truncate!
                        if (offset > 0) {
                            raf.setLength(0);
                            raf.seek(0);
                            offset = 0;
                        }
                        long respLen = sc.conn.getContentLengthLong();
                        if (respLen == 0) {
                            Log.w(TAG, "downloadToFile HTTP 200 empty body for " + urlStr);
                            return false;
                        }
                        if (respLen > 0) {
                            totalLength = respLen;
                        }
                        long chunkRead = 0;
                        try (InputStream in = new BufferedInputStream(sc.conn.getInputStream(), 64 * 1024)) {
                            byte[] buf = new byte[64 * 1024];
                            int n;
                            while ((n = in.read(buf)) != -1) {
                                raf.write(buf, 0, n);
                                chunkRead += n;
                            }
                        }
                        offset = chunkRead;
                        break;
                    } else {
                        Log.w(TAG, "downloadToFile HTTP " + code + " (offset=" + offset + ") for " + urlStr);
                        return false;
                    }
                } finally {
                    if (sc != null && sc.conn != null) sc.conn.disconnect();
                }
            }
            return offset > 0 && (totalLength < 0 || offset == totalLength);
        } catch (Throwable t) {
            Log.w(TAG, "downloadToFile error: " + t.getMessage());
            return false;
        }
    }

    private static void muxMp4(File videoFile, File audioFile, File outFile) throws Exception {
        MediaExtractor vEx = new MediaExtractor();
        MediaExtractor aEx = new MediaExtractor();
        MediaMuxer muxer = new MediaMuxer(outFile.getAbsolutePath(), MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
        try {
            vEx.setDataSource(videoFile.getAbsolutePath());
            aEx.setDataSource(audioFile.getAbsolutePath());

            int initialBufSize = 1024 * 1024; // 1 MB base
            int vTrackSrc = -1;
            int vTrackDst = -1;
            for (int i = 0; i < vEx.getTrackCount(); i++) {
                MediaFormat fmt = vEx.getTrackFormat(i);
                String mime = fmt.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("video/")) {
                    if (fmt.containsKey(MediaFormat.KEY_MAX_INPUT_SIZE)) {
                        initialBufSize = Math.max(initialBufSize, fmt.getInteger(MediaFormat.KEY_MAX_INPUT_SIZE));
                    }
                    vEx.selectTrack(i);
                    vTrackSrc = i;
                    vTrackDst = muxer.addTrack(fmt);
                    break;
                }
            }

            int aTrackSrc = -1;
            int aTrackDst = -1;
            for (int i = 0; i < aEx.getTrackCount(); i++) {
                MediaFormat fmt = aEx.getTrackFormat(i);
                String mime = fmt.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/")) {
                    if (fmt.containsKey(MediaFormat.KEY_MAX_INPUT_SIZE)) {
                        initialBufSize = Math.max(initialBufSize, fmt.getInteger(MediaFormat.KEY_MAX_INPUT_SIZE));
                    }
                    aEx.selectTrack(i);
                    aTrackSrc = i;
                    aTrackDst = muxer.addTrack(fmt);
                    break;
                }
            }

            if (vTrackSrc < 0 || vTrackDst < 0 || aTrackSrc < 0 || aTrackDst < 0) {
                throw new IOException("Missing video/audio track for muxing (v=" + vTrackSrc + "/" + vTrackDst + ", a=" + aTrackSrc + "/" + aTrackDst + ")");
            }

            muxer.start();
            ByteBuffer[] bufHolder = new ByteBuffer[]{ByteBuffer.allocate(Math.min(initialBufSize, MAX_MUX_SAMPLE_BUFFER_BYTES))};
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();

            copyExtractorTrack(vEx, muxer, vTrackDst, bufHolder, info);
            copyExtractorTrack(aEx, muxer, aTrackDst, bufHolder, info);

            muxer.stop();
        } finally {
            try { muxer.release(); } catch (Throwable ignored) {}
            try { vEx.release(); } catch (Throwable ignored) {}
            try { aEx.release(); } catch (Throwable ignored) {}
        }
    }

    private static void copyExtractorTrack(
            MediaExtractor extractor,
            MediaMuxer muxer,
            int dstTrack,
            ByteBuffer[] bufHolder,
            MediaCodec.BufferInfo info
    ) throws IOException {
        while (true) {
            int size = readSampleGrowing(extractor, bufHolder);
            if (size < 0) break;
            info.offset = 0;
            info.size = size;
            info.presentationTimeUs = extractor.getSampleTime();
            int sampleFlags = extractor.getSampleFlags();
            int flags = 0;
            if ((sampleFlags & MediaExtractor.SAMPLE_FLAG_SYNC) != 0) {
                flags |= MediaCodec.BUFFER_FLAG_KEY_FRAME;
            }
            info.flags = flags;
            muxer.writeSampleData(dstTrack, bufHolder[0], info);
            extractor.advance();
        }
    }

    static int readSampleGrowing(MediaExtractor extractor, ByteBuffer[] bufHolder) throws IOException {
        while (true) {
            ByteBuffer buf = bufHolder[0];
            buf.clear();
            try {
                return extractor.readSampleData(buf, 0);
            } catch (IllegalArgumentException e) {
                int nextCap = buf.capacity() * 2;
                if (nextCap > MAX_MUX_SAMPLE_BUFFER_BYTES) {
                    throw new IOException("Media sample exceeded max buffer size (" + MAX_MUX_SAMPLE_BUFFER_BYTES + ")", e);
                }
                bufHolder[0] = ByteBuffer.allocate(nextCap);
            }
        }
    }
}
