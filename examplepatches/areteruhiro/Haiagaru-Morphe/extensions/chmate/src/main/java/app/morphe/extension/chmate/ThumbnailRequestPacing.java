package app.morphe.extension.chmate;

import android.content.Context;
import android.os.SystemClock;
import java.io.IOException;
import java.net.URI;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

final class ThumbnailRequestPacing {
    static final String DEFAULT_HOST = "bbs.animanch.com";
    private static final long INTERVAL_MS = 2000;
    private static final long DEFAULT_COOLDOWN_MS = 60000;
    private static final Map<String, Gate> HOSTS = new LinkedHashMap<>();

    interface Request<T> { T get(Gate gate) throws IOException; }

    static String host(String address) {
        try {
            String host = URI.create(address).getHost();
            return host == null ? "" : host.toLowerCase(Locale.ROOT);
        } catch (IllegalArgumentException invalid) {
            return "";
        }
    }

    static <T> T fetch(Context context, String address, Request<T> request) throws IOException {
        String host = host(address);
        if (context == null || !ThreadListThumbnailSettings.pacedHosts(context).contains(host))
            return request.get(null);
        Gate gate;
        synchronized (HOSTS) {
            gate = HOSTS.computeIfAbsent(host, ignored -> new Gate());
        }
        return gate.fetch(request);
    }

    static final class Deferred extends IOException {
        final long retryAt;
        Deferred(long retryAt) {
            super("Thumbnail requests are paused after HTTP 429");
            this.retryAt = retryAt;
        }
    }

    static final class Gate {
        private long nextRequest, retryAt;

        synchronized <T> T fetch(Request<T> request) throws IOException {
            long now = SystemClock.elapsedRealtime();
            if (retryAt > now) throw new Deferred(retryAt);
            try {
                if (nextRequest > now) Thread.sleep(nextRequest - now);
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                throw new IOException("Thumbnail request interrupted", interrupted);
            }
            nextRequest = SystemClock.elapsedRealtime() + INTERVAL_MS;
            return request.get(this);
        }

        void check(int status, String retryAfter) throws Deferred {
            if (status != 429) return;
            retryAt = SystemClock.elapsedRealtime() + retryDelay(retryAfter, System.currentTimeMillis());
            throw new Deferred(retryAt);
        }
    }

    static long retryDelay(String value, long wallTime) {
        if (value == null) return DEFAULT_COOLDOWN_MS;
        try {
            long seconds = Long.parseLong(value.trim());
            if (seconds >= 0) return Math.max(DEFAULT_COOLDOWN_MS,
                    Math.min(seconds, Long.MAX_VALUE / 2000) * 1000);
        } catch (NumberFormatException invalidNumber) {
            try {
                long target = ZonedDateTime.parse(value, DateTimeFormatter.RFC_1123_DATE_TIME)
                        .toInstant().toEpochMilli();
                return Math.max(DEFAULT_COOLDOWN_MS, target - wallTime);
            } catch (RuntimeException invalidDate) {
                // Use the default when the server does not give a usable date.
            }
        }
        return DEFAULT_COOLDOWN_MS;
    }

    private ThumbnailRequestPacing() {}
}
