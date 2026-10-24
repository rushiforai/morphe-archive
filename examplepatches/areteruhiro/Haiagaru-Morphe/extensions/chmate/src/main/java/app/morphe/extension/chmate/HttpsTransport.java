package app.morphe.extension.chmate;

import java.io.IOException;
import java.io.InputStream;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;

/** Shared policy for OkHttp and java.net, without changing hostnames or TLS validation. */
public final class HttpsTransport {
    private static volatile boolean enabled;
    private static volatile int thumbnailServerPort = -1;

    private HttpsTransport() {}

    public static void setEnabled(boolean value) {
        enabled = value;
    }

    public static boolean shouldUpgrade(String scheme) {
        return enabled && "http".equalsIgnoreCase(scheme);
    }

    /** Only the process-owned, loopback thumbnail server may remain HTTP. */
    static void registerThumbnailServerPort(int port) {
        thumbnailServerPort = port > 0 && port <= 65535 ? port : -1;
    }

    public static boolean isLocalThumbnailEndpoint(String host, int port) {
        return (port > 0 && port == thumbnailServerPort && "127.0.0.1".equals(host))
                || ImageVpnController.isLocalEndpoint(host, port)
                || (ImageVpnController.enabled() && "127.0.0.1".equals(host) && port == 9);
    }
    /** Hissi's HTTP endpoint is deliberately excluded; it is not a local/proxy-bypass endpoint. */
    public static boolean isHttpUpgradeExempt(String host,int port){
        return "hissi.org".equalsIgnoreCase(host)||"www.hissi.org".equalsIgnoreCase(host)
                ||isLocalThumbnailEndpoint(host,port);
    }

    /** -1 selects the HTTPS default; nonstandard explicitly selected ports are retained. */
    public static int upgradePort(int port) {
        return port == 80 ? -1 : port;
    }

    public static URL upgrade(URL original) throws IOException {
        if (original == null || !shouldUpgrade(original.getProtocol())
                || isHttpUpgradeExempt(original.getHost(), original.getPort())) return original;
        String external = original.toExternalForm();
        String upgraded = "https" + external.substring(original.getProtocol().length());
        String authority = original.getAuthority();
        if (original.getPort() == 80 && authority != null) {
            int authorityStart = upgraded.indexOf("//") + 2;
            upgraded = upgraded.substring(0, authorityStart)
                    + authority.substring(0, authority.lastIndexOf(':'))
                    + upgraded.substring(authorityStart + authority.length());
        }
        // Preserve escaped credentials, IPv6, path, query, and fragment byte-for-byte.
        return new URL(upgraded);
    }

    public static String upgradeUrl(String original) {
        if (!enabled || original == null) return original;
        // URL/OkHttp accept leading ASCII whitespace. Keep it intact for their own parser.
        int start = 0;
        while (start < original.length() && original.charAt(start) <= ' ') start++;
        if (!original.regionMatches(true, start, "http://", 0, 7)) return original;
        try {
            return original.substring(0, start) + upgrade(new URL(original.substring(start))).toExternalForm();
        } catch (IOException | IllegalArgumentException ignored) {
            // Keep malformed input subject to the original API's validation.
            return original;
        }
    }

    public static URLConnection openConnection(URL url) throws IOException {
        URLConnection connection = openRawConnection(url, null, false);
        return ImageVpnController.enabled()
                ? ImageVpnRedirectConnection.wrap(connection, url, null, false) : connection;
    }

    public static URLConnection openConnection(URL url, Proxy proxy) throws IOException {
        URLConnection connection = openRawConnection(url, proxy, true);
        return ImageVpnController.enabled()
                ? ImageVpnRedirectConnection.wrap(connection, url, proxy, true) : connection;
    }

    /** Only the guarded redirect driver may call this when VPN protection is enabled. */
    static URLConnection openRawConnection(URL url, Proxy proxy, boolean explicitProxy) throws IOException {
        URL target = ImageVpnController.route(upgrade(url));
        // Capability URLs must stay local even if a system HTTP proxy is configured.
        if (isLocalThumbnailEndpoint(target.getHost(), target.getPort())) return target.openConnection(Proxy.NO_PROXY);
        return explicitProxy ? target.openConnection(proxy) : target.openConnection();
    }

    public static InputStream openStream(URL url) throws IOException {
        return openConnection(url).getInputStream();
    }
}
