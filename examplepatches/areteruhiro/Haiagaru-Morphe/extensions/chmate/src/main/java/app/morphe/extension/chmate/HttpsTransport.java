package app.morphe.extension.chmate;

import java.io.IOException;
import java.io.InputStream;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;

/** Shared policy for OkHttp and java.net, without changing hostnames or TLS validation. */
public final class HttpsTransport {
    private static volatile boolean enabled;

    private HttpsTransport() {}

    public static void setEnabled(boolean value) {
        enabled = value;
    }

    public static boolean shouldUpgrade(String scheme) {
        return enabled && "http".equalsIgnoreCase(scheme);
    }

    /** -1 selects the HTTPS default; nonstandard explicitly selected ports are retained. */
    public static int upgradePort(int port) {
        return port == 80 ? -1 : port;
    }

    public static URL upgrade(URL original) throws IOException {
        if (original == null || !shouldUpgrade(original.getProtocol())) return original;
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
        return upgrade(url).openConnection();
    }

    public static URLConnection openConnection(URL url, Proxy proxy) throws IOException {
        return upgrade(url).openConnection(proxy);
    }

    public static InputStream openStream(URL url) throws IOException {
        return openConnection(url).getInputStream();
    }
}
