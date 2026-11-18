// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import java.io.IOException;
import java.io.InputStream;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Website previews, a Sync Ultra feature: the image a page names for link previews ({@code og:image}), which the app
 * loaded from its developer's image server ({@link ImageServer}). The phone now reads it from the page itself.
 */
public final class WebsitePreviews {
    /** How much of a page to read, at most: the preview image is named in its head. */
    static final int MAX_HEAD_BYTES = 256 * 1024;
    /** How long a website preview may take to load its page and its image's headers. */
    static final long DEADLINE_MS = 15_000;
    /** How long reading a page may take once it answers: a site that slow is remembered. */
    static final long PAGE_READ_MS = 10_000;

    // The meta tags that name a page's preview image, best first.
    private static final String[] IMAGE_TAGS = {"og:image", "og:image:secure_url", "og:image:url", "twitter:image", "twitter:image:src"};
    private static final Pattern ENTITY = Pattern.compile("&(#[0-9]{1,7}|#[xX][0-9A-Fa-f]{1,6}|[A-Za-z]{2,6});");
    private static final Map<String, String> NAMED = new HashMap<>();
    private static final Pattern SCHEME = Pattern.compile("[A-Za-z][A-Za-z0-9+.-]*://");
    private static final Pattern DIGITS_AND_DOTS = Pattern.compile("[0-9.]+");

    static {
        NAMED.put("amp", "&");
        NAMED.put("lt", "<");
        NAMED.put("gt", ">");
        NAMED.put("quot", "\"");
        NAMED.put("apos", "'");
        NAMED.put("nbsp", " ");
    }

    /** The head of a page as fetched, after redirects. */
    static final class Page {
        final String url;
        final String contentType;
        final byte[] head;

        Page(String url, String contentType, byte[] head) {
            this.url = url;
            this.contentType = contentType;
            this.head = head;
        }
    }

    /** Fetches the head of a page, refusing private addresses; the image client in the app, a fake in tests. */
    interface Pages {
        Page fetch(String link) throws IOException;
    }

    private WebsitePreviews() {}

    /** Turned on by the "Enable Sync Ultra" patch. */
    public static boolean isEnabled() {
        return false;
    }

    /**
     * Whether the link is a website preview's: an https link that isn't Tenor's (Fix Tenor previews handles those) or
     * Gfycat's (Gfycat shut down).
     */
    static boolean isWebsite(String link) {
        URI uri = uri(link);
        return handles(link) && !Tenor.handles(link) && !onDomain(hostOf(uri), "gfycat.com");
    }

    /** Whether the link is one whose page this fetches: https only, as the app's own check requires. */
    static boolean handles(String link) {
        URI uri = uri(link);
        return uri != null && "https".equalsIgnoreCase(uri.getScheme()) && hasPlainHost(uri);
    }

    /**
     * The https image the page at the link names for previews. Throws an IOException when the page can't be read, and
     * another exception when it was read and has none.
     */
    static String image(String link, Pages pages) throws IOException {
        if (!handles(link)) throw new IllegalArgumentException("Not an https link: " + link);
        Page page = pages.fetch(link);
        if (!isHtml(page.contentType)) throw new IllegalStateException("Not a web page (" + page.contentType + "): " + link);
        String image = imageIn(new String(page.head, StandardCharsets.UTF_8), page.url);
        if (image == null) throw new IllegalStateException("No preview image on " + link);
        return image;
    }

    static boolean isHtml(String contentType) {
        if (contentType == null) return false;
        String type = contentType.split(";", 2)[0].trim().toLowerCase(Locale.ROOT);
        return type.equals("text/html") || type.equals("application/xhtml+xml");
    }

    /**
     * A tag's attributes, names lowercased, the first of each name kept. Read by hand, not by a pattern, so a hostile
     * tag (a long name, an unclosed quote) costs no more than its length.
     */
    static Map<String, String> attributes(String tag) {
        Map<String, String> attributes = new HashMap<>();
        int length = tag.length();
        int at = 0;
        while (at < length) {
            char c = tag.charAt(at);
            if (Character.isWhitespace(c) || c == '/') {
                at++;
                continue;
            }
            int nameStart = at;
            while (at < length && !Character.isWhitespace(tag.charAt(at)) && tag.charAt(at) != '=' && tag.charAt(at) != '/') at++;
            String name = tag.substring(nameStart, at).toLowerCase(Locale.ROOT);
            while (at < length && Character.isWhitespace(tag.charAt(at))) at++;
            String value = "";
            if (at < length && tag.charAt(at) == '=') {
                at++;
                while (at < length && Character.isWhitespace(tag.charAt(at))) at++;
                if (at < length && (tag.charAt(at) == '"' || tag.charAt(at) == '\'')) {
                    int close = tag.indexOf(tag.charAt(at), at + 1);
                    if (close < 0) close = length;
                    value = tag.substring(at + 1, close);
                    at = close + 1;
                } else {
                    int valueStart = at;
                    while (at < length && !Character.isWhitespace(tag.charAt(at))) at++;
                    value = tag.substring(valueStart, at);
                }
            }
            if (!name.isEmpty() && !attributes.containsKey(name)) attributes.put(name, value);
        }
        return attributes;
    }

    /** The preview image the page's meta tags name, resolved against the page's URL and made https, or null. */
    static String imageIn(String html, String pageUrl) {
        Map<String, String> found = new HashMap<>();
        // Found by hand, not by a pattern, and matched in the page itself: lowercasing can change its length ("İ"), and
        // with it every index. A tag runs from its '<' to its '>'; one another '<' opens first is unclosed and skipped.
        // Each stretch between two '<' is read once.
        for (int start = html.indexOf('<'), next; start >= 0; start = next) {
            next = html.indexOf('<', start + 1);
            int limit = next < 0 ? html.length() : next;
            int end = -1;
            for (int at = start + 1; at < limit && end < 0; at++) {
                if (html.charAt(at) == '>') end = at;
            }
            boolean meta = html.regionMatches(true, start + 1, "meta", 0, 4)
                    && (start + 5 >= html.length() || !Character.isLetterOrDigit(html.charAt(start + 5)));
            if (end < 0 || !meta) continue;
            Map<String, String> attributes = attributes(html.substring(start + 5, end));
            String key = attributes.containsKey("property") ? attributes.get("property") : attributes.get("name");
            if (key != null) key = key.trim().toLowerCase(Locale.ROOT);
            String content = attributes.get("content");
            // A page may name several images: the first of each kind is the main one.
            if (key != null && content != null && !content.trim().isEmpty() && !found.containsKey(key)) {
                found.put(key, content);
            }
        }
        for (String tag : IMAGE_TAGS) {
            String image = absolute(unescape(found.get(tag)), pageUrl);
            if (image != null) return image;
        }
        return null;
    }

    /** The URL resolved against the page's, with http made https, or null unless that is an https URL with a host. */
    static String absolute(String url, String pageUrl) {
        if (url == null) return null;
        URI base = uri(pageUrl);
        URI resolved = uri(url.trim());
        if (base == null || resolved == null) return null;
        try {
            resolved = base.resolve(resolved);
        } catch (IllegalArgumentException error) {
            return null;
        }
        String scheme = resolved.getScheme() == null ? "" : resolved.getScheme().toLowerCase(Locale.ROOT);
        if (!hasPlainHost(resolved)) return null;
        String rest = resolved.toString().substring(scheme.length());
        // Browsers load an http image on an https page over https too.
        if (scheme.equals("http") || scheme.equals("https")) return "https" + rest;
        return null;
    }

    /** The text with HTML character references replaced by the characters they stand for. */
    static String unescape(String text) {
        if (text == null || text.indexOf('&') < 0) return text;
        Matcher entity = ENTITY.matcher(text);
        StringBuffer out = new StringBuffer();
        while (entity.find()) {
            String name = entity.group(1);
            String replacement;
            if (name.charAt(0) == '#') {
                boolean hex = name.length() > 1 && (name.charAt(1) == 'x' || name.charAt(1) == 'X');
                int code = Integer.parseInt(name.substring(hex ? 2 : 1), hex ? 16 : 10);
                replacement = Character.isValidCodePoint(code) ? new String(Character.toChars(code)) : entity.group();
            } else {
                replacement = NAMED.get(name.toLowerCase(Locale.ROOT));
                if (replacement == null) replacement = entity.group();
            }
            entity.appendReplacement(out, Matcher.quoteReplacement(replacement));
        }
        entity.appendTail(out);
        return out.toString();
    }

    /**
     * Reads the page up to its {@code </head>}, at most {@link #MAX_HEAD_BYTES}, and gives up once the deadline passes.
     */
    static byte[] readHead(InputStream in, int maxBytes, long deadlineMs) throws IOException {
        byte[] head = new byte[maxBytes];
        int size = 0;
        while (size < maxBytes) {
            if (System.currentTimeMillis() > deadlineMs) throw new ImageServer.Answer("The page took too long to load");
            int read = in.read(head, size, maxBytes - size);
            if (read == -1) break;
            int from = Math.max(0, size - 6);
            size += read;
            if (indexOfHeadEnd(head, from, size) >= 0) break;
        }
        return Arrays.copyOf(head, size);
    }

    private static int indexOfHeadEnd(byte[] bytes, int from, int size) {
        byte[] end = {'<', '/', 'h', 'e', 'a', 'd'};
        outer:
        for (int i = from; i <= size - end.length; i++) {
            for (int j = 0; j < end.length; j++) {
                int b = bytes[i + j];
                if (b >= 'A' && b <= 'Z') b += 'a' - 'A';
                if (b != end[j]) continue outer;
            }
            return i;
        }
        return -1;
    }

    /**
     * Whether the address is outside the ranges kept for the phone itself, local networks and carriers: loopback,
     * private, link-local, CGNAT, unique local, multicast and reserved. A device with a global IPv6 address looks
     * public, even on the phone's own network; https and certificate checks keep a preview from sending it a request.
     */
    static boolean isPublic(InetAddress address) {
        if (address == null || address.isAnyLocalAddress() || address.isLoopbackAddress() || address.isLinkLocalAddress()
                || address.isSiteLocalAddress() || address.isMulticastAddress()) {
            return false;
        }
        byte[] bytes = address.getAddress();
        if (address instanceof Inet4Address) return isPublicIpv4(bytes, 0);
        if (!(address instanceof Inet6Address) || bytes.length != 16) return false;
        int first = bytes[0] & 0xff;
        // Unique local fc00::/7.
        if ((first & 0xfe) == 0xfc) return false;
        // IPv4-compatible ::a.b.c.d and IPv4-mapped ::ffff:a.b.c.d (Java turns most of these into Inet4Address).
        if (allZero(bytes, 0, 10) && ((bytes[10] == 0 && bytes[11] == 0) || (bytes[10] == (byte) 0xff && bytes[11] == (byte) 0xff))) {
            return isPublicIpv4(bytes, 12);
        }
        // NAT64 64:ff9b::/96 and 6to4 2002::/16 lead to the IPv4 address they hold.
        if (bytes[0] == 0 && bytes[1] == 0x64 && bytes[2] == (byte) 0xff && bytes[3] == (byte) 0x9b) {
            if (allZero(bytes, 4, 12)) return isPublicIpv4(bytes, 12);
            // Local-use NAT64 64:ff9b:1::/48 translates to a network's own addresses.
            if (bytes[4] == 0 && bytes[5] == 1) return false;
        }
        if (bytes[0] == 0x20 && bytes[1] == 0x02) return isPublicIpv4(bytes, 2);
        return true;
    }

    /**
     * Refuses a host before anything connects to it: Sync's, which previews never contact, and an address that isn't
     * public. `host` is canonical, as OkHttp gives it. OkHttp takes any host of digits and dots as an address and never
     * looks it up, so one that isn't a plain dotted quad is refused; it looks a name up, and {@link ImageServer} checks
     * what its DNS answers.
     */
    static void checkHost(String host) throws IOException {
        if (host == null || host.isEmpty()) throw new ImageServer.Answer("No host");
        if (onDomain(host, "syncforreddit.com")) throw new ImageServer.Answer("Sync's server: " + host);
        InetAddress address;
        if (DIGITS_AND_DOTS.matcher(host).matches()) {
            address = ipv4(host);
            if (address == null) throw new ImageServer.Answer("Not a plain address: " + host);
        } else if (host.indexOf(':') >= 0) {
            try {
                // A literal: Java never looks up a host with a ':'.
                address = InetAddress.getByName(host);
            } catch (IOException error) {
                throw new ImageServer.Answer("Not an address: " + host, error);
            }
        } else {
            return;
        }
        if (!isPublic(address)) throw new ImageServer.Answer("Not a public address: " + host);
    }

    /** The dotted quad as an address, or null unless it is one: four numbers up to 255. */
    private static InetAddress ipv4(String host) {
        String[] parts = host.split("\\.", -1);
        if (parts.length != 4) return null;
        byte[] bytes = new byte[4];
        for (int i = 0; i < 4; i++) {
            // A leading zero may make it octal (012 is 10) to the system's parser.
            if (parts[i].isEmpty() || parts[i].length() > 3 || (parts[i].length() > 1 && parts[i].charAt(0) == '0')) return null;
            int part = Integer.parseInt(parts[i]);
            if (part > 255) return null;
            bytes[i] = (byte) part;
        }
        try {
            return InetAddress.getByAddress(bytes);
        } catch (IOException error) {
            return null;
        }
    }

    /** Whether the host is the domain or under it, ignoring case and a trailing dot. */
    static boolean onDomain(String host, String domain) {
        if (host == null) return false;
        String name = host.toLowerCase(Locale.ROOT);
        if (name.endsWith(".")) name = name.substring(0, name.length() - 1);
        return name.equals(domain) || name.endsWith("." + domain);
    }

    /** Whether every address a name has is public: OkHttp may connect to any of them. */
    static boolean allPublic(List<InetAddress> addresses) {
        for (InetAddress address : addresses) {
            if (!isPublic(address)) return false;
        }
        return true;
    }

    private static boolean isPublicIpv4(byte[] bytes, int at) {
        int a = bytes[at] & 0xff;
        int b = bytes[at + 1] & 0xff;
        int c = bytes[at + 2] & 0xff;
        return !(a == 0 || a == 10 || a == 127 || a >= 224 // this network, private, loopback, multicast and reserved
                || (a == 100 && b >= 64 && b <= 127) // CGNAT
                || (a == 169 && b == 254) // link-local
                || (a == 172 && b >= 16 && b <= 31) // private
                || (a == 192 && b == 168) // private
                || (a == 192 && b == 0 && c == 0) // IETF protocol assignments
                || (a == 198 && (b == 18 || b == 19))); // benchmarking
    }

    private static boolean allZero(byte[] bytes, int from, int to) {
        for (int i = from; i < to; i++) {
            if (bytes[i] != 0) return false;
        }
        return true;
    }

    /** A host and no user info. URI gives no host for some it can't parse as one (an underscore): the authority holds it. */
    private static boolean hasPlainHost(URI uri) {
        String authority = uri.getRawAuthority();
        return authority != null && !authority.isEmpty() && authority.indexOf('@') < 0;
    }

    /** The host in the URI's authority, without user info or port, or null. */
    private static String hostOf(URI uri) {
        if (uri == null || uri.getRawAuthority() == null) return null;
        String host = uri.getRawAuthority();
        host = host.substring(host.lastIndexOf('@') + 1);
        int port = host.lastIndexOf(':');
        return port > host.lastIndexOf(']') ? host.substring(0, port) : host;
    }

    /**
     * The link as a URI, with what URI refuses and OkHttp and browsers allow escaped: a space, '|', a '[' outside the
     * host, a '%' that starts no escape, a second '#'.
     */
    private static URI uri(String link) {
        if (link == null) return null;
        byte[] bytes = link.getBytes(StandardCharsets.UTF_8);
        // Where the host starts: "https://host", or "//host" relative to the page's scheme. The scheme is ASCII, so a
        // character's index is its byte's.
        int authority = -1;
        Matcher scheme = SCHEME.matcher(link);
        if (link.startsWith("//")) {
            authority = 2;
        } else if (scheme.lookingAt()) {
            authority = scheme.end();
        }
        int authorityEnd = bytes.length;
        if (authority >= 0) {
            for (int i = authority; i < bytes.length; i++) {
                if (bytes[i] == '/' || bytes[i] == '?' || bytes[i] == '#') {
                    authorityEnd = i;
                    break;
                }
            }
        }
        StringBuilder escaped = new StringBuilder(bytes.length);
        boolean fragment = false;
        for (int i = 0; i < bytes.length; i++) {
            int c = bytes[i] & 0xff;
            boolean inHost = authority >= 0 && i >= authority && i < authorityEnd;
            boolean escape = c <= 0x20 || c >= 0x7f || "\"<>\\^`{|}".indexOf(c) >= 0
                    || ((c == '[' || c == ']') && !inHost)
                    || (c == '%' && !(i + 2 < bytes.length && isHex(bytes[i + 1]) && isHex(bytes[i + 2])))
                    || (c == '#' && fragment);
            if (c == '#') fragment = true;
            if (escape) {
                escaped.append('%').append(Character.toUpperCase(Character.forDigit(c >> 4, 16)))
                        .append(Character.toUpperCase(Character.forDigit(c & 0xf, 16)));
            } else {
                escaped.append((char) c);
            }
        }
        try {
            return new URI(escaped.toString());
        } catch (Exception error) {
            return null;
        }
    }

    private static boolean isHex(byte b) {
        return Character.digit(b, 16) >= 0;
    }
}
