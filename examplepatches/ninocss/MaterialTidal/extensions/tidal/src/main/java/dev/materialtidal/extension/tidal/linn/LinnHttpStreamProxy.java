package dev.materialtidal.extension.tidal.linn;

import android.util.Log;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Local LAN HTTP server streaming remuxed Hi-Res DASH FLAC and optional HTTPS BTS passthrough
 * streams over plain HTTP so every Linn Majik DSM firmware (DSM/1–5) can play without TLS issues.
 */
public final class LinnHttpStreamProxy {

    public static final class Registration {
        public final String url;
        public final int seekOffsetSec;

        Registration(String url, int seekOffsetSec) {
            this.url = url;
            this.seekOffsetSec = seekOffsetSec;
        }
    }

    private static final class Entry {
        final LinnTidalStreamResolver.ResolvedStream stream;
        final AtomicBoolean cancelled = new AtomicBoolean(false);

        Entry(LinnTidalStreamResolver.ResolvedStream stream) {
            this.stream = stream;
        }
    }

    private static final String TAG = "MaterialTidalLinn";

    private final Map<String, Entry> entries = new ConcurrentHashMap<>();
    private final Set<Socket> activeClients = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private final ExecutorService workers = Executors.newCachedThreadPool();
    private volatile ServerSocket serverSocket;
    private volatile Thread acceptThread;
    private volatile int port = -1;

    public synchronized void start() throws IOException {
        if (serverSocket != null && !serverSocket.isClosed()) {
            return;
        }
        ServerSocket ss = new ServerSocket(0);
        ss.setReuseAddress(true);
        serverSocket = ss;
        port = ss.getLocalPort();

        Thread t = new Thread(() -> {
            while (!ss.isClosed()) {
                try {
                    Socket client = ss.accept();
                    workers.execute(() -> handleClient(client));
                } catch (IOException ignored) {
                    if (ss.isClosed()) {
                        break;
                    }
                }
            }
        }, "LinnHttpProxyAccept");
        t.setDaemon(true);
        acceptThread = t;
        t.start();
    }

    public synchronized void stop() {
        cancelAllStreams();
        entries.clear();
        ServerSocket ss = serverSocket;
        serverSocket = null;
        port = -1;
        if (ss != null) {
            try {
                ss.close();
            } catch (IOException ignored) {
            }
        }
        Thread t = acceptThread;
        acceptThread = null;
        if (t != null) {
            t.interrupt();
        }
    }

    public void cancelAllStreams() {
        for (Entry e : entries.values()) {
            e.cancelled.set(true);
        }
        for (Socket sock : activeClients) {
            try {
                sock.close();
            } catch (IOException ignored) {
            }
        }
        activeClients.clear();
    }

    public Registration registerStream(
            LinnDevice device,
            LinnTidalStreamResolver.ResolvedStream stream,
            int requestedStartSec
    ) throws IOException {
        start();
        if (!stream.isDash && LinnConfig.getStreamDeliveryMode() == LinnConfig.STREAM_MODE_HYBRID) {
            return new Registration(stream.directUrl, 0);
        }

        String token = UUID.randomUUID().toString().replace("-", "");
        entries.put(token, new Entry(stream));
        while (entries.size() > 8) {
            String first = entries.keySet().iterator().next();
            Entry removed = entries.remove(first);
            if (removed != null) {
                removed.cancelled.set(true);
            }
        }

        String ext = "audio/mp4".equals(stream.mimeType) ? "m4a" : "flac";
        String lanIp = LinnRawHttpClient.resolveLocalIpv4ForTarget(device != null ? device.host : null);
        int startSec = Math.max(0, requestedStartSec);
        int actualOffsetSec = 0;
        String suffix = "";
        if (stream.isDash && startSec > 0) {
            int[] segAndOffset = computeDashStartSegment(stream, startSec);
            actualOffsetSec = segAndOffset[1];
            if (actualOffsetSec > 0) {
                suffix = "?startSec=" + actualOffsetSec;
            }
        }
        String url = "http://" + lanIp + ":" + port + "/stream/" + token + "." + ext + suffix;
        return new Registration(url, actualOffsetSec);
    }

    private static int[] computeDashStartSegment(LinnTidalStreamResolver.ResolvedStream stream, int targetSec) {
        List<Double> durs = stream.dashSegmentDurationsSec;
        double acc = 0.0;
        for (int i = 0; i < durs.size(); i++) {
            double next = acc + durs.get(i);
            if (next > targetSec) {
                return new int[]{i, (int) Math.floor(acc)};
            }
            acc = next;
        }
        return new int[]{0, 0};
    }

    private void handleClient(Socket client) {
        activeClients.add(client);
        try (Socket sock = client) {
            sock.setSoTimeout(15000);
            BufferedInputStream in = new BufferedInputStream(sock.getInputStream(), 2048);
            String reqLine = readAsciiLine(in);
            if (reqLine == null || reqLine.isEmpty()) {
                return;
            }
            String rangeHeader = null;
            String header;
            while ((header = readAsciiLine(in)) != null && !header.isEmpty()) {
                if (header.toLowerCase(Locale.ROOT).startsWith("range:")) {
                    rangeHeader = header.substring(6).trim();
                }
            }

            String[] parts = reqLine.split("\\s+");
            if (parts.length < 2) {
                writeSimpleStatus(sock.getOutputStream(), "400 Bad Request");
                return;
            }
            String method = parts[0].toUpperCase(Locale.ROOT);
            String pathAndQuery = parts[1];
            int qIdx = pathAndQuery.indexOf('?');
            String path = qIdx >= 0 ? pathAndQuery.substring(0, qIdx) : pathAndQuery;
            String query = qIdx >= 0 ? pathAndQuery.substring(qIdx + 1) : "";

            String token = extractToken(path);
            Entry entry = token != null ? entries.get(token) : null;
            if (entry == null) {
                writeSimpleStatus(sock.getOutputStream(), "404 Not Found");
                return;
            }

            OutputStream out = sock.getOutputStream();
            Log.i(TAG, "Proxy " + method + " " + pathAndQuery + " dash=" + entry.stream.isDash);
            if (entry.stream.isDash) {
                serveDashFlac(method, query, entry, out);
            } else {
                serveDirectPassthrough(method, rangeHeader, entry, out);
            }
        } catch (IOException e) {
            Log.w(TAG, "Proxy client error: " + e.getMessage());
        } finally {
            activeClients.remove(client);
        }
    }

    private static void serveDashFlac(
            String method,
            String query,
            Entry entry,
            OutputStream out
    ) throws IOException {
        StringBuilder hdr = new StringBuilder();
        hdr.append("HTTP/1.1 200 OK\r\n");
        hdr.append("Content-Type: audio/flac\r\n");
        hdr.append("Connection: close\r\n\r\n");
        out.write(hdr.toString().getBytes(StandardCharsets.US_ASCII));
        out.flush();

        if ("HEAD".equals(method)) {
            return;
        }
        int startSec = parseStartSec(query);
        int startSegIdx = 0;
        long totalSamplesOverride = 0;
        double remSec = entry.stream.totalDurationSec;
        if (startSec > 0) {
            int[] segAndOff = computeDashStartSegment(entry.stream, startSec);
            startSegIdx = segAndOff[0];
            remSec = Math.max(0.0, entry.stream.totalDurationSec - segAndOff[1]);
        }
        if (remSec > 0 && entry.stream.sampleRate > 0) {
            totalSamplesOverride = Math.round(remSec * entry.stream.sampleRate);
        }
        LinnDashFlacRemuxer.streamDashFlac(
                entry.stream.dashInitUrl,
                entry.stream.dashSegmentUrls,
                startSegIdx,
                totalSamplesOverride,
                out,
                entry.cancelled
        );
    }

    private static void serveDirectPassthrough(
            String method,
            String rangeHeader,
            Entry entry,
            OutputStream out
    ) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL(entry.stream.directUrl).openConnection();
        conn.setConnectTimeout(6000);
        conn.setReadTimeout(15000);
        conn.setRequestMethod("HEAD".equals(method) ? "HEAD" : "GET");
        if (rangeHeader != null && !rangeHeader.isEmpty()) {
            conn.setRequestProperty("Range", rangeHeader);
        }
        try {
            int code = conn.getResponseCode();
            String msg = code == 206 ? "206 Partial Content" : (code >= 200 && code < 300 ? "200 OK" : code + " Error");
            StringBuilder hdr = new StringBuilder();
            hdr.append("HTTP/1.1 ").append(msg).append("\r\n");
            hdr.append("Content-Type: ").append(entry.stream.mimeType).append("\r\n");
            hdr.append("Accept-Ranges: bytes\r\n");
            long len = conn.getContentLengthLong();
            if (len >= 0) {
                hdr.append("Content-Length: ").append(len).append("\r\n");
            }
            String contentRange = conn.getHeaderField("Content-Range");
            if (contentRange != null) {
                hdr.append("Content-Range: ").append(contentRange).append("\r\n");
            }
            hdr.append("Connection: close\r\n\r\n");
            out.write(hdr.toString().getBytes(StandardCharsets.US_ASCII));
            out.flush();

            if ("HEAD".equals(method) || code < 200 || code >= 300) {
                return;
            }
            try (InputStream in = conn.getInputStream()) {
                byte[] buf = new byte[32768];
                int n;
                while ((n = in.read(buf)) != -1) {
                    if (entry.cancelled.get()) {
                        break;
                    }
                    out.write(buf, 0, n);
                }
                out.flush();
            }
        } finally {
            conn.disconnect();
        }
    }

    private static void writeSimpleStatus(OutputStream out, String status) throws IOException {
        String resp = "HTTP/1.1 " + status + "\r\nContent-Length: 0\r\nConnection: close\r\n\r\n";
        out.write(resp.getBytes(StandardCharsets.US_ASCII));
        out.flush();
    }

    private static String extractToken(String path) {
        if (!path.startsWith("/stream/")) {
            return null;
        }
        String rest = path.substring("/stream/".length());
        int dot = rest.indexOf('.');
        return dot > 0 ? rest.substring(0, dot) : rest;
    }

    private static int parseStartSec(String query) {
        if (query == null || query.isEmpty()) {
            return 0;
        }
        for (String pair : query.split("&")) {
            if (pair.startsWith("startSec=")) {
                try {
                    return Math.max(0, Integer.parseInt(pair.substring("startSec=".length())));
                } catch (NumberFormatException ignored) {
                }
            }
        }
        return 0;
    }

    private static String readAsciiLine(InputStream in) throws IOException {
        ByteArrayOutputStream sb = new ByteArrayOutputStream(64);
        int b;
        boolean any = false;
        while ((b = in.read()) != -1) {
            any = true;
            if (b == '\n') {
                break;
            }
            if (b != '\r') {
                sb.write(b);
            }
            if (sb.size() > 8192) {
                break;
            }
        }
        return any ? sb.toString(StandardCharsets.US_ASCII.name()) : null;
    }
}
