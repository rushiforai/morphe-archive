/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.io.EOFException;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * A small HTTP server on 127.0.0.1 that hands a video to a player app in byte ranges, so the player
 * can seek while the video is still arriving. Nothing off the phone can reach it, and an app on the
 * phone needs the address's random token, which only goes to the player that was asked to open it.
 *
 * Each connection reads on its own thread. A second thread waits for the player to hang up and then
 * interrupts the first, since a read may be parked until Telegram gets more of the file.
 *
 * The server stops by itself when no player has been connected for a while, or when bytes have
 * stopped moving for a long time. A stream nobody is connected to is told to go idle much sooner,
 * so a closed player doesn't leave Telegram downloading the rest of the video.
 */
final class VideoStreamServer {
    /** One open read of a video. Only the thread that reads closes it. */
    interface Reader {
        /** Up to {@code length} bytes. Zero or less ends the response. */
        int read(byte[] into, int offset, int length) throws IOException;
        void close();
    }

    /** Where a stream's bytes come from. */
    interface Source {
        Reader open(long position, long length) throws IOException;
        /** No player has been connected for a while. A new connection may still come. */
        void idle();
    }

    /** The waits, which a test shortens. */
    static final class Timing {
        long tickMs = 5_000;
        long headerMs = 10_000;
        long emptyMs = 3 * 60_000;
        long stalledMs = 30 * 60_000;
        long unwatchedMs = 20_000;
    }

    static final int MAX_STREAMS = 4;
    static final int MAX_CONNECTIONS = 8;
    static final int MAX_HEADER_BYTES = 16 * 1024;
    private static final int BUFFER_BYTES = 64 * 1024;
    private static final int NAME_LIMIT = 60;
    private static final String FALLBACK_NAME = "video.mp4";
    private static final String ANY_BYTES = "application/octet-stream";
    private static final long[] UNSATISFIABLE = new long[0];

    private static final class Stream {
        final String key;
        final String token;
        final String name;
        final String mime;
        final long size;
        final Source source;
        int connections;
        boolean parked;
        long lastSeen;

        Stream(String key, String token, String name, String mime, long size, Source source, long now) {
            this.key = key;
            this.token = token;
            this.name = name;
            this.mime = mime;
            this.size = size;
            this.source = source;
            lastSeen = now;
        }
    }

    private static final class Connection {
        final Socket socket;
        Thread handler;
        Stream stream;

        Connection(Socket socket) {
            this.socket = socket;
        }

        /** Ends both of this connection's threads, wherever they're waiting. */
        void end() {
            closeQuietly(socket);
            Thread reading = handler;
            if (reading != null) reading.interrupt();
        }
    }

    private final Timing timing;
    private final Runnable onStopped;
    private final ServerSocket server;
    private final Object lock = new Object();
    private final Map<String, Stream> streams = new LinkedHashMap<>();
    private final Set<Connection> connections = new HashSet<>();
    private final AtomicBoolean stopped = new AtomicBoolean();
    private final SecureRandom random = new SecureRandom();
    private volatile long lastActivity = now();

    VideoStreamServer(Timing timing, Runnable onStopped) throws IOException {
        this.timing = timing;
        this.onStopped = onStopped;
        server = new ServerSocket(0, MAX_CONNECTIONS, InetAddress.getByAddress(new byte[] {127, 0, 0, 1}));
        server.setSoTimeout((int) timing.tickMs);
    }

    void start() {
        daemon("video stream server", this::acceptLoop).start();
    }

    int port() {
        return server.getLocalPort();
    }

    InetAddress address() {
        return server.getInetAddress();
    }

    boolean stopped() {
        return stopped.get();
    }

    boolean empty() {
        synchronized (lock) {
            return streams.isEmpty();
        }
    }

    /**
     * The address a player opens for this stream, or null once the server has stopped. The same
     * {@code key} gets the address it already has, so a video opened twice is one stream.
     */
    String add(String key, String name, String mime, long size, Source source) {
        Stream evicted = null;
        String address;
        synchronized (lock) {
            if (stopped.get()) return null;
            long now = now();
            lastActivity = now;
            Stream stream = streams.get(key);
            if (stream != null) {
                stream.parked = false;
                stream.lastSeen = now;
            } else {
                if (streams.size() >= MAX_STREAMS) evicted = evict();
                stream = new Stream(key, newToken(), safeName(name), safeMime(mime), size, source, now);
                streams.put(key, stream);
            }
            address = "http://127.0.0.1:" + port() + "/" + stream.token + "/" + stream.name;
        }
        if (evicted != null) idle(evicted.source);
        return address;
    }

    /** Takes a stream off again, as when no player could be started for it. */
    void remove(String key) {
        Stream removed;
        synchronized (lock) {
            removed = streams.remove(key);
            if (removed == null) return;
            dropConnections(removed);
            if (removed.parked) return;
            removed.parked = true;
        }
        idle(removed.source);
    }

    /** Closes everything. Blocks only as long as closing sockets does, so it runs off the main thread. */
    void stop() {
        if (!stopped.compareAndSet(false, true)) return;
        closeQuietly(server);
        List<Source> toIdle = new ArrayList<>();
        synchronized (lock) {
            for (Connection connection : connections) connection.end();
            for (Stream stream : streams.values()) {
                if (!stream.parked) toIdle.add(stream.source);
                stream.parked = true;
            }
            streams.clear();
        }
        for (Source source : toIdle) idle(source);
        onStopped.run();
    }

    /** The oldest stream nobody is watching, or else the oldest. */
    private Stream evict() {
        Stream chosen = null;
        for (Stream stream : streams.values()) {
            if (chosen == null) chosen = stream;
            if (stream.connections == 0) {
                chosen = stream;
                break;
            }
        }
        streams.remove(chosen.key);
        dropConnections(chosen);
        boolean wasParked = chosen.parked;
        chosen.parked = true;
        return wasParked ? null : chosen;
    }

    private void dropConnections(Stream stream) {
        for (Connection connection : connections) {
            if (connection.stream == stream) connection.end();
        }
    }

    private void acceptLoop() {
        while (!stopped.get()) {
            try {
                accepted(server.accept());
            } catch (SocketTimeoutException quiet) {
                // Only here so the checks below run.
            } catch (IOException closed) {
                stop();
                return;
            }
            tick();
        }
    }

    private void accepted(Socket socket) {
        Connection connection = new Connection(socket);
        boolean full;
        synchronized (lock) {
            full = stopped.get() || connections.size() >= MAX_CONNECTIONS;
            if (!full) {
                connections.add(connection);
                lastActivity = now();
                connection.handler = daemon("video stream", () -> serve(connection));
            }
        }
        if (full) {
            try {
                respond(socket.getOutputStream(), "503 Service Unavailable", "");
            } catch (IOException gone) {
                // It left first.
            }
            closeQuietly(socket);
            return;
        }
        connection.handler.start();
    }

    /** Parks the streams nobody is watching and stops the server when it has nothing left to do. */
    private void tick() {
        long now = now();
        List<Source> toIdle = new ArrayList<>();
        boolean finished;
        synchronized (lock) {
            for (Stream stream : streams.values()) {
                if (stream.connections == 0 && !stream.parked && now - stream.lastSeen >= timing.unwatchedMs) {
                    stream.parked = true;
                    toIdle.add(stream.source);
                }
            }
            long quiet = now - lastActivity;
            finished = quiet >= (connections.isEmpty() ? timing.emptyMs : timing.stalledMs);
        }
        for (Source source : toIdle) idle(source);
        if (finished) stop();
    }

    private void serve(Connection connection) {
        Socket socket = connection.socket;
        Reader reader = null;
        try {
            socket.setSoTimeout((int) timing.headerMs);
            socket.setTcpNoDelay(true);
            InputStream in = socket.getInputStream();
            OutputStream out = socket.getOutputStream();
            String head = readHead(in);
            if (head == null) {
                respond(out, "431 Request Header Fields Too Large", "");
                return;
            }
            String[] lines = head.split("\r\n");
            String[] request = lines[0].split(" ");
            if (request.length != 3 || !request[2].startsWith("HTTP/1.")) {
                respond(out, "400 Bad Request", "");
                return;
            }
            // The token comes first, so nothing about the server shows without it.
            Stream stream = find(request[1]);
            if (stream == null) {
                respond(out, "404 Not Found", "");
                return;
            }
            boolean headOnly = "HEAD".equals(request[0]);
            if (!headOnly && !"GET".equals(request[0])) {
                respond(out, "405 Method Not Allowed", "Allow: GET, HEAD\r\n");
                return;
            }
            long[] range = parseRange(header(lines, "range"), stream.size);
            if (range == UNSATISFIABLE) {
                respond(out, "416 Range Not Satisfiable", "Content-Range: bytes */" + stream.size + "\r\n");
                return;
            }
            if (!attach(connection, stream)) return;
            socket.setSoTimeout(0);
            daemon("video stream watch", () -> watch(connection)).start();

            long start = range == null ? 0 : range[0];
            long end = range == null ? stream.size - 1 : range[1];
            long length = end - start + 1;
            String status = range == null ? "200 OK" : "206 Partial Content";
            String headers = "Content-Type: " + (stream.mime != null ? stream.mime : ANY_BYTES) + "\r\n"
                    + "Accept-Ranges: bytes\r\n"
                    + (range == null ? "" : "Content-Range: bytes " + start + "-" + end + "/" + stream.size + "\r\n")
                    + "Content-Length: " + length + "\r\n";
            if (headOnly) {
                writeHead(out, status, headers);
                return;
            }
            try {
                reader = stream.source.open(start, length);
            } catch (IOException | RuntimeException failed) {
                respond(out, "502 Bad Gateway", "");
                return;
            }
            writeHead(out, status, headers);
            copy(reader, out, length);
        } catch (IOException gone) {
            // The player hung up, or never finished asking.
        } finally {
            // A leftover interrupt from the watcher isn't for whatever runs next.
            Thread.interrupted();
            if (reader != null) closeReader(reader);
            detach(connection);
            closeQuietly(socket);
        }
    }

    private void copy(Reader reader, OutputStream out, long length) throws IOException {
        byte[] buffer = new byte[BUFFER_BYTES];
        long left = length;
        while (left > 0 && !stopped.get() && !Thread.currentThread().isInterrupted()) {
            int read = reader.read(buffer, 0, (int) Math.min(left, buffer.length));
            // Telegram's reader answers below zero when interrupted and zero once closed.
            if (read <= 0) return;
            out.write(buffer, 0, read);
            left -= read;
            lastActivity = now();
        }
    }

    /** Waits for the player to hang up. Players never half close, so an end of input means it's gone. */
    private void watch(Connection connection) {
        try {
            InputStream in = connection.socket.getInputStream();
            byte[] ignored = new byte[256];
            while (in.read(ignored) >= 0) {
                // Anything it sends after its request means nothing here.
            }
        } catch (IOException gone) {
            // Same thing.
        }
        connection.end();
    }

    private boolean attach(Connection connection, Stream stream) {
        synchronized (lock) {
            if (streams.get(stream.key) != stream) return false;
            connection.stream = stream;
            stream.connections++;
            stream.parked = false;
            stream.lastSeen = now();
            lastActivity = stream.lastSeen;
            return true;
        }
    }

    private void detach(Connection connection) {
        synchronized (lock) {
            connections.remove(connection);
            Stream stream = connection.stream;
            if (stream == null) return;
            connection.stream = null;
            stream.connections--;
            stream.lastSeen = now();
        }
    }

    /** Every stream's token is compared in full, so timing says nothing about how close a guess came. */
    private Stream find(String target) {
        if (!target.startsWith("/")) return null;
        int end = target.indexOf('/', 1);
        byte[] given = (end < 0 ? target.substring(1) : target.substring(1, end)).getBytes(StandardCharsets.ISO_8859_1);
        Stream match = null;
        synchronized (lock) {
            for (Stream stream : streams.values()) {
                if (MessageDigest.isEqual(given, stream.token.getBytes(StandardCharsets.ISO_8859_1))) match = stream;
            }
        }
        return match;
    }

    private String newToken() {
        byte[] bytes = new byte[16];
        random.nextBytes(bytes);
        StringBuilder token = new StringBuilder(32);
        for (byte b : bytes) token.append(String.format(Locale.ROOT, "%02x", b));
        return token.toString();
    }

    /** The request up to its blank line, null when that's too long. */
    private String readHead(InputStream in) throws IOException {
        byte[] head = new byte[MAX_HEADER_BYTES];
        int used = 0;
        long deadline = now() + timing.headerMs;
        while (used < head.length) {
            int read = in.read(head, used, head.length - used);
            if (read < 0) throw new EOFException();
            int from = Math.max(0, used - 3);
            used += read;
            for (int i = from; i + 3 < used; i++) {
                if (head[i] == '\r' && head[i + 1] == '\n' && head[i + 2] == '\r' && head[i + 3] == '\n') {
                    return new String(head, 0, i, StandardCharsets.ISO_8859_1);
                }
            }
            if (now() >= deadline) throw new SocketTimeoutException();
        }
        return null;
    }

    private static String header(String[] lines, String name) {
        for (int i = 1; i < lines.length; i++) {
            int colon = lines[i].indexOf(':');
            if (colon > 0 && lines[i].substring(0, colon).trim().equalsIgnoreCase(name)) {
                return lines[i].substring(colon + 1).trim();
            }
        }
        return null;
    }

    private static void writeHead(OutputStream out, String status, String headers) throws IOException {
        String head = "HTTP/1.1 " + status + "\r\n" + headers + "Connection: close\r\nCache-Control: no-store\r\n\r\n";
        out.write(head.getBytes(StandardCharsets.ISO_8859_1));
        out.flush();
    }

    private static void respond(OutputStream out, String status, String headers) throws IOException {
        writeHead(out, status, headers + "Content-Length: 0\r\n");
    }

    /**
     * What a Range header asks of a file of {@code size} bytes: first and last byte, null for the
     * whole file, an empty array when nothing it asks for exists. A header that can't be read, or
     * asks for several ranges, is ignored, as HTTP allows.
     */
    static long[] parseRange(String header, long size) {
        if (header == null) return null;
        String value = header.trim();
        if (!value.regionMatches(true, 0, "bytes=", 0, 6)) return null;
        String spec = value.substring(6).trim();
        int dash = spec.indexOf('-');
        if (dash < 0 || spec.indexOf(',') >= 0) return null;
        String first = spec.substring(0, dash).trim();
        String last = spec.substring(dash + 1).trim();
        try {
            if (first.isEmpty()) {
                if (!digits(last)) return null;
                long suffix = Long.parseLong(last);
                if (suffix == 0 || size == 0) return UNSATISFIABLE;
                return new long[] {Math.max(0, size - suffix), size - 1};
            }
            if (!digits(first) || (!last.isEmpty() && !digits(last))) return null;
            long start = Long.parseLong(first);
            long end = last.isEmpty() ? size - 1 : Long.parseLong(last);
            if (end < start && !last.isEmpty()) return null;
            if (start >= size) return UNSATISFIABLE;
            return new long[] {start, Math.min(end, size - 1)};
        } catch (NumberFormatException tooLong) {
            return null;
        }
    }

    private static boolean digits(String text) {
        if (text.isEmpty()) return false;
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c < '0' || c > '9') return false;
        }
        return true;
    }

    /** A file name that's safe in the address. A player reads the extension from it. */
    static String safeName(String name) {
        StringBuilder safe = new StringBuilder();
        if (name != null) {
            for (int i = 0; i < name.length() && safe.length() < NAME_LIMIT; i++) {
                char c = name.charAt(i);
                boolean plain = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9')
                        || c == '.' || c == '-' || c == '_';
                safe.append(plain ? c : '_');
            }
        }
        // Keep the extension when a long name got cut.
        if (name != null && name.length() > NAME_LIMIT) {
            int dot = name.lastIndexOf('.');
            String extension = dot < 0 ? "" : safeName(name.substring(dot));
            if (extension.length() > 1 && extension.length() <= 8) {
                safe.setLength(NAME_LIMIT - extension.length());
                safe.append(extension);
            }
        }
        String text = safe.toString();
        // Only dots would read as a path, and nothing at all gives the player no hint.
        return text.replace(".", "").replace("_", "").isEmpty() ? FALLBACK_NAME : text;
    }

    /** The sender's type if it's a well formed video type, or null. It comes from the message. */
    static String safeMime(String mime) {
        if (mime == null) return null;
        String type = mime.trim().toLowerCase(Locale.ROOT);
        if (!type.startsWith("video/") || type.length() == 6 || type.length() > 64) return null;
        for (int i = 6; i < type.length(); i++) {
            char c = type.charAt(i);
            boolean plain = (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || c == '.' || c == '-' || c == '+' || c == '_';
            if (!plain) return null;
        }
        return type;
    }

    /** A file that's already here, read as a stream. */
    static Source fileSource(File file) {
        return new Source() {
            @Override public Reader open(long position, long length) throws IOException {
                RandomAccessFile opened = new RandomAccessFile(file, "r");
                try {
                    opened.seek(position);
                } catch (IOException | RuntimeException failed) {
                    closeQuietly(opened);
                    throw failed;
                }
                return new Reader() {
                    @Override public int read(byte[] into, int offset, int count) throws IOException {
                        return opened.read(into, offset, count);
                    }

                    @Override public void close() {
                        closeQuietly(opened);
                    }
                };
            }

            @Override public void idle() {}
        };
    }

    private static void idle(Source source) {
        try {
            source.idle();
        } catch (RuntimeException ignored) {
            // A stream that can't be parked is no reason to stop the others.
        }
    }

    private static void closeReader(Reader reader) {
        try {
            reader.close();
        } catch (RuntimeException ignored) {
            // The response is over either way.
        }
    }

    private static void closeQuietly(java.io.Closeable closeable) {
        try {
            closeable.close();
        } catch (IOException ignored) {
            // Nothing is left to do with it.
        }
    }

    private static Thread daemon(String name, Runnable body) {
        Thread thread = new Thread(body, name);
        thread.setDaemon(true);
        return thread;
    }

    private static long now() {
        return System.nanoTime() / 1_000_000L;
    }
}
