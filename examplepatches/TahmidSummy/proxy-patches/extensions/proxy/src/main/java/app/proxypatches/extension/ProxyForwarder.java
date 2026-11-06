package app.proxypatches.extension;

import android.app.Application;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.webkit.WebView;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.ProxySelector;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;

import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

/**
 * Local forwarder that makes the whole app use an upstream HTTP or HTTPS (TLS) proxy,
 * optionally with Basic authentication.
 * <p>
 * Listens on 127.0.0.1:&lt;random&gt;. For every client connection it opens a connection to the
 * upstream proxy (TLS with certificate + hostname verification if {@link ProxyConfig#useTls()}),
 * forwards the client's proxy request with a Proxy-Authorization header added, and pipes bytes.
 * The app's default ProxySelector, the http(s).proxyHost/Port system properties and the WebView
 * proxy override all point at the local listener. There is no direct fallback: if the proxy is
 * unreachable, requests fail instead of leaking.
 */
@SuppressWarnings("unused")
public final class ProxyForwarder {
    private static final String TAG = "ProxyPatch";
    private static final int MAX_HEADER = 64 * 1024;

    private static boolean started;
    private static volatile int localPort = -1;
    private static volatile ProxySelector selector;

    private ProxyForwarder() {}

    /**
     * Called by the patch at the very start of Application.attachBaseContext. Never throws.
     * Starts even when no proxy is set yet: the app then stays offline (fail closed) until the
     * user sets one in Proxy settings.
     */
    public static synchronized void start(android.content.Context context) {
        if (started) return;
        started = true;
        try {
            ProxySettings.init(context);
            daemon("proxy-shortcut", () -> ProxySettings.publishShortcut(context));
            final ServerSocket server = new ServerSocket(0, 128, InetAddress.getByName("127.0.0.1"));
            localPort = server.getLocalPort();
            localProxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("127.0.0.1", localPort));
            selector = new LocalSelector(localProxy);
            apply();
            installUrlHandlers();
            daemon("proxy-accept", () -> acceptLoop(server));
            daemon("proxy-watch", () -> {
                int tick = 0;
                while (true) {
                    try { Thread.sleep(1500); } catch (InterruptedException e) { return; }
                    try { apply(); } catch (Throwable ignored) {}
                    // The app may replace all dynamic shortcuts (wiping ours); put it back.
                    if (++tick % 10 == 0) ProxySettings.ensureShortcut(context);
                }
            });
            scheduleWebViewOverride();
        } catch (Throwable t) {
            Log.e(TAG, "start failed", t);
        }
    }

    public static int localPort() { return localPort; }

    // ---- HttpURLConnection: no direct fallback --------------------------------------------
    // Android's HttpURLConnection (built-in OkHttp 2.x) appends a DIRECT route after the
    // ProxySelector's proxies when no explicit proxy was given, so when our proxy fails (not set,
    // down, wrong login) SDKs using it (e.g. AppsFlyer, Firebase logging) silently go direct.
    // An explicitly passed proxy has no such fallback, so every http(s) URL is opened with our
    // proxy passed explicitly - even if the caller asked for Proxy.NO_PROXY.

    private static volatile Proxy localProxy;

    private static void installUrlHandlers() {
        try {
            // URLs created before the factory is installed keep Android's default handlers;
            // new URL(template, spec) reuses the template's handler for the same protocol.
            final URL httpTemplate = new URL("http://proxy-patch.invalid/");
            final URL httpsTemplate = new URL("https://proxy-patch.invalid/");
            URL.setURLStreamHandlerFactory(protocol -> {
                if ("http".equalsIgnoreCase(protocol)) return new ForcedProxyHandler(httpTemplate, 80);
                if ("https".equalsIgnoreCase(protocol)) return new ForcedProxyHandler(httpsTemplate, 443);
                return null; // everything else: default handler
            });
        } catch (Throwable t) {
            Log.e(TAG, "URL handler install failed; HttpURLConnection may fall back to direct", t);
        }
    }

    static final class ForcedProxyHandler extends URLStreamHandler {
        private final URL template;
        private final int defaultPort;

        ForcedProxyHandler(URL template, int defaultPort) {
            this.template = template;
            this.defaultPort = defaultPort;
        }

        @Override
        protected URLConnection openConnection(URL u) throws IOException {
            return openConnection(u, null);
        }

        @Override
        protected URLConnection openConnection(URL u, Proxy requested) throws IOException {
            URL real = new URL(template, u.toExternalForm());
            String host = u.getHost() == null ? "" : u.getHost().toLowerCase();
            boolean loopback = host.equals("localhost") || host.startsWith("127.")
                    || host.equals("::1") || host.equals("[::1]");
            Proxy p = localProxy;
            if (loopback || p == null) return real.openConnection(Proxy.NO_PROXY);
            return real.openConnection(p);
        }

        @Override
        protected int getDefaultPort() {
            return defaultPort;
        }
    }

    /** Points Java networking (and Cronet, via the patched ProxyChangeListener) at the forwarder. */
    static void apply() {
        String p = String.valueOf(localPort);
        setIfDifferent("http.proxyHost", "127.0.0.1");
        setIfDifferent("http.proxyPort", p);
        setIfDifferent("https.proxyHost", "127.0.0.1");
        setIfDifferent("https.proxyPort", p);
        setIfDifferent("http.nonProxyHosts", "localhost|127.*|[::1]");
        System.clearProperty("socksProxyHost");
        if (ProxySelector.getDefault() != selector) ProxySelector.setDefault(selector);
    }

    private static void setIfDifferent(String k, String v) {
        if (!v.equals(System.getProperty(k))) System.setProperty(k, v);
    }

    static final class LocalSelector extends ProxySelector {
        private final List<Proxy> viaLocal;

        LocalSelector(Proxy local) { viaLocal = Collections.singletonList(local); }

        @Override
        public List<Proxy> select(URI uri) {
            if (uri == null) throw new IllegalArgumentException("uri == null");
            String host = uri.getHost();
            if (host != null) {
                String h = host.toLowerCase();
                if (h.equals("localhost") || h.startsWith("127.") || h.equals("::1") || h.equals("[::1]")) {
                    return Collections.singletonList(Proxy.NO_PROXY);
                }
            }
            return viaLocal;
        }

        @Override
        public void connectFailed(URI uri, SocketAddress sa, IOException ioe) {}
    }

    // ---- WebView ---------------------------------------------------------------------------
    // WebView runs its own Chromium (from the WebView APK) that ignores Java proxy settings.
    // Use WebView's proxy-override API (what androidx.webkit.ProxyController calls) through the
    // support-library boundary, so this works whether or not the app bundles androidx.webkit.

    private static void scheduleWebViewOverride() {
        try {
            // Main process only: WebView refuses to share its data directory across processes.
            if (Build.VERSION.SDK_INT < 28) return;
            String proc = Application.getProcessName();
            if (proc == null || proc.indexOf(':') >= 0) return;
            new Handler(Looper.getMainLooper()).post(ProxyForwarder::applyWebViewOverride);
        } catch (Throwable t) {
            Log.w(TAG, "webview schedule failed", t);
        }
    }

    static void applyWebViewOverride() {
        try {
            ClassLoader cl = WebView.getWebViewClassLoader();
            Object factory = Class.forName("org.chromium.support_lib_glue.SupportLibReflectionUtil", true, cl)
                    .getDeclaredMethod("createWebViewProviderFactory").invoke(null);
            Method getPc = Class.forName(
                    "org.chromium.support_lib_boundary.WebViewProviderFactoryBoundaryInterface", false, cl)
                    .getMethod("getProxyController");
            Object controller = ((InvocationHandler) factory).invoke(null, getPc, null);

            Method set4 = null, set5 = null;
            for (Method m : Class.forName(
                    "org.chromium.support_lib_boundary.ProxyControllerBoundaryInterface", false, cl).getMethods()) {
                if (!m.getName().equals("setProxyOverride")) continue;
                if (m.getParameterTypes().length == 4) set4 = m;
                if (m.getParameterTypes().length == 5) set5 = m;
            }
            String[][] rules = {{"*", "http://127.0.0.1:" + localPort}};
            String[] bypass = new String[0];
            Runnable done = () -> Log.i(TAG, "WebView proxy override active on port " + localPort);
            Executor direct = Runnable::run;
            InvocationHandler pc = (InvocationHandler) controller;
            if (set5 != null) pc.invoke(null, set5, new Object[]{rules, bypass, done, direct, Boolean.FALSE});
            else if (set4 != null) pc.invoke(null, set4, new Object[]{rules, bypass, done, direct});
            else Log.w(TAG, "WebView has no setProxyOverride");
        } catch (Throwable t) {
            Throwable c = t;
            while (c instanceof InvocationTargetException && c.getCause() != null) c = c.getCause();
            Log.w(TAG, "WebView proxy override failed: " + c);
        }
    }

    // ---- Forwarding ------------------------------------------------------------------------

    private static void acceptLoop(ServerSocket server) {
        while (true) {
            try {
                final Socket client = server.accept();
                daemon("proxy-conn", () -> handle(client));
            } catch (Throwable t) {
                Log.w(TAG, "accept: " + t);
                try { Thread.sleep(200); } catch (InterruptedException e) { return; }
            }
        }
    }

    private static void handle(Socket client) {
        Socket upstream = null;
        ProxySettings.Values settings = null;
        try {
            client.setTcpNoDelay(true);
            byte[] head = readHeader(client.getInputStream());
            if (head == null) return;

            // Snapshot per connection: saved changes apply to the next connection.
            settings = ProxySettings.get();
            final ProxySettings.Values cfg = settings;
            String header = new String(head, StandardCharsets.ISO_8859_1);
            boolean isConnect = header.regionMatches(true, 0, "CONNECT ", 0, 8);

            if (settings.direct) {
                // "Run without proxy": act as a plain local proxy that connects directly.
                upstream = openTarget(header, isConnect, client.getOutputStream(), ProxyForwarder::connectDirect);
                if (upstream == null) return;
            } else if (!settings.isConfigured()) {
                ProxySettings.showNotConfiguredHint();
                return; // fail closed
            } else if (settings.isSocks()) {
                // SOCKS5 proxy: the forwarder speaks SOCKS5 upstream, the app still sees an HTTP proxy.
                upstream = openTarget(header, isConnect, client.getOutputStream(),
                        (host, port) -> Socks5.connect(cfg, host, port));
                if (upstream == null) return;
                ProxyStatus.ok();
            } else {
                byte[] rewritten = rewrite(header, isConnect, settings.authBase64())
                        .getBytes(StandardCharsets.ISO_8859_1);
                upstream = openUpstream(settings);
                OutputStream uout = upstream.getOutputStream();
                uout.write(rewritten);
                uout.flush();

                // Read the proxy's reply header ourselves (then pass it on), so a rejected
                // login or refused tunnel can be reported instead of failing silently.
                byte[] reply = readHeader(upstream.getInputStream());
                if (reply == null) throw new java.io.EOFException("the proxy closed the connection without replying");
                OutputStream cout = client.getOutputStream();
                cout.write(reply);
                cout.flush();
                int code = statusCode(reply);
                if (code == 407) {
                    ProxyStatus.failed(ProxyStatus.Problem.LOGIN, "HTTP 407");
                    return;
                }
                if (isConnect && code != 200) {
                    // Some proxies (e.g. Caddy with probe resistance) hide a bad login behind a
                    // redirect or 404 instead of 407.
                    ProxyStatus.failed(ProxyStatus.Problem.REFUSED, "HTTP " + code);
                    return;
                }
                ProxyStatus.ok();
            }

            final Socket c = client;
            final Socket u = upstream;
            Thread up = daemon("proxy-up", () -> pipe(c, u));
            pipe(u, c);
            up.join(30000);
        } catch (Throwable t) {
            Log.w(TAG, "conn: " + t);
            if (settings != null && !settings.direct && settings.isConfigured()) {
                ProxyStatus.Problem problem = ProxyStatus.classify(t);
                if (problem != null) {
                    String detail = problem == ProxyStatus.Problem.LOGIN || problem == ProxyStatus.Problem.REFUSED
                            ? (settings.isSocks() ? "SOCKS5" : String.valueOf(t.getMessage()))
                            : settings.host + ":" + settings.port;
                    ProxyStatus.failed(problem, detail);
                }
            }
        } finally {
            closeQuietly(client);
            closeQuietly(upstream);
        }
    }

    /** Status code from an HTTP response header ("HTTP/1.1 200 OK" -> 200), or -1. */
    static int statusCode(byte[] header) {
        String first = new String(header, StandardCharsets.ISO_8859_1).split("\r\n", 2)[0];
        String[] parts = first.split(" ");
        try {
            return parts.length >= 2 ? Integer.parseInt(parts[1]) : -1;
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    /** Opens a TCP connection to the destination host:port (directly, or through SOCKS5). */
    interface Connector {
        Socket connect(String host, int port) throws IOException;
    }

    static Socket connectDirect(String host, int port) throws IOException {
        Socket s = new Socket();
        s.setTcpNoDelay(true);
        try {
            s.connect(new InetSocketAddress(host, port), 15000);
        } catch (IOException e) {
            closeQuietly(s);
            throw e;
        }
        return s;
    }

    /**
     * Handles the client's proxy request ourselves: connects to the destination using
     * {@code connector} (directly for "Run without proxy", or through SOCKS5). CONNECT gets a
     * "200 Connection established"; plain-HTTP requests are rewritten from absolute-form to
     * origin-form and forwarded. Returns null if the request is unusable.
     */
    static Socket openTarget(String header, boolean isConnect, OutputStream toClient, Connector connector)
            throws IOException {
        String[] lines = header.split("\r\n");
        String[] requestLine = lines[0].split(" ");
        if (requestLine.length < 3) return null;
        String method = requestLine[0], target = requestLine[1], version = requestLine[2];

        String host;
        int port;
        String originTarget = null;
        if (isConnect) {
            int colon = target.lastIndexOf(':');
            if (colon <= 0) return null;
            host = target.substring(0, colon);
            port = Integer.parseInt(target.substring(colon + 1));
        } else {
            URI uri = URI.create(target);
            if (uri.getHost() == null) return null;
            host = uri.getHost();
            port = uri.getPort() > 0 ? uri.getPort() : 80;
            String path = uri.getRawPath() == null || uri.getRawPath().isEmpty() ? "/" : uri.getRawPath();
            originTarget = uri.getRawQuery() == null ? path : path + "?" + uri.getRawQuery();
        }
        if (host.startsWith("[") && host.endsWith("]")) host = host.substring(1, host.length() - 1);

        Socket s;
        try {
            s = connector.connect(host, port);
        } catch (IOException e) {
            if (isConnect) {
                toClient.write("HTTP/1.1 502 Bad Gateway\r\nContent-Length: 0\r\n\r\n"
                        .getBytes(StandardCharsets.ISO_8859_1));
                toClient.flush();
            }
            throw e;
        }

        if (isConnect) {
            toClient.write("HTTP/1.1 200 Connection established\r\n\r\n".getBytes(StandardCharsets.ISO_8859_1));
            toClient.flush();
        } else {
            StringBuilder sb = new StringBuilder(header.length());
            sb.append(method).append(' ').append(originTarget).append(' ').append(version).append("\r\n");
            for (int i = 1; i < lines.length; i++) {
                String line = lines[i];
                if (line.isEmpty()) continue;
                String lower = line.toLowerCase();
                if (lower.startsWith("proxy-") || lower.startsWith("connection:")) continue;
                sb.append(line).append("\r\n");
            }
            sb.append("Connection: close\r\n\r\n");
            OutputStream out = s.getOutputStream();
            out.write(sb.toString().getBytes(StandardCharsets.ISO_8859_1));
            out.flush();
        }
        return s;
    }

    static Socket openUpstream(ProxySettings.Values v) throws IOException {
        String host = v.host;
        int port = v.port;
        Socket raw = new Socket();
        raw.setTcpNoDelay(true);
        raw.connect(new InetSocketAddress(host, port), 15000);
        if (!v.useTls()) return raw;

        SSLSocket s = (SSLSocket) ((SSLSocketFactory) SSLSocketFactory.getDefault())
                .createSocket(raw, host, port, true);
        SSLParameters params = s.getSSLParameters();
        params.setEndpointIdentificationAlgorithm("HTTPS"); // verify the certificate matches the host
        s.setSSLParameters(params);
        s.setSoTimeout(30000);
        s.startHandshake();
        s.setSoTimeout(0);
        return s;
    }

    /** Reads up to and including the blank line ending the request header. */
    private static byte[] readHeader(InputStream in) throws IOException {
        ByteArrayOutputStream buf = new ByteArrayOutputStream(512);
        int state = 0;
        while (buf.size() < MAX_HEADER) {
            int b = in.read();
            if (b < 0) return null;
            buf.write(b);
            if (b == '\r' && (state == 0 || state == 2)) state++;
            else if (b == '\n' && state == 1) state = 2;
            else if (b == '\n' && state == 3) return buf.toByteArray();
            else state = (b == '\r') ? 1 : 0;
        }
        return null;
    }

    /**
     * Used by the settings screen: connects to the proxy with the given settings and asks it to
     * open a tunnel to www.google.com:443. Returns a human-readable result.
     */
    static String testProxy(ProxySettings.Values v) {
        long t0 = System.currentTimeMillis();
        Socket s = null;
        if (v.isSocks()) {
            try {
                s = Socks5.connect(v, "www.google.com", 443);
                return "✓ Working (" + (System.currentTimeMillis() - t0) + " ms)\nSOCKS5 tunnel to www.google.com:443 opened";
            } catch (Socks5.SocksException e) {
                return "✗ " + e.getMessage();
            } catch (java.net.UnknownHostException e) {
                return "✗ Couldn't find that host name.\n" + e;
            } catch (Throwable e) {
                return "✗ Couldn't connect to the SOCKS5 proxy.\n" + e;
            } finally {
                closeQuietly(s);
            }
        }
        try {
            s = openUpstream(v);
            s.setSoTimeout(15000);
            String req = "CONNECT www.google.com:443 HTTP/1.1\r\nHost: www.google.com:443\r\n\r\n";
            OutputStream out = s.getOutputStream();
            out.write(rewrite(req, true, v.authBase64()).getBytes(StandardCharsets.ISO_8859_1));
            out.flush();
            byte[] head = readHeader(s.getInputStream());
            String statusLine = head == null ? "(no response)"
                    : new String(head, StandardCharsets.ISO_8859_1).split("\r\n", 2)[0];
            long ms = System.currentTimeMillis() - t0;
            if (statusLine.matches("HTTP/1\\.[01] 200.*")) {
                return "✓ Working (" + ms + " ms)\n" + statusLine;
            }
            if (statusLine.contains(" 407")) {
                return "✗ The proxy asked for a login: check the username and password.\n" + statusLine;
            }
            return "✗ The proxy refused the tunnel. Check the login (some proxies hide " +
                    "login errors behind a redirect or 404).\n" + statusLine;
        } catch (javax.net.ssl.SSLException e) {
            return "✗ TLS failed. If this is a plain HTTP proxy, set the proxy type to HTTP.\n" + e;
        } catch (java.net.UnknownHostException e) {
            return "✗ Couldn't find that host name.\n" + e;
        } catch (Throwable e) {
            return "✗ Couldn't connect to the proxy.\n" + e;
        } finally {
            closeQuietly(s);
        }
    }

    static String rewrite(String header, boolean isConnect, String auth) {
        String[] lines = header.split("\r\n");
        StringBuilder sb = new StringBuilder(header.length() + 128);
        sb.append(lines[0]).append("\r\n");
        for (int i = 1; i < lines.length; i++) {
            String line = lines[i];
            if (line.isEmpty()) continue;
            String lower = line.toLowerCase();
            if (lower.startsWith("proxy-authorization:")) continue;
            if (!isConnect && (lower.startsWith("proxy-connection:") || lower.startsWith("connection:"))) continue;
            sb.append(line).append("\r\n");
        }
        if (!auth.isEmpty()) sb.append("Proxy-Authorization: Basic ").append(auth).append("\r\n");
        // Plain-HTTP requests: one request per connection so each one carries auth.
        if (!isConnect) sb.append("Connection: close\r\n");
        sb.append("\r\n");
        return sb.toString();
    }

    private static void pipe(Socket from, Socket to) {
        byte[] buf = new byte[16384];
        try {
            InputStream in = from.getInputStream();
            OutputStream out = to.getOutputStream();
            int n;
            while ((n = in.read(buf)) >= 0) {
                out.write(buf, 0, n);
                out.flush();
            }
        } catch (Throwable ignored) {
        } finally {
            closeQuietly(from);
            closeQuietly(to);
        }
    }

    private static Thread daemon(String name, Runnable r) {
        Thread t = new Thread(r, name);
        t.setDaemon(true);
        t.start();
        return t;
    }

    private static void closeQuietly(Socket s) {
        if (s != null) try { s.close(); } catch (Throwable ignored) {}
    }
}
