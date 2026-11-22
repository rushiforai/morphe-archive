package local.lunaredge.cast;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.*;

/** Puente HTTP de sesión para el motor local: CORS y rutas HLS accesibles desde la TV. */
public final class CastRelay implements Closeable {
    private static final int PLAYLIST_LIMIT = 2 * 1024 * 1024;
    private static final Pattern ATTRIBUTE = Pattern.compile("URI=\"([^\"]+)\"");
    private final ServerSocket server;
    private final InetAddress receiver;
    private final String base;
    private final Map<String, URI> routes = new HashMap<>();
    private final Map<URI, String> reverse = new HashMap<>();
    private final Set<Socket> sockets = Collections.synchronizedSet(new HashSet<>());
    private final Set<HttpURLConnection> upstreams = Collections.synchronizedSet(new HashSet<>());
    private final ExecutorService acceptor = Executors.newSingleThreadExecutor();
    private final ThreadPoolExecutor workers = new ThreadPoolExecutor(4, 4, 0, TimeUnit.SECONDS, new ArrayBlockingQueue<>(32));
    private final AtomicInteger requests = new AtomicInteger();
    private final AtomicInteger playlists = new AtomicInteger();
    private final AtomicInteger failures = new AtomicInteger();
    private final AtomicInteger resources = new AtomicInteger();
    private final AtomicLong bytesSent = new AtomicLong();
    private final AtomicInteger idleConnections = new AtomicInteger();
    private final AtomicInteger readFailures = new AtomicInteger();
    private final AtomicInteger writeFailures = new AtomicInteger();
    private volatile String lastError = "ninguno";
    private volatile boolean closed;
    private volatile int lastStatus;

    public CastRelay(InetAddress wifiAddress, InetAddress receiver) throws IOException {
        this.receiver = receiver;
        server = new ServerSocket();
        server.bind(new InetSocketAddress(wifiAddress, 0), 16);
        base = "http://" + wifiAddress.getHostAddress() + ":" + server.getLocalPort() + "/" + UUID.randomUUID() + "/";
        acceptor.execute(() -> {
            while (!closed) try {
                Socket socket = server.accept();
                // Solo se atiende al receptor seleccionado; las rutas también tienen un identificador aleatorio.
                if (!receiver.equals(socket.getInetAddress())) { socket.close(); continue; }
                sockets.add(socket);
                try { workers.execute(() -> serve(socket)); }
                catch (RejectedExecutionException error) { lastError = "cola_llena"; failures.incrementAndGet(); sockets.remove(socket); socket.close(); }
            } catch (IOException error) { if (!closed) failures.incrementAndGet(); }
        });
    }

    public synchronized String url(String source) throws IOException {
        final URI uri;
        try { uri = new URI(source); } catch (URISyntaxException error) { throw new IOException("URI no válida"); }
        if (!("http".equalsIgnoreCase(uri.getScheme()) || "https".equalsIgnoreCase(uri.getScheme())) || uri.getHost() == null || uri.getRawUserInfo() != null) {
            throw new IOException("Fuente no compatible");
        }
        String known = reverse.get(uri);
        if (known != null) return known;
        if (routes.size() >= 65536) throw new IOException("Demasiadas rutas HLS");
        String path = "r" + routes.size();
        String result = base + path;
        routes.put(URI.create(base).getRawPath() + path, uri);
        reverse.put(uri, result);
        return result;
    }

    public String report() {
        return "Puente CORS: solicitudes TV " + requests.get() + "; listas " + playlists.get() + "; recursos " + resources.get() +
                "; bytes " + bytesSent.get() + "; fallos " + failures.get() + "; último HTTP " + lastStatus +
                "\nDetalle puente: conexiones sin petición " + idleConnections.get() + "; errores lectura " + readFailures.get() +
                "; errores escritura " + writeFailures.get() + "; último fallo " + lastError;
    }

    private void serve(Socket socket) {
        HttpURLConnection upstream = null;
        String phase = "cabecera_tv";
        try (Socket client = socket) {
            client.setSoTimeout(10000);
            BufferedInputStream input = new BufferedInputStream(client.getInputStream());
            String request = line(input);
            if (request.isEmpty()) { idleConnections.incrementAndGet(); return; }
            String[] first = request.split(" ", 3);
            if (first.length != 3) return;
            Map<String, String> headers = new HashMap<>();
            int total = request.length();
            String next;
            while (!(next = line(input)).isEmpty()) {
                total += next.length();
                if (total > 16384) throw new IOException("Cabeceras demasiado largas");
                int colon = next.indexOf(':');
                if (colon > 0) headers.put(next.substring(0, colon).toLowerCase(Locale.ROOT), next.substring(colon + 1).trim());
            }
            OutputStream output = client.getOutputStream();
            String origin = headers.get("origin");
            // El receptor puede incluir Origin; se refleja únicamente si es una URL de origen válida.
            if (origin == null || !origin.matches("https?://[a-zA-Z0-9.\\-]+(:[0-9]+)?")) origin = "*";
            URI source;
            synchronized (this) { source = routes.get(first[1]); }
            if (source == null) { response(output, 404, origin, Collections.emptyMap()); return; }
            requests.incrementAndGet();
            String method = first[0];
            if ("OPTIONS".equals(method)) { response(output, 204, origin, Collections.emptyMap()); return; }
            if (!"GET".equals(method) && !"HEAD".equals(method)) { response(output, 405, origin, Collections.emptyMap()); return; }
            boolean head = "HEAD".equals(method);
            phase = "conexion_motor";
            upstream = (HttpURLConnection) source.toURL().openConnection();
            upstreams.add(upstream);
            upstream.setConnectTimeout(10000);
            upstream.setReadTimeout(20000);
            upstream.setRequestMethod(method);
            upstream.setRequestProperty("Accept-Encoding", "identity");
            String range = headers.get("range");
            // Las listas se reescriben enteras; Range solo se aplica a recursos binarios.
            boolean knownPlaylist = source.getPath().toLowerCase(Locale.ROOT).endsWith(".m3u8");
            if (range != null && range.matches("bytes=[0-9]*-[0-9]*(,[0-9]*-[0-9]*)*") && !knownPlaylist) upstream.setRequestProperty("Range", range);
            int code = upstream.getResponseCode();
            lastStatus = code;
            if (code >= 400) { failures.incrementAndGet(); lastError = "HTTP_" + code; }
            String type = upstream.getContentType();
            boolean hls = knownPlaylist || type != null && type.toLowerCase(Locale.ROOT).contains("mpegurl");
            Map<String, String> outgoing = new LinkedHashMap<>();
            outgoing.put("Content-Type", type == null ? "application/octet-stream" : type);
            if (head) {
                if (!hls) copyHeader(upstream, outgoing, "Content-Length");
                response(output, code, origin, outgoing);
                return;
            }
            InputStream body = code >= 400 ? upstream.getErrorStream() : upstream.getInputStream();
            if (body == null) { response(output, code, origin, outgoing); return; }
            try (BufferedInputStream stream = new BufferedInputStream(body)) {
                phase = "lectura_motor";
                stream.mark(16);
                byte[] prefix = new byte[10];
                int count = stream.read(prefix);
                stream.reset();
                hls = hls || count >= 7 && new String(prefix, 0, count, StandardCharsets.UTF_8).replace("\ufeff", "").startsWith("#EXTM3U");
                if (hls && code >= 200 && code < 300) {
                    byte[] data = rewrite(readPlaylist(stream), upstream.getURL().toURI()).getBytes(StandardCharsets.UTF_8);
                    outgoing.put("Content-Type", "application/vnd.apple.mpegurl");
                    outgoing.put("Content-Length", Integer.toString(data.length));
                    phase = "escritura_tv";
                    response(output, 200, origin, outgoing);
                    output.write(data);
                    playlists.incrementAndGet();
                } else {
                    for (String key : new String[]{"Content-Length", "Content-Range", "Accept-Ranges"}) copyHeader(upstream, outgoing, key);
                    phase = "escritura_tv";
                    response(output, code, origin, outgoing);
                    resources.incrementAndGet();
                    byte[] buffer = new byte[32768];
                    while (!closed) {
                        phase = "lectura_motor";
                        count = stream.read(buffer);
                        if (count == -1) break;
                        phase = "escritura_tv";
                        output.write(buffer, 0, count);
                        bytesSent.addAndGet(count);
                    }
                }
            }
        } catch (Exception error) {
            if (!closed) {
                if ("cabecera_tv".equals(phase)) idleConnections.incrementAndGet();
                else {
                    failures.incrementAndGet();
                    if ("escritura_tv".equals(phase)) writeFailures.incrementAndGet();
                    else readFailures.incrementAndGet();
                    lastError = phase + "/" + error.getClass().getSimpleName();
                }
            }
        } finally {
            if (upstream != null) { upstreams.remove(upstream); upstream.disconnect(); }
            sockets.remove(socket);
        }
    }

    private String rewrite(String text, URI source) throws IOException {
        StringBuilder result = new StringBuilder();
        for (String line : text.replace("\ufeff", "").split("\\r?\\n", -1)) {
            String trimmed = line.trim();
            if (!trimmed.isEmpty() && !trimmed.startsWith("#")) line = resolve(source, trimmed);
            else if (trimmed.startsWith("#")) {
                Matcher matcher = ATTRIBUTE.matcher(line);
                StringBuffer changed = new StringBuffer();
                while (matcher.find()) matcher.appendReplacement(changed, Matcher.quoteReplacement("URI=\"" + resolve(source, matcher.group(1)) + "\""));
                matcher.appendTail(changed);
                line = changed.toString();
            }
            result.append(line).append('\n');
        }
        return result.toString();
    }

    private String resolve(URI source, String reference) throws IOException {
        try { return url(source.resolve(reference).toString()); }
        catch (IllegalArgumentException error) { throw new IOException("Referencia HLS no válida"); }
    }

    private static String readPlaylist(InputStream input) throws IOException {
        ByteArrayOutputStream data = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int count;
        while ((count = input.read(buffer)) != -1) {
            if (data.size() + count > PLAYLIST_LIMIT) throw new IOException("Lista HLS demasiado grande");
            data.write(buffer, 0, count);
        }
        return new String(data.toByteArray(), StandardCharsets.UTF_8);
    }

    private static String line(InputStream input) throws IOException {
        ByteArrayOutputStream data = new ByteArrayOutputStream();
        int value;
        while ((value = input.read()) != -1 && value != '\n') {
            if (data.size() >= 8192) throw new IOException("Línea demasiado larga");
            if (value != '\r') data.write(value);
        }
        return data.toString("ISO-8859-1");
    }

    private static void copyHeader(HttpURLConnection source, Map<String, String> destination, String name) {
        String value = source.getHeaderField(name);
        if (value != null) destination.put(name, value);
    }

    private static void response(OutputStream output, int status, String origin, Map<String, String> headers) throws IOException {
        StringBuilder text = new StringBuilder("HTTP/1.1 " + status + " Result\r\nConnection: close\r\nCache-Control: no-store\r\n");
        text.append("Access-Control-Allow-Origin: ").append(origin).append("\r\nVary: Origin\r\n")
                .append("Access-Control-Allow-Methods: GET, HEAD, OPTIONS\r\nAccess-Control-Allow-Headers: Range, Content-Type\r\n")
                .append("Access-Control-Expose-Headers: Content-Length, Content-Range, Accept-Ranges\r\n");
        for (Map.Entry<String, String> entry : headers.entrySet()) {
            if (!entry.getValue().contains("\r") && !entry.getValue().contains("\n")) text.append(entry.getKey()).append(": ").append(entry.getValue()).append("\r\n");
        }
        text.append("\r\n");
        output.write(text.toString().getBytes(StandardCharsets.ISO_8859_1));
    }

    @Override public void close() {
        closed = true;
        try { server.close(); } catch (IOException ignored) { }
        synchronized (sockets) { for (Socket socket : sockets) try { socket.close(); } catch (IOException ignored) { } }
        synchronized (upstreams) { for (HttpURLConnection connection : upstreams) connection.disconnect(); }
        workers.shutdownNow();
        acceptor.shutdownNow();
    }
}
