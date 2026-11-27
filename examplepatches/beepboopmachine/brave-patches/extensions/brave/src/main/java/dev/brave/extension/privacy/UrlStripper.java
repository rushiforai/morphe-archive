package dev.brave.extension.privacy;

import java.io.ByteArrayOutputStream;
import java.lang.reflect.Field;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UrlStripper {
    private static final Set<String> TRACKING_EXACT = new HashSet<>(Arrays.asList(
        "gclid", "gbraid", "wbraid", "fbclid", "msclkid", "twclid", "dclid",
        "igshid", "mc_eid", "vero_id", "_openstat"
    ));

    private static final Pattern URL_PATTERN = Pattern.compile("(?i)https?://[^\\s]+");

    /**
     * Sanitizes a URL or a text string containing a URL by stripping known tracking parameters.
     */
    public static String sanitize(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }

        String trimmed = input.trim();
        String lowerTrimmed = trimmed.toLowerCase(Locale.ROOT);
        boolean isDirectUrl = (lowerTrimmed.startsWith("http://") || lowerTrimmed.startsWith("https://"))
                && !containsWhitespace(trimmed);

        if (isDirectUrl) {
            return sanitizeSingleUrl(trimmed);
        }

        Matcher matcher = URL_PATTERN.matcher(input);
        if (matcher.find()) {
            StringBuffer sb = new StringBuffer();
            do {
                String matchedUrl = matcher.group();
                String sanitizedUrl = sanitizeSingleUrl(matchedUrl);
                matcher.appendReplacement(sb, Matcher.quoteReplacement(sanitizedUrl));
            } while (matcher.find());
            matcher.appendTail(sb);
            return sb.toString();
        }

        return input;
    }

    private static boolean containsWhitespace(String s) {
        for (int i = 0; i < s.length(); i++) {
            if (Character.isWhitespace(s.charAt(i))) return true;
        }
        return false;
    }

    private static String sanitizeSingleUrl(String url) {
        try {
            int hashIdx = url.indexOf('#');
            String fragment = "";
            String urlBeforeHash = url;
            if (hashIdx >= 0) {
                fragment = url.substring(hashIdx);
                urlBeforeHash = url.substring(0, hashIdx);
            }

            int queryIdx = urlBeforeHash.indexOf('?');
            if (queryIdx < 0) {
                return url;
            }

            String base = urlBeforeHash.substring(0, queryIdx);
            String queryString = urlBeforeHash.substring(queryIdx + 1);
            if (queryString.isEmpty()) {
                return base + fragment;
            }

            boolean isMediaHost = isSiStrippableMediaHost(base);

            String[] pairs = queryString.split("&");
            StringBuilder newQuery = new StringBuilder();
            for (String pair : pairs) {
                if (pair.isEmpty()) continue;
                int eqIdx = pair.indexOf('=');
                String rawKey = eqIdx >= 0 ? pair.substring(0, eqIdx) : pair;
                String decodedKey = decodePercentOnce(rawKey);
                if (isTrackingParam(decodedKey, isMediaHost)) {
                    continue;
                }
                if (newQuery.length() > 0) {
                    newQuery.append('&');
                }
                newQuery.append(pair);
            }

            if (newQuery.length() > 0) {
                return base + "?" + newQuery.toString() + fragment;
            } else {
                return base + fragment;
            }
        } catch (Throwable t) {
            return url;
        }
    }

    private static boolean isSiStrippableMediaHost(String baseUrl) {
        try {
            URI uri = URI.create(baseUrl);
            String host = uri.getHost();
            if (host == null || host.isEmpty()) return false;
            String h = host.toLowerCase(Locale.ROOT);
            while (h.endsWith(".")) {
                h = h.substring(0, h.length() - 1);
            }
            return "youtube.com".equals(h) || h.endsWith(".youtube.com")
                    || "youtu.be".equals(h) || h.endsWith(".youtu.be")
                    || "spotify.com".equals(h) || h.endsWith(".spotify.com");
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Decodes percent-encoded octets (%XX) and '+' once without failing on malformed escapes.
     */
    private static String decodePercentOnce(String raw) {
        if (raw == null || raw.isEmpty() || (raw.indexOf('%') < 0 && raw.indexOf('+') < 0)) {
            return raw;
        }
        ByteArrayOutputStream out = new ByteArrayOutputStream(raw.length());
        int len = raw.length();
        for (int i = 0; i < len; i++) {
            char c = raw.charAt(i);
            if (c == '+') {
                out.write(' ');
            } else if (c == '%' && i + 2 < len) {
                int hi = Character.digit(raw.charAt(i + 1), 16);
                int lo = Character.digit(raw.charAt(i + 2), 16);
                if (hi >= 0 && lo >= 0) {
                    out.write((hi << 4) | lo);
                    i += 2;
                } else {
                    out.write('%');
                }
            } else if (c < 0x80) {
                out.write(c);
            } else {
                byte[] utf8 = String.valueOf(c).getBytes(StandardCharsets.UTF_8);
                out.write(utf8, 0, utf8.length);
            }
        }
        return new String(out.toByteArray(), StandardCharsets.UTF_8);
    }

    private static boolean isTrackingParam(String key, boolean isMediaHost) {
        if (key == null) return false;
        String lower = key.trim().toLowerCase(Locale.ROOT);
        if (lower.startsWith("utm_")) {
            return true;
        }
        if (TRACKING_EXACT.contains(lower)) {
            return true;
        }
        // Scope "si" parameter strictly to verified YouTube / Spotify hostnames
        if ("si".equals(lower) && isMediaHost) {
            return true;
        }
        return false;
    }

    /**
     * Safely reads and sanitizes the URL field ('d') on ShareParams (bih) instance.
     */
    public static void sanitizeShareObject(Object shareParams) {
        if (shareParams == null) return;
        try {
            Field[] fields = shareParams.getClass().getDeclaredFields();
            for (Field f : fields) {
                if ("d".equals(f.getName()) && f.getType() == String.class) {
                    f.setAccessible(true);
                    String currentUrl = (String) f.get(shareParams);
                    if (currentUrl != null) {
                        f.set(shareParams, sanitize(currentUrl));
                    }
                    return;
                }
            }
        } catch (Throwable ignored) {}
    }
}
