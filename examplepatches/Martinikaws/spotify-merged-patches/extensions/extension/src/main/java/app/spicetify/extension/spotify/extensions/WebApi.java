package app.spicetify.extension.spotify.extensions;

import android.util.Log;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Spotify's Web API, for the one job the bridge can't do: a search across the whole catalog. Its
 * token comes from the core, over the bridge, the way the app's own Web API calls get theirs. A
 * request blocks, so it runs on the Web API thread, never the bridge thread, and the real one keeps
 * to the Web API's pace ({@link Paced}).
 */
final class WebApi {
    static final String TOKEN_URI = "sp://auth/v2/token?renew=0";
    private static final int TIMEOUT_MILLIS = 15_000;
    /** One daemon thread, parked while idle, for the requests. */
    private static final ExecutorService NETWORK = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "Spicetify Web API");
        thread.setDaemon(true);
        return thread;
    });

    /**
     * A GET with a bearer token: the body of a 200 answer, or an IOException, a {@link RateLimited}
     * for a 429. It blocks.
     */
    interface Http {
        String get(String url, String token) throws IOException;
    }

    /** Time for {@link Paced}: a clock in milliseconds that never goes back, and a sleep. */
    interface Clock {
        long millis();

        void sleep(long millis) throws InterruptedException;
    }

    /** The real GET, at the Web API's pace, which {@link #get} runs on the Web API thread. */
    static final Http HTTP = new Paced(WebApi::blockingGet, new Clock() {
        @Override
        public long millis() {
            return TimeUnit.NANOSECONDS.toMillis(System.nanoTime());
        }

        @Override
        public void sleep(long millis) throws InterruptedException {
            Thread.sleep(millis);
        }
    });

    /** The first track of a search, or null when the page was empty, and how many tracks matched. */
    static final class SearchResult {
        String trackUri;
        int total;
    }

    /**
     * A 429, or a request {@link Paced} held back: the seconds to wait, and whether the quota is used
     * up for the session. Its message never holds the token.
     */
    static final class RateLimited extends IOException {
        final long retryAfterSeconds;
        final boolean quotaExceeded;

        RateLimited(String message, long retryAfterSeconds, boolean quotaExceeded) {
            super(message);
            this.retryAfterSeconds = retryAfterSeconds;
            this.quotaExceeded = quotaExceeded;
        }
    }

    /**
     * The Web API's budget: one request at a time and one a second at most, none until a 429's
     * Retry-After has passed, and none for the rest of the session after a 429 that says
     * QUOTA_EXCEEDED. The pace is waited out on the calling thread, while a request that a pause or
     * the stop holds back fails at once, so no caller sits out a long pause.
     */
    static final class Paced implements Http {
        private static final long SPACING_MILLIS = 1000;
        private final Http http;
        private final Clock clock;
        /** When the next request may go. */
        private long nextAt; // guarded by this
        /** When a 429's Retry-After ends. */
        private long pausedUntil; // guarded by this
        /** A 429 said QUOTA_EXCEEDED: nothing more this session. */
        private boolean stopped; // guarded by this

        Paced(Http http, Clock clock) {
            this.http = http;
            this.clock = clock;
            nextAt = pausedUntil = clock.millis(); // the clock may start anywhere
        }

        @Override
        public synchronized String get(String url, String token) throws IOException {
            if (stopped) {
                throw new RateLimited("the Web API quota is used up (QUOTA_EXCEEDED) until Spotify restarts", 0, true);
            }
            long paused = pausedUntil - clock.millis();
            if (paused > 0) {
                long seconds = TimeUnit.MILLISECONDS.toSeconds(paused + 999);
                throw new RateLimited("the Web API asked to wait " + seconds + " s more", seconds, false);
            }
            long wait = nextAt - clock.millis();
            if (wait > 0) {
                try {
                    clock.sleep(wait);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    throw new InterruptedIOException("interrupted while waiting for the Web API's pace");
                }
            }
            nextAt = clock.millis() + SPACING_MILLIS;
            try {
                return http.get(url, token);
            } catch (RateLimited e) {
                if (e.quotaExceeded) stopped = true;
                pausedUntil = clock.millis() + TimeUnit.SECONDS.toMillis(e.retryAfterSeconds);
                throw e;
            }
        }
    }

    private WebApi() {}

    /** Asks the core for a token. {@code result} gets its UTF-8 bytes, or why not, on the bridge thread. */
    static void token(PlayerBridge.Result result) {
        PlayerBridge.get(TOKEN_URI, new PlayerBridge.Result() {
            @Override
            public void done(byte[] body) {
                String token;
                try {
                    token = parseToken(new String(body, StandardCharsets.UTF_8));
                } catch (Throwable e) {
                    result.failed(e.getMessage() != null ? e.getMessage() : e.toString());
                    return;
                }
                result.done(token.getBytes(StandardCharsets.UTF_8));
            }

            @Override
            public void failed(String reason) {
                result.failed(reason);
            }
        });
    }

    /**
     * A {@code TokenResponse}'s {@code accessToken}. An {@code errorCode} above 0 fails, as it does in
     * the app. No failure quotes the answer, since the answer holds the token.
     */
    static String parseToken(String json) throws IOException {
        JSONObject response;
        try {
            response = new JSONObject(json);
        } catch (JSONException e) {
            // Not e's message: org.json quotes its whole input there.
            throw new IOException("sp://auth/v2/token gave an answer that isn't a JSON object");
        }
        int error = response.optInt("errorCode");
        if (error > 0) {
            throw new IOException("sp://auth/v2/token responded with an error: " + error + ", "
                    + response.optString("errorDescription"));
        }
        String token = response.optString("accessToken");
        if (token.isEmpty()) throw new IOException("sp://auth/v2/token gave no access token");
        for (int i = 0; i < token.length(); i++) {
            char c = token.charAt(i);
            // A header can't carry it, and the exception that would say so quotes the header.
            if (c < 0x20 || c > 0x7e) {
                throw new IOException("sp://auth/v2/token gave a token with a character outside printable ASCII");
            }
        }
        return token;
    }

    /** One track matching {@code query}, at {@code offset}, in the market of the token's user. */
    static String searchUrl(String query, int offset) {
        try {
            return "https://api.spotify.com/v1/search?q=" + URLEncoder.encode(query, "UTF-8")
                    + "&type=track&limit=1&offset=" + offset + "&market=from_token";
        } catch (UnsupportedEncodingException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    static SearchResult parseSearch(String json) throws JSONException {
        JSONObject tracks = new JSONObject(json).getJSONObject("tracks");
        SearchResult result = new SearchResult();
        result.total = tracks.optInt("total");
        JSONArray items = tracks.optJSONArray("items");
        JSONObject first = items == null ? null : items.optJSONObject(0);
        String uri = first == null ? "" : first.optString("uri");
        if (!uri.isEmpty()) result.trackUri = uri;
        return result;
    }

    /**
     * GETs {@code url} through {@code http} on the Web API thread. {@code result} gets the body's
     * UTF-8 bytes, or why not, back on the bridge thread.
     */
    static void get(Http http, String url, String token, PlayerBridge.Result result) {
        NETWORK.execute(() -> {
            try {
                PlayerBridge.post(answer(http, url, token, result));
            } catch (Throwable e) {
                Log.w("Spicetify", "Couldn't hand a Web API answer to the bridge", e);
            }
        });
    }

    /** On the Web API thread: runs the GET, and returns what the bridge thread does with its outcome. */
    private static Runnable answer(Http http, String url, String token, PlayerBridge.Result result) {
        try {
            byte[] body = http.get(url, token).getBytes(StandardCharsets.UTF_8);
            return () -> result.done(body);
        } catch (Throwable e) {
            Log.w("Spicetify", "A Web API request failed", e);
            String reason = e.getMessage() != null ? e.getMessage() : e.toString();
            return () -> result.failed(reason);
        }
    }

    /** The GET itself, with no pace: {@link #HTTP} paces it. */
    static String blockingGet(String url, String token) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        try {
            connection.setConnectTimeout(TIMEOUT_MILLIS);
            connection.setReadTimeout(TIMEOUT_MILLIS);
            connection.setRequestProperty("Authorization", "Bearer " + token);
            int status = connection.getResponseCode();
            if (status == 429) throw rateLimited(connection);
            if (status != HttpURLConnection.HTTP_OK) throw new IOException("the Web API answered HTTP " + status);
            try (InputStream input = connection.getInputStream()) {
                return read(input);
            }
        } finally {
            connection.disconnect();
        }
    }

    /**
     * A 429's {@code Retry-After} in seconds, and whether its body's {@code error.reason} is
     * QUOTA_EXCEEDED, which the Web API sends since July 2026. A header or body that can't be read
     * counts as absent. Neither holds the token.
     */
    private static RateLimited rateLimited(HttpURLConnection connection) {
        long seconds = 0;
        String retryAfter = connection.getHeaderField("Retry-After");
        if (retryAfter != null) {
            try {
                seconds = Math.max(0, Long.parseLong(retryAfter.trim()));
            } catch (NumberFormatException dateOrJunk) {
                // ponytail: an HTTP date, which the Web API doesn't send, counts as no Retry-After.
            }
        }
        boolean quota = false;
        try (InputStream body = connection.getErrorStream()) {
            JSONObject error = body == null ? null : new JSONObject(read(body)).optJSONObject("error");
            quota = error != null && "QUOTA_EXCEEDED".equals(error.optString("reason"));
        } catch (IOException | JSONException unreadable) {
            // No body to read: a plain 429.
        }
        return new RateLimited("the Web API answered HTTP 429" + (quota ? " (QUOTA_EXCEEDED)" : "")
                + (seconds > 0 ? ", retry after " + seconds + " s" : ""), seconds, quota);
    }

    private static String read(InputStream input) throws IOException {
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        for (int read; (read = input.read(buffer)) != -1; ) body.write(buffer, 0, read);
        return new String(body.toByteArray(), StandardCharsets.UTF_8);
    }
}
