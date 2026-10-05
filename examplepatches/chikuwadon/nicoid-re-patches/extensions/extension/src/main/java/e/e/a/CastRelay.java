package e.e.a;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;

/** Adds authenticated HLS to the existing Cast server while retaining its comment and stop paths. */
public final class CastRelay {
    private CastRelay() { }
    private static final Map<Object, Session> pending = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, Session> active = Collections.synchronizedMap(new WeakHashMap<>());
    public static void prepare(Object callback, String url) {
        try {
            Object service = callback.getClass().getField("a").get(callback);
            Session old = pending.remove(service); if (old != null) old.close();
            if (url == null || !new URL(url).getPath().endsWith(".m3u8")) return;
            String cookie = (String) Class.forName("e.e.a.ModernPlayback").getField("domandCookie").get(null);
            pending.put(service, new Session(new URL(url), cookie));
        } catch (Exception error) { failed(error); }
    }
    public static void attach(Object callback) {
        try {
            Object service = callback.getClass().getField("a").get(callback);
            Session session = pending.remove(service);
            if (session == null) return;
            Object server = service.getClass().getField("n").get(service);
            try {
                String base = (String) service.getClass().getField("i").get(service);
                if (base == null || !base.startsWith("http://")) throw new IOException("No local Cast address");
                String url = base.replaceAll("/+$", "") + session.hls.route(session.master);
                Session old = active.put(server, session); if (old != null) old.close();
                service.getClass().getField("j").set(service, url);
                CastDiagnostics.record("Cast: authenticated HLS relay attached");
            } catch (Exception error) { active.remove(server); session.close(); throw error; }
        } catch (Exception error) { failed(error); }
    }
    public static boolean dispatch(Object server, Socket socket) {
        Session session = active.get(server);
        if (session == null) return false;
        try { session.accept(server, socket); }
        finally {
            // The original accept loop sets k before calling its socket handler.
            try { server.getClass().getField("k").setBoolean(server, false); }
            catch (ReflectiveOperationException error) { failed(error); }
        }
        return true;
    }
    public static void detach(Object server) {
        Session session = active.remove(server); if (session != null) session.close();
    }
    static void failed(Throwable error) { CastDiagnostics.record("Cast relay failed: " + error.getClass().getSimpleName()); }
    static final class Session {
        final URL master;
        final CastHls hls;
        final ThreadPoolExecutor workers = new ThreadPoolExecutor(4, 4, 30, TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(16));
        final Set<Socket> sockets = new HashSet<>();
        final Set<HttpURLConnection> connections = new HashSet<>();
        volatile boolean closed;
        Session(URL master, String cookie) throws IOException {
            CastHls.validate(master); this.master = master; hls = new CastHls(cookie);
            workers.allowCoreThreadTimeOut(true);
        }
        synchronized void accept(Object server, Socket socket) {
            if (closed) { closeSocket(socket); return; }
            sockets.add(socket);
            try { workers.execute(() -> serve(server, socket)); }
            catch (RejectedExecutionException error) { sockets.remove(socket); closeSocket(socket); failed(error); }
        }
        synchronized void close() {
            closed = true; workers.shutdownNow();
            for (Socket socket : sockets) closeSocket(socket);
            sockets.clear();
            for (HttpURLConnection connection : connections) connection.disconnect();
            connections.clear(); hls.clear();
        }
        private void serve(Object server, Socket socket) {
            try (Socket client = socket; BufferedOutputStream out = new BufferedOutputStream(client.getOutputStream())) {
                client.setSoTimeout(15000);
                BufferedReader in = new BufferedReader(new InputStreamReader(client.getInputStream(), StandardCharsets.US_ASCII));
                String first = line(in);
                String[] request = first == null ? new String[0] : first.split(" ");
                if (request.length != 3) { response(out, 400, null, 0); return; }
                String method = request[0], path = request[1], range = null;
                boolean head = "HEAD".equals(method);
                int size = first.length();
                for (String header; (header = line(in)) != null && !header.isEmpty();) {
                    size += header.length(); if (size > 32768) throw new IOException("Oversized Cast request");
                    if (header.regionMatches(true, 0, "Range:", 0, 6)) range = header.substring(6).trim();
                }
                if ("OPTIONS".equals(method)) { response(out, 204, null, 0); return; }
                if (!head && !"GET".equals(method)) { response(out, 405, null, 0); return; }
                // Comment transfer retains the original formatter and custom receiver protocol.
                if (path.equals("/comment.json")) {
                    if (head) response(out, 200, "application/json", -1);
                    else server.getClass().getMethod("a", BufferedOutputStream.class).invoke(server, out);
                    return;
                }
                URL url = hls.lookup(path);
                if (url == null || closed) { response(out, 404, null, 0); return; }
                if (range != null && !range.matches("bytes=(?:[0-9]+-[0-9]*|-[0-9]+)")) {
                    response(out, 416, null, 0); return;
                }
                transfer(out, url, head, range);
            } catch (Exception error) { failed(error); }
            finally { synchronized (this) { sockets.remove(socket); } }
        }
        void transfer(BufferedOutputStream out, URL url, boolean head, String range) throws IOException {
            HttpURLConnection connection = null;
            boolean responded = false;
            try {
                for (int redirect = 0; ; redirect++) {
                    CastHls.validate(url);
                    connection = (HttpURLConnection) url.openConnection();
                    synchronized (this) {
                        if (closed) throw new IOException("Cast session closed");
                        connections.add(connection);
                    }
                    connection.setConnectTimeout(15000); connection.setReadTimeout(20000);
                    connection.setInstanceFollowRedirects(false);
                    // Fetch a playlist even for HEAD so its rewritten Content-Length matches GET.
                    connection.setRequestMethod("GET");
                    connection.setRequestProperty("Accept-Encoding", "identity");
                    connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36");
                    connection.setRequestProperty("Origin", "https://www.nicovideo.jp");
                    connection.setRequestProperty("Referer", "https://www.nicovideo.jp/");
                    String cookie = hls.cookieFor(url);
                    if (!cookie.isEmpty()) connection.setRequestProperty("Cookie", cookie);
                    boolean playlist = url.getPath().endsWith(".m3u8");
                    if (range != null && !playlist) connection.setRequestProperty("Range", range);
                    int status = connection.getResponseCode();
                    if (status == 301 || status == 302 || status == 303 || status == 307 || status == 308) {
                        String location = connection.getHeaderField("Location");
                        if (redirect >= 5 || location == null) throw new IOException("Cast redirect failed");
                        URL next = new URL(url, location); CastHls.validate(next);
                        release(connection); connection = null; url = next; continue;
                    }
                    CastDiagnostics.record("Cast relay HTTP " + status + (playlist ? " playlist" : " resource"));
                    if (status != 200 && status != 206) { responded = true; response(out, status, null, 0); return; }
                    String type = connection.getContentType();
                    playlist |= type != null && type.toLowerCase(Locale.ROOT).contains("mpegurl");
                    if (playlist) {
                        byte[] body;
                        try (InputStream input = connection.getInputStream()) { body = readPlaylist(input); }
                        byte[] rewritten = hls.rewrite(url, new String(body, StandardCharsets.UTF_8)).getBytes(StandardCharsets.UTF_8);
                        responded = true; response(out, 200, "application/vnd.apple.mpegurl", rewritten.length);
                        if (!head) out.write(rewritten);
                    } else {
                        String length = connection.getHeaderField("Content-Length");
                        long count = length == null ? -1 : Long.parseLong(length);
                        responded = true; responseStart(out, status, type == null ? "application/octet-stream" : type, count);
                        if (!playlist) {
                            header(out, "Content-Range", connection.getHeaderField("Content-Range"));
                            header(out, "Accept-Ranges", "bytes");
                        }
                        out.write("\r\n".getBytes(StandardCharsets.US_ASCII));
                        if (!head) try (InputStream input = connection.getInputStream()) {
                            byte[] buffer = new byte[32768];
                            for (int n; (n = input.read(buffer)) != -1;) {
                                if (closed) throw new IOException("Cast session closed");
                                out.write(buffer, 0, n);
                            }
                        }
                    }
                    out.flush(); return;
                }
            } catch (IOException error) {
                // Do not forward an upstream exception message or body (may contain signed URLs).
                failed(error);
                if (!responded) response(out, 502, null, 0);
                else throw error;
            } finally { if (connection != null) release(connection); }
        }
        private void release(HttpURLConnection connection) {
            synchronized (this) { connections.remove(connection); }
            connection.disconnect();
        }
    }
    private static byte[] readPlaylist(InputStream input) throws IOException {
        ByteArrayOutputStream body = new ByteArrayOutputStream(); byte[] buffer = new byte[8192];
        for (int n; (n = input.read(buffer)) != -1;) {
            if (body.size() + n > 2 * 1024 * 1024) throw new IOException("Oversized HLS playlist");
            body.write(buffer, 0, n);
        }
        return body.toByteArray();
    }
    private static String line(BufferedReader in) throws IOException {
        StringBuilder text = new StringBuilder();
        for (int c; (c = in.read()) != -1;) {
            if (c == '\n') return text.toString();
            if (c != '\r') text.append((char)c);
            if (text.length() > 8192) throw new IOException("Oversized Cast header");
        }
        return text.length() == 0 ? null : text.toString();
    }
    private static void responseStart(OutputStream out, int status, String type, long length) throws IOException {
        out.write(("HTTP/1.1 " + status + " Response\r\n").getBytes(StandardCharsets.US_ASCII));
        header(out, "Connection", "close"); header(out, "Access-Control-Allow-Origin", "*");
        header(out, "Access-Control-Allow-Methods", "GET, HEAD, OPTIONS");
        header(out, "Access-Control-Allow-Headers", "Range");
        header(out, "Access-Control-Expose-Headers", "Content-Length, Content-Range, Accept-Ranges");
        header(out, "Cache-Control", "no-store"); header(out, "Content-Type", type);
        if (length >= 0) header(out, "Content-Length", Long.toString(length));
    }
    private static void response(OutputStream out, int status, String type, long length) throws IOException {
        responseStart(out, status, type, length); out.write("\r\n".getBytes(StandardCharsets.US_ASCII)); out.flush();
    }
    private static void header(OutputStream out, String name, String value) throws IOException {
        if (value != null && value.indexOf('\r') < 0 && value.indexOf('\n') < 0)
            out.write((name + ": " + value + "\r\n").getBytes(StandardCharsets.US_ASCII));
    }
    private static void closeSocket(Socket socket) { try { socket.close(); } catch (IOException ignored) { } }
}
