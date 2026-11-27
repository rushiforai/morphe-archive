package dev.brave.extension.media;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.IpPrefix;
import android.net.LinkProperties;
import android.net.Network;
import android.os.Build;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.Socket;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.zip.GZIPInputStream;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SNIHostName;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

/**
 * Centralized SSRF defense, Referer/Cookie isolation, safe manual redirect handling,
 * bounded stream readers, and bounded thread-pool factory for native media networking.
 */
public final class NetworkSafety {
    private static final String TAG = "Brave_NetworkSafety";
    private static final int MAX_REDIRECTS = 5;
    private static volatile Context sAppContext = null;

    public static void initContext(Context ctx) {
        if (ctx != null && sAppContext == null) {
            Context app = ctx.getApplicationContext();
            sAppContext = (app != null) ? app : ctx;
        }
    }
    private static final SecureRandom SECURE_RANDOM = new SecureRandom();
    public static final String DEFAULT_USER_AGENT =
            "Mozilla/5.0 (Linux; Android 14; Pixel 6a) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36";

    private NetworkSafety() {}

    public static final class SafeConnection {
        public final HttpURLConnection conn;
        public final String finalUrl;
        public final int responseCode;

        public SafeConnection(HttpURLConnection conn, String finalUrl, int responseCode) {
            this.conn = conn;
            this.finalUrl = finalUrl;
            this.responseCode = responseCode;
        }
    }

    public static final class TextFetchResult {
        public final String finalUrl;
        public final String body;
        public final boolean truncated;

        public TextFetchResult(String finalUrl, String body) {
            this(finalUrl, body, false);
        }

        public TextFetchResult(String finalUrl, String body, boolean truncated) {
            this.finalUrl = finalUrl;
            this.body = body;
            this.truncated = truncated;
        }
    }

    public static final class ByteFetchResult {
        public final String finalUrl;
        public final byte[] body;
        public final String contentType;
        public final int responseCode;

        public ByteFetchResult(String finalUrl, byte[] body, String contentType, int responseCode) {
            this.finalUrl = finalUrl;
            this.body = body;
            this.contentType = contentType;
            this.responseCode = responseCode;
        }
    }

    public static String generateRandomTokenHex(int numBytes) {
        byte[] bytes = new byte[numBytes];
        SECURE_RANDOM.nextBytes(bytes);
        StringBuilder sb = new StringBuilder(numBytes * 2);
        for (byte b : bytes) {
            sb.append(String.format(Locale.ROOT, "%02x", b & 0xFF));
        }
        return sb.toString();
    }

    public static ExecutorService newBoundedPool(int threads, int queueCapacity, final String prefix) {
        final AtomicInteger counter = new AtomicInteger(1);
        ThreadFactory factory = r -> {
            Thread t = new Thread(r, prefix + "-" + counter.getAndIncrement());
            t.setDaemon(true);
            return t;
        };
        ThreadPoolExecutor exec = new ThreadPoolExecutor(
                threads,
                threads,
                30L,
                TimeUnit.SECONDS,
                new LinkedBlockingQueue<>(queueCapacity),
                factory,
                new ThreadPoolExecutor.AbortPolicy()
        );
        exec.allowCoreThreadTimeOut(true);
        return exec;
    }

    /**
     * Validates a MIME type against strict RFC 6838 type/subtype syntax without CR, LF,
     * or arbitrary parameters to prevent HTTP header injection.
     */
    public static String sanitizeMimeType(String rawMime, String fallbackMime) {
        String safeFallback = (fallbackMime != null && isValidMimeCore(fallbackMime))
                ? fallbackMime.trim().toLowerCase(Locale.ROOT)
                : "application/octet-stream";
        if (rawMime == null) return safeFallback;
        for (int i = 0; i < rawMime.length(); i++) {
            char c = rawMime.charAt(i);
            if (c < 0x20 || c == 0x7F) {
                return safeFallback;
            }
        }
        String trimmed = rawMime.trim();
        int semi = trimmed.indexOf(';');
        String core = (semi >= 0 ? trimmed.substring(0, semi) : trimmed).trim().toLowerCase(Locale.ROOT);
        if (!isValidMimeCore(core)) {
            return safeFallback;
        }
        return core;
    }

    private static boolean isValidMimeCore(String core) {
        if (core == null || core.isEmpty() || core.length() > 127) return false;
        int slash = core.indexOf('/');
        if (slash <= 0 || slash >= core.length() - 1) return false;
        if (core.indexOf('/', slash + 1) >= 0) return false;
        String type = core.substring(0, slash);
        String sub = core.substring(slash + 1);
        return isMimeToken(type) && isMimeToken(sub);
    }

    private static boolean isMimeToken(String token) {
        if (token.isEmpty() || token.length() > 63) return false;
        char first = token.charAt(0);
        if (!((first >= 'a' && first <= 'z') || (first >= 'A' && first <= 'Z') || (first >= '0' && first <= '9'))) {
            return false;
        }
        for (int i = 0; i < token.length(); i++) {
            char c = token.charAt(i);
            boolean ok = (c >= 'a' && c <= 'z')
                    || (c >= 'A' && c <= 'Z')
                    || (c >= '0' && c <= '9')
                    || c == '!' || c == '#' || c == '$' || c == '&'
                    || c == '^' || c == '_' || c == '.' || c == '+' || c == '-';
            if (!ok) return false;
        }
        return true;
    }

    public static String stripControlChars(String value) {
        if (value == null || value.isEmpty()) return "";
        StringBuilder sb = new StringBuilder(value.length());
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c >= 0x20 && c != 0x7F) {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    /**
     * Extracts canonical origin "scheme://host" or "scheme://host:port" for http(s) URLs.
     * Returns null if not a valid http(s) URL.
     */
    public static String formatOrigin(String urlStr) {
        if (urlStr == null || urlStr.isEmpty()) return null;
        try {
            URI uri = URI.create(urlStr.trim());
            String scheme = uri.getScheme();
            String host = uri.getHost();
            if (scheme == null || host == null || host.isEmpty()) return null;
            String lowerScheme = scheme.toLowerCase(Locale.ROOT);
            if (!"http".equals(lowerScheme) && !"https".equals(lowerScheme)) return null;
            String lowerHost = host.toLowerCase(Locale.ROOT);
            int port = uri.getPort();
            boolean isDefaultPort = (port == -1)
                    || ("http".equals(lowerScheme) && port == 80)
                    || ("https".equals(lowerScheme) && port == 443);
            return isDefaultPort ? (lowerScheme + "://" + lowerHost) : (lowerScheme + "://" + lowerHost + ":" + port);
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static boolean isSameOrigin(String urlA, String urlB) {
        String origA = formatOrigin(urlA);
        String origB = formatOrigin(urlB);
        return origA != null && origA.equals(origB);
    }

    /**
     * Computes a Referer header adhering to strict-origin-when-cross-origin:
     * - Never downgrades HTTPS -> HTTP (returns empty string)
     * - Same origin: full URL without #fragment
     * - Cross origin: origin + "/" only (strips path and query string tokens)
     */
    public static String computeSafeReferer(String pageUrl, String targetUrl) {
        if (pageUrl == null || pageUrl.isEmpty() || targetUrl == null || targetUrl.isEmpty()) {
            return "";
        }
        try {
            URI pageUri = URI.create(pageUrl.trim());
            URI targetUri = URI.create(targetUrl.trim());
            String pScheme = pageUri.getScheme() != null ? pageUri.getScheme().toLowerCase(Locale.ROOT) : "";
            String tScheme = targetUri.getScheme() != null ? targetUri.getScheme().toLowerCase(Locale.ROOT) : "";
            if ((!"http".equals(pScheme) && !"https".equals(pScheme))
                    || (!"http".equals(tScheme) && !"https".equals(tScheme))) {
                return "";
            }
            // Block HTTPS -> HTTP referrer downgrade
            if ("https".equals(pScheme) && "http".equals(tScheme)) {
                return "";
            }
            String pOrigin = formatOrigin(pageUrl);
            String tOrigin = formatOrigin(targetUrl);
            if (pOrigin == null || tOrigin == null) return "";
            if (pOrigin.equals(tOrigin)) {
                String clean = pageUrl.trim();
                int hashIdx = clean.indexOf('#');
                return hashIdx >= 0 ? clean.substring(0, hashIdx) : clean;
            }
            // Cross-origin: send origin only
            return pOrigin + "/";
        } catch (Throwable ignored) {
            return "";
        }
    }

    /**
     * Computes an eligible Cookie header value for targetUrl given the page/source URL
     * from which document.cookie was collected:
     * - Blocks HTTPS -> HTTP credential downgrade (protects Secure cookies)
     * - Requires exact host match (case-insensitive) to prevent cross-host cookie leakage
     *
     * Note: cookieSourceUrl is a page URL rather than a Set-Cookie Path attribute, so page path
     * matching is intentionally not applied (page paths like /watch/123 must not block host-wide
     * cookies sent to /media/ endpoints on the same host).
     */
    public static String computeSafeCookie(String cookie, String cookieSourceUrl, String targetUrl) {
        if (cookie == null || cookie.isEmpty()
                || cookieSourceUrl == null || cookieSourceUrl.isEmpty()
                || targetUrl == null || targetUrl.isEmpty()) {
            return "";
        }
        try {
            URI srcUri = URI.create(cookieSourceUrl.trim());
            URI dstUri = URI.create(targetUrl.trim());
            String srcScheme = srcUri.getScheme() != null ? srcUri.getScheme().toLowerCase(Locale.ROOT) : "";
            String dstScheme = dstUri.getScheme() != null ? dstUri.getScheme().toLowerCase(Locale.ROOT) : "";
            if ((!"http".equals(srcScheme) && !"https".equals(srcScheme))
                    || (!"http".equals(dstScheme) && !"https".equals(dstScheme))) {
                return "";
            }
            // Prevent HTTPS -> HTTP credential downgrade
            if ("https".equals(srcScheme) && "http".equals(dstScheme)) {
                return "";
            }
            String srcHost = normalizeHost(srcUri.getHost());
            String dstHost = normalizeHost(dstUri.getHost());
            if (srcHost == null || dstHost == null) return "";
            if (!srcHost.equals(dstHost)) {
                return "";
            }
            return cookie;
        } catch (Throwable ignored) {
            return "";
        }
    }

    public static String normalizeHost(String rawHost) {
        if (rawHost == null || rawHost.isEmpty()) return null;
        String h = rawHost.trim().toLowerCase(Locale.ROOT);
        if (h.startsWith("[") && h.endsWith("]")) {
            h = h.substring(1, h.length() - 1);
        }
        while (h.endsWith(".")) {
            h = h.substring(0, h.length() - 1);
        }
        return h.isEmpty() ? null : h;
    }

    public static boolean isLiteralIpAddress(String host) {
        if (host == null || host.isEmpty()) return false;
        String h = host.trim();
        if (h.startsWith("[") && h.endsWith("]")) {
            h = h.substring(1, h.length() - 1);
        }
        // Strict decimal dotted-quad IPv4 (no leading-zero octal ambiguity)
        String[] parts = h.split("\\.", -1);
        if (parts.length == 4) {
            for (String p : parts) {
                if (p.isEmpty() || p.length() > 3) return false;
                if (p.length() > 1 && p.charAt(0) == '0') return false;
                for (int i = 0; i < p.length(); i++) {
                    char c = p.charAt(i);
                    if (c < '0' || c > '9') return false;
                }
                int val = Integer.parseInt(p);
                if (val < 0 || val > 255) return false;
            }
            return true;
        }
        // IPv6 literal (must contain ':' and only hex/colon/dot characters)
        if (h.indexOf(':') >= 0) {
            for (int i = 0; i < h.length(); i++) {
                char c = h.charAt(i);
                boolean ok = (c >= '0' && c <= '9')
                        || (c >= 'a' && c <= 'f')
                        || (c >= 'A' && c <= 'F')
                        || c == ':' || c == '.';
                if (!ok) return false;
            }
            return true;
        }
        return false;
    }

    /**
     * Checks whether targetUrl is safe to connect to from native code without SSRF.
     * Always resolves DNS and verifies every address. Non-public destinations are blocked
     * UNLESS the host is a non-rebindable literal IP or "localhost" on the exact same origin
     * (scheme, host, and port) as pageContextUrl.
     */
    public static boolean isAllowedTargetUrl(String targetUrl, String pageContextUrl) {
        try {
            validateTargetUrl(targetUrl, pageContextUrl);
            return true;
        } catch (IOException e) {
            Log.w(TAG, "Blocked target URL (" + targetUrl + "): " + e.getMessage());
            return false;
        }
    }

    public static void validateTargetUrl(String targetUrl, String pageContextUrl) throws IOException {
        validateAndResolveTarget(targetUrl, pageContextUrl);
    }

    /**
     * Validates targetUrl against SSRF rules and returns the validated resolved InetAddress array
     * so callers can pin connections directly to those verified addresses without DNS TOCTOU.
     */
    public static InetAddress[] validateAndResolveTarget(String targetUrl, String pageContextUrl) throws IOException {
        if (targetUrl == null || targetUrl.trim().isEmpty()) {
            throw new IOException("Empty URL");
        }
        URI uri;
        try {
            uri = URI.create(targetUrl.trim());
        } catch (IllegalArgumentException e) {
            throw new IOException("Malformed URL: " + targetUrl, e);
        }

        String scheme = uri.getScheme();
        if (scheme == null) {
            throw new IOException("Missing URL scheme");
        }
        String lowerScheme = scheme.toLowerCase(Locale.ROOT);
        if (!"http".equals(lowerScheme) && !"https".equals(lowerScheme)) {
            throw new IOException("Disallowed URL scheme: " + lowerScheme);
        }

        String host = normalizeHost(uri.getHost());
        if (host == null) {
            throw new IOException("Missing URL host");
        }

        if (host.endsWith(".localhost") || host.endsWith(".local")) {
            throw new IOException("Blocked local hostname: " + host);
        }

        boolean isLocalhost = "localhost".equals(host);
        boolean isLiteralIp = isLiteralIpAddress(host);

        // Always perform DNS resolution (never short-circuit before resolution)
        InetAddress[] addresses;
        try {
            addresses = InetAddress.getAllByName(host);
        } catch (Throwable t) {
            throw new IOException("DNS resolution failed for host: " + host, t);
        }
        if (addresses == null || addresses.length == 0) {
            throw new IOException("No addresses resolved for host: " + host);
        }

        boolean hasNonPublic = false;
        for (InetAddress addr : addresses) {
            if (isNonPublicAddress(addr)) {
                hasNonPublic = true;
                break;
            }
        }

        if (hasNonPublic || isLocalhost) {
            // Only allow non-public / loopback targets when the page itself was opened on the exact
            // same origin (scheme + host + port) AND the host cannot undergo external DNS rebinding.
            boolean sameOrigin = pageContextUrl != null && !pageContextUrl.isEmpty()
                    && isSameOrigin(pageContextUrl, targetUrl);
            if (!sameOrigin || (!isLiteralIp && !isLocalhost)) {
                throw new IOException("Blocked non-public destination for host " + host);
            }
            if (isLocalhost) {
                for (InetAddress addr : addresses) {
                    if (!addr.isLoopbackAddress()) {
                        throw new IOException("Blocked non-loopback address " + addr.getHostAddress() + " for localhost");
                    }
                }
            }
        }

        return addresses;
    }

    public static boolean isNonPublicAddress(InetAddress addr) {
        if (addr == null) return true;
        if (addr.isAnyLocalAddress()
                || addr.isLoopbackAddress()
                || addr.isLinkLocalAddress()
                || addr.isSiteLocalAddress()
                || addr.isMulticastAddress()) {
            return true;
        }

        byte[] raw = addr.getAddress();
        if (addr instanceof Inet4Address && raw.length == 4) {
            return isNonPublicIpv4(raw);
        }
        if (addr instanceof Inet6Address && raw.length == 16) {
            int b0 = raw[0] & 0xFF;
            int b1 = raw[1] & 0xFF;
            int b2 = raw[2] & 0xFF;
            int b3 = raw[3] & 0xFF;
            // Unique Local Address (fc00::/7)
            if ((b0 & 0xFE) == 0xFC) return true;
            // Discard-Only Address Block (0100::/64)
            if (b0 == 0x01 && b1 == 0x00 && b2 == 0x00 && b3 == 0x00
                    && raw[4] == 0 && raw[5] == 0 && raw[6] == 0 && raw[7] == 0) {
                return true;
            }
            // IPv4-mapped IPv6 (::ffff:0:0/96)
            boolean isV4Mapped = true;
            for (int i = 0; i < 10; i++) {
                if (raw[i] != 0) {
                    isV4Mapped = false;
                    break;
                }
            }
            if (isV4Mapped && (raw[10] & 0xFF) == 0xFF && (raw[11] & 0xFF) == 0xFF) {
                byte[] v4 = new byte[]{raw[12], raw[13], raw[14], raw[15]};
                return isNonPublicIpv4(v4);
            }
            // NAT64 local-use prefix (64:ff9b:1::/48, RFC 8215) - non-global local translation space
            if (b0 == 0x00 && b1 == 0x64 && b2 == 0xFF && b3 == 0x9B
                    && (raw[4] & 0xFF) == 0x00 && (raw[5] & 0xFF) == 0x01) {
                return true;
            }
            // NAT64 well-known prefix (64:ff9b::/96, RFC 6052) - validate embedded IPv4 in bytes 12..15
            if (b0 == 0x00 && b1 == 0x64 && b2 == 0xFF && b3 == 0x9B
                    && raw[4] == 0 && raw[5] == 0 && raw[6] == 0 && raw[7] == 0
                    && raw[8] == 0 && raw[9] == 0 && raw[10] == 0 && raw[11] == 0) {
                byte[] v4 = new byte[]{raw[12], raw[13], raw[14], raw[15]};
                return isNonPublicIpv4(v4);
            }
            // 6to4 (2002::/16, RFC 3056) - validate embedded IPv4 in bytes 2..5
            if (b0 == 0x20 && b1 == 0x02) {
                byte[] v4 = new byte[]{raw[2], raw[3], raw[4], raw[5]};
                return isNonPublicIpv4(v4);
            }
            // Teredo (2001:0000::/32, RFC 4380) - block Teredo tunneling addresses unconditionally
            if (b0 == 0x20 && b1 == 0x01 && b2 == 0x00 && b3 == 0x00) {
                return true;
            }
            // Dynamically discovered RFC 6052 NAT64 Network-Specific Prefixes (NSPs)
            if (isNonPublicUnderActiveNat64Prefixes(raw)) {
                return true;
            }
        }
        return false;
    }

    private static List<byte[]> discoverActiveNat64Prefixes() {
        Context ctx = sAppContext;
        if (ctx == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            return Collections.emptyList();
        }
        List<byte[]> result = new ArrayList<>(2);
        try {
            Object obj = ctx.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (!(obj instanceof ConnectivityManager)) return result;
            ConnectivityManager cm = (ConnectivityManager) obj;
            Network[] nets = cm.getAllNetworks();
            if (nets == null) return result;
            for (Network net : nets) {
                LinkProperties lp = cm.getLinkProperties(net);
                if (lp == null) continue;
                IpPrefix nat64 = lp.getNat64Prefix();
                if (nat64 == null) continue;
                byte[] pBytes = nat64.getRawAddress();
                int pLen = nat64.getPrefixLength();
                if (pBytes != null && pBytes.length == 16 && isValidRfc6052PrefixLength(pLen)) {
                    byte[] packed = new byte[17];
                    System.arraycopy(pBytes, 0, packed, 0, 16);
                    packed[16] = (byte) pLen;
                    result.add(packed);
                }
            }
        } catch (Throwable ignored) {}
        return result;
    }

    private static boolean isValidRfc6052PrefixLength(int prefixLen) {
        return prefixLen == 32 || prefixLen == 40 || prefixLen == 48
                || prefixLen == 56 || prefixLen == 64 || prefixLen == 96;
    }

    private static boolean isNonPublicUnderActiveNat64Prefixes(byte[] raw) {
        List<byte[]> active = discoverActiveNat64Prefixes();
        for (byte[] packed : active) {
            int pLen = packed[16] & 0xFF;
            if (matchesRfc6052NspAndNonPublicIpv4(raw, packed, pLen)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Checks whether raw (16-byte IPv6 address) matches the given RFC 6052 Network-Specific Prefix
     * (prefixLen in {32, 40, 48, 56, 64, 96}) and decodes its embedded IPv4 address for non-public check.
     */
    static boolean matchesRfc6052NspAndNonPublicIpv4(byte[] raw, byte[] prefixBytes, int prefixLen) {
        if (raw == null || raw.length != 16 || prefixBytes == null || prefixBytes.length < 16) return false;
        if (!isValidRfc6052PrefixLength(prefixLen)) return false;
        int fullBytes = prefixLen / 8;
        for (int i = 0; i < fullBytes; i++) {
            if (raw[i] != prefixBytes[i]) return false;
        }
        byte[] v4 = extractRfc6052Ipv4(raw, prefixLen);
        return v4 != null && isNonPublicIpv4(v4);
    }

    private static byte[] extractRfc6052Ipv4(byte[] raw, int prefixLen) {
        switch (prefixLen) {
            case 96:
                return new byte[]{raw[12], raw[13], raw[14], raw[15]};
            case 64:
                return new byte[]{raw[9], raw[10], raw[11], raw[12]};
            case 56:
                return new byte[]{raw[7], raw[9], raw[10], raw[11]};
            case 48:
                return new byte[]{raw[6], raw[7], raw[9], raw[10]};
            case 40:
                return new byte[]{raw[5], raw[6], raw[7], raw[9]};
            case 32:
                return new byte[]{raw[4], raw[5], raw[6], raw[7]};
            default:
                return null;
        }
    }

    private static boolean isNonPublicIpv4(byte[] ip) {
        int b0 = ip[0] & 0xFF;
        int b1 = ip[1] & 0xFF;
        // 0.0.0.0/8 ("this" network)
        if (b0 == 0) return true;
        // 10.0.0.0/8 (RFC 1918)
        if (b0 == 10) return true;
        // 100.64.0.0/10 (CGNAT / Shared Address Space RFC 6598)
        if (b0 == 100 && (b1 >= 64 && b1 <= 127)) return true;
        // 127.0.0.0/8 (Loopback)
        if (b0 == 127) return true;
        // 169.254.0.0/16 (Link-local / Cloud metadata)
        if (b0 == 169 && b1 == 254) return true;
        // 172.16.0.0/12 (RFC 1918)
        if (b0 == 172 && (b1 >= 16 && b1 <= 31)) return true;
        // 192.168.0.0/16 (RFC 1918)
        if (b0 == 192 && b1 == 168) return true;
        // 198.18.0.0/15 (Benchmarking)
        if (b0 == 198 && (b1 == 18 || b1 == 19)) return true;
        // 224.0.0.0/4 (Multicast) and 240.0.0.0/4 (Reserved / Broadcast)
        if (b0 >= 224) return true;
        return false;
    }

    /**
     * Opens an HTTP(S) connection with manual redirect handling, validating every hop for SSRF,
     * pinning the resolved IP address into the socket/URL connection to eliminate DNS TOCTOU,
     * and recomputing Referer and Cookie headers per hop.
     */
    public static SafeConnection openSafeConnection(
            String initialUrl,
            String method,
            String userAgent,
            String cookie,
            String cookieSourceUrl,
            String refererPageUrl,
            String pageContextUrl,
            String rangeHeader,
            boolean acceptGzip,
            int connectTimeoutMs,
            int readTimeoutMs
    ) throws IOException {
        return openSafeConnectionInternal(
                initialUrl, method, userAgent, cookie, cookieSourceUrl,
                refererPageUrl, pageContextUrl, rangeHeader, acceptGzip,
                null, null, null, connectTimeoutMs, readTimeoutMs
        );
    }

    public static TextFetchResult postTextSafe(
            String urlStr,
            String contentType,
            String body,
            String userAgent,
            String refererPageUrl,
            String pageContextUrl,
            String originHeader,
            int maxChars,
            int timeoutMs
    ) throws IOException {
        byte[] bodyBytes = body != null ? body.getBytes(StandardCharsets.UTF_8) : new byte[0];
        SafeConnection sc = openSafeConnectionInternal(
                urlStr, "POST", userAgent, "", "",
                refererPageUrl, pageContextUrl, null, true,
                contentType, bodyBytes, originHeader, timeoutMs, timeoutMs
        );
        try {
            if (sc.responseCode < 200 || sc.responseCode >= 300) {
                return null;
            }
            String encoding = sc.conn.getHeaderField("Content-Encoding");
            boolean[] truncatedOut = new boolean[1];
            String respBody = readTextInternal(sc.conn.getInputStream(), encoding, maxChars, false, truncatedOut);
            return new TextFetchResult(sc.finalUrl, respBody, truncatedOut[0]);
        } finally {
            sc.conn.disconnect();
        }
    }

    private static SafeConnection openSafeConnectionInternal(
            String initialUrl,
            String method,
            String userAgent,
            String cookie,
            String cookieSourceUrl,
            String refererPageUrl,
            String pageContextUrl,
            String rangeHeader,
            boolean acceptGzip,
            String contentType,
            byte[] postBody,
            String originHeader,
            int connectTimeoutMs,
            int readTimeoutMs
    ) throws IOException {
        String currentUrl = initialUrl;
        String currentMethod = (method != null && !method.isEmpty()) ? method : "GET";
        String effectivePageContext = (pageContextUrl != null && !pageContextUrl.isEmpty())
                ? pageContextUrl : refererPageUrl;

        for (int hop = 0; hop <= MAX_REDIRECTS; hop++) {
            InetAddress[] validatedAddrs = validateAndResolveTarget(currentUrl, effectivePageContext);
            List<InetAddress> orderedAddrs = orderAddressesPreferIpv4(validatedAddrs);
            URL logicalUrl = new URL(currentUrl);

            HttpURLConnection conn = null;
            int code = -1;
            IOException lastConnectErr = null;
            for (InetAddress pinnedAddr : orderedAddrs) {
                HttpURLConnection candidate = openPinnedConnection(
                        logicalUrl, pinnedAddr, currentMethod, userAgent,
                        cookie, cookieSourceUrl, refererPageUrl, currentUrl,
                        rangeHeader, acceptGzip, contentType, postBody, originHeader,
                        connectTimeoutMs, readTimeoutMs
                );
                try {
                    if (postBody != null && "POST".equalsIgnoreCase(currentMethod)) {
                        candidate.setFixedLengthStreamingMode(postBody.length);
                        try (OutputStream os = candidate.getOutputStream()) {
                            os.write(postBody);
                        }
                    }
                    code = candidate.getResponseCode();
                    conn = candidate;
                    break;
                } catch (IOException e) {
                    candidate.disconnect();
                    lastConnectErr = e;
                }
            }
            if (conn == null) {
                throw (lastConnectErr != null) ? lastConnectErr : new IOException("Failed connecting to " + currentUrl);
            }

            if (code == 301 || code == 302 || code == 303 || code == 307 || code == 308) {
                String location = conn.getHeaderField("Location");
                conn.disconnect();
                if (location == null || location.trim().isEmpty()) {
                    throw new IOException("Redirect without Location header");
                }
                if (hop == MAX_REDIRECTS) {
                    throw new IOException("Too many redirects");
                }
                URL next = new URL(logicalUrl, location.trim());
                String prevOrigin = formatOrigin(logicalUrl.toString());
                String nextOrigin = formatOrigin(next.toString());
                boolean sameOriginRedirect = prevOrigin != null && prevOrigin.equals(nextOrigin);
                currentUrl = next.toString();
                if ((code == 301 || code == 302 || code == 303) && !"HEAD".equalsIgnoreCase(currentMethod)) {
                    currentMethod = "GET";
                    postBody = null;
                    contentType = null;
                    originHeader = null;
                } else if ("POST".equalsIgnoreCase(currentMethod) && !sameOriginRedirect) {
                    throw new IOException("Blocked cross-origin POST redirect from " + prevOrigin + " to " + nextOrigin);
                } else if (!sameOriginRedirect) {
                    originHeader = null;
                }
                continue;
            }

            return new SafeConnection(conn, currentUrl, code);
        }

        throw new IOException("Too many redirects");
    }

    private static List<InetAddress> orderAddressesPreferIpv4(InetAddress[] addresses) {
        List<InetAddress> v4 = new ArrayList<>(addresses.length);
        List<InetAddress> other = new ArrayList<>(addresses.length);
        for (InetAddress addr : addresses) {
            if (addr instanceof Inet4Address) {
                v4.add(addr);
            } else {
                other.add(addr);
            }
        }
        v4.addAll(other);
        return v4;
    }

    private static String formatIpLiteralForUrl(InetAddress addr) {
        String ip = addr.getHostAddress();
        int pct = ip.indexOf('%');
        if (pct >= 0) {
            ip = ip.substring(0, pct);
        }
        return (addr instanceof Inet6Address) ? ("[" + ip + "]") : ip;
    }

    private static String stripBrackets(String host) {
        if (host == null) return "";
        if (host.startsWith("[") && host.endsWith("]")) {
            return host.substring(1, host.length() - 1);
        }
        return host;
    }

    private static HttpURLConnection openPinnedConnection(
            URL logicalUrl,
            InetAddress pinnedAddr,
            String method,
            String userAgent,
            String cookie,
            String cookieSourceUrl,
            String refererPageUrl,
            String currentLogicalUrl,
            String rangeHeader,
            boolean acceptGzip,
            String contentType,
            byte[] postBody,
            String originHeader,
            int connectTimeoutMs,
            int readTimeoutMs
    ) throws IOException {
        String pinnedHost = formatIpLiteralForUrl(pinnedAddr);
        URL connectUrl = new URL(logicalUrl.getProtocol(), pinnedHost, logicalUrl.getPort(), logicalUrl.getFile());
        HttpURLConnection conn = (HttpURLConnection) connectUrl.openConnection();

        String logicalHost = logicalUrl.getHost();
        String hostHeader = (logicalUrl.getPort() != -1) ? (logicalHost + ":" + logicalUrl.getPort()) : logicalHost;
        conn.setRequestMethod(method);
        conn.setConnectTimeout(connectTimeoutMs);
        conn.setReadTimeout(readTimeoutMs);
        conn.setInstanceFollowRedirects(false);
        conn.setRequestProperty("Host", hostHeader);
        conn.setRequestProperty("Accept", "*/*");
        if (acceptGzip) {
            conn.setRequestProperty("Accept-Encoding", "gzip");
        }
        if (userAgent != null && !userAgent.isEmpty()) {
            conn.setRequestProperty("User-Agent", userAgent);
        } else {
            conn.setRequestProperty("User-Agent", DEFAULT_USER_AGENT);
        }
        if (contentType != null && !contentType.isEmpty()) {
            conn.setRequestProperty("Content-Type", contentType);
        }
        if (originHeader != null && !originHeader.isEmpty()) {
            conn.setRequestProperty("Origin", originHeader);
        }
        if (postBody != null && "POST".equalsIgnoreCase(method)) {
            conn.setDoOutput(true);
        }

        String safeRef = computeSafeReferer(refererPageUrl, currentLogicalUrl);
        if (!safeRef.isEmpty()) {
            conn.setRequestProperty("Referer", safeRef);
        }

        String safeCookie = computeSafeCookie(cookie, cookieSourceUrl, currentLogicalUrl);
        if (!safeCookie.isEmpty()) {
            conn.setRequestProperty("Cookie", safeCookie);
        }

        if (rangeHeader != null && !rangeHeader.isEmpty()) {
            conn.setRequestProperty("Range", rangeHeader);
        }

        if (conn instanceof HttpsURLConnection) {
            HttpsURLConnection httpsConn = (HttpsURLConnection) conn;
            final String sniHost = stripBrackets(logicalHost);
            if (!isLiteralIpAddress(sniHost)) {
                httpsConn.setSSLSocketFactory(
                        new SniPinnedSSLSocketFactory(HttpsURLConnection.getDefaultSSLSocketFactory(), sniHost)
                );
            }
            httpsConn.setHostnameVerifier(new HostnameVerifier() {
                @Override
                public boolean verify(String hostname, SSLSession session) {
                    return HttpsURLConnection.getDefaultHostnameVerifier().verify(sniHost, session);
                }
            });
        }

        return conn;
    }

    private static final class SniPinnedSSLSocketFactory extends SSLSocketFactory {
        private final SSLSocketFactory delegate;
        private final String sniHost;

        SniPinnedSSLSocketFactory(SSLSocketFactory delegate, String sniHost) {
            this.delegate = delegate;
            this.sniHost = sniHost;
        }

        private Socket configureSni(Socket sock) {
            if (sock instanceof SSLSocket && sniHost != null && !sniHost.isEmpty()) {
                SSLSocket ssl = (SSLSocket) sock;
                SSLParameters params = ssl.getSSLParameters();
                params.setServerNames(Collections.singletonList(new SNIHostName(sniHost)));
                ssl.setSSLParameters(params);
            }
            return sock;
        }

        @Override
        public String[] getDefaultCipherSuites() {
            return delegate.getDefaultCipherSuites();
        }

        @Override
        public String[] getSupportedCipherSuites() {
            return delegate.getSupportedCipherSuites();
        }

        @Override
        public Socket createSocket(Socket s, String host, int port, boolean autoClose) throws IOException {
            return configureSni(delegate.createSocket(s, host, port, autoClose));
        }

        @Override
        public Socket createSocket(String host, int port) throws IOException {
            return configureSni(delegate.createSocket(host, port));
        }

        @Override
        public Socket createSocket(String host, int port, InetAddress localHost, int localPort) throws IOException {
            return configureSni(delegate.createSocket(host, port, localHost, localPort));
        }

        @Override
        public Socket createSocket(InetAddress host, int port) throws IOException {
            return configureSni(delegate.createSocket(host, port));
        }

        @Override
        public Socket createSocket(InetAddress address, int port, InetAddress localAddress, int localPort) throws IOException {
            return configureSni(delegate.createSocket(address, port, localAddress, localPort));
        }
    }

    public static TextFetchResult fetchTextSafe(
            String urlStr,
            String userAgent,
            String cookie,
            String cookieSourceUrl,
            String refererPageUrl,
            String pageContextUrl,
            int maxChars,
            int timeoutMs
    ) throws IOException {
        return fetchTextInternal(
                urlStr, userAgent, cookie, cookieSourceUrl,
                refererPageUrl, pageContextUrl, maxChars, timeoutMs, false
        );
    }

    public static TextFetchResult fetchTextStrict(
            String urlStr,
            String userAgent,
            String cookie,
            String cookieSourceUrl,
            String refererPageUrl,
            String pageContextUrl,
            int maxChars,
            int timeoutMs
    ) throws IOException {
        return fetchTextInternal(
                urlStr, userAgent, cookie, cookieSourceUrl,
                refererPageUrl, pageContextUrl, maxChars, timeoutMs, true
        );
    }

    private static TextFetchResult fetchTextInternal(
            String urlStr,
            String userAgent,
            String cookie,
            String cookieSourceUrl,
            String refererPageUrl,
            String pageContextUrl,
            int maxChars,
            int timeoutMs,
            boolean throwOnExceed
    ) throws IOException {
        SafeConnection sc = openSafeConnection(
                urlStr, "GET", userAgent, cookie, cookieSourceUrl,
                refererPageUrl, pageContextUrl, null, true, timeoutMs, timeoutMs
        );
        try {
            if (sc.responseCode < 200 || sc.responseCode >= 300) {
                return null;
            }
            String encoding = sc.conn.getHeaderField("Content-Encoding");
            boolean[] truncatedOut = new boolean[1];
            String body = readTextInternal(sc.conn.getInputStream(), encoding, maxChars, throwOnExceed, truncatedOut);
            return new TextFetchResult(sc.finalUrl, body, truncatedOut[0]);
        } finally {
            sc.conn.disconnect();
        }
    }

    public static byte[] readBytesBounded(InputStream is, int maxBytes) throws IOException {
        try (InputStream in = new BufferedInputStream(is, 16 * 1024);
             ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            byte[] buf = new byte[16 * 1024];
            int r;
            int total = 0;
            while ((r = in.read(buf)) != -1) {
                total += r;
                if (total > maxBytes) {
                    throw new IOException("Response exceeded size limit of " + maxBytes + " bytes");
                }
                baos.write(buf, 0, r);
            }
            return baos.toByteArray();
        }
    }

    public static String readTextBounded(InputStream is, String contentEncoding, int maxChars) throws IOException {
        return readTextInternal(is, contentEncoding, maxChars, false, null);
    }

    public static String readTextStrict(InputStream is, String contentEncoding, int maxChars) throws IOException {
        return readTextInternal(is, contentEncoding, maxChars, true, null);
    }

    private static String readTextInternal(
            InputStream is,
            String contentEncoding,
            int maxChars,
            boolean throwOnExceed,
            boolean[] truncatedOut
    ) throws IOException {
        if (maxChars < 0) {
            throw new IllegalArgumentException("maxChars must be >= 0");
        }
        InputStream stream = is;
        if (contentEncoding != null && "gzip".equalsIgnoreCase(contentEncoding.trim())) {
            stream = new GZIPInputStream(stream);
        }
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(stream, StandardCharsets.UTF_8))) {
            StringBuilder sb = new StringBuilder();
            char[] buf = new char[4096];
            int r;
            int total = 0;
            while ((r = reader.read(buf)) != -1) {
                if (total + r > maxChars) {
                    if (throwOnExceed) {
                        throw new IOException("Response exceeded size limit of " + maxChars + " chars");
                    }
                    int allowed = maxChars - total;
                    if (allowed > 0) sb.append(buf, 0, allowed);
                    if (truncatedOut != null && truncatedOut.length > 0) {
                        truncatedOut[0] = true;
                    }
                    break;
                }
                sb.append(buf, 0, r);
                total += r;
            }
            return sb.toString();
        }
    }
}
