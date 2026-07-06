package app.morphe.extension.tiktok.share;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Best-effort share URL sanitizer.
 *
 * Removes common tracking/query parameters from TikTok-generated share links.
 * Uses simple parsing and is null-safe to prevent crashes.
 */
@SuppressWarnings("unused")
public final class ShareUrlSanitizer {

    private ShareUrlSanitizer() {}

    private static final Set<String> TRACKING_KEYS = new HashSet<>(Arrays.asList(
        "utm_source",
        "utm_medium",
        "utm_campaign",
        "utm_term",
        "utm_content",
        "fbclid",
        "igshid",
        "share_link_id",
        "invitation_scene",
        "ref",
        "source",
        "si",
        "utm_id"
    ));

    public static String sanitizeShareUrl(String url) {
        if (url == null) return null;

        try {
            int qIndex = url.indexOf('?');
            if (qIndex < 0 || qIndex == url.length() - 1) return url;

            String base = url.substring(0, qIndex);
            String query = url.substring(qIndex + 1);

            String[] parts = query.split("&");
            StringBuilder kept = new StringBuilder();

            for (int i = 0; i < parts.length; i++) {
                String part = parts[i];
                if (part == null || part.isEmpty()) continue;

                int eq = part.indexOf('=');
                String key = (eq >= 0) ? part.substring(0, eq) : part;

                if (key != null && TRACKING_KEYS.contains(key)) {
                    continue;
                }

                if (kept.length() > 0) kept.append('&');
                kept.append(part);
            }

            if (kept.length() == 0) return base;
            return base + "?" + kept;
        } catch (Throwable ignored) {
            return url;
        }
    }
}

