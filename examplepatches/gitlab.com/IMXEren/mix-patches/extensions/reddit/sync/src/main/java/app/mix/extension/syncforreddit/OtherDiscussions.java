/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.extension.syncforreddit;

import android.net.Uri;
import java.util.Locale;

/** Builds working, sorted URLs for Sync's "Other discussions" feed. */
@SuppressWarnings("unused")
public final class OtherDiscussions {
    private OtherDiscussions() {
    }

    public static String rewriteUrl(String originalUrl, String key, String after, String rawSort) {
        if (key == null || !key.toLowerCase(Locale.ROOT).startsWith("seen###")) {
            return originalUrl;
        }
        String[] parts = key.split("###", 3);
        if (parts.length < 2 || parts[1].isEmpty()) {
            return originalUrl;
        }

        String target = decode(parts[1]);
        if (target.isEmpty()) {
            return originalUrl;
        }

        SortOption option = SortOption.from(rawSort);
        StringBuilder url = new StringBuilder("https://oauth.reddit.com/search.json?q=")
                .append(encode("url:" + target))
                .append("&limit=25&sort=")
                .append(mapSort(option.name));
        if (after != null && !after.isEmpty() && !"null".equals(after)) {
            url.append("&after=").append(encode(after));
        }
        if (option.time != null) {
            url.append("&t=").append(option.time);
        }
        return url.toString();
    }

    private static String mapSort(String sort) {
        if ("hot".equals(sort) || "new".equals(sort)
                || "top".equals(sort) || "comments".equals(sort)) {
            return sort;
        }
        if ("rising".equals(sort)) {
            return "new";
        }
        return "controversial".equals(sort) ? "top" : "hot";
    }

    private static String decode(String value) {
        return Uri.decode(value);
    }

    private static String encode(String value) {
        return Uri.encode(value);
    }
}
