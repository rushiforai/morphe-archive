package app.morphe.extension.tiktok.download;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/** HTTPS-only media transport with destination validation at every redirect hop. */
final class MediaTransport {
    /** Five redirects covers TikTok's ordinary CDN handoff without permitting an endless chain. */
    static final int MAX_REDIRECTS = 5;
    static final Client DEFAULT = new Client(InetAddress::getAllByName, URL::openConnection);

    private MediaTransport() { }

    static boolean hasAllowedShape(String value) {
        try {
            target(value);
            return true;
        } catch (IOException ignored) {
            return false;
        }
    }

    static Response open(
            String value,
            MediaBudget.Deadline deadline,
            int connectTimeoutMs,
            int readTimeoutMs,
            String userAgent,
            boolean identityEncoding
    ) throws IOException {
        return DEFAULT.open(value, deadline, connectTimeoutMs, readTimeoutMs,
                userAgent, identityEncoding);
    }

    interface Resolver {
        InetAddress[] resolve(String host) throws IOException;
    }

    interface ConnectionOpener {
        URLConnection open(URL url) throws IOException;
    }

    static final class Client {
        private final Resolver resolver;
        private final ConnectionOpener opener;

        Client(Resolver resolver, ConnectionOpener opener) {
            this.resolver = resolver;
            this.opener = opener;
        }

        Response open(
                String value,
                MediaBudget.Deadline deadline,
                int connectTimeoutMs,
                int readTimeoutMs,
                String userAgent,
                boolean identityEncoding
        ) throws IOException {
            Target current = target(value);
            Set<String> visited = new HashSet<>();
            int redirects = 0;
            while (true) {
                MediaBudget.check(deadline);
                if (!visited.add(current.identity)) {
                    throw new IOException("Media redirect loop refused");
                }

                // URLConnection.openConnection() does not connect. Resolve once before creating
                // it, then again immediately before the operation that opens the socket. A name
                // that changes to a local address between those boundaries is refused.
                requirePublicAddresses(current.host, resolver);
                URLConnection opened = opener.open(current.url);
                if (!(opened instanceof HttpURLConnection)) {
                    throw new IOException("Media transport is not HTTP");
                }

                HttpURLConnection connection = (HttpURLConnection) opened;
                boolean returned = false;
                try {
                    connection.setInstanceFollowRedirects(false);
                    connection.setConnectTimeout(MediaBudget.timeoutMillis(deadline, connectTimeoutMs));
                    connection.setReadTimeout(MediaBudget.timeoutMillis(deadline, readTimeoutMs));
                    if (identityEncoding) {
                        connection.setRequestProperty("Accept-Encoding", "identity");
                    }
                    if (userAgent != null && !userAgent.isEmpty()) {
                        connection.setRequestProperty("User-Agent", userAgent);
                    }

                    requirePublicAddresses(current.host, resolver);
                    MediaBudget.check(deadline);
                    int responseCode = connection.getResponseCode();
                    if (!isRedirect(responseCode)) {
                        returned = true;
                        return new Response(connection, responseCode, current.url);
                    }

                    if (redirects >= MAX_REDIRECTS) {
                        throw new IOException("Media redirect limit exceeded");
                    }
                    String location = connection.getHeaderField("Location");
                    if (location == null || location.trim().isEmpty()) {
                        throw new IOException("Media redirect has no destination");
                    }
                    current = redirect(current.uri, location);
                    redirects++;
                } finally {
                    if (!returned) connection.disconnect();
                }
            }
        }
    }

    static final class Response implements AutoCloseable {
        private final HttpURLConnection connection;
        final int statusCode;
        final URL url;

        private Response(HttpURLConnection connection, int statusCode, URL url) {
            this.connection = connection;
            this.statusCode = statusCode;
            this.url = url;
        }

        String header(String name) {
            return connection.getHeaderField(name);
        }

        InputStream inputStream() throws IOException {
            return connection.getInputStream();
        }

        String contentType() {
            return connection.getContentType();
        }

        @Override public void close() {
            connection.disconnect();
        }
    }

    static boolean isPublicAddress(InetAddress address) {
        if (address == null
                || address.isAnyLocalAddress()
                || address.isLoopbackAddress()
                || address.isLinkLocalAddress()
                || address.isSiteLocalAddress()
                || address.isMulticastAddress()) {
            return false;
        }

        byte[] bytes = address.getAddress();
        if (bytes.length == 4) {
            int first = bytes[0] & 255;
            int second = bytes[1] & 255;
            // Also refuse shared carrier space and non-routable address blocks. Neither can be
            // a public CDN endpoint, and accepting them would widen the local-network boundary.
            return first != 0
                    && first != 10
                    && first != 127
                    && !(first == 100 && second >= 64 && second <= 127)
                    && !(first == 169 && second == 254)
                    && !(first == 172 && second >= 16 && second <= 31)
                    && !(first == 192 && second == 168)
                    && first < 224;
        }

        if (bytes.length == 16) {
            int first = bytes[0] & 255;
            int second = bytes[1] & 255;
            // Java does not classify RFC 4193 unique-local addresses as site-local.
            if ((first & 0xfe) == 0xfc) return false;
            if (first == 0xfe && (second & 0xc0) == 0x80) return false;
            if (first == 0xff) return false;
        }
        return true;
    }

    private static void requirePublicAddresses(String host, Resolver resolver) throws IOException {
        InetAddress[] addresses;
        try {
            addresses = resolver.resolve(host);
        } catch (RuntimeException error) {
            throw new IOException("Media hostname could not be resolved safely", error);
        }
        if (addresses == null || addresses.length == 0) {
            throw new IOException("Media hostname has no address");
        }
        for (InetAddress address : addresses) {
            if (!isPublicAddress(address)) {
                throw new IOException("Media URL resolves to a non-public address");
            }
        }
    }

    private static boolean isRedirect(int statusCode) {
        return statusCode == 300 || statusCode == 301 || statusCode == 302
                || statusCode == 303 || statusCode == 307 || statusCode == 308;
    }

    private static Target redirect(URI base, String location) throws IOException {
        try {
            return target(base.resolve(new URI(location.trim())).toString());
        } catch (IllegalArgumentException | URISyntaxException error) {
            throw new IOException("Media redirect destination is invalid", error);
        }
    }

    private static Target target(String value) throws IOException {
        if (value == null) throw new IOException("Media URL is missing");
        try {
            URI uri = new URI(value.trim()).normalize();
            if (!"https".equalsIgnoreCase(uri.getScheme())) {
                throw new IOException("Media URL must use HTTPS");
            }
            if (uri.getRawUserInfo() != null) {
                throw new IOException("Media URL cannot contain user information");
            }
            String host = uri.getHost();
            if (host == null || host.isEmpty()) {
                throw new IOException("Media URL has no hostname");
            }
            if (host.startsWith("[") && host.endsWith("]")) {
                host = host.substring(1, host.length() - 1);
            }
            host = host.toLowerCase(Locale.ROOT);
            int port = uri.getPort() < 0 ? 443 : uri.getPort();
            String path = uri.getRawPath();
            if (path == null || path.isEmpty()) path = "/";
            String identity = host + ":" + port + path
                    + (uri.getRawQuery() == null ? "" : "?" + uri.getRawQuery());
            return new Target(uri, uri.toURL(), host, identity);
        } catch (URISyntaxException | IllegalArgumentException error) {
            throw new IOException("Media URL is invalid", error);
        }
    }

    private static final class Target {
        final URI uri;
        final URL url;
        final String host;
        final String identity;

        Target(URI uri, URL url, String host, String identity) {
            this.uri = uri;
            this.url = url;
            this.host = host;
            this.identity = identity;
        }
    }
}
