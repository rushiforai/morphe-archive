/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.extension.syncforreddit;

import com.android.volley.NetworkResponse;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

/** Prevents further Arctic Shift requests until a reported rate-limit reset. */
@SuppressWarnings("unused")
public final class RateLimitThrottle {
    private static final String HOST = "arctic-shift.photon-reddit.com";
    private static final long FALLBACK_DELAY_MS = 60_000L;
    private static volatile long throttledUntil;

    private RateLimitThrottle() {
    }

    public static boolean isThrottled() {
        return System.currentTimeMillis() < throttledUntil;
    }

    public static void observe(String url, NetworkResponse response) {
        if (response == null) {
            return;
        }
        Map<String, String> headers = response.headers;
        observe(
                url,
                response.statusCode,
                header(headers, "X-RateLimit-Reset"),
                header(headers, "X-RateLimit-Reset-At"));
    }

    public static synchronized void observe(String url, int statusCode,
                                             String reset, String resetAtHeader) {
        if (url == null || !url.contains(HOST) || statusCode != 429) {
            return;
        }
        long now = System.currentTimeMillis();
        long resetAt = parseResetAt(resetAtHeader);
        if (resetAt <= now) {
            double seconds = parseResetSeconds(reset);
            resetAt = seconds >= 0.0
                    ? now + (long) (seconds * 1000.0)
                    : now + FALLBACK_DELAY_MS;
        }
        throttledUntil = Math.max(throttledUntil, resetAt);
    }

    private static String header(Map<String, String> headers, String name) {
        if (headers == null) {
            return null;
        }
        for (Map.Entry<String, String> entry : headers.entrySet()) {
            if (name.equalsIgnoreCase(entry.getKey())) {
                return entry.getValue();
            }
        }
        return null;
    }

    private static long parseResetAt(String value) {
        if (value == null) {
            return 0L;
        }
        try {
            long timestamp = Long.parseLong(value.trim());
            return timestamp < 10_000_000_000L ? timestamp * 1000L : timestamp;
        } catch (NumberFormatException ignored) {
            for (String pattern : new String[]{
                    "yyyy-MM-dd'T'HH:mm:ss.SSSXXX",
                    "yyyy-MM-dd'T'HH:mm:ssXXX",
                    "EEE, dd MMM yyyy HH:mm:ss zzz",
            }) {
                long timestamp = parseDate(value, pattern);
                if (timestamp > 0L) {
                    return timestamp;
                }
            }
            return 0L;
        }
    }

    private static long parseDate(String value, String pattern) {
        try {
            SimpleDateFormat format = new SimpleDateFormat(pattern, Locale.US);
            format.setTimeZone(TimeZone.getTimeZone("UTC"));
            Date date = format.parse(value.trim());
            return date == null ? 0L : date.getTime();
        } catch (ParseException ignored) {
            return 0L;
        }
    }

    private static double parseResetSeconds(String value) {
        try {
            return value == null ? -1.0 : Double.parseDouble(value.trim());
        } catch (NumberFormatException ignored) {
            return -1.0;
        }
    }
}
