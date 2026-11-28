package app.morphed.extension.twitch.vpn;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import app.morphed.extension.twitch.net.Web;

/**
 * HTTP/1.1 through the VPN tunnel. Connections are kept and reused (a stream asks the same few servers every
 * second or two; a TLS handshake through the tunnel each time would cost a round trip or three).
 */
public final class TunnelWeb implements Web {
    private static final int IDLE_PER_HOST = 4;
    private static final long IDLE_MS = 30_000;

    private final IpStack stack;
    private final Map<String, ArrayDeque<Pooled>> idle = new HashMap<>();

    private static final class Pooled {
        final TcpConnection tcp;
        final InputStream in;
        final OutputStream out;
        long idleSince;

        Pooled(TcpConnection tcp, InputStream in, OutputStream out) {
            this.tcp = tcp;
            this.in = in;
            this.out = out;
        }
    }

    public TunnelWeb(IpStack stack) {
        this.stack = stack;
    }

    private Pooled take(String key) {
        synchronized (idle) {
            ArrayDeque<Pooled> queue = idle.get(key);
            long now = System.currentTimeMillis();
            while (queue != null && !queue.isEmpty()) {
                Pooled pooled = queue.pollLast();
                if (now - pooled.idleSince < IDLE_MS && pooled.tcp.isOpen()) return pooled;
                pooled.tcp.reset();
            }
        }
        return null;
    }

    /** Drops kept connections idle too long or closed by the server, for every host (each holds a buffer). */
    public void reap() {
        long now = System.currentTimeMillis();
        synchronized (idle) {
            java.util.Iterator<ArrayDeque<Pooled>> queues = idle.values().iterator();
            while (queues.hasNext()) {
                ArrayDeque<Pooled> queue = queues.next();
                java.util.Iterator<Pooled> it = queue.iterator();
                while (it.hasNext()) {
                    Pooled pooled = it.next();
                    if (now - pooled.idleSince >= IDLE_MS || !pooled.tcp.isOpen()) {
                        it.remove();
                        pooled.tcp.reset();
                    }
                }
                if (queue.isEmpty()) queues.remove();
            }
        }
    }

    private void giveBack(String key, Pooled pooled) {
        pooled.idleSince = System.currentTimeMillis();
        reap();
        synchronized (idle) {
            ArrayDeque<Pooled> queue = idle.computeIfAbsent(key, k -> new ArrayDeque<>());
            queue.addLast(pooled);
            while (queue.size() > IDLE_PER_HOST) queue.pollFirst().tcp.reset();
        }
    }

    public void closeAll() {
        synchronized (idle) {
            for (ArrayDeque<Pooled> queue : idle.values()) for (Pooled pooled : queue) pooled.tcp.reset();
            idle.clear();
        }
    }

    private Pooled open(String host, int port, boolean tls, int timeoutMs) throws IOException {
        byte[] address = stack.resolve(host);
        TcpConnection tcp = stack.connect(address, port, timeoutMs);
        tcp.setTimeout(timeoutMs);
        if (!tls) return new Pooled(tcp, tcp.input, tcp.output);
        try {
            TlsStream stream = new TlsStream(host, port, tcp.input, tcp.output);
            return new Pooled(tcp, stream.input, stream.output);
        } catch (IOException e) {
            tcp.reset();
            throw e;
        }
    }

    @Override
    public Response send(Request request) throws IOException {
        URL url = new URL(request.url);
        boolean tls = "https".equals(url.getProtocol());
        int port = url.getPort() > 0 ? url.getPort() : tls ? 443 : 80;
        String host = url.getHost();
        String key = (tls ? "s:" : "p:") + host + ":" + port;
        String target = url.getFile().isEmpty() ? "/" : url.getFile();
        StringBuilder head = new StringBuilder();
        head.append(request.method).append(' ').append(target).append(" HTTP/1.1\r\n");
        head.append("Host: ").append(port == (tls ? 443 : 80) ? host : host + ":" + port).append("\r\n");
        boolean hasEncoding = false;
        for (Map.Entry<String, String> header : request.headers.entrySet()) {
            if (header.getKey().equalsIgnoreCase("Accept-Encoding")) hasEncoding = true;
            head.append(header.getKey()).append(": ").append(header.getValue()).append("\r\n");
        }
        if (!hasEncoding) head.append("Accept-Encoding: identity\r\n");
        if (request.body != null) head.append("Content-Length: ").append(request.body.length).append("\r\n");
        head.append("Connection: keep-alive\r\n\r\n");
        byte[] headBytes = head.toString().getBytes(StandardCharsets.ISO_8859_1);

        // A kept connection may have been closed by the server meanwhile: one more try on a fresh one.
        int timeoutMs = request.timeoutMs;
        for (int attempt = 0; ; attempt++) {
            Pooled connection = attempt == 0 ? take(key) : null;
            boolean reused = connection != null;
            if (connection == null) connection = open(host, port, tls, timeoutMs);
            connection.tcp.setTimeout(timeoutMs);
            try {
                connection.out.write(headBytes);
                if (request.body != null) connection.out.write(request.body);
                Response response = readResponse(connection.in, request.method);
                String connectionHeader = response.header("Connection");
                if (connectionHeader != null && connectionHeader.equalsIgnoreCase("close")) connection.tcp.reset();
                else giveBack(key, connection);
                return response;
            } catch (IOException e) {
                connection.tcp.reset();
                if (!reused) throw e;
                // A kept connection the server dropped: one fresh try. One that ran out of time may mean the
                // tunnel itself is gone: its try gets half the time, so the two together don't outlast the player.
                if (e instanceof java.net.SocketTimeoutException) timeoutMs = Math.max(1000, timeoutMs / 2);
            } catch (RuntimeException broken) { // a malformed answer: the connection can't be trusted any more
                connection.tcp.reset();
                throw new IOException("A broken answer from " + host + ": " + broken, broken);
            }
        }
    }

    private static String line(InputStream in) throws IOException {
        StringBuilder out = new StringBuilder();
        int c;
        while ((c = in.read()) != -1) {
            if (c == '\n') break;
            if (c != '\r') out.append((char) c);
        }
        if (c == -1 && out.length() == 0) throw new IOException("The server closed the connection");
        return out.toString();
    }

    static Response readResponse(InputStream raw, String method) throws IOException {
        // Buffered for reading lines byte by byte. It can't read past this answer: the server sends the next one
        // only after the next request (no pipelining).
        InputStream in = new java.io.BufferedInputStream(raw, 65536);
        int code;
        Map<String, String> headers;
        do { // interim answers (100 Continue, 103 Early Hints) come before the real one
            String status = line(in);
            String[] parts = status.split(" ", 3);
            if (parts.length < 2 || !parts[0].startsWith("HTTP/")) throw new IOException("Not an HTTP answer: " + status);
            try {
                code = Integer.parseInt(parts[1]);
            } catch (NumberFormatException e) {
                throw new IOException("Not an HTTP answer: " + status);
            }
            headers = new LinkedHashMap<>();
            String header;
            while (!(header = line(in)).isEmpty()) {
                int colon = header.indexOf(':');
                if (colon > 0) headers.put(header.substring(0, colon).trim().toLowerCase(Locale.ROOT), header.substring(colon + 1).trim());
            }
        } while (code >= 100 && code < 200 && code != 101);
        byte[] body;
        if ("HEAD".equals(method) || code == 204 || code == 304 || code == 101) {
            body = new byte[0];
        } else if ("chunked".equalsIgnoreCase(headers.get("transfer-encoding"))) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            while (true) {
                String sizeLine = line(in);
                int semicolon = sizeLine.indexOf(';');
                int size = Integer.parseInt((semicolon >= 0 ? sizeLine.substring(0, semicolon) : sizeLine).trim(), 16);
                if (size == 0) {
                    while (!line(in).isEmpty()) {
                        // trailers
                    }
                    break;
                }
                copy(in, out, size);
                line(in);
            }
            body = out.toByteArray();
        } else if (headers.containsKey("content-length")) {
            int length = Integer.parseInt(headers.get("content-length"));
            ByteArrayOutputStream out = new ByteArrayOutputStream(length);
            copy(in, out, length);
            body = out.toByteArray();
        } else {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[16384];
            int read;
            while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
            body = out.toByteArray();
            headers.put("connection", "close");
        }
        return new Response(code, headers, body);
    }

    private static void copy(InputStream in, OutputStream out, int length) throws IOException {
        byte[] buffer = new byte[16384];
        int left = length;
        while (left > 0) {
            int read = in.read(buffer, 0, Math.min(buffer.length, left));
            if (read < 0) throw new IOException("The answer ended early");
            out.write(buffer, 0, read);
            left -= read;
        }
    }
}
