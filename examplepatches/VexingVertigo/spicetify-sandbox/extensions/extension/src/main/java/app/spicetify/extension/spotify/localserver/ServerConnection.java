package app.spicetify.extension.spotify.localserver;

import java.net.URI;
import java.nio.charset.StandardCharsets;
import android.util.Base64;
import java.util.Locale;

/** One immutable credential and URL scope. Never attached to a URL from another scope. */
public final class ServerConnection {
    public final URI root;
    public final String username;
    private final String password;

    public ServerConnection(String url, String username, String password) {
        this(url, username, password, false);
    }

    ServerConnection(String url, String username, String password, boolean loopbackTest) {
        URI parsed;
        try { parsed = URI.create(assumeHttps(url)); }
        catch (RuntimeException ex) { throw new IllegalArgumentException("Enter a valid HTTPS WebDAV folder URL."); }
        boolean loopback = loopbackTest && "http".equals(parsed.getScheme()) && "127.0.0.1".equals(parsed.getHost());
        if ((!"https".equals(parsed.getScheme()) && !loopback) || parsed.getHost() == null
                || parsed.getRawUserInfo() != null || parsed.getRawQuery() != null || parsed.getRawFragment() != null
                || parsed.getPort() == 0 || parsed.getPort() > 65535) {
            throw new IllegalArgumentException("Use an HTTPS folder URL without credentials, query, or fragment.");
        }
        String path = parsed.getRawPath();
        if (path == null || path.isEmpty()) path = "/";
        if (!path.endsWith("/")) path += "/";
        root = URI.create(URI.create(parsed.getScheme() + "://" + parsed.getRawAuthority() + path).toASCIIString());
        validatePath(root);
        this.username = username == null ? "" : username;
        this.password = password == null ? "" : password;
        if (this.username.contains(":")) throw new IllegalArgumentException("The username cannot contain a colon.");
    }

    public boolean hasPassword() { return !password.isEmpty(); }
    static String assumeHttps(String input) {
        String value = input.trim();
        if (value.regionMatches(true, 0, "http:", 0, 5)
                || value.regionMatches(true, 0, "https:", 0, 6)) return value;
        int colon = value.indexOf(':');
        int slash = value.indexOf('/');
        if (colon >= 0 && (slash < 0 || colon < slash)) {
            int portEnd = slash < 0 ? value.length() : slash;
            String port = value.substring(colon + 1, portEnd);
            if (port.isEmpty() || !port.chars().allMatch(Character::isDigit)) return value;
        }
        return "https://" + value;
    }
    String password() { return password; }
    String authorization() {
        return username.isEmpty() ? null : "Basic " + Base64.encodeToString(
                (username + ":" + password).getBytes(StandardCharsets.UTF_8), Base64.NO_WRAP);
    }

    public URI resolve(URI base, String href) {
        URI target = URI.create(base.resolve(href).toASCIIString());
        validatePath(target);
        if (!root.getScheme().equalsIgnoreCase(target.getScheme())
                || target.getHost() == null || !root.getHost().equalsIgnoreCase(target.getHost())
                || port(root) != port(target) || target.getRawUserInfo() != null
                || target.getRawQuery() != null || target.getRawFragment() != null
                || !target.getRawPath().startsWith(root.getRawPath())) {
            throw new IllegalArgumentException("The server returned a URL outside the configured folder.");
        }
        return target;
    }

    private static int port(URI uri) { return uri.getPort() == -1 ? ("https".equals(uri.getScheme()) ? 443 : 80) : uri.getPort(); }

    private static void validatePath(URI uri) {
        String raw = uri.getRawPath();
        if (raw == null) throw new IllegalArgumentException("The URL has no path.");
        String lower = raw.toLowerCase(Locale.ROOT);
        if (lower.contains("%2f") || lower.contains("%5c") || lower.contains("%25") || raw.contains("\\")) {
            throw new IllegalArgumentException("Encoded path separators are not supported.");
        }
        for (String segment : uri.getPath().split("/", -1)) {
            if (segment.equals(".") || segment.equals("..") || segment.chars().anyMatch(c -> c < 32 || c == 127)) {
                throw new IllegalArgumentException("The URL contains an unsafe path.");
            }
        }
    }
}
