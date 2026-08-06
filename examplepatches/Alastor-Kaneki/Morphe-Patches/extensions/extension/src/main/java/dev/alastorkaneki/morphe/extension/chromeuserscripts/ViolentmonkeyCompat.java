package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import java.net.URI;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Small Android adaptation of Violentmonkey's MIT-licensed userscript detection and installer
 * rules. Source basis: violentmonkey/violentmonkey commit
 * f356136259d8c3a2c0125d2b5595f17ffed15a54, especially script.js and tab-redirector.js.
 *
 * Violentmonkey's WebExtension runtime cannot run inside stock Chrome Android, so this class only
 * ports the portable parser/installer behavior. Chrome tab access and script execution remain in
 * the native Morphe bridge.
 */
public final class ViolentmonkeyCompat {
    private static final Pattern USER_SCRIPT_BLOCK = Pattern.compile(
            "(?s)//\\s*==UserScript==.*?//\\s*==/UserScript=="
    );
    private static final Pattern USER_STYLE_BLOCK = Pattern.compile(
            "(?s)/\\*\\s*==UserStyle==.*?==/UserStyle==\\s*\\*/"
    );
    private static final Pattern NAME_LINE = Pattern.compile(
            "(?m)^\\s*(?://|\\*)\\s*@name(?:[:_-][^\\s]+)?\\s+\\S.*$",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern FORK_PAGE = Pattern.compile(
            "/scripts/(\\d+)(?:-([^/?#]+))?(?:/|$)",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern MARKER = Pattern.compile(
            "(?:^|[&#])monkeyscript-install=([^&#]+)",
            Pattern.CASE_INSENSITIVE
    );

    private ViolentmonkeyCompat() { }

    public static boolean looksLikeUserscript(String source) {
        if (source == null) return false;
        String trimmed = source.trim();
        if (trimmed.isEmpty() || trimmed.startsWith("<")) return false;
        boolean hasBlock = USER_SCRIPT_BLOCK.matcher(source).find()
                || USER_STYLE_BLOCK.matcher(source).find();
        return hasBlock && NAME_LINE.matcher(source).find();
    }

    public static boolean isDirectUserscriptUrl(String value) {
        if (value == null) return false;
        try {
            URI uri = new URI(value);
            String scheme = lower(uri.getScheme());
            String path = lower(uri.getPath());
            return ("http".equals(scheme) || "https".equals(scheme))
                    && path != null
                    && (path.endsWith(".user.js") || path.endsWith(".user.css"));
        } catch (Exception ignored) {
            return false;
        }
    }

    /** Mirrors Violentmonkey's trusted installer families. */
    public static boolean isTrustedInstallUrl(String value) {
        if (!isDirectUserscriptUrl(value)) return false;
        try {
            URI uri = new URI(value);
            String host = normalizeHost(uri.getHost());
            String path = uri.getPath() == null ? "" : uri.getPath();
            if ("update.greasyfork.org".equals(host)
                    || "update.sleazyfork.org".equals(host)) {
                return path.startsWith("/scripts/");
            }
            if ("greasyfork.org".equals(host) || "sleazyfork.org".equals(host)) {
                return path.contains("/scripts/") && path.contains("/code/");
            }
            if ("raw.githubusercontent.com".equals(host)) return path.split("/").length >= 5;
            if ("github.com".equals(host)) {
                return path.contains("/raw/")
                        || path.contains("/releases/download/")
                        || path.contains("/releases/latest/download/");
            }
            if ("gist.github.com".equals(host)) return true;
            return "openuserjs.org".equals(host) && path.startsWith("/install/");
        } catch (Exception ignored) {
            return false;
        }
    }

    public static boolean isForkScriptPage(String value) {
        if (value == null) return false;
        try {
            URI uri = new URI(value);
            return isForkHost(uri.getHost())
                    && FORK_PAGE.matcher(uri.getPath() == null ? "" : uri.getPath()).find();
        } catch (Exception ignored) {
            return false;
        }
    }

    public static String fallbackForkInstallUrl(String pageUrl) throws Exception {
        URI uri = new URI(pageUrl);
        String host = normalizeHost(uri.getHost());
        if (!isForkHost(host)) throw new Exception("Not a Greasy Fork or Sleazy Fork page");
        Matcher matcher = FORK_PAGE.matcher(uri.getPath() == null ? "" : uri.getPath());
        if (!matcher.find()) throw new Exception("Could not read the Fork script ID");

        String id = matcher.group(1);
        String slug = matcher.group(2);
        if (slug == null || slug.trim().isEmpty()) slug = "script";
        slug = slug.replaceAll("[^A-Za-z0-9._-]+", "-");
        String updateHost = "greasyfork.org".equals(host)
                ? "update.greasyfork.org"
                : "update.sleazyfork.org";
        return "https://" + updateHost + "/scripts/" + id + "/" + slug + ".user.js";
    }

    public static boolean hasInstallMarker(String value) {
        return installUrlFromMarker(value) != null;
    }

    public static String installUrlFromMarker(String value) {
        if (value == null) return null;
        Matcher matcher = MARKER.matcher(value);
        if (!matcher.find()) return null;
        try {
            String decoded = URLDecoder.decode(matcher.group(1), StandardCharsets.UTF_8.name());
            return isDirectUserscriptUrl(decoded) ? decoded : null;
        } catch (Exception ignored) {
            return null;
        }
    }

    public static boolean isForkHost(String host) {
        String normalized = normalizeHost(host);
        return "greasyfork.org".equals(normalized) || "sleazyfork.org".equals(normalized);
    }

    public static String normalizeHost(String host) {
        if (host == null) return "";
        String normalized = host.toLowerCase(Locale.US).trim();
        return normalized.startsWith("www.") ? normalized.substring(4) : normalized;
    }

    private static String lower(String value) {
        return value == null ? null : value.toLowerCase(Locale.US);
    }
}
