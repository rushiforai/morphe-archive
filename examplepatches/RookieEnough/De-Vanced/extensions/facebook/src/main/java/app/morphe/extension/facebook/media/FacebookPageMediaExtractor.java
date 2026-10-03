/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

import org.json.JSONArray;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Extracts Facebook's actual delivery formats from the public Reel/video page.
 *
 * The page's server-rendered data contains videoDeliveryLegacyFields and
 * videoDeliveryResponseFragment, including progressive SD URLs and DASH MPDs.
 */
public final class FacebookPageMediaExtractor {
    private static final String USER_AGENT =
            "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 " +
                    "Chrome/131 Mobile Safari/537.36";
    private static final int MAX_PAGE_BYTES = 12 * 1024 * 1024;
    private static final long CACHE_MS = 60_000L;

    private static final Pattern DASH_VALUE = Pattern.compile(
            "\"(?:dash_manifest|manifest_xml)\"\\s*:\\s*" +
                    "\"((?:\\\\.|[^\"\\\\])*)\"",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern SD_URL = Pattern.compile(
            "\"(?:playable_url|browser_native_sd_url)\"\\s*:\\s*" +
                    "\"((?:\\\\.|[^\"\\\\])*)\"",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern HD_URL = Pattern.compile(
            "\"(?:playable_url_quality_hd|browser_native_hd_url)\"" +
                    "\\s*:\\s*\"((?:\\\\.|[^\"\\\\])*)\"",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern PROGRESSIVE_URL = Pattern.compile(
            "\"progressive_url\"\\s*:\\s*" +
                    "\"((?:\\\\.|[^\"\\\\])*)\"",
            Pattern.CASE_INSENSITIVE
    );

    private static final LinkedHashMap<String, CacheEntry> CACHE =
            new LinkedHashMap<String, CacheEntry>(16, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(
                        Map.Entry<String, CacheEntry> eldest
                ) {
                    return size() > 16;
                }
            };

    private FacebookPageMediaExtractor() {
    }

    public static Result extract(String videoId) {
        if (videoId == null ||
                !videoId.matches("[0-9]{6,24}")) {
            return Result.EMPTY;
        }

        long now = System.currentTimeMillis();
        synchronized (CACHE) {
            CacheEntry cached = CACHE.get(videoId);
            if (cached != null && now - cached.time < CACHE_MS) {
                return cached.result;
            }
        }

        Result result;
        try {
            String id = URLEncoder.encode(videoId, "UTF-8");
            String page = downloadText(
                    "https://www.facebook.com/video/video.php?v=" + id
            );
            result = parsePage(page);
        } catch (Throwable ignored) {
            result = Result.EMPTY;
        }

        synchronized (CACHE) {
            CACHE.put(videoId, new CacheEntry(now, result));
        }
        return result;
    }

    private static Result parsePage(String page) {
        if (page == null || page.isEmpty()) return Result.EMPTY;

        LinkedHashMap<String, MediaVariant> dash =
                new LinkedHashMap<>();
        LinkedHashSet<String> lowProgressive =
                new LinkedHashSet<>();
        LinkedHashSet<String> highProgressive =
                new LinkedHashSet<>();

        Matcher manifestValues = DASH_VALUE.matcher(page);
        while (manifestValues.find()) {
            String value = decodeValue(manifestValues.group(1));
            if (value == null || value.isEmpty()) continue;
            if (value.startsWith("http://") ||
                    value.startsWith("https://")) {
                try {
                    value = downloadText(value);
                } catch (Throwable ignored) {
                    continue;
                }
            }
            for (MediaVariant variant :
                    DashManifestParser.parse(value)) {
                if (variant.url != null && !variant.url.isEmpty()) {
                    dash.putIfAbsent(variant.url, variant);
                }
            }
        }

        collectUrls(SD_URL, page, lowProgressive);
        collectUrls(HD_URL, page, highProgressive);

        Matcher progressive = PROGRESSIVE_URL.matcher(page);
        while (progressive.find()) {
            String url = decodeValue(progressive.group(1));
            if (!isMediaUrl(url)) continue;
            int start = Math.max(0, progressive.start() - 400);
            int end = Math.min(page.length(), progressive.end() + 500);
            String context = page.substring(start, end)
                    .toLowerCase(Locale.US);
            if (context.contains("\"quality\":\"sd\"") ||
                    context.contains("\\\"quality\\\":\\\"sd\\\"")) {
                lowProgressive.add(url);
            } else if (context.contains("\"quality\":\"hd\"") ||
                    context.contains("\\\"quality\\\":\\\"hd\\\"")) {
                highProgressive.add(url);
            }
        }

        if (dash.isEmpty() &&
                lowProgressive.isEmpty() &&
                highProgressive.isEmpty()) {
            return Result.EMPTY;
        }
        return new Result(
                new ArrayList<>(dash.values()),
                new ArrayList<>(lowProgressive),
                new ArrayList<>(highProgressive)
        );
    }

    private static void collectUrls(
            Pattern pattern,
            String text,
            LinkedHashSet<String> output
    ) {
        Matcher matcher = pattern.matcher(text);
        while (matcher.find()) {
            String value = decodeValue(matcher.group(1));
            if (isMediaUrl(value)) output.add(value);
        }
    }

    private static String downloadText(String value) throws Exception {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(value)
                    .openConnection();
            connection.setInstanceFollowRedirects(true);
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(30_000);
            connection.setRequestProperty("User-Agent", USER_AGENT);
            connection.setRequestProperty(
                    "Accept-Language",
                    "en-US,en;q=0.9"
            );
            connection.setRequestProperty(
                    "Accept-Encoding",
                    "identity"
            );
            int response = connection.getResponseCode();
            if (response != HttpURLConnection.HTTP_OK) {
                throw new IllegalStateException("HTTP " + response);
            }

            try (InputStream input = connection.getInputStream();
                 ByteArrayOutputStream output =
                         new ByteArrayOutputStream(256 * 1024)) {
                byte[] buffer = new byte[32 * 1024];
                int total = 0;
                int count;
                while ((count = input.read(buffer)) >= 0) {
                    if (count == 0) continue;
                    total += count;
                    if (total > MAX_PAGE_BYTES) {
                        throw new IllegalStateException(
                                "Facebook format page was too large"
                        );
                    }
                    output.write(buffer, 0, count);
                }
                return output.toString("UTF-8");
            }
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static String decodeValue(String value) {
        if (value == null || value.isEmpty()) return value;
        String decoded = value;
        try {
            decoded = new JSONArray("[\"" + value + "\"]")
                    .getString(0);
        } catch (Throwable ignored) {
        }
        decoded = decoded
                .replace("&amp;", "&")
                .replace("&#039;", "'")
                .replace("&quot;", "\"");
        if (decoded.contains("%3C") ||
                decoded.contains("%3c") ||
                decoded.contains("%22")) {
            try {
                decoded = URLDecoder.decode(decoded, "UTF-8");
            } catch (Throwable ignored) {
            }
        }
        return decoded;
    }

    private static boolean isMediaUrl(String value) {
        if (value == null) return false;
        String lower = value.toLowerCase(Locale.US);
        return (lower.startsWith("https://") ||
                lower.startsWith("http://")) &&
                (lower.contains("fbcdn.net") ||
                        lower.contains("cdninstagram.com"));
    }

    public static final class Result {
        static final Result EMPTY = new Result(
                Collections.emptyList(),
                Collections.emptyList(),
                Collections.emptyList()
        );

        public final List<MediaVariant> dashVariants;
        public final List<String> lowProgressiveUrls;
        public final List<String> highProgressiveUrls;

        Result(
                List<MediaVariant> dashVariants,
                List<String> lowProgressiveUrls,
                List<String> highProgressiveUrls
        ) {
            this.dashVariants = dashVariants;
            this.lowProgressiveUrls = lowProgressiveUrls;
            this.highProgressiveUrls = highProgressiveUrls;
        }

        public boolean isEmpty() {
            return dashVariants.isEmpty() &&
                    lowProgressiveUrls.isEmpty() &&
                    highProgressiveUrls.isEmpty();
        }
    }

    private static final class CacheEntry {
        final long time;
        final Result result;

        CacheEntry(long time, Result result) {
            this.time = time;
            this.result = result;
        }
    }
}
