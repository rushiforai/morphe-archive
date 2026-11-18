package app.afterglow.extension.diagnostics;

import java.util.regex.Pattern;

/** iOS YTAGLog category routing and redaction, with Android private paths included. */
public final class LogPolicy {
    public static final int MAX_MESSAGE = 1024;
    private static final Pattern URL = Pattern.compile("(?i)https?://[^\\s]+");
    private static final Pattern PATH = Pattern.compile(
            "(?i)(?:file://)?/(?:private|var|Users|mobile|tmp|Documents|Library|data|storage|sdcard|mnt|home)/[^\\s]+");
    private static final Pattern SECRET = Pattern.compile(
            "(?i)\\b(authorization|proxy-authorization|cookie|set-cookie|x-goog-visitor-id|visitorData|clickTrackingParams|poToken|accessGroup|accountID|userID|prompt|videoID)\\s*[:=]\\s*[^\\n,;]+");
    private LogPolicy() {}

    public static String categoryKey(String category) {
        String c = category == null ? "" : category;
        if (starts(c, "dl-", "download", "extractor", "selector", "ffmpeg", "action-sheet")) return "debugLogDownloads";
        if (starts(c, "overlay", "shorts-ui", "vc-resolve", "fullscreen")) return "debugLogPlayerUI";
        if (starts(c, "premium-ctrl", "premium-controls")) return "debugLogPremiumControls";
        if (c.startsWith("pip")) return "debugLogPiP";
        if (starts(c, "offline-", "ctor")) return "debugLogProbes";
        return null;
    }

    public static boolean allows(boolean enabled, boolean firehose, String category, boolean categoryEnabled) {
        return firehose || (enabled && (categoryKey(category) == null || categoryEnabled));
    }

    public static String redact(String message) {
        if (message == null) return "";
        String safe = URL.matcher(message).replaceAll("<url>");
        safe = PATH.matcher(safe).replaceAll("<path>");
        safe = SECRET.matcher(safe).replaceAll("$1=<redacted>");
        return safe.length() > MAX_MESSAGE ? safe.substring(0, MAX_MESSAGE) + "…<truncated>" : safe;
    }

    public static String categoryName(String category) {
        String safe = category == null ? "log" : category.replaceAll("[^a-zA-Z0-9_.-]", "_");
        return safe.isEmpty() ? "log" : safe.substring(0, Math.min(96, safe.length()));
    }

    private static boolean starts(String category, String... prefixes) {
        for (String prefix : prefixes) if (category.startsWith(prefix)) return true;
        return false;
    }
}
