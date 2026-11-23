package nl.johninnl.deezer.lyrics;

import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import javax.net.ssl.HttpsURLConnection;

/** A single lookup; scheduling and generation ownership belong to the repository. */
public final class LrclibClient {
    public enum Status { FOUND, MISSING, RETRY, ERROR }
    public static final class Result {
        public final Status status;
        public final LyricsPayload payload;
        public final long retryDelayMs;
        private Result(Status status, LyricsPayload payload, long delay) {
            this.status = status; this.payload = payload; this.retryDelayMs = delay;
        }
        public static Result found(LyricsPayload payload) {
            if (payload == null) throw new IllegalArgumentException("Missing lyric payload");
            return new Result(Status.FOUND, payload, 0);
        }
        public static Result missing() { return new Result(Status.MISSING, null, 0); }
        public static Result retry(long delay) { return new Result(Status.RETRY, null, Math.max(1000, delay)); }
        public static Result error() { return new Result(Status.ERROR, null, 30000); }
    }

    public Result fetch(TrackSignature signature) {
        HttpsURLConnection connection = null;
        try {
            connection = (HttpsURLConnection) new URL("https://lrclib.net/api/get?" + signature.query()).openConnection();
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(8000);
            connection.setUseCaches(false);
            connection.setRequestProperty("Accept", "application/json");
            connection.setRequestProperty("User-Agent", "DutchAppPatchesDeezer/" + BuildConfig.PATCH_VERSION +
                    " (+https://gitlab.com/johninnld/nl-morphe-patches)");
            int status = connection.getResponseCode();
            LyricsDiagnostics.event("http_status=" + status);
            if (status == 404) return Result.missing();
            if (status == 429 || status == 503) return Result.retry(retryDelay(
                    connection.getHeaderField("Retry-After"), System.currentTimeMillis(), Math.random(), status == 503 ? 1000 : 30000));
            String contentType = connection.getContentType();
            if (status != 200 || contentType == null || !contentType.toLowerCase(java.util.Locale.ROOT).contains("application/json"))
                return Result.error();
            if (connection.getContentLengthLong() > 1048576) return Result.error();
            try (InputStream input = connection.getInputStream(); ByteArrayOutputStream body = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[8192];
                for (int n; (n = input.read(buffer)) != -1;) {
                    if (body.size() + n > 1048576) return Result.error();
                    body.write(buffer, 0, n);
                }
                LyricsPayload payload = decode(signature, new String(body.toByteArray(), StandardCharsets.UTF_8));
                LyricsDiagnostics.event(payload == null ? "payload_missing" : "payload_ready");
                return payload == null ? Result.missing() : Result.found(payload);
            }
        } catch (Exception failure) {
            // Do not log lyric bodies, track URLs, native tokens or account details.
            LyricsDiagnostics.event("http_error=" + failure.getClass().getSimpleName());
            return Result.error();
        } finally { if (connection != null) connection.disconnect(); }
    }

    static LyricsPayload decode(TrackSignature expected, String json) throws org.json.JSONException {
        JSONObject record = new JSONObject(json);
        double duration = record.optDouble("duration", Double.NaN);
        if (!expected.matches(record.optString("trackName", ""), record.optString("artistName", ""),
                record.optString("albumName", ""), duration)) return null;
        Object instrumental = record.opt("instrumental");
        if (!(instrumental instanceof Boolean)) return null;
        return LyricsPayload.normalize(record.optLong("id", -1), (Boolean) instrumental,
                nullableString(record, "plainLyrics"), nullableString(record, "syncedLyrics"), expected.durationSeconds);
    }

    private static String nullableString(JSONObject json, String name) {
        Object value = json.opt(name);
        return value instanceof String ? (String) value : null;
    }

    static long retryDelay(String header, long wallTimeMs, double jitter, long fallbackMs) {
        long delay = fallbackMs;
        if (header != null) {
            try {
                double seconds = Double.parseDouble(header.trim());
                if (Double.isFinite(seconds) && seconds >= 0) delay = (long) Math.ceil(Math.min(seconds, Long.MAX_VALUE / 2000.0) * 1000);
            } catch (NumberFormatException numeric) {
                try { delay = Math.max(0, ZonedDateTime.parse(header, DateTimeFormatter.RFC_1123_DATE_TIME).toInstant().toEpochMilli() - wallTimeMs); }
                catch (Exception malformed) { /* retain bounded retry policy, without parsing the response body */ }
            }
        }
        delay = Math.max(1000, delay);
        long extra = (long) (delay * 0.3 * Math.max(0, Math.min(1, jitter)));
        return delay > Long.MAX_VALUE - extra ? Long.MAX_VALUE : delay + extra;
    }
}
