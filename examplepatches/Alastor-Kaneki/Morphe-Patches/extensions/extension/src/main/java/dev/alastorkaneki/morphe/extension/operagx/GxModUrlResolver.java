package dev.alastorkaneki.morphe.extension.operagx;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Pure-Java URL extraction logic, kept separate so it can be tested without Android. */
public final class GxModUrlResolver {
    private static final String CDN_HOST_PATTERN =
            "(?:mods\\.store\\.gx\\.me|play\\.gxc\\.gg|play\\.gx\\.games)";

    private static final Pattern STORE_PAGE_PATTERN = Pattern.compile(
            "(?:https?://)?(?:www\\.)?store\\.gx\\.me/" +
                    "(?:[a-z]{2}(?:-[a-z]{2})?/)?mods/" +
                    "[a-z0-9]+/[a-z0-9-]+/?(?:[?#][^\\s<>]*)?",
            Pattern.CASE_INSENSITIVE
    );

    private static final Pattern DIRECT_CRX_PATTERN = Pattern.compile(
            "(?:https?:)?//" + CDN_HOST_PATTERN +
                    "/mods/[^\\s\\\"'<>]+?/mod\\.crx(?:\\?[^\\s\\\"'<>]*)?",
            Pattern.CASE_INSENSITIVE
    );

    private static final Pattern CONTENT_ASSET_PATTERN = Pattern.compile(
            "(?:https?:)?//" + CDN_HOST_PATTERN +
                    "/mods/[^\\s\\\"'<>]+?/contents/[^\\s\\\"'<>]+",
            Pattern.CASE_INSENSITIVE
    );

    private GxModUrlResolver() {
    }

    public static String extractStorePageUrl(String sharedText) {
        if (sharedText == null) {
            return null;
        }
        Matcher matcher = STORE_PAGE_PATTERN.matcher(normalizeEscapes(sharedText.trim()));
        if (!matcher.find()) {
            return null;
        }

        String value = trimTrailingPunctuation(matcher.group());
        if (!value.regionMatches(true, 0, "http://", 0, 7) &&
                !value.regionMatches(true, 0, "https://", 0, 8)) {
            value = "https://" + value;
        }
        return value;
    }

    public static String resolveCrxUrlFromHtml(String html) {
        if (html == null || html.isEmpty()) {
            return null;
        }

        String normalized = normalizeEscapes(html);

        Matcher direct = DIRECT_CRX_PATTERN.matcher(normalized);
        if (direct.find()) {
            String candidate = withHttps(direct.group());
            return isAllowedCrxUrl(candidate) ? candidate : null;
        }

        // GX Store page data includes preview/content asset URLs from the same
        // version directory as mod.crx. Replacing /contents/... with /mod.crx
        // mirrors the store's own package layout.
        Matcher contentAsset = CONTENT_ASSET_PATTERN.matcher(normalized);
        if (contentAsset.find()) {
            String assetUrl = withHttps(contentAsset.group());
            int contentsIndex = assetUrl.toLowerCase(Locale.ROOT).indexOf("/contents/");
            if (contentsIndex >= 0) {
                String candidate = assetUrl.substring(0, contentsIndex) + "/mod.crx";
                return isAllowedCrxUrl(candidate) ? candidate : null;
            }
        }

        return null;
    }

    public static boolean isAllowedCrxUrl(String candidate) {
        if (candidate == null) {
            return false;
        }
        try {
            URI uri = new URI(candidate);
            String scheme = uri.getScheme();
            String host = uri.getHost();
            String path = uri.getPath();
            if (!"https".equalsIgnoreCase(scheme) || host == null || path == null) {
                return false;
            }

            String normalizedHost = host.toLowerCase(Locale.ROOT);
            boolean allowedHost = normalizedHost.equals("mods.store.gx.me")
                    || normalizedHost.equals("play.gxc.gg")
                    || normalizedHost.equals("play.gx.games");
            return allowedHost && path.toLowerCase(Locale.ROOT).endsWith("/mod.crx");
        } catch (URISyntaxException ignored) {
            return false;
        }
    }

    public static String slugFromStoreUrl(String storeUrl) {
        String normalizedStoreUrl = extractStorePageUrl(storeUrl);
        if (normalizedStoreUrl == null) {
            return "gx-mod";
        }

        String clean = normalizedStoreUrl;
        int query = clean.indexOf('?');
        if (query >= 0) {
            clean = clean.substring(0, query);
        }
        int fragment = clean.indexOf('#');
        if (fragment >= 0) {
            clean = clean.substring(0, fragment);
        }

        String[] parts = clean.split("/");
        for (int i = parts.length - 1; i >= 0; i--) {
            if (!parts[i].isEmpty()) {
                return sanitizeFilePart(parts[i]);
            }
        }
        return "gx-mod";
    }

    private static String normalizeEscapes(String text) {
        return text
                .replace("\\u002F", "/")
                .replace("\\u002f", "/")
                .replace("\\u003A", ":")
                .replace("\\u003a", ":")
                .replace("\\u0026", "&")
                .replace("\\/", "/")
                .replace("&amp;", "&");
    }

    private static String withHttps(String url) {
        return url.startsWith("//") ? "https:" + url : url;
    }

    private static String trimTrailingPunctuation(String value) {
        int end = value.length();
        while (end > 0) {
            char c = value.charAt(end - 1);
            if (c == '.' || c == ',' || c == ')' || c == ']' || c == '}' ||
                    c == '"' || c == '\'') {
                end--;
            } else {
                break;
            }
        }
        return value.substring(0, end);
    }

    private static String sanitizeFilePart(String value) {
        String sanitized = value.toLowerCase(Locale.ROOT)
                .replaceAll("[^a-z0-9._-]+", "-")
                .replaceAll("^-+|-+$", "");
        return sanitized.isEmpty() ? "gx-mod" : sanitized;
    }
}
