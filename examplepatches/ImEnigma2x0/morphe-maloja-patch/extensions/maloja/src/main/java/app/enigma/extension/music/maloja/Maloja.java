package app.enigma.extension.music.maloja;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Client of the ListenBrainz compatible API of a Maloja server.
 */
public class Maloja {
    private static final String API_PATH = "/apis/listenbrainz/1/";
    private static final int TIMEOUT_MILLISECONDS = 10_000;

    public static class TokenValidation {
        public final boolean valid;
        public final String userName;
        public final String message;

        TokenValidation(boolean valid, String userName, String message) {
            this.valid = valid;
            this.userName = userName;
            this.message = message;
        }
    }

    /**
     * Suffixes a user may paste along with the server URL: Maloja documents its API as
     * {@code <server>/apis/listenbrainz}, and ListenBrainz clients append {@code /1}.
     */
    private static final String[] API_SUFFIXES = {"/apis/listenbrainz/1", "/apis/listenbrainz"};

    /**
     * @return The server URL as typed by the user, reduced to the origin plus any base path,
     *         with https as the scheme, or an empty string if nothing usable was typed.
     */
    public static String normalizeBaseUrl(String serverUrl) {
        if (serverUrl == null) return "";
        String url = serverUrl.trim();
        if (url.isEmpty()) return "";

        if (url.startsWith("http://")) {
            url = "https://" + url.substring("http://".length());
        } else if (!url.startsWith("https://")) {
            url = "https://" + url;
        }

        url = stripTrailingSlashes(url);
        for (String suffix : API_SUFFIXES) {
            if (url.endsWith(suffix)) {
                url = stripTrailingSlashes(url.substring(0, url.length() - suffix.length()));
                break;
            }
        }

        return url;
    }

    private static String stripTrailingSlashes(String url) {
        while (url.endsWith("/")) {
            url = url.substring(0, url.length() - 1);
        }
        return url;
    }

    /**
     * Synchronously validates the API key against the server.
     * Must be called from a background thread.
     */
    public static TokenValidation validateToken(String serverUrl, String apiKey) throws IOException {
        Utils.verifyOffMainThread();
        final String baseUrl = normalizeBaseUrl(serverUrl);
        if (baseUrl.isEmpty()) throw new IllegalArgumentException("Server URL is missing");
        if (apiKey == null || apiKey.isBlank()) throw new IllegalArgumentException("API key is missing");

        HttpURLConnection connection = openConnection(baseUrl, "validate-token", apiKey);
        connection.setRequestMethod("GET");

        try {
            final int code = connection.getResponseCode();
            if (code == HttpURLConnection.HTTP_OK) {
                JSONObject root = new JSONObject(readBody(connection.getInputStream()));
                return new TokenValidation(
                        root.optBoolean("valid"),
                        root.optString("user_name"),
                        root.optString("message"));
            }
            return new TokenValidation(false, null, errorMessage(connection, code));
        } catch (JSONException ex) {
            throw new IOException("Unexpected response from server", ex);
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Synchronously submits a single listen.
     * Must be called from a background thread.
     */
    public static boolean scrobble(String serverUrl, String apiKey, String artist, String track,
                                   String album, int durationSeconds, long listenedAtSeconds) throws IOException {
        Utils.verifyOffMainThread();
        final String baseUrl = normalizeBaseUrl(serverUrl);
        if (baseUrl.isEmpty() || apiKey == null || apiKey.isBlank()) {
            Logger.printDebug(() -> "Cannot scrobble, Maloja server or API key not set");
            return false;
        }

        final byte[] bodyBytes = buildListen(artist, track, album, durationSeconds, listenedAtSeconds)
                .getBytes(StandardCharsets.UTF_8);
        HttpURLConnection connection = openConnection(baseUrl, "submit-listens", apiKey);
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setFixedLengthStreamingMode(bodyBytes.length);
        connection.setDoOutput(true);

        try {
            try (OutputStream output = connection.getOutputStream()) {
                output.write(bodyBytes);
            }

            final int code = connection.getResponseCode();
            if (code == HttpURLConnection.HTTP_OK) {
                return true;
            }
            final String error = errorMessage(connection, code);
            if (code == HttpURLConnection.HTTP_CONFLICT) {
                Logger.printDebug(() -> "Maloja already has a scrobble with this timestamp: " + error);
                return true;
            }
            Logger.printException(() -> "Maloja server returned code: " + code + ". Response: " + error);
            return false;
        } finally {
            connection.disconnect();
        }
    }

    static String buildListen(String artist, String track, String album,
                              int durationSeconds, long listenedAtSeconds) throws IOException {
        try {
            JSONObject metadata = new JSONObject();
            metadata.put("artist_name", artist);
            metadata.put("track_name", track);
            if (album != null && !album.isBlank()) {
                metadata.put("release_name", album);
            }

            JSONObject additionalInfo = new JSONObject();
            if (durationSeconds > 0) {
                additionalInfo.put("duration", durationSeconds);
            }
            additionalInfo.put("submission_client", "Morphe Maloja");
            additionalInfo.put("submission_client_version", Utils.getPatchesReleaseVersion());
            metadata.put("additional_info", additionalInfo);

            JSONObject listen = new JSONObject();
            listen.put("listened_at", listenedAtSeconds);
            listen.put("track_metadata", metadata);

            JSONObject request = new JSONObject();
            request.put("listen_type", "single");
            request.put("payload", new JSONArray().put(listen));
            return request.toString();
        } catch (JSONException ex) {
            throw new IOException("Could not build listen payload", ex);
        }
    }

    private static HttpURLConnection openConnection(String baseUrl, String method, String apiKey) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(baseUrl + API_PATH + method).openConnection();
        connection.setRequestProperty("User-Agent", "Morphe-Maloja/" + Utils.getPatchesReleaseVersion()
                + " (YTMusic/" + Utils.getAppVersionName() + ")");
        connection.setRequestProperty("Authorization", "Token " + apiKey);
        connection.setRequestProperty("Accept", "application/json");
        connection.setConnectTimeout(TIMEOUT_MILLISECONDS);
        connection.setReadTimeout(TIMEOUT_MILLISECONDS);
        return connection;
    }

    private static String errorMessage(HttpURLConnection connection, int code) {
        final String message = "HTTP " + code;
        InputStream errorStream = connection.getErrorStream();
        if (errorStream == null) return message;
        try {
            String body = readBody(errorStream);
            try {
                JSONObject root = new JSONObject(body);
                String error = root.optString("error", root.optString("message"));
                if (!error.isEmpty()) return message + ": " + error;
            } catch (JSONException ignored) {
            }
            if (!body.isBlank()) return message + ": " + body.trim();
        } catch (IOException ignored) {
        }
        return message;
    }

    private static String readBody(InputStream stream) throws IOException {
        StringBuilder builder = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(stream, StandardCharsets.UTF_8))) {
            char[] buffer = new char[1024];
            int read;
            while ((read = reader.read(buffer)) != -1) {
                builder.append(buffer, 0, read);
            }
        }
        return builder.toString();
    }
}
