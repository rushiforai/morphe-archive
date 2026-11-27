package dev.jkcarino.extension.reddit.frontpage;

import java.util.Locale;

public final class ExtensionStrUtils {
    private ExtensionStrUtils() {}

    public static boolean isBlank(String s) {
        if (s == null) return true;
        int len = s.length();
        for (int i = 0; i < len; i++) {
            char c = s.charAt(i);
            if (!Character.isWhitespace(c) && c != '\u00A0' && c != '\u2007' && c != '\u202F') {
                return false;
            }
        }
        return true;
    }

    public static String trim(String s) {
        if (s == null) return "";
        int start = 0;
        int end = s.length();
        while (start < end) {
            char c = s.charAt(start);
            if (Character.isWhitespace(c) || c == '\u00A0' || c == '\u2007' || c == '\u202F') {
                start++;
            } else {
                break;
            }
        }
        while (end > start) {
            char c = s.charAt(end - 1);
            if (Character.isWhitespace(c) || c == '\u00A0' || c == '\u2007' || c == '\u202F') {
                end--;
            } else {
                break;
            }
        }
        return s.substring(start, end);
    }

    public static String lower(String s) {
        return s == null ? "" : s.toLowerCase(Locale.ROOT);
    }

    public static boolean contains(String s, String needle) {
        return s != null && needle != null && s.contains(needle);
    }

    public static boolean containsIgnoreCase(String s, String needle) {
        if (s == null || needle == null) return false;
        return s.toLowerCase(Locale.ROOT).contains(needle.toLowerCase(Locale.ROOT));
    }

    public static boolean endsWith(String s, String suffix) {
        return s != null && suffix != null && s.endsWith(suffix);
    }

    public static boolean startsWith(String s, String prefix) {
        return s != null && prefix != null && s.startsWith(prefix);
    }

    public static String replace(String s, String target, String replacement) {
        if (s == null) return "";
        if (target == null || replacement == null || target.isEmpty()) return s;
        return s.replace(target, replacement);
    }

    public static int lastIndexOf(String s, char ch) {
        return s == null ? -1 : s.lastIndexOf(ch);
    }

    public static String unescapeAmp(String s) {
        if (s == null) return "";
        String cur = s;
        String prev;
        do {
            prev = cur;
            cur = cur.replace("&amp;", "&");
        } while (!cur.equals(prev));
        return cur;
    }

    /**
     * Produces a canonical deduplication key for a media URL without depending on android.net.Uri.
     * - Unescapes &amp; and trims whitespace
     * - Lowercases host only; maps preview.redd.it and i.redd.it into a shared host space
     * - Keeps the full path case-sensitive (so v.redd.it/A/DASH_720.mp4 != v.redd.it/B/DASH_720.mp4)
     * - Drops query parameters except format= (lowercased)
     */
    public static String canonicalMediaKey(String rawUrl) {
        if (rawUrl == null) return "";
        String url = trim(unescapeAmp(rawUrl));
        if (url.isEmpty()) return "";
        try {
            java.net.URI uri = new java.net.URI(url);
            String hostRaw = uri.getHost();
            if (hostRaw == null || hostRaw.isEmpty()) {
                return url;
            }
            String host = hostRaw.toLowerCase(Locale.ROOT);
            if ("preview.redd.it".equals(host) || "i.redd.it".equals(host)) {
                host = "redd.it-img";
            }
            String path = uri.getRawPath();
            if (path == null) path = "";
            String formatParam = extractQueryParam(uri.getRawQuery(), "format");
            if (formatParam != null && !formatParam.isEmpty()) {
                String fmt = formatParam.toLowerCase(Locale.ROOT);
                if ("pjpg".equals(fmt) || "jpeg".equals(fmt)) fmt = "jpg";
                if ("png8".equals(fmt)) fmt = "png";
                return host + path + "?format=" + fmt;
            }
            return host + path;
        } catch (Throwable ignored) {
            // Fallback manual parse for URLs with unencoded characters
            int schemeIdx = url.indexOf("://");
            if (schemeIdx < 0) return url;
            int hostStart = schemeIdx + 3;
            int pathStart = url.indexOf('/', hostStart);
            int queryStart = url.indexOf('?', hostStart);
            int fragStart = url.indexOf('#', hostStart);
            int endOfUrl = fragStart >= 0 ? fragStart : url.length();
            int hostEnd = endOfUrl;
            if (pathStart >= 0 && pathStart < hostEnd) hostEnd = pathStart;
            if (queryStart >= 0 && queryStart < hostEnd) hostEnd = queryStart;
            String host = url.substring(hostStart, hostEnd).toLowerCase(Locale.ROOT);
            if ("preview.redd.it".equals(host) || "i.redd.it".equals(host)) {
                host = "redd.it-img";
            }
            String path = "";
            if (pathStart >= 0 && pathStart < endOfUrl) {
                int pathEnd = (queryStart >= 0 && queryStart < endOfUrl) ? queryStart : endOfUrl;
                path = url.substring(pathStart, pathEnd);
            }
            String query = (queryStart >= 0 && queryStart + 1 < endOfUrl)
                ? url.substring(queryStart + 1, endOfUrl)
                : null;
            String formatParam = extractQueryParam(query, "format");
            if (formatParam != null && !formatParam.isEmpty()) {
                String fmt = formatParam.toLowerCase(Locale.ROOT);
                if ("pjpg".equals(fmt) || "jpeg".equals(fmt)) fmt = "jpg";
                if ("png8".equals(fmt)) fmt = "png";
                return host + path + "?format=" + fmt;
            }
            return host + path;
        }
    }

    private static String extractQueryParam(String query, String key) {
        if (query == null || query.isEmpty()) return null;
        int start = 0;
        int len = query.length();
        while (start < len) {
            int amp = query.indexOf('&', start);
            int end = amp < 0 ? len : amp;
            int eq = query.indexOf('=', start);
            if (eq > start && eq < end) {
                String k = query.substring(start, eq);
                if (k.equals(key)) {
                    return query.substring(eq + 1, end);
                }
            }
            start = end + 1;
        }
        return null;
    }

    private static String trimEdgePunctuation(String s) {
        int start = 0;
        int end = s.length();
        while (start < end) {
            char c = s.charAt(start);
            if (c == '_' || c == '.' || c == '-' || c == ' ') start++;
            else break;
        }
        while (end > start) {
            char c = s.charAt(end - 1);
            if (c == '_' || c == '.' || c == '-' || c == ' ') end--;
            else break;
        }
        return s.substring(start, end);
    }

    /**
     * Sanitizes a post title for use as a filename while preserving Unicode letters and digits.
     * Strips only filesystem-illegal characters and control characters, truncates by code points.
     */
    public static String sanitizeFileName(String raw) {
        try {
            if (isBlank(raw)) return "reddit_media";
            StringBuilder sb = new StringBuilder();
            int len = raw.length();
            boolean prevUnderscore = false;
            int codePointCount = 0;
            int i = 0;
            while (i < len && codePointCount < 60) {
                int cp = raw.codePointAt(i);
                int charCount = Character.charCount(cp);
                i += charCount;

                boolean illegal = cp < 0x20 || cp == 0x7F ||
                    cp == '/' || cp == '\\' || cp == ':' || cp == '*' ||
                    cp == '?' || cp == '"' || cp == '<' || cp == '>' || cp == '|';
                boolean whitespace = Character.isWhitespace(cp) || cp == 0x00A0 || cp == 0x2007 || cp == 0x202F;

                if (illegal || whitespace) {
                    if (!prevUnderscore && sb.length() > 0) {
                        sb.append('_');
                        prevUnderscore = true;
                        codePointCount++;
                    }
                } else if (Character.isLetterOrDigit(cp) || cp == '.' || cp == '_' || cp == '-') {
                    if (cp == '_') {
                        if (!prevUnderscore && sb.length() > 0) {
                            sb.append('_');
                            prevUnderscore = true;
                            codePointCount++;
                        }
                    } else {
                        sb.appendCodePoint(cp);
                        prevUnderscore = false;
                        codePointCount++;
                    }
                } else {
                    if (!prevUnderscore && sb.length() > 0) {
                        sb.append('_');
                        prevUnderscore = true;
                        codePointCount++;
                    }
                }
            }
            String cleaned = trimEdgePunctuation(sb.toString());
            if (cleaned.isEmpty()) return "reddit_media";
            if (!Character.isLetterOrDigit(cleaned.codePointAt(0))) {
                cleaned = "r_" + cleaned;
            }
            return cleaned;
        } catch (Throwable ignored) {
            return "reddit_media";
        }
    }
}
