/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-17.
 * Modified by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.misc.requests;

import android.content.Context;
import android.os.Build;

import androidx.annotation.Nullable;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.Map;

import app.morphe.extension.shared.innertube.utils.AuthUtils;
import app.morphe.extension.shared.requests.Requester;

// share the app-authenticated browse transport with playlist downloads,
// and the same transport for "next", whose lock-screen metadata names each downloaded track.
public final class MusicBrowseRequest {
    private MusicBrowseRequest() {}

    public static JSONObject browse(Context context, String browseId,
                                    @Nullable String continuation, @Nullable String fields)
            throws IOException, JSONException {
        JSONObject body = new JSONObject().put("context", context(context));
        body.put(continuation == null ? "browseId" : "continuation",
                continuation == null ? browseId : continuation);
        String query = fields == null ? "" : "&fields=" + URLEncoder.encode(fields, StandardCharsets.UTF_8.name());
        try {
            return post(context, "browse", body, query);
        } catch (BadRequestException ex) {
            // The AA field mask is an optimisation, never a requirement for browsing.
            if (fields != null) return browse(context, browseId, continuation, null);
            throw ex;
        }
    }

    /** The same authenticated browse, in the format used by Music's native page renderer. */
    public static byte[] browseNative(Context context, String browseId, @Nullable String continuation)
            throws IOException, JSONException {
        JSONObject body = new JSONObject().put("context", context(context));
        body.put(continuation == null ? "browseId" : "continuation",
                continuation == null ? browseId : continuation);
        HttpURLConnection connection = openPost(context, "browse", body, "&alt=proto");
        Requester.ConnectionProvider route = Requester.scopedConnection();
        try {
            String type = connection.getContentType();
            if (type == null || !type.startsWith("application/x-protobuf")) {
                throw new IOException("Music browse did not return a native response");
            }
            try (InputStream input = connection.getInputStream()) {
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                byte[] buffer = new byte[32 * 1024];
                int count;
                while ((count = input.read(buffer)) != -1) {
                    if (route != null && route.cancelled()) throw new IOException("Music browse was cancelled");
                    if (output.size() + count > 32 * 1024 * 1024) {
                        throw new IOException("Music browse exceeds 32 MiB");
                    }
                    output.write(buffer, 0, count);
                }
                return output.toByteArray();
            }
        } finally {
            connection.disconnect();
        }
    }

    /** Music's watch response for one video; its lock-screen renderer is Music's own track metadata. */
    public static JSONObject next(Context context, String videoId) throws IOException, JSONException {
        return post(context, "next", new JSONObject().put("context", context(context)).put("videoId", videoId), "");
    }

    /**
     * Music's watch response for the given request fields (a video, a
     * playlist, a continuation, ...), sent exactly as {@link #next(Context, String)} and {@link #browse} are.
     */
    public static JSONObject nextWith(Context context, JSONObject fields) throws IOException, JSONException {
        return requestWith(context, "next", fields);
    }

    /** Uses the same authenticated Android Music transport for a server-supplied playlist edit. */
    public static JSONObject editPlaylist(Context context, JSONObject fields) throws IOException, JSONException {
        return requestWith(context, "browse/edit_playlist", fields);
    }

    private static JSONObject requestWith(Context context, String endpoint, JSONObject fields)
            throws IOException, JSONException {
        JSONObject body = new JSONObject().put("context", context(context));
        java.util.Iterator<String> keys = fields.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            body.put(key, fields.get(key));
        }
        return post(context, endpoint, body, "");
    }

    private static final class BadRequestException extends IOException {
        BadRequestException() {
            super("Music request HTTP 400");
        }
    }

    private static String version(Context context) throws IOException {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (Exception ex) {
            throw new IOException("Cannot determine Music client version", ex);
        }
    }

    private static JSONObject context(Context context) throws IOException, JSONException {
        Locale locale = Locale.getDefault();
        JSONObject client = new JSONObject()
                .put("clientName", "ANDROID_MUSIC").put("clientVersion", version(context))
                .put("osName", "Android").put("osVersion", Build.VERSION.RELEASE)
                .put("androidSdkVersion", Build.VERSION.SDK_INT).put("hl", locale.toLanguageTag());
        if (!locale.getCountry().isEmpty()) client.put("gl", locale.getCountry());
        return new JSONObject().put("client", client);
    }

    private static JSONObject post(Context context, String endpoint, JSONObject body, String query)
            throws IOException, JSONException {
        HttpURLConnection connection = openPost(context, endpoint, body, query);
        try {
            JSONObject response = Requester.parseJSONObject(connection);
            if (response.has("error")) throw new IOException("Music " + endpoint + " returned an error");
            return response;
        } finally {
            connection.disconnect();
        }
    }

    private static HttpURLConnection openPost(Context context, String endpoint, JSONObject body, String query)
            throws IOException {
        String version = version(context);
        String url = "https://youtubei.googleapis.com/youtubei/v1/" + endpoint + "?prettyPrint=false" + query;
        HttpURLConnection connection = Requester.openDirectConnection(new URL(url));
        boolean accepted = false;
        try {
            connection.setRequestMethod("POST");
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(30_000);
            connection.setUseCaches(false);
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("User-Agent", "com.google.android.apps.youtube.music/" + version
                    + " (Linux; U; Android " + Build.VERSION.RELEASE + ") gzip");
            connection.setRequestProperty("X-YouTube-Client-Name", "21");
            connection.setRequestProperty("X-YouTube-Client-Version", version);
            for (Map.Entry<String, String> header : AuthUtils.getRequestHeader().entrySet()) {
                if (header.getValue() != null && !header.getValue().isEmpty()) {
                    connection.setRequestProperty(header.getKey(), header.getValue());
                }
            }
            byte[] payload = body.toString().getBytes(StandardCharsets.UTF_8);
            connection.setFixedLengthStreamingMode(payload.length);
            try (OutputStream output = connection.getOutputStream()) {
                output.write(payload);
            }
            int status = connection.getResponseCode();
            if (status == HttpURLConnection.HTTP_BAD_REQUEST) throw new BadRequestException();
            if (status != HttpURLConnection.HTTP_OK) throw new IOException("Music " + endpoint + " HTTP " + status);
            accepted = true;
            return connection;
        } finally {
            if (!accepted) connection.disconnect();
        }
    }
}
