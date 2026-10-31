package app.xitter.extension;

import android.util.Log;

import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;
import java.util.Locale;
import java.util.Map;

/**
 * Where the app may connect. Every address of X (x.com, twitter.com, twimg.com, t.co and the
 * rest) is rewritten to the Xitter instance; with "Block third-party services" on, any other
 * host is refused. The patch routes every OkHttp client, URL connection, DNS lookup and WebView
 * load in the app through here, so nothing reaches X even when one layer is bypassed.
 */
@SuppressWarnings("unused")
public final class XitterNetwork {
    static final String TAG = "Xitter";

    private XitterNetwork() {}

    // X's own domains: rewritten to the instance, never contacted
    private static final String[] X_DOMAINS = {
            "x.com", "twitter.com", "twimg.com", "t.co", "twttr.com", "twitter.co",
            "pscp.tv", "periscope.tv", "tweetdeck.com", "vine.co", "twitpic.com",
    };
    // xAI's: Grok in the app; nothing on the instance answers it, so it is refused
    private static final String[] REFUSED_DOMAINS = {"x.ai", "grok.com", "grok.x.com"};

    private static volatile Instance instance;

    static final class Instance {
        final String scheme;
        final String host;
        final int port;
        /** A path the instance lives under, without a trailing slash ("" for the root). */
        final String base;
        final String origin;
        final String[] allowed;

        Instance(String url) {
            URI u = URI.create(url.trim());
            scheme = u.getScheme() == null ? "https" : u.getScheme().toLowerCase(Locale.ROOT);
            host = u.getHost() == null ? "localhost" : u.getHost().toLowerCase(Locale.ROOT);
            port = u.getPort();
            String p = u.getRawPath() == null ? "" : u.getRawPath();
            while (p.endsWith("/")) p = p.substring(0, p.length() - 1);
            base = p;
            origin = scheme + "://" + host + (port == -1 ? "" : ":" + port);
            String extra = XitterConfig.allowedHosts();
            allowed = extra == null || extra.trim().isEmpty() ? new String[0] : extra.toLowerCase(Locale.ROOT).split("\\s*,\\s*");
        }
    }

    static Instance instance() {
        Instance i = instance;
        if (i == null) instance = i = new Instance(XitterConfig.serverUrl());
        return i;
    }

    private static boolean under(String host, String domain) {
        return host.equals(domain) || host.endsWith("." + domain);
    }

    /** One of X's hosts, which is answered by the instance instead. */
    public static boolean isXHost(String host) {
        if (host == null) return false;
        host = host.toLowerCase(Locale.ROOT);
        if (isInstanceHost(host)) return false;
        for (String d : X_DOMAINS) if (under(host, d)) return true;
        return false;
    }

    public static boolean isInstanceHost(String host) {
        return host != null && host.equalsIgnoreCase(instance().host);
    }

    /** Whether a connection to this host (after rewriting) may be made at all. */
    public static boolean isAllowed(String host) {
        if (host == null || host.isEmpty()) return false;
        host = host.toLowerCase(Locale.ROOT);
        if (host.startsWith("[") && host.endsWith("]")) host = host.substring(1, host.length() - 1);
        if (isInstanceHost(host)) return true;
        for (String d : X_DOMAINS) if (under(host, d)) return false;
        for (String d : REFUSED_DOMAINS) if (under(host, d)) return false;
        for (String d : instance().allowed) if (!d.isEmpty() && under(host, d)) return true;
        if (isLocal(host)) return true;
        return !XitterConfig.blockThirdParty();
    }

    // the device itself and literal private addresses (an instance on the LAN, a dev server)
    private static boolean isLocal(String host) {
        if (host.equals("localhost") || host.endsWith(".localhost")) return true;
        if (!isIpLiteral(host)) return false;
        try {
            InetAddress a = InetAddress.getByName(host); // a literal: parsed, never looked up
            return a.isLoopbackAddress() || a.isSiteLocalAddress() || a.isLinkLocalAddress() || a.isAnyLocalAddress();
        } catch (Exception e) {
            return false;
        }
    }

    private static boolean isIpLiteral(String host) {
        return host.matches("[0-9.]+") || (host.contains(":") && host.matches("[0-9a-fA-F:.%]+"));
    }

    /** The path an X address has on the instance (the instance serves X's paths from its root). */
    static String mapPath(String host, String path) {
        if (path == null || path.isEmpty()) path = "/";
        host = host.toLowerCase(Locale.ROOT);
        // the client's own files, which the instance keeps under /abs
        if (host.equals("abs.twimg.com")) return "/abs" + path;
        // chat: its live socket, its manifest and the key backup realm
        if (under(host, "chat-ws.x.com") && path.startsWith("/ws")) return "/xchat" + path;
        if (host.equals("chat.x.com") || host.equals("chat-staging.x.com")) return "/xchat" + path;
        if (host.startsWith("realm-") && under(host, "x.com")) return "/juicebox" + path;
        return path;
    }

    /**
     * An address rewritten for the instance, unchanged if it may be used as it is, or null when
     * it must not be contacted. Accepts http(s) and ws(s).
     */
    public static String rewrite(String url) {
        if (url == null) return null;
        URI u;
        try {
            u = URI.create(url.trim());
        } catch (IllegalArgumentException e) {
            return url; // not an address the network would take
        }
        String scheme = u.getScheme();
        if (scheme == null) return url;
        scheme = scheme.toLowerCase(Locale.ROOT);
        boolean web = scheme.equals("http") || scheme.equals("https");
        boolean socket = scheme.equals("ws") || scheme.equals("wss");
        if (!web && !socket) return url; // data:, file:, content:, about:, intents...
        String host = u.getHost();
        if (host == null) return null;
        if (isXHost(host)) {
            Instance i = instance();
            String s = socket ? (i.scheme.equals("https") ? "wss" : "ws") : i.scheme;
            StringBuilder b = new StringBuilder(s).append("://").append(i.host);
            if (i.port != -1) b.append(':').append(i.port);
            b.append(i.base).append(mapPath(host, u.getRawPath()));
            if (u.getRawQuery() != null) b.append('?').append(u.getRawQuery());
            if (u.getRawFragment() != null) b.append('#').append(u.getRawFragment());
            return b.toString();
        }
        return isAllowed(host) ? url : null;
    }

    static void blocked(String what) {
        Log.w(TAG, "blocked " + what);
    }

    // ---- java.net (the patch replaces the app's calls to these with the methods below) ----

    public static URLConnection openConnection(URL url) throws IOException {
        return guard(url).openConnection();
    }

    public static URLConnection openConnection(URL url, Proxy proxy) throws IOException {
        return guard(url).openConnection(proxy);
    }

    public static InputStream openStream(URL url) throws IOException {
        return guard(url).openConnection().getInputStream();
    }

    private static URL guard(URL url) throws IOException {
        String protocol = url.getProtocol();
        if (!"http".equalsIgnoreCase(protocol) && !"https".equalsIgnoreCase(protocol)) return url;
        String to = rewrite(url.toString());
        if (to == null) {
            blocked(url.getHost());
            throw new IOException("Blocked by Xitter: " + url.getHost());
        }
        if (to.equals(url.toString())) return url;
        try {
            return new URL(to);
        } catch (MalformedURLException e) {
            throw new IOException(e);
        }
    }

    // DNS: the last line of defence. A lookup of X's hosts means something wasn't rewritten.
    public static InetAddress[] getAllByName(String host) throws UnknownHostException {
        check(host);
        return InetAddress.getAllByName(host);
    }

    public static InetAddress getByName(String host) throws UnknownHostException {
        check(host);
        return InetAddress.getByName(host);
    }

    static void check(String host) throws UnknownHostException {
        if (host == null || host.isEmpty()) return; // the local host
        if (!isAllowed(host)) {
            blocked("lookup of " + host);
            throw new UnknownHostException("Blocked by Xitter: " + host);
        }
    }

    // ---- WebView ----

    public static void loadUrl(android.webkit.WebView view, String url) {
        String to = rewrite(url);
        if (to == null) {
            blocked(url);
            view.loadUrl("about:blank");
        } else {
            view.loadUrl(to);
        }
    }

    public static void loadUrl(android.webkit.WebView view, String url, Map<String, String> headers) {
        String to = rewrite(url);
        if (to == null) {
            blocked(url);
            view.loadUrl("about:blank");
        } else {
            view.loadUrl(to, headers);
        }
    }

    public static void postUrl(android.webkit.WebView view, String url, byte[] body) {
        String to = rewrite(url);
        if (to == null) {
            blocked(url);
            view.loadUrl("about:blank");
        } else {
            view.postUrl(to, body);
        }
    }

    // ---- OkHttp ----

    /** Called at the start of every OkHttpClient.Builder.build() in the app. */
    public static void onBuild(okhttp3.OkHttpClient.Builder builder) {
        try {
            OkHttpGuard.install(builder);
        } catch (Throwable t) {
            // a client without the guard must not be built
            Log.e(TAG, "could not guard an OkHttp client", t);
            throw new IllegalStateException("Xitter: could not guard an OkHttp client", t);
        }
    }
}
