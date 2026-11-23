package app.voidhack.extension.applemusic.lyrics;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Random;

final class LrclibApiClient {
    static final String BASE_URL = "https://lrclib.net";
    static final String USER_AGENT = "Nich87Patches-AppleMusic/1.0 (https://github.com/Nich87/nich87-patches)";
    private static final int CONNECT_TIMEOUT_MS = 6000;
    private static final int READ_TIMEOUT_MS = 8000;
    private static final long MIN_REQUEST_INTERVAL_MS = 250L;

    private static final Object THROTTLE_LOCK = new Object();
    private static long lastRequestFinishedAtMs = 0L;
    private static volatile long retryNotBeforeMs = 0L;
    private static final Random RANDOM = new Random();

    static final class RateLimitException extends IOException {
        final long retryAfterMs;

        RateLimitException(long retryAfterMs) {
            super("LRCLIB rate limited (" + retryAfterMs + "ms)");
            this.retryAfterMs = retryAfterMs;
        }
    }

    private static final class HttpResult {
        final int statusCode;
        final String contentType;
        final String retryAfter;
        final String body;

        HttpResult(int statusCode, String contentType, String retryAfter, String body) {
            this.statusCode = statusCode;
            this.contentType = contentType == null ? "" : contentType;
            this.retryAfter = retryAfter;
            this.body = body == null ? "" : body;
        }

        boolean isJson() {
            return contentType.toLowerCase(Locale.ROOT).contains("application/json");
        }
    }

    private LrclibApiClient() {}

    static boolean isRateLimitedNow() {
        return System.currentTimeMillis() < retryNotBeforeMs;
    }

    static LrclibModels.LyricsRecord getExact(String trackName, String artistName, String albumName, int durationSec)
            throws IOException {
        if (isBlank(trackName) || isBlank(artistName)) return null;
        StringBuilder url = new StringBuilder(BASE_URL).append("/api/get?track_name=")
                .append(encode(trackName))
                .append("&artist_name=").append(encode(artistName));
        if (!isBlank(albumName)) {
            url.append("&album_name=").append(encode(albumName));
        }
        if (durationSec >= 1 && durationSec <= 3600) {
            url.append("&duration=").append(durationSec);
        }
        HttpResult res = executeGet(url.toString());
        if (res.statusCode == 404) return null;
        if (res.statusCode != 200 || !res.isJson()) {
            throw new IOException("LRCLIB /api/get status=" + res.statusCode);
        }
        try {
            return LrclibModels.LyricsRecord.fromJson(new JSONObject(res.body));
        } catch (JSONException e) {
            throw new IOException("Invalid JSON from /api/get", e);
        }
    }

    static LrclibModels.LyricsRecord getById(long id) throws IOException {
        if (id <= 0L) return null;
        HttpResult res = executeGet(BASE_URL + "/api/get/" + id);
        if (res.statusCode == 404) return null;
        if (res.statusCode != 200 || !res.isJson()) {
            throw new IOException("LRCLIB /api/get/" + id + " status=" + res.statusCode);
        }
        try {
            return LrclibModels.LyricsRecord.fromJson(new JSONObject(res.body));
        } catch (JSONException e) {
            throw new IOException("Invalid JSON from /api/get/" + id, e);
        }
    }

    static List<LrclibModels.SearchSummary> search(String trackName, String artistName, String albumName, String q)
            throws IOException {
        String queryParams = buildSearchQuery(trackName, artistName, albumName, q);
        if (queryParams.isEmpty()) return Collections.emptyList();

        // Try lightweight v2 beta search first; seamlessly fall back to stable v1 search if needed.
        try {
            HttpResult v2 = executeGet(BASE_URL + "/api/v2/search?" + queryParams);
            if (v2.statusCode == 200 && v2.isJson()) {
                return parseV2Array(v2.body);
            }
        } catch (RateLimitException e) {
            throw e;
        } catch (IOException ignored) {
            // Fall back to v1 /api/search
        }

        HttpResult v1 = executeGet(BASE_URL + "/api/search?" + queryParams);
        if (v1.statusCode == 404) return Collections.emptyList();
        if (v1.statusCode != 200 || !v1.isJson()) {
            throw new IOException("LRCLIB /api/search status=" + v1.statusCode);
        }
        return parseV1Array(v1.body);
    }

    static LrclibModels.LyricsRecord resolveAutoMatch(
            LrclibModels.TrackQuery query,
            boolean requireSynced,
            boolean preferWordSync,
            boolean allowPlain,
            boolean allowSearchFallback) throws IOException {
        if (query == null || isBlank(query.title)) return null;

        // 1. Direct signature match via GET /api/get
        LrclibModels.LyricsRecord exact = null;
        if (!isBlank(query.artist)) {
            try {
                exact = getExact(query.title, query.artist, query.album, query.durationSec);
            } catch (RateLimitException e) {
                throw e;
            } catch (IOException ignored) {
                exact = null;
            }
        }
        if (exact != null) {
            if (exact.instrumental) {
                if (!allowSearchFallback) return requireSynced ? null : exact;
            } else if (exact.hasSynced()) {
                return exact;
            } else if (!requireSynced && allowPlain && exact.hasPlain() && !allowSearchFallback) {
                return exact;
            }
        }

        if (!allowSearchFallback) {
            if (exact != null && !requireSynced && (exact.hasPlain() && allowPlain || exact.instrumental)) {
                return exact;
            }
            return null;
        }

        // 2. Structured search fallback (handles slight duration / album / edition differences)
        List<LrclibModels.SearchSummary> candidates = search(query.title, query.artist, null, null);
        LrclibModels.SearchSummary best = LrclibMatcher.pickBest(query, candidates, requireSynced, preferWordSync, allowPlain);

        // 3. Cleaned title + primary artist retry if no confident match yet
        if (best == null) {
            String cleanedTitle = LrclibMatcher.stripEditions(query.title);
            String primaryArtist = LrclibMatcher.primaryArtist(query.artist);
            boolean changed = !cleanedTitle.equalsIgnoreCase(query.title)
                    || !primaryArtist.equalsIgnoreCase(query.artist);
            if (changed && !cleanedTitle.isEmpty()) {
                List<LrclibModels.SearchSummary> retry = search(cleanedTitle, primaryArtist, null, null);
                best = LrclibMatcher.pickBest(query, retry, requireSynced, preferWordSync, allowPlain);
            }
        }

        if (best != null) {
            if (best.fullRecord != null) return best.fullRecord;
            return getById(best.id);
        }

        // If search yielded no better synced candidate, preserve usable exact match.
        if (exact != null && !requireSynced) {
            if (exact.hasPlain() && allowPlain) return exact;
            if (exact.instrumental) return exact;
        }
        return null;
    }

    private static String buildSearchQuery(String trackName, String artistName, String albumName, String q) {
        if (!isBlank(q)) {
            return "q=" + encode(q.trim());
        }
        if (isBlank(trackName)) return "";
        StringBuilder sb = new StringBuilder();
        sb.append("track_name=").append(encode(trackName.trim()));
        if (!isBlank(artistName)) {
            sb.append("&artist_name=").append(encode(artistName.trim()));
        }
        if (!isBlank(albumName)) {
            sb.append("&album_name=").append(encode(albumName.trim()));
        }
        return sb.toString();
    }

    private static List<LrclibModels.SearchSummary> parseV2Array(String body) throws IOException {
        try {
            JSONArray array = new JSONArray(body);
            List<LrclibModels.SearchSummary> out = new ArrayList<>(array.length());
            for (int i = 0; i < array.length(); i++) {
                JSONObject item = array.optJSONObject(i);
                LrclibModels.SearchSummary summary = LrclibModels.SearchSummary.fromV2Json(item);
                if (summary != null) out.add(summary);
            }
            return out;
        } catch (JSONException e) {
            throw new IOException("Invalid v2 search JSON", e);
        }
    }

    private static List<LrclibModels.SearchSummary> parseV1Array(String body) throws IOException {
        try {
            JSONArray array = new JSONArray(body);
            List<LrclibModels.SearchSummary> out = new ArrayList<>(array.length());
            for (int i = 0; i < array.length(); i++) {
                JSONObject item = array.optJSONObject(i);
                LrclibModels.SearchSummary summary = LrclibModels.SearchSummary.fromV1Json(item);
                if (summary != null) out.add(summary);
            }
            return out;
        } catch (JSONException e) {
            throw new IOException("Invalid v1 search JSON", e);
        }
    }

    private static HttpResult executeGet(String urlString) throws IOException {
        synchronized (THROTTLE_LOCK) {
            long now = System.currentTimeMillis();
            if (now < retryNotBeforeMs) {
                throw new RateLimitException(retryNotBeforeMs - now);
            }
            long wait = (lastRequestFinishedAtMs + MIN_REQUEST_INTERVAL_MS) - now;
            if (wait > 0L) {
                try {
                    Thread.sleep(wait);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    throw new IOException("Interrupted while waiting for LRCLIB request slot", e);
                }
            }
            HttpURLConnection conn = null;
            try {
                conn = (HttpURLConnection) new URL(urlString).openConnection();
                conn.setRequestMethod("GET");
                conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
                conn.setReadTimeout(READ_TIMEOUT_MS);
                conn.setRequestProperty("User-Agent", USER_AGENT);
                conn.setRequestProperty("Lrclib-Client", USER_AGENT);
                conn.setRequestProperty("Accept", "application/json");

                int code = conn.getResponseCode();
                String contentType = conn.getContentType();
                String retryAfter = conn.getHeaderField("Retry-After");

                if (code == 429 || code == 503) {
                    long backoffMs = LrclibMatcher.parseRetryAfterMillis(retryAfter, RANDOM.nextDouble());
                    retryNotBeforeMs = System.currentTimeMillis() + backoffMs;
                    throw new RateLimitException(backoffMs);
                }

                InputStream stream = code >= 200 && code < 300 ? conn.getInputStream() : conn.getErrorStream();
                String body = readStream(stream);
                return new HttpResult(code, contentType, retryAfter, body);
            } finally {
                lastRequestFinishedAtMs = System.currentTimeMillis();
                if (conn != null) conn.disconnect();
            }
        }
    }

    private static String readStream(InputStream stream) throws IOException {
        if (stream == null) return "";
        try (InputStream in = stream) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int read;
            while ((read = in.read(buffer)) != -1) {
                out.write(buffer, 0, read);
                if (out.size() > 2 * 1024 * 1024) {
                    throw new IOException("LRCLIB response exceeded 2MB safety cap");
                }
            }
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        }
    }

    private static String encode(String s) {
        try {
            return URLEncoder.encode(s, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new AssertionError("UTF-8 unavailable", e);
        }
    }

    private static boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }
}
