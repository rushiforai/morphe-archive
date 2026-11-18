// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import android.util.Log;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Answers the app's Imgur requests from Imgur's own API. The app loads albums and single images through its
 * developer's mirror, {@code images.syncforreddit.com}, which no longer exists, and uploads through a RapidAPI proxy
 * that refuses its key (401). Its parsers already read the API's shapes. Album previews in comments and posts, which
 * came from its developer's image server, become the album cover's thumbnail ({@link ImageServer}).
 */
public final class Imgur {
    private static final String MIRROR = "https://images.syncforreddit.com/";
    private static final String ALBUM_MIRROR = MIRROR + "a/";
    private static final String IMAGE_MIRROR = MIRROR + "image/";
    private static final String UPLOAD = "https://imgur-apiv3.p.rapidapi.com/3/image";
    // Before each upload the app asks its developer's GitHub repository whether uploads are on. Anything but
    // {"enabled":true}, a failed request or a deleted file included, cancels the upload.
    private static final String UPLOAD_SWITCH =
            "https://raw.githubusercontent.com/laurencedawson/reddit-sync-development/master/api/upload.json";
    private static final byte[] UPLOAD_ON = "{\"enabled\":true}".getBytes(StandardCharsets.UTF_8);
    private static final String ALBUM_PREVIEW = ImageServer.PREFIX + "imgur-album-";
    private static final String API = "https://api.imgur.com/3/";
    // An upload sends the whole image, base64-encoded.
    private static final int UPLOAD_TIMEOUT_MS = 60_000;
    // Imgur sends no cache headers, so the app would store its answers already expired: it would ask again on every
    // open and forget the album page it was on. An hour, as the app caches its own gallery answers.
    static final String CACHE_CONTROL = "max-age=3600";

    /** Imgur's API, sent the client ID and the system's own User-Agent; a fake in tests. */
    interface Api {
        Http.Reply send(String method, String path, byte[] body, String contentType) throws Exception;
    }

    static final Api IMGUR = (method, path, body, contentType) -> {
        Map<String, String> headers = new HashMap<>();
        headers.put("Authorization", "Client-ID " + clientId());
        headers.put("User-Agent", Http.systemUserAgent());
        if (contentType != null) headers.put("Content-Type", contentType);
        return Http.send(method, API + path, headers, body, true, body == null ? Http.TIMEOUT_MS : UPLOAD_TIMEOUT_MS);
    };

    private Imgur() {}

    /** Turned on by the "Fix Imgur" patch. */
    public static boolean isEnabled() {
        return false;
    }

    /** The patch's "Imgur client ID" option. */
    public static String clientId() {
        return "";
    }

    static boolean handles(String url) {
        return url != null
                && (url.startsWith(ALBUM_MIRROR) || url.startsWith(IMAGE_MIRROR) || url.startsWith(UPLOAD)
                        || url.equals(UPLOAD_SWITCH));
    }

    /**
     * Never returns null: the app's own requests go to hosts that no longer answer, and would send its old Imgur keys.
     * A failure becomes an error response, which the app reports as a failed load or upload.
     */
    static NetworkResponse answer(Request<?> request) {
        String url = request.getUrl();
        try {
            boolean upload = url.startsWith(UPLOAD);
            byte[] body = upload ? request.getBody() : null;
            String contentType = upload ? request.getBodyContentType() : null;
            return VolleyHook.response(reply(url, body, contentType, IMGUR));
        } catch (Exception error) {
            Log.w(VolleyHook.TAG, "Imgur request failed: " + url, error);
            return VolleyHook.json(502, new byte[0]);
        }
    }

    /** Imgur's answer to the app's request: the upload switch, an upload, an image, or an album. */
    static Http.Reply reply(String url, byte[] body, String contentType, Api api) throws Exception {
        if (url.equals(UPLOAD_SWITCH)) {
            return withCacheControl(new Http.Reply(200, UPLOAD_ON, VolleyHook.jsonHeaders()), "no-store");
        }
        if (url.startsWith(UPLOAD)) {
            if (body == null) throw new IllegalArgumentException("Upload without a body");
            // The app caches every upload's answer under the same key: never let one answer the next.
            return withCacheControl(api.send("POST", "image", body, contentType), "no-store");
        }
        String id = mirrorId(url);
        if (id == null) throw new IllegalArgumentException("Unexpected Imgur URL: " + url);
        if (url.startsWith(IMAGE_MIRROR)) return cached(api.send("GET", "image/" + id, null, null));
        Http.Reply album = api.send("GET", "album/" + id, null, null);
        if (album.status != 404) return cached(album);
        // Links to a single image posted to Imgur's gallery look like album links.
        Http.Reply image = api.send("GET", "image/" + id, null, null);
        if (image.status != 200) return album;
        return cached(new Http.Reply(200, albumOf(image.body), VolleyHook.jsonHeaders()));
    }

    /**
     * The thumbnail of the album's cover for the app's preview URL of an Imgur album, {@code …?url=imgur-album-<id>},
     * or null for another preview. Throws when the album has no image to show.
     */
    static String albumPreview(String url, Api api) throws Exception {
        if (url == null || !url.startsWith(ALBUM_PREVIEW)) return null;
        String id = url.substring(ALBUM_PREVIEW.length());
        if (!isId(id)) throw new IllegalArgumentException("Unexpected Imgur album preview: " + url);
        // Glide caches the thumbnail under the preview URL, so each album is looked up once.
        return "https://i.imgur.com/" + cover(id, api) + "m.jpg";
    }

    /** The ID of the album's cover image, or of its first image if it names none. */
    private static String cover(String id, Api api) throws Exception {
        Http.Reply album = api.send("GET", "album/" + id, null, null);
        if (album.status == 200) {
            JSONObject data = data(album);
            Object cover = data.opt("cover");
            if (cover instanceof String && isId((String) cover)) return (String) cover;
            JSONArray images = data.optJSONArray("images");
            JSONObject first = images == null ? null : images.optJSONObject(0);
            Object firstId = first == null ? null : first.opt("id");
            if (firstId instanceof String && isId((String) firstId)) return (String) firstId;
            throw new IllegalStateException("Imgur album " + id + " has no images");
        }
        if (album.status != 404) throw new IllegalStateException("Imgur answered " + album.status + " for album " + id);
        // Links to a single image posted to Imgur's gallery look like album links. Check the image exists: Imgur
        // answers a missing image's thumbnail with its "removed" picture, not an error.
        Http.Reply image = api.send("GET", "image/" + id, null, null);
        if (image.status != 200) throw new IllegalStateException("Imgur answered " + image.status + " for image " + id);
        Object imageId = data(image).opt("id");
        if (imageId instanceof String && isId((String) imageId)) return (String) imageId;
        throw new IllegalStateException("Imgur image " + id + " has no ID");
    }

    private static JSONObject data(Http.Reply reply) throws JSONException {
        return new JSONObject(new String(reply.body, StandardCharsets.UTF_8)).getJSONObject("data");
    }

    private static boolean isId(String id) {
        return id.matches("[A-Za-z0-9]+");
    }

    /** A successful answer, made cacheable; others as they were. */
    private static Http.Reply cached(Http.Reply reply) {
        return reply.status == 200 ? withCacheControl(reply, CACHE_CONTROL) : reply;
    }

    private static Http.Reply withCacheControl(Http.Reply reply, String cacheControl) {
        Map<String, String> headers = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
        headers.putAll(reply.headers);
        headers.put("Cache-Control", cacheControl);
        return new Http.Reply(reply.status, reply.body, headers);
    }

    /** The ID at the end of the app's mirror URL, {@code …/a/<hash>/<id>}, or null. Imgur IDs are case-sensitive. */
    static String mirrorId(String url) {
        if (url == null || !url.startsWith(MIRROR)) return null;
        String id = url.substring(url.lastIndexOf('/') + 1);
        return isId(id) ? id : null;
    }

    /** An image response, {@code {"data":{image}}}, as an album response holding only that image. */
    static byte[] albumOf(byte[] imageResponse) throws JSONException {
        JSONObject image = new JSONObject(new String(imageResponse, StandardCharsets.UTF_8)).getJSONObject("data");
        JSONObject album = new JSONObject().put("images", new JSONArray().put(image));
        return new JSONObject().put("data", album).toString().getBytes(StandardCharsets.UTF_8);
    }

    /**
     * Called by the app's Imgur ID parser with one path segment, before it cuts the segment at the first dash. Imgur's
     * newer links put a title before the ID ({@code /gallery/funny-cat-AbC1234}), old posts' 5-character IDs included:
     * those become the ID with whatever followed it; every other segment is returned as it was.
     */
    public static String withoutTitle(String segment) {
        if (segment == null) return null;
        int end = segment.length();
        for (char stop : new char[] {'#', '?', '&', '.'}) {
            int at = segment.indexOf(stop);
            if (at >= 0 && at < end) end = at;
        }
        String name = segment.substring(0, end);
        int dash = name.lastIndexOf('-');
        if (dash <= 0) return segment;
        String id = name.substring(dash + 1);
        // Imgur's IDs have 7 characters, or 5 for old posts.
        return id.matches("[A-Za-z0-9]{5}|[A-Za-z0-9]{7}") ? id + segment.substring(end) : segment;
    }
}
