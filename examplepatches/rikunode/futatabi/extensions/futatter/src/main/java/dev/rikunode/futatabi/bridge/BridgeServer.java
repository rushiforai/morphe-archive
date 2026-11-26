package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

final class BridgeServer {
    private static final String TAG = "FutatabiBridge";
    private static final int PORT = 18765;
    private final AimogeAdapter aimoge;
    private final AnimanchAdapter animanch;
    private final MebukiAdapter mebuki;
    private final ExtensionApi extension;
    private final StockReply stockReply;
    private final ExecutorService workers = Executors.newFixedThreadPool(6);
    private static volatile ServerSocket listener;
    private static final java.util.Set<Socket> acceptedPeers = java.util.concurrent.ConcurrentHashMap.newKeySet();

    BridgeServer(Context context) {
        aimoge = new AimogeAdapter(context);
        animanch = new AnimanchAdapter(context);
        mebuki = new MebukiAdapter(context);
        extension = new ExtensionApi(context, aimoge, animanch, mebuki);
        stockReply = new StockReply(aimoge,animanch,extension,draft->MebukiNewThreadActivity.open(context,draft),
                draft->AnimanchNewThreadActivity.open(context,draft));
    }

    void run() {
        try (ServerSocket server = new ServerSocket(PORT, 16, InetAddress.getByName("127.0.0.1"))) {
            server.setSoTimeout(30000);
            listener = server;
            while (!Thread.currentThread().isInterrupted()) {
                try {
                    Socket client = server.accept();
                    acceptedPeers.add(client);
                    try {
                        workers.execute(() -> {
                            try { serve(client); }
                            finally { acceptedPeers.remove(client); }
                        });
                    } catch (RuntimeException ex) {
                        acceptedPeers.remove(client);
                        client.close();
                        throw ex;
                    }
                } catch (java.net.SocketTimeoutException ignored) {
                }
            }
        } catch (Exception ex) {
            Log.w(TAG, "Local bridge unavailable: " + ex.getClass().getSimpleName());
        } finally {
            // A failed second bind must never clear the live listener.
            ServerSocket current = listener;
            if (current != null && current.isClosed()) listener = null;
            workers.shutdownNow();
        }
    }

    /** Connect without writing anything until the reverse socket is owned by this process. */
    static Socket connectVerified() throws Exception {
        ServerSocket expected = listener;
        if (expected == null || expected.isClosed()) throw new java.io.IOException("Bridge unavailable");
        Socket socket = new Socket();
        boolean verified = false;
        try {
            socket.connect(new java.net.InetSocketAddress("127.0.0.1", PORT), 2500);
            long deadline = System.nanoTime() + 2_500_000_000L;
            do {
                if (listener != expected || expected.isClosed()) break;
                // accept() can lag behind connect(); inspect this exact TCP connection.
                if (isAcceptedPeer(socket) && listener == expected && !expected.isClosed()) {
                    socket.setSoTimeout(25000);
                    verified = true;
                    return socket;
                }
                Thread.sleep(10);
            } while (System.nanoTime() < deadline);
            throw new java.io.IOException("Bridge peer not verified");
        } finally {
            if (!verified) socket.close();
        }
    }

    private static boolean isAcceptedPeer(Socket outgoing) {
        for (Socket accepted : acceptedPeers) {
            if (!accepted.isClosed() && outgoing.getLocalSocketAddress().equals(accepted.getRemoteSocketAddress()) &&
                    outgoing.getRemoteSocketAddress().equals(accepted.getLocalSocketAddress())) return true;
        }
        return false;
    }

    static boolean requiresOwnPeer(String method, String path) {
        boolean callback = "GET".equals(method) && path.startsWith("/ext/login/aimoge/callback?");
        return (!callback && path.startsWith("/ext/")) || path.startsWith("/animanch/") ||
                ("POST".equals(method) && StockReply.isPath(path));
    }

    // The stock client appends &sort=N to catalog URLs. Match the mode
    // parameter, not the whole raw request target.
    static boolean hasCatalogMode(String rawPath) {
        int query = rawPath.indexOf('?');
        if (query < 0) return false;
        for (String parameter : rawPath.substring(query + 1).split("&")) {
            if ("mode=cat".equals(parameter)) return true;
        }
        return false;
    }

    static String readLine(InputStream in, int limit) throws Exception {
        ByteArrayOutputStream b = new ByteArrayOutputStream();
        for (int i = 0; i < limit; i++) {
            int ch = in.read();
            if (ch < 0) return null;
            if (ch == '\n') {
                byte[] raw = b.toByteArray();
                int size = raw.length;
                if (size > 0 && raw[size - 1] == '\r') size--;
                return new String(raw, 0, size, StandardCharsets.US_ASCII);
            }
            b.write(ch);
        }
        throw new IllegalArgumentException("Header too long");
    }

    private void serve(Socket socket) {
        try (Socket client = socket) {
            client.setSoTimeout(12000);
            InputStream input = new BufferedInputStream(client.getInputStream());
            String first = readLine(input, 2048);
            if (first == null) return;
            String[] parts = first.split(" ");
            if (parts.length != 3 || !parts[2].startsWith("HTTP/1.")) return;
            String method = parts[0], path = parts[1];
            if (!path.startsWith("/") || path.length() > 2000) return;
            Map<String,String> headers = new HashMap<>();
            int length = 0;
            for (int i = 0; i < 50; i++) {
                String line = readLine(input, 8192);
                if (line == null) return;
                if (line.isEmpty()) break;
                length += line.length();
                if (length > 12000) return;
                int colon = line.indexOf(':');
                if (colon > 0) headers.put(line.substring(0, colon).trim().toLowerCase(java.util.Locale.ROOT),
                        line.substring(colon + 1).trim());
            }
            boolean stockPost="POST".equals(method)&&StockReply.isPath(path);
            boolean ownPeer = ProcessSocketAuth.ownsPeer(client);
            // The external PKCE callback is protected by its one-time state, not a process check.
            // All other extension routes and all Animanch routes can use local credentials.
            if ((requiresOwnPeer(method, path) && !ownPeer) ||
                    (stockPost && !StockReply.stockHeaders(headers))) {
                write(client.getOutputStream(),BridgeResponse.text(403,"Not authorized"));return;
            }
            byte[] body = new byte[0];
            if ("POST".equals(method)) {
                String size = headers.get("content-length");
                int n;
                try { n = Integer.parseInt(size); }
                catch (Exception ignored) { n = -1; }
                if (n < 0 || n > 28_000_000) {
                    write(client.getOutputStream(), BridgeResponse.text(413, "Invalid request length"));
                    return;
                }
                body = new byte[n];
                int off = 0;
                while (off < n) {
                    int count = input.read(body, off, n - off);
                    if (count < 0) return;
                    off += count;
                }
            }
            BridgeResponse response;
            if (path.startsWith("/ext/")) {
                response = extension.route(method, path, headers, body);
            } else if (stockPost) {
                response = stockReply.submit(path,headers,body);
            } else if (!"GET".equals(method)) {
                response = BridgeResponse.text(403, "Read only");
            } else if (path.startsWith("/aimoge/")) {
                response = aimoge.route(path);
            } else if (path.startsWith("/animanch/")) {
                response = animanch.route(path);
            } else if (path.startsWith("/mebuki/")) {
                response = mebuki.route(path, ownPeer);
            } else {
                response = BridgeResponse.text(404, "Not found");
            }
            // Log only bounded route categories and status, never query, IDs,
            // request bodies, credentials, cookies or response payloads.
            if (response.status >= 400 && (path.startsWith("/aimoge/") || path.startsWith("/animanch/"))) {
                String[] route = path.split("\\?", 2)[0].split("/");
                String kind = route.length > 2 && route[2].matches("res|thumb|src|cat|futaba\\.php|futaba\\.htm|sd\\.php")
                        ? route[2] : "other";
                Log.w(TAG, "Board request " + ("GET".equals(method) ? "GET" : "POST".equals(method) ? "POST" : "other")
                        + " " + route[1] + "/" + kind + " HTTP " + response.status);
            }
            write(client.getOutputStream(), response);
        } catch (Exception ex) {
            Log.w(TAG, "Local request error: " + ex.getClass().getSimpleName());
        }
    }

    private static void write(OutputStream raw, BridgeResponse response) throws Exception {
        BufferedOutputStream output = new BufferedOutputStream(raw);
        String phrase;
        switch (response.status) {
            case 200: phrase = "OK"; break;
            case 201: phrase = "Created"; break;
            case 400: phrase = "Bad Request"; break;
            case 401: phrase = "Unauthorized"; break;
            case 403: phrase = "Forbidden"; break;
            case 404: phrase = "Not Found"; break;
            case 405: phrase = "Method Not Allowed"; break;
            case 409: phrase = "Conflict"; break;
            case 413: phrase = "Payload Too Large"; break;
            case 429: phrase = "Too Many Requests"; break;
            default: phrase = "Unavailable";
        }
        String headers = "HTTP/1.1 " + response.status + " " + phrase +
                "\r\nContent-Type: " + response.contentType +
                "\r\nContent-Length: " + response.bytes.length +
                "\r\nCache-Control: no-store\r\nX-Content-Type-Options: nosniff" +
                "\r\nConnection: close\r\n\r\n";
        output.write(headers.getBytes(StandardCharsets.US_ASCII));
        output.write(response.bytes);
        output.flush();
    }

    static final class BridgeResponse {
        final int status;
        final String contentType;
        final byte[] bytes;
        BridgeResponse(int status, String type, byte[] bytes) {
            this.status = status; this.contentType = type; this.bytes = bytes;
        }
        static BridgeResponse text(int status, String message) {
            return new BridgeResponse(status, "text/plain; charset=utf-8",
                    message.getBytes(StandardCharsets.UTF_8));
        }
        static BridgeResponse json(int status, String json) {
            return new BridgeResponse(status, "application/json; charset=utf-8",
                    json.getBytes(StandardCharsets.UTF_8));
        }
        static BridgeResponse html(byte[] bytes) {
            return new BridgeResponse(200, "text/html; charset=Shift_JIS", bytes);
        }
        static BridgeResponse image(byte[] bytes) {
            return new BridgeResponse(200, "image/jpeg", bytes);
        }
    }
}
