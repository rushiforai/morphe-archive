/*
 * Copyright 2026 wchill, IMXEren.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.extension.syncforreddit;

import java.util.Locale;

import app.mix.extension.shared.fixes.redgifs.BaseFixRedgifsApiPatch;
import okhttp3.OkHttpClient;

/**
 * @noinspection unused
 */
public class FixRedgifsApiPatch extends BaseFixRedgifsApiPatch {
    static {
        INSTANCE = new FixRedgifsApiPatch();
    }

    public String getDefaultUserAgent() {
        // To be filled in by patch
        return "";
    }

    public static OkHttpClient install(OkHttpClient.Builder builder) {
        return builder.addInterceptor(INSTANCE).build();
    }

    /**
     * Extracts a Redgifs ID after removing the query or fragment from the complete URL.
     * Sync's original implementation removes a trailing slash first, so URLs such as
     * {@code /watch/<id>/?utm_source=share} incorrectly produce an empty ID.
     * Redgifs API IDs are case-sensitive, while Sync can produce title-case watch URLs,
     * so the extracted ID is normalized to lowercase.
     *
     * <p>The suffix cleanup intentionally matches Sync's original behavior. In particular,
     * {@code .jpg} remains so image posts fail over to the WebView instead of being passed to
     * the native video player.</p>
     */
    public static String extractGifId(String url) {
        if (url == null) return null;

        try {
            int queryStart = url.indexOf('?');
            if (queryStart >= 0) url = url.substring(0, queryStart);

            int fragmentStart = url.indexOf('#');
            if (fragmentStart >= 0) url = url.substring(0, fragmentStart);

            if (url.endsWith("/")) url = url.substring(0, url.length() - 1);

            String id = url.substring(url.lastIndexOf('/') + 1);
            id = id.replace(".gif", "").replace(".mp4", "").replace(".webm", "")
                    .replace("-mobile", "").replace("-size_restricted", "")
                    .replace("-max-1mb-poster", "");
            if (id.contains("-")) id = id.split("-")[0];
            return id.toLowerCase(Locale.ROOT);
        } catch (Exception ignored) {
            return null;
        }
    }
}
