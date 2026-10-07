/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.extension.reddit;

import android.net.Uri;

import org.json.JSONArray;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Collection;

import app.mix.extension.shared.requests.Requester;

public final class ArcticShiftApi {
    private static final String HOST = "arctic-shift.photon-reddit.com";
    private static final String BASE_URL = "https://" + HOST + "/api/";

    private ArcticShiftApi() {
    }

    public static boolean isArchiveUrl(String url) {
        return url != null && HOST.equalsIgnoreCase(Uri.parse(url).getHost());
    }

    public static String searchUrl(String kind, String author, Long before, int limit) {
        boolean comments = "t1".equals(kind);
        StringBuilder url = new StringBuilder(BASE_URL)
                .append(comments ? "comments/search" : "posts/search")
                .append("?author=").append(Uri.encode(author))
                .append("&limit=").append(limit).append("&sort=desc");
        if (comments) {
            url.append("&md2html=true");
        }
        if (before != null) {
            url.append("&before=").append(Math.max(0L, before - 1L));
        }
        return url.toString();
    }

    public static JSONArray postsByIds(Collection<String> ids, String fields, String userAgent)
            throws Exception {
        return get(BASE_URL + "posts/ids?ids=" + Uri.encode(String.join(",", ids), ",")
                + "&fields=" + Uri.encode(fields, ","), userAgent);
    }

    public static JSONArray get(String url, String userAgent) throws Exception {
        if (ArcticShiftRateLimit.isThrottled()) {
            return null;
        }
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        try {
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(10_000);
            connection.setReadTimeout(20_000);
            if (userAgent != null && !userAgent.isEmpty()) {
                connection.setRequestProperty("User-Agent", userAgent);
            }
            int status = connection.getResponseCode();
            ArcticShiftRateLimit.observe(url, status,
                    connection.getHeaderField("X-RateLimit-Reset"),
                    connection.getHeaderField("X-RateLimit-Reset-At"));
            if (status != 200) {
                return null;
            }
            return Requester.parseJSONObjectAndDisconnect(connection).optJSONArray("data");
        } finally {
            connection.disconnect();
        }
    }
}
