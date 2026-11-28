/*
 * Personal use only. See the README for details.
 *
 * Based on the ListenBrainz client of the Morphe scrobbling patch (GPLv3).
 */

package app.big1mosha.selfhostscrobble.extension;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

/**
 * Talks to a ListenBrainz-compatible server: Koito, Maloja, or listenbrainz.org.
 */
final class ListenBrainzClient {
    private static final String TAG = "SelfHostScrobble";
    private static final String USER_AGENT = "SelfHostScrobble/1.0";

    private ListenBrainzClient() {
    }

    /**
     * Resolves the configured server into a ListenBrainz API base URL.
     *
     * <p>Accepts {@code http://host:4110}, {@code http://host:4110/apis/listenbrainz},
     * {@code .../apis/listenbrainz/1}, or a full endpoint URL.
     */
    private static String apiBase() {
        String url = Config.serverUrl().trim();
        if (url.isEmpty()) {
            return null;
        }

        if (!url.contains("://")) {
            url = "https://" + url;
        }

        url = stripTrailingSlashes(url);
        url = stripSuffix(url, "/submit-listens");
        url = stripSuffix(url, "/validate-token");
        url = stripTrailingSlashes(url);

        if (!url.endsWith("/1")) {
            url += "/1";
        }

        return url;
    }

    private static String endpoint(String path) {
        String base = apiBase();
        return base == null ? null : base + "/" + path;
    }

    private static String stripTrailingSlashes(String value) {
        String result = value;
        while (result.endsWith("/")) {
            result = result.substring(0, result.length() - 1);
        }
        return result;
    }

    private static String stripSuffix(String value, String suffix) {
        return value.endsWith(suffix)
                ? value.substring(0, value.length() - suffix.length())
                : value;
    }

    static void scrobble(String artist, String track, String album, String songId,
                         int duration, long timestamp) {
        String url = endpoint("submit-listens");
        if (url == null) {
            Log.w(TAG, "Server URL is not set, skipping scrobble");
            return;
        }

        try {
            JSONObject payload = new JSONObject();
            payload.put("listened_at", timestamp);
            payload.put("track_metadata", createTrackMetadata(artist, track, songId, album, duration));

            JSONArray payloadArray = new JSONArray();
            payloadArray.put(payload);

            JSONObject request = new JSONObject();
            request.put("listen_type", "single");
            request.put("payload", payloadArray);

            post(url, request.toString());
            Log.i(TAG, "Scrobbled '" + track + "' by " + artist);
        } catch (Throwable t) {
            Log.e(TAG, "Scrobble failed for '" + track + "' by " + artist, t);
        }
    }

    static void nowPlaying(String artist, String track, String album, String songId, int duration) {
        String url = endpoint("submit-listens");
        if (url == null) {
            Log.w(TAG, "Server URL is not set, skipping now playing");
            return;
        }

        try {
            JSONObject payload = new JSONObject();
            payload.put("track_metadata", createTrackMetadata(artist, track, songId, album, duration));

            JSONArray payloadArray = new JSONArray();
            payloadArray.put(payload);

            JSONObject request = new JSONObject();
            request.put("listen_type", "playing_now");
            request.put("payload", payloadArray);

            post(url + "?return_msid=true", request.toString());
            Log.d(TAG, "Updated now playing to '" + track + "'");
        } catch (Throwable t) {
            Log.e(TAG, "Now playing failed for '" + track + "'", t);
        }
    }

    private static JSONObject createTrackMetadata(String artist, String track, String songId,
                                                  String album, int duration) throws Exception {
        JSONObject metadata = new JSONObject();
        metadata.put("artist_name", artist);
        metadata.put("track_name", track);

        if (album != null && !album.trim().isEmpty()) {
            metadata.put("release_name", album);
        }

        JSONObject info = new JSONObject();
        if (duration > 0) {
            // Koito reads duration_ms, Maloja reads duration.
            info.put("duration_ms", (long) duration * 1000L);
            info.put("duration", duration);
        }
        if (songId != null && !songId.trim().isEmpty()) {
            info.put("origin_url", "https://music.youtube.com/watch?v=" + songId);
        }
        info.put("submission_client", "SelfHostScrobble");
        info.put("submission_client_version", "1.0");

        metadata.put("additional_info", info);
        return metadata;
    }

    private static void post(String url, String body) throws Exception {
        Log.d(TAG, "POST " + url);

        byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();

        try {
            connection.setRequestMethod("POST");
            connection.setRequestProperty("User-Agent", USER_AGENT);
            connection.setRequestProperty("Authorization", "Token " + Config.token());
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setFixedLengthStreamingMode(bytes.length);
            connection.setDoOutput(true);
            connection.setConnectTimeout(10000);
            connection.setReadTimeout(10000);

            try (OutputStream output = connection.getOutputStream()) {
                output.write(bytes);
            }

            int code = connection.getResponseCode();
            if (code >= 200 && code < 300) {
                return;
            }

            throw new IllegalStateException(
                    "Server returned HTTP " + code + " for " + url
                            + " (" + readError(connection) + ")"
            );
        } finally {
            connection.disconnect();
        }
    }

    private static String readError(HttpURLConnection connection) {
        java.io.InputStream stream = connection.getErrorStream();
        if (stream == null) {
            return "no body";
        }

        try (java.io.ByteArrayOutputStream buffer = new java.io.ByteArrayOutputStream()) {
            byte[] chunk = new byte[1024];
            int read;
            while ((read = stream.read(chunk)) != -1) {
                buffer.write(chunk, 0, read);
            }
            String body = buffer.toString(StandardCharsets.UTF_8.name());
            return body.isEmpty() ? "empty body" : body;
        } catch (Throwable t) {
            return "unreadable body";
        }
    }
}
