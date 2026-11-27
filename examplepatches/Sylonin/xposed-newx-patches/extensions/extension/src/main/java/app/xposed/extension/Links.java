package app.xposed.extension;

import java.net.IDN;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * Domain and exact-URL rules, after X-Posed's domain-utils.js. A bare host such as
 * "example.com" covers the site and its subdomains; anything with a scheme, path, query or
 * fragment is an exact destination. Only complete http(s) links are accepted, and t.co
 * wrappers never count as evidence because their destination is unknown.
 */
final class Links {
    static final int MAX_INPUT = 4096;
    private static final int MAX_HOST = 253;
    private static final int MAX_TOKENS = 64;
    private static final int MAX_PER_SOURCE = 12;
    private static final String SHORTENER = "t.co";

    /** A parsed link: lowercase ASCII host without a trailing dot, and the normalized URL. */
    private static final class Parsed {
        final String host, url;

        Parsed(String host, String url) {
            this.host = host;
            this.url = url;
        }
    }

    private Links() {
    }

    /** The rule for user input: an exact URL, a domain, or "" when it is neither. */
    static String normalizeRule(String input) {
        if (input == null) return "";
        String value = input.trim();
        return hasScheme(value) || value.indexOf('/') >= 0 || value.indexOf('?') >= 0 || value.indexOf('#') >= 0
                ? normalizeExactUrl(value)
                : normalizeDomain(value);
    }

    static boolean isExact(String rule) {
        return rule.startsWith("https://") || rule.startsWith("http://");
    }

    /** The site of a link without a leading "www.", or "". */
    static String normalizeDomain(String input) {
        Parsed parsed = parse(input);
        return parsed == null ? "" : site(parsed.host);
    }

    /** Repeated "www." prefixes stay, so normalizing twice never broadens a rule. */
    private static String site(String host) {
        if (host.startsWith("www.") && !host.startsWith("www.www.") && host.indexOf('.', 4) >= 0) host = host.substring(4);
        return host.indexOf('.') >= 0 ? host : "";
    }

    /** The complete destination, keeping scheme, www, path case, query and fragment, or "". */
    static String normalizeExactUrl(String input) {
        Parsed parsed = parse(input);
        return parsed == null || parsed.url.length() > MAX_INPUT ? "" : parsed.url;
    }

    /** The first rule that covers a link, or null. Domain rules match parent domains through set lookups. */
    static String match(String link, Set<String> domains, Set<String> urls) {
        Parsed parsed = parse(link);
        if (parsed == null || parsed.host.equals(SHORTENER)) return null;
        if (!urls.isEmpty() && urls.contains(parsed.url)) return parsed.url;
        if (domains.isEmpty()) return null;
        String candidate = site(parsed.host);
        while (candidate.indexOf('.') >= 0) {
            if (domains.contains(candidate)) return candidate;
            candidate = candidate.substring(candidate.indexOf('.') + 1);
        }
        return null;
    }

    /**
     * Links written into free text such as the profile location. Every whitespace separated
     * token must be a complete link on its own; links inside paths or e-mail addresses are
     * never inspected.
     */
    static List<String> inText(String text) {
        List<String> links = new ArrayList<>();
        if (text == null || text.isEmpty() || text.length() > MAX_INPUT) return links;
        String[] tokens = text.trim().split("\\s+", MAX_TOKENS + 1);
        for (int i = 0; i < tokens.length && i < MAX_TOKENS && links.size() < MAX_PER_SOURCE; i++) {
            String token = tokens[i];
            if (hasScheme(token) || token.indexOf('/') >= 0) {
                if (!normalizeExactUrl(token).isEmpty()) links.add(token);
                continue;
            }
            String bare = stripPunctuation(token);
            if (!normalizeDomain(bare).isEmpty()) links.add(bare);
        }
        return links;
    }

    private static String stripPunctuation(String token) {
        int start = 0, end = token.length();
        while (start < end && "([<\"'".indexOf(token.charAt(start)) >= 0) start++;
        while (end > start && ")]>\"',;!".indexOf(token.charAt(end - 1)) >= 0) end--;
        return token.substring(start, end);
    }

    private static boolean hasScheme(String value) {
        return value.regionMatches(true, 0, "http://", 0, 7) || value.regionMatches(true, 0, "https://", 0, 8);
    }

    private static Parsed parse(String input) {
        if (input == null || input.length() > MAX_INPUT) return null;
        String value = input.trim();
        if (value.isEmpty()) return null;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (Character.isWhitespace(c) || Character.isISOControl(c) || c == '\\') return null;
        }

        String scheme, rest;
        if (value.regionMatches(true, 0, "http://", 0, 7)) {
            scheme = "http";
            rest = value.substring(7);
        } else if (value.regionMatches(true, 0, "https://", 0, 8)) {
            scheme = "https";
            rest = value.substring(8);
        } else {
            // A scheme-less link must start with a plain host: no other scheme, port, credentials or escapes.
            String authority = value.substring(0, authorityEnd(value));
            if (authority.isEmpty() || authority.indexOf(':') >= 0 || authority.indexOf('@') >= 0
                    || authority.indexOf('%') >= 0) return null;
            scheme = "https";
            rest = value;
        }

        int end = authorityEnd(rest);
        String authority = rest.substring(0, end);
        String tail = rest.substring(end);
        if (authority.isEmpty() || authority.indexOf('@') >= 0) return null;

        String host = authority;
        int port = -1;
        int colon = authority.lastIndexOf(':');
        if (colon >= 0) {
            host = authority.substring(0, colon);
            String digits = authority.substring(colon + 1);
            if (!digits.isEmpty()) {
                if (digits.length() > 5) return null;
                for (int i = 0; i < digits.length(); i++) {
                    if (digits.charAt(i) < '0' || digits.charAt(i) > '9') return null;
                }
                port = Integer.parseInt(digits);
                if (port > 65535) return null;
            }
        }
        if (port == (scheme.equals("https") ? 443 : 80)) port = -1;

        try {
            host = IDN.toASCII(host, IDN.ALLOW_UNASSIGNED).toLowerCase(Locale.ROOT);
        } catch (IllegalArgumentException e) {
            return null;
        }
        if (host.endsWith(".")) host = host.substring(0, host.length() - 1);
        if (!isValidHost(host)) return null;

        StringBuilder url = new StringBuilder(scheme.length() + host.length() + tail.length() + 10)
                .append(scheme).append("://").append(host);
        if (port >= 0) url.append(':').append(port);
        if (!tail.startsWith("/")) url.append('/');
        appendEncoded(url, tail);
        return new Parsed(host, url.toString());
    }

    private static int authorityEnd(String s) {
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '/' || c == '?' || c == '#') return i;
        }
        return s.length();
    }

    /** At least two labels, not all numeric, each 1 to 63 letters, digits or inner hyphens. */
    private static boolean isValidHost(String host) {
        if (host.isEmpty() || host.length() > MAX_HOST) return false;
        String[] labels = host.split("\\.", -1);
        if (labels.length < 2) return false;
        boolean numeric = true;
        for (String label : labels) {
            if (label.isEmpty() || label.length() > 63) return false;
            if (label.charAt(0) == '-' || label.charAt(label.length() - 1) == '-') return false;
            for (int i = 0; i < label.length(); i++) {
                char c = label.charAt(i);
                if (c >= 'a' && c <= 'z' || c == '-') {
                    numeric = false;
                } else if (c < '0' || c > '9') {
                    return false;
                }
            }
        }
        return !numeric;
    }

    /** Percent-encodes non-ASCII characters as UTF-8, as browsers do, so typed and observed links agree. */
    private static void appendEncoded(StringBuilder out, String tail) {
        for (int i = 0; i < tail.length(); ) {
            int cp = tail.codePointAt(i);
            int n = Character.charCount(cp);
            if (cp < 0x80) {
                out.append((char) cp);
            } else {
                for (byte b : new String(Character.toChars(cp)).getBytes(StandardCharsets.UTF_8)) {
                    out.append('%').append(Character.toUpperCase(Character.forDigit((b >> 4) & 0xF, 16)))
                            .append(Character.toUpperCase(Character.forDigit(b & 0xF, 16)));
                }
            }
            i += n;
        }
    }
}
