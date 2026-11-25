package app.template.extension.stayfree;

import android.content.Context;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Minimal HTTP/1.1 server implementing the subset of the StayFree usage API used for device
 * pairing and cross-device stats. Paths may come with or without the {@code /v1} prefix.
 * <p>
 * Sync endpoints are open to the LAN (the browser extension calls them) but every one of them
 * needs either a short-lived pairing code or the group key it returns. Requests from the app
 * itself (loopback) additionally reach a small proxy allowlist of read-only lookups; any other
 * {@code api.stayfreeapps.com} call, i.e. every data-collection upload, is answered locally and
 * dropped.
 */
final class LocalSyncServer {
    /** Read-only lookups the app makes today, forwarded upstream unchanged (loopback only). */
    private static final String[] PROXY_ALLOWLIST = {
            "android/apps/",
            "remote_config/",
            "characteristics/",
            "analytics/avg_",
            "analytics/top_apps",
            "brands",
    };

    private static final int MAX_HEADER_LINE = 16 * 1024;
    private static final int MAX_BODY = 32 * 1024 * 1024;

    private final int port;
    private final LocalSyncStore store;
    private final AndroidUsage usage;
    private final SyncDebugLog debugLog;
    private final ExecutorService workers = Executors.newFixedThreadPool(4);
    private ServerSocket serverSocket;

    LocalSyncServer(Context context, int port) {
        this.port = port;
        this.store = new LocalSyncStore(new File(context.getFilesDir(), "stayfree_local_sync.json"));
        this.usage = new AndroidUsage(context);
        this.debugLog = new SyncDebugLog(context);
    }

    void start() throws IOException {
        ServerSocket socket = new ServerSocket();
        socket.setReuseAddress(true);
        socket.bind(new InetSocketAddress((InetAddress) null, port), 32);
        serverSocket = socket;
        Thread acceptor = new Thread(this::acceptLoop, "StayFreeLocalSync");
        acceptor.setDaemon(true);
        acceptor.start();
    }

    private void acceptLoop() {
        while (!serverSocket.isClosed()) {
            try {
                Socket client = serverSocket.accept();
                workers.execute(() -> handle(client));
            } catch (IOException e) {
                Log.w(LocalSync.TAG, "accept failed", e);
            }
        }
    }

    // region HTTP plumbing

    private static final class Request {
        String method;
        String target;
        String path;
        Map<String, String> query = new HashMap<>();
        Map<String, String> headers = new LinkedHashMap<>();
        byte[] body = new byte[0];
        boolean loopback;

        JSONObject json() throws LocalSyncStore.HttpError {
            if (body.length == 0) return new JSONObject();
            try {
                return new JSONObject(new String(body, StandardCharsets.UTF_8));
            } catch (JSONException e) {
                throw new LocalSyncStore.HttpError(400, "Invalid JSON body");
            }
        }
    }

    private static final class Response {
        final int status;
        final String contentType;
        final byte[] body;
        final Map<String, String> headers = new LinkedHashMap<>();

        Response(int status, String contentType, byte[] body) {
            this.status = status;
            this.contentType = contentType;
            this.body = body == null ? new byte[0] : body;
        }

        static Response json(Object value) {
            return new Response(200, "application/json; charset=utf-8", value.toString().getBytes(StandardCharsets.UTF_8));
        }

        static Response empty(int status) {
            return new Response(status, null, null);
        }

        static Response error(int status, String message) {
            JSONObject error = new JSONObject();
            LocalSyncStore.put(error, "error", message == null ? "" : message);
            return new Response(status, "application/json; charset=utf-8", error.toString().getBytes(StandardCharsets.UTF_8));
        }
    }

    private void handle(Socket socket) {
        try (Socket s = socket) {
            s.setSoTimeout(20_000);
            InputStream in = new BufferedInputStream(s.getInputStream());
            Request request = readRequest(in);
            if (request == null) return;
            request.loopback = s.getInetAddress().isLoopbackAddress();

            Response response;
            Throwable failure = null;
            try {
                response = route(request);
            } catch (LocalSyncStore.HttpError e) {
                failure = e;
                response = Response.error(e.status, e.getMessage());
            } catch (Throwable t) {
                failure = t;
                Log.e(LocalSync.TAG, "Error handling " + request.method + " " + request.path, t);
                response = Response.error(500, t.toString());
            }
            debugLog.request(request.method, request.target, request.loopback,
                    s.getInetAddress().getHostAddress(), request.body, response.status, failure);
            writeResponse(s.getOutputStream(), request.method, response);
        } catch (IOException ignored) {
            // Client went away.
        }
    }

    private static Request readRequest(InputStream in) throws IOException {
        String requestLine = readLine(in);
        if (requestLine == null || requestLine.isEmpty()) return null;
        String[] parts = requestLine.split(" ");
        if (parts.length < 2) return null;

        Request request = new Request();
        request.method = parts[0].toUpperCase(Locale.US);
        request.target = parts[1];
        String line;
        while ((line = readLine(in)) != null && !line.isEmpty()) {
            int colon = line.indexOf(':');
            if (colon > 0) request.headers.put(line.substring(0, colon).trim().toLowerCase(Locale.US), line.substring(colon + 1).trim());
        }

        int q = request.target.indexOf('?');
        request.path = q >= 0 ? request.target.substring(0, q) : request.target;
        if (q >= 0) {
            for (String pair : request.target.substring(q + 1).split("&")) {
                if (pair.isEmpty()) continue;
                int eq = pair.indexOf('=');
                String name = eq >= 0 ? pair.substring(0, eq) : pair;
                String value = eq >= 0 ? pair.substring(eq + 1) : "";
                request.query.put(URLDecoder.decode(name, "UTF-8"), URLDecoder.decode(value, "UTF-8"));
            }
        }

        if ("chunked".equalsIgnoreCase(request.headers.get("transfer-encoding"))) {
            request.body = readChunked(in);
        } else {
            String length = request.headers.get("content-length");
            int n = length == null ? 0 : Integer.parseInt(length.trim());
            if (n < 0 || n > MAX_BODY) throw new IOException("Body too large");
            request.body = readFully(in, n);
        }
        return request;
    }

    private static String readLine(InputStream in) throws IOException {
        ByteArrayOutputStream line = new ByteArrayOutputStream();
        int c;
        while ((c = in.read()) != -1) {
            if (c == '\n') break;
            if (c != '\r') line.write(c);
            if (line.size() > MAX_HEADER_LINE) throw new IOException("Header line too long");
        }
        if (c == -1 && line.size() == 0) return null;
        return line.toString("ISO-8859-1");
    }

    private static byte[] readFully(InputStream in, int length) throws IOException {
        byte[] data = new byte[length];
        int read = 0;
        while (read < length) {
            int n = in.read(data, read, length - read);
            if (n < 0) throw new IOException("Unexpected end of body");
            read += n;
        }
        return data;
    }

    private static byte[] readChunked(InputStream in) throws IOException {
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        while (true) {
            String sizeLine = readLine(in);
            if (sizeLine == null) throw new IOException("Unexpected end of chunked body");
            int semicolon = sizeLine.indexOf(';');
            int size = Integer.parseInt((semicolon >= 0 ? sizeLine.substring(0, semicolon) : sizeLine).trim(), 16);
            if (size == 0) {
                String trailer;
                while ((trailer = readLine(in)) != null && !trailer.isEmpty()) {
                    // Discard trailers.
                }
                return body.toByteArray();
            }
            if (body.size() + size > MAX_BODY) throw new IOException("Body too large");
            body.write(readFully(in, size));
            readLine(in);
        }
    }

    private static void writeResponse(OutputStream out, String method, Response response) throws IOException {
        StringBuilder head = new StringBuilder();
        head.append("HTTP/1.1 ").append(response.status).append(' ').append(reason(response.status)).append("\r\n");
        if (response.contentType != null) head.append("Content-Type: ").append(response.contentType).append("\r\n");
        head.append("Content-Length: ").append(response.body.length).append("\r\n");
        head.append("Connection: close\r\n");
        head.append("Cache-Control: no-store\r\n");
        head.append("Access-Control-Allow-Origin: *\r\n");
        head.append("Access-Control-Allow-Methods: GET, POST, HEAD, OPTIONS\r\n");
        head.append("Access-Control-Allow-Headers: *\r\n");
        head.append("Access-Control-Expose-Headers: Last-Modified\r\n");
        head.append("Access-Control-Allow-Private-Network: true\r\n");
        for (Map.Entry<String, String> h : response.headers.entrySet()) {
            head.append(h.getKey()).append(": ").append(h.getValue()).append("\r\n");
        }
        head.append("\r\n");
        out.write(head.toString().getBytes(StandardCharsets.ISO_8859_1));
        if (!"HEAD".equals(method)) out.write(response.body);
        out.flush();
    }

    private static String reason(int status) {
        switch (status) {
            case 200: return "OK";
            case 204: return "No Content";
            case 400: return "Bad Request";
            case 403: return "Forbidden";
            case 404: return "Not Found";
            case 409: return "Conflict";
            case 429: return "Too Many Requests";
            case 502: return "Bad Gateway";
            default: return status >= 500 ? "Server Error" : "Status";
        }
    }

    // endregion

    // region Routing

    private Response route(Request request) throws Exception {
        if ("OPTIONS".equals(request.method)) return Response.empty(204);

        String p = request.path;
        if (p.startsWith("/v1/")) p = p.substring(4);
        else if (p.startsWith("/")) p = p.substring(1);

        switch (p) {
            case "":
            case "local/status":
                return status(request);
            case "sync/pairing/generate":
                return pairingGenerate(request);
            case "sync/pairing/validate":
                return pairingValidate(request);
            case "sync/pairing/check":
                return pairingCheck(request);
            case "sync/devices":
                return devices(request);
            case "sync/devices/remove":
                store.removeMember(request.query.get("key"), request.query.get("install_id"));
                return Response.empty(200);
            case "sync/devices/sessions":
                return sessions(request);
            case "sync/config":
                return Response.json(store.config(request.query.get("key")));
            case "web/upload":
                return webUpload(request);
            case "android/apps":
                return androidApps(request);
            default:
                break;
        }
        if (p.startsWith("sync/config/") && "POST".equals(request.method)) {
            store.updateConfig(p.substring("sync/config/".length()), request.json());
            return Response.empty(200);
        }
        if (p.startsWith("local/icon/")) {
            byte[] png = usage.iconPng(p.substring("local/icon/".length()));
            return png == null ? Response.empty(404) : new Response(200, "image/png", png);
        }

        if (!request.loopback) return Response.empty(404);
        for (String allowed : PROXY_ALLOWLIST) if (p.startsWith(allowed)) return proxy(request);
        // Everything else the app sends to api.stayfreeapps.com is data collection: drop it.
        return Response.empty("GET".equals(request.method) || "HEAD".equals(request.method) ? 404 : 204);
    }

    private Response status(Request request) {
        JSONObject status = new JSONObject();
        LocalSyncStore.put(status, "ok", true);
        LocalSyncStore.put(status, "service", "StayFree local sync");
        LocalSyncStore.put(status, "device", usage.deviceName());
        return Response.json(status);
    }

    /** The app's own install id is learnt from its pairing calls, which come over loopback. */
    private String installId(Request request) {
        String id = request.query.get("install_id");
        if (request.loopback && !LocalSyncStore.isBlank(id)) {
            store.noteLocalInstallId(id);
            store.registerDevice(id, usage.deviceName());
        }
        return id;
    }

    private Response pairingGenerate(Request request) throws LocalSyncStore.HttpError {
        return Response.json(store.generateCode(installId(request)));
    }

    private Response pairingValidate(Request request) throws LocalSyncStore.HttpError {
        String key = store.validateCode(installId(request), request.query.get("code"));
        return Response.json(groupKey(key));
    }

    private Response pairingCheck(Request request) throws LocalSyncStore.HttpError {
        String key = store.groupOf(installId(request));
        if (key == null) throw new LocalSyncStore.HttpError(404, "Not in a device group");
        return Response.json(groupKey(key));
    }

    private static JSONObject groupKey(String key) {
        JSONObject response = new JSONObject();
        LocalSyncStore.put(response, "key", key);
        return response;
    }

    private Response devices(Request request) throws LocalSyncStore.HttpError {
        List<String> members = store.members(request.query.get("key"));
        if (members.isEmpty()) throw new LocalSyncStore.HttpError(404, "Not in a device group");
        org.json.JSONArray list = new org.json.JSONArray();
        for (int i = 0; i < members.size(); i++) {
            String id = members.get(i);
            String name = store.deviceName(id);
            if (name == null) name = id.equals(store.localInstallId()) ? usage.deviceName() : "Browser";
            JSONObject device = new JSONObject();
            LocalSyncStore.put(device, "device_number", i + 1);
            LocalSyncStore.put(device, "install_id", id);
            LocalSyncStore.put(device, "name", name);
            list.put(device);
        }
        return Response.json(list);
    }

    /**
     * Sessions of every other device in the requester's group: this phone's apps come from
     * UsageStatsManager, paired browsers' websites from their uploads.
     */
    private Response sessions(Request request) throws LocalSyncStore.HttpError {
        String key = request.query.get("key");
        String requester = request.query.get("install_id");
        if (!store.isMember(key, requester)) throw new LocalSyncStore.HttpError(404, "Not in a device group");
        String local = store.localInstallId();
        List<String> members = store.members(key);

        if ("HEAD".equals(request.method)) {
            long lastModifiedSec = 0;
            for (String member : members) {
                if (member.equals(requester)) continue;
                long t = member.equals(local) ? System.currentTimeMillis() / 1000 / 60 * 60 : store.lastWebUpload(member);
                lastModifiedSec = Math.max(lastModifiedSec, t);
            }
            Response response = Response.empty(200);
            response.headers.put("Last-Modified", httpDate(Math.max(lastModifiedSec, 1) * 1000));
            return response;
        }

        long now = System.currentTimeMillis();
        long startMs = parseTime(request.query.get("start_time"), now - 24 * 60 * 60 * 1000L);
        long endMs = parseTime(request.query.get("end_time"), now);
        Set<String> appIds = csv(request.query.get("app_ids"));

        JSONObject androidApps = new JSONObject();
        JSONObject websites = new JSONObject();
        for (String member : members) {
            if (member.equals(requester)) continue;
            if (member.equals(local)) usage.appendSessions(androidApps, startMs, endMs, appIds, member);
            else store.appendWebSessions(websites, member, startMs / 1000, endMs / 1000, appIds);
        }

        JSONObject response = new JSONObject();
        LocalSyncStore.put(response, "android_apps", androidApps);
        LocalSyncStore.put(response, "websites", websites);
        LocalSyncStore.put(response, "windows_apps", new JSONObject());
        LocalSyncStore.put(response, "mac_apps", new JSONObject());
        LocalSyncStore.put(response, "linux_apps", new JSONObject());
        LocalSyncStore.put(response, "ios_apps", new JSONObject());
        return Response.json(response);
    }

    /**
     * The extension's web-usage upload. Only kept for devices in a group; before pairing it is
     * just used as "create device" (empty websites) and to learn the browser's name.
     */
    private Response webUpload(Request request) throws LocalSyncStore.HttpError {
        JSONObject body = request.json();
        String installId = body.optString("install_id");
        if (LocalSyncStore.isBlank(installId)) throw new LocalSyncStore.HttpError(400, "install_id required");

        String browser = body.optString("device_name", "Browser");
        String os = body.optString("device_type", "");
        store.registerDevice(installId, os.isEmpty() ? browser : browser + " (" + os + ")");

        JSONObject websites = body.optJSONObject("websites");
        if (websites == null || websites.length() == 0) return Response.empty(200);
        // 409 makes the extension keep its upload cursor, so history is sent once it is paired.
        if (store.groupOf(installId) == null) throw new LocalSyncStore.HttpError(409, "Not in a device group yet");
        store.storeWebSessions(installId, websites);
        return Response.empty(200);
    }

    private Response androidApps(Request request) {
        String host = request.headers.get("host");
        String iconBase = "http://" + (host == null ? "127.0.0.1:" + port : host) + "/local/icon/";
        return Response.json(usage.appInfo(csv(request.query.get("app_ids")), iconBase));
    }

    private static Response proxy(Request request) throws IOException {
        URL url = new URL(LocalSync.UPSTREAM_ORIGIN + (request.target.startsWith("/") ? "" : "/") + request.target);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        try {
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(30_000);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestMethod(request.method);
            for (Map.Entry<String, String> h : request.headers.entrySet()) {
                switch (h.getKey()) {
                    case "host":
                    case "connection":
                    case "content-length":
                    case "accept-encoding":
                    case "transfer-encoding":
                        break;
                    default:
                        connection.setRequestProperty(h.getKey(), h.getValue());
                }
            }
            if (request.body.length > 0) {
                connection.setDoOutput(true);
                connection.setFixedLengthStreamingMode(request.body.length);
                try (OutputStream out = connection.getOutputStream()) {
                    out.write(request.body);
                }
            }
            int status = connection.getResponseCode();
            InputStream in = status >= 400 ? connection.getErrorStream() : connection.getInputStream();
            byte[] body = new byte[0];
            if (in != null) {
                try (InputStream stream = in) {
                    ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                    byte[] chunk = new byte[16 * 1024];
                    int n;
                    while ((n = stream.read(chunk)) > 0) buffer.write(chunk, 0, n);
                    body = buffer.toByteArray();
                }
            }
            return new Response(status, connection.getContentType(), body);
        } catch (IOException e) {
            return Response.error(502, e.toString());
        } finally {
            connection.disconnect();
        }
    }

    // endregion

    private static Set<String> csv(String value) {
        if (LocalSyncStore.isBlank(value)) return null;
        Set<String> values = new LinkedHashSet<>();
        for (String part : value.split(",")) if (!part.trim().isEmpty()) values.add(part.trim());
        return values.isEmpty() ? null : values;
    }

    /** Accepts ISO-8601 (with or without offset/time) or epoch seconds/milliseconds. */
    static long parseTime(String value, long fallback) {
        if (LocalSyncStore.isBlank(value)) return fallback;
        String v = value.trim();
        try {
            if (v.matches("-?\\d+")) {
                long n = Long.parseLong(v);
                return n > 100_000_000_000L ? n : n * 1000;
            }
        } catch (NumberFormatException ignored) {
        }
        try {
            return OffsetDateTime.parse(v).toInstant().toEpochMilli();
        } catch (RuntimeException ignored) {
        }
        try {
            return Instant.parse(v).toEpochMilli();
        } catch (RuntimeException ignored) {
        }
        try {
            return LocalDateTime.parse(v).toInstant(ZoneOffset.UTC).toEpochMilli();
        } catch (RuntimeException ignored) {
        }
        try {
            return LocalDate.parse(v).atStartOfDay().toInstant(ZoneOffset.UTC).toEpochMilli();
        } catch (RuntimeException ignored) {
        }
        return fallback;
    }

    private static String httpDate(long epochMs) {
        SimpleDateFormat format = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", Locale.US);
        format.setTimeZone(TimeZone.getTimeZone("GMT"));
        return format.format(new Date(epochMs));
    }
}
