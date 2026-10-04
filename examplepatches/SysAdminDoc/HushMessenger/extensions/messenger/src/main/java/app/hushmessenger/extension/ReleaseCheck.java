package app.hushmessenger.extension;

import android.content.SharedPreferences;
import android.util.JsonReader;
import android.util.JsonToken;
import java.io.IOException;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

/** Only validated public release fields are kept. No response body or account data is cached. */
final class ReleaseCheck {
    static final long COOLDOWN_MS = 60 * 60 * 1000L;
    static final String CACHE_KEY = "update_release_cache";
    static final String RETRY_KEY = "update_retry_at";
    static final String RETRY_ENDPOINT_KEY = "update_retry_endpoint";
    static final String FAILURES_KEY = "update_retry_count";
    static final int MAX_CACHE_CHARS = 1024;
    static final long MAX_RETRY_MS = 24 * 60 * 60 * 1000L;
    final String endpoint, tag, page, etag;
    final long checkedAt;

    private ReleaseCheck(String endpoint, String tag, String page, String etag, long checkedAt) throws IOException {
        if (endpoint == null || endpoint.length() > 256 || endpoint.indexOf('\n') >= 0 || endpoint.indexOf('\r') >= 0
            || !validTag(tag) || page == null || page.isEmpty() || !page.equals(SettingsActivity.releasePage(page, tag)) || checkedAt <= 0)
            throw new IOException("Invalid cached release");
        this.endpoint = endpoint;
        this.tag = tag;
        this.page = page;
        this.etag = validEtag(etag) ? etag : "";
        this.checkedAt = checkedAt;
    }

    static boolean validTag(String tag) {
        if (tag == null || tag.length() > 128 || !tag.matches("v?(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)(?:-[0-9A-Za-z-]+(?:\\.[0-9A-Za-z-]+)*)?(?:\\+[0-9A-Za-z-]+(?:\\.[0-9A-Za-z-]+)*)?")) return false;
        String[] version = tag.split("\\+", 2)[0].split("-", 2);
        if (version.length == 2) for (String identifier : version[1].split("\\."))
            if (identifier.matches("0[0-9]+")) return false;
        return true;
    }

    static boolean validEtag(String etag) {
        return etag != null && etag.length() <= 256 && etag.matches("(?:W/)?\"[\\x21\\x23-\\x7E]+\"");
    }

    String version() { return tag.startsWith("v") ? tag.substring(1) : tag; }
    boolean recent(long now) { return now >= checkedAt && now - checkedAt < COOLDOWN_MS; }

    String encode() { return "1\n" + endpoint + "\n" + tag + "\n" + page + "\n" + etag + "\n" + checkedAt; }

    static ReleaseCheck cached(SharedPreferences prefs, String endpoint, long now) {
        try {
            String saved = prefs.getString(CACHE_KEY, "");
            if (saved == null || saved.length() > MAX_CACHE_CHARS) return null;
            String[] fields = saved.split("\n", -1);
            if (fields.length != 6 || !"1".equals(fields[0]) || !endpoint.equals(fields[1])) return null;
            if (!fields[4].isEmpty() && !validEtag(fields[4])) return null;
            if (!fields[5].matches("[1-9][0-9]{0,18}")) return null;
            long time = Long.parseLong(fields[5]);
            if (time > now) return null;
            return new ReleaseCheck(fields[1], fields[2], fields[3], fields[4], time);
        } catch (IOException | IllegalArgumentException | ClassCastException invalid) { return null; }
    }

    static ReleaseCheck parse(String body, String endpoint, String etag, long checkedAt) throws IOException {
        String tag = null, page = null;
        try (JsonReader reader = new JsonReader(new StringReader(body))) {
            reader.setLenient(false);
            reader.beginObject();
            while (reader.hasNext()) {
                String name = reader.nextName();
                if ("tag_name".equals(name) || "html_url".equals(name)) {
                    if (reader.peek() != JsonToken.STRING) throw new IOException("Invalid release field type");
                    if ("tag_name".equals(name)) {
                        if (tag != null) throw new IOException("Duplicate release tag");
                        tag = reader.nextString();
                    } else {
                        if (page != null) throw new IOException("Duplicate release URL");
                        page = reader.nextString();
                    }
                } else reader.skipValue();
            }
            reader.endObject();
            if (reader.peek() != JsonToken.END_DOCUMENT) throw new IOException("Trailing release data");
        }
        if (page == null) throw new IOException("Missing release URL");
        return new ReleaseCheck(endpoint, tag, page, etag, checkedAt);
    }

    /** Null when a 304 names a different ETag. The caller drops the cache so the next check is unconditional. */
    ReleaseCheck revalidated(String responseEtag, long time) throws IOException {
        if (!etag.isEmpty() && responseEtag != null && !etag.equals(responseEtag)) return null;
        return new ReleaseCheck(endpoint, tag, page, etag, time);
    }

    static long retryDeadline(SharedPreferences prefs, String endpoint, long now) {
        try {
            long saved = endpoint.equals(prefs.getString(RETRY_ENDPOINT_KEY, "")) ? Math.max(0, prefs.getLong(RETRY_KEY, 0)) : 0;
            // Nothing saved now is more than a day ahead. A later value is from an unbounded earlier version or a clock set back.
            return saved > dayAhead(now) ? 0 : saved;
        } catch (ClassCastException invalid) { return 0; }
    }

    private static long dayAhead(long now) { return now > Long.MAX_VALUE - MAX_RETRY_MS ? Long.MAX_VALUE : now + MAX_RETRY_MS; }

    static int failures(SharedPreferences prefs) {
        try { return Math.max(0, Math.min(6, prefs.getInt(FAILURES_KEY, 0))); }
        catch (ClassCastException invalid) { return 0; }
    }

    static long retryAt(HttpURLConnection conn, long now, int previousFailures) {
        long retry = -1;
        String after = conn.getHeaderField("Retry-After");
        if (after != null && after.length() <= 64) {
            try {
                long seconds = Long.parseLong(after);
                if (seconds >= 0) retry = Math.addExact(now, Math.multiplyExact(seconds, 1000));
            } catch (IllegalArgumentException | ArithmeticException invalidSeconds) {
                try { retry = ZonedDateTime.parse(after, DateTimeFormatter.RFC_1123_DATE_TIME).toInstant().toEpochMilli(); }
                catch (java.time.DateTimeException | ArithmeticException invalidDate) { }
            }
        }
        String reset = conn.getHeaderField("X-RateLimit-Reset");
        if ("0".equals(conn.getHeaderField("X-RateLimit-Remaining")) && reset != null && reset.length() <= 20) {
            try {
                long seconds = Long.parseLong(reset);
                if (seconds >= 0) retry = Math.max(retry, Math.multiplyExact(seconds, 1000));
            } catch (IllegalArgumentException | ArithmeticException invalidReset) { }
        }
        long backoff = Math.addExact(now, 60_000L << Math.min(6, previousFailures));
        // A past reset or Retry-After: 0 can't undercut the backoff, and no header parks checks for more than a day.
        return retry >= 0 ? Math.min(dayAhead(now), Math.max(backoff, retry)) : backoff;
    }
}
