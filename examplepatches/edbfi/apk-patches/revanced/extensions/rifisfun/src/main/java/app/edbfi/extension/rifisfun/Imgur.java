// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import android.net.Uri;
import android.util.Log;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Loads the app's Imgur albums and album thumbnails from Imgur's own API. The app asked its developer's proxy,
 * {@code api.redditisfun.com/api/imgur/3/…}, whose host no longer exists. Its parser already reads the API's album
 * shape.
 */
public final class Imgur {
    private static final String API = "https://api.imgur.com/3/";
    // The path of the proxy's album URLs, which the album viewer builds: …/album/<id> or …/gallery/album/<id>.
    private static final String PROXY_PATH = "/api/imgur/3/";

    /** Imgur's API, sent the client ID and the system's own User-Agent; a fake in tests. */
    interface Api {
        Http.Reply get(String path) throws Exception;
    }

    static final Api IMGUR = path -> {
        Map<String, String> headers = new HashMap<>();
        headers.put("Authorization", "Client-ID " + clientId());
        headers.put("User-Agent", Http.systemUserAgent());
        return Http.send("GET", API + path, headers, null);
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

    /**
     * Called by the album viewer, on its background thread, in place of its request to the proxy URL it built. Returns
     * the album response for its parser, or null for a failed load, which it reports.
     */
    public static InputStream album(Uri proxyUrl) {
        String url = String.valueOf(proxyUrl);
        if (!isEnabled()) return null;
        try {
            return new ByteArrayInputStream(album(proxyAlbumId(url), IMGUR));
        } catch (Exception error) {
            Log.w(App.TAG, "Imgur album failed: " + url, error);
            return null;
        }
    }

    /** Called by the album viewer when its parser rejects the album {@link #album(Uri)} returned. */
    public static void parseFailed(Throwable error) {
        Log.w(App.TAG, "Imgur album didn't parse", error);
    }

    /**
     * Called by the album thumbnail loader, on its background thread, in place of its request to the proxy. Returns the
     * thumbnail URL of the album's cover for an Imgur album link, or null for none, which it reports as a failed load.
     */
    public static String cover(Uri link) {
        String url = String.valueOf(link);
        if (!isEnabled()) return null;
        try {
            return "https://i.imgur.com/" + cover(linkAlbumId(url), IMGUR) + "l.jpg";
        } catch (Exception error) {
            Log.w(App.TAG, "Imgur album cover failed: " + url, error);
            return null;
        }
    }

    /** The album's response, {@code {"data":{album}}}, or an album holding only the image of that ID. */
    static byte[] album(String id, Api api) throws Exception {
        Http.Reply album = api.get("album/" + id);
        if (album.status == 200) return album.body;
        if (album.status != 404) throw new IllegalStateException("Imgur answered " + album.status + " for album " + id);
        // Single images posted to Imgur's gallery have gallery links, which the app opens as albums.
        Http.Reply image = api.get("image/" + id);
        if (image.status != 200) throw new IllegalStateException("Imgur answered " + image.status + " for image " + id);
        return albumOf(image.body);
    }

    /** The ID of the album's cover image, or of its first image if it names none. */
    static String cover(String id, Api api) throws Exception {
        Http.Reply album = api.get("album/" + id);
        if (album.status == 200) {
            JSONObject data = data(album.body);
            Object cover = data.opt("cover");
            if (cover instanceof String && isId((String) cover)) return (String) cover;
            JSONArray images = data.optJSONArray("images");
            JSONObject first = images == null ? null : images.optJSONObject(0);
            Object firstId = first == null ? null : first.opt("id");
            if (firstId instanceof String && isId((String) firstId)) return (String) firstId;
            throw new IllegalStateException("Imgur album " + id + " has no images");
        }
        if (album.status != 404) throw new IllegalStateException("Imgur answered " + album.status + " for album " + id);
        // A single image in the gallery. Check it exists: Imgur answers a missing image's thumbnail with its "removed"
        // picture, not an error.
        Http.Reply image = api.get("image/" + id);
        if (image.status != 200) throw new IllegalStateException("Imgur answered " + image.status + " for image " + id);
        Object imageId = data(image.body).opt("id");
        if (imageId instanceof String && isId((String) imageId)) return (String) imageId;
        throw new IllegalStateException("Imgur image " + id + " has no ID");
    }

    /**
     * An image response, {@code {"data":{image}}}, as an album response holding only that image. The viewer keys the
     * album by its ID and crashes without one, so it gets the image's.
     */
    static byte[] albumOf(byte[] imageResponse) throws JSONException {
        JSONObject image = data(imageResponse);
        Object id = image.opt("id");
        if (!(id instanceof String) || !isId((String) id)) throw new JSONException("Imgur image without an ID");
        JSONObject album = new JSONObject().put("id", id).put("cover", id);
        for (String key : new String[] {"datetime", "nsfw", "account_url"}) {
            if (image.has(key)) album.put(key, image.get(key));
        }
        album.put("images", new JSONArray().put(image));
        return new JSONObject().put("data", album).toString().getBytes(StandardCharsets.UTF_8);
    }

    private static JSONObject data(byte[] response) throws JSONException {
        return new JSONObject(new String(response, StandardCharsets.UTF_8)).getJSONObject("data");
    }

    /** The album ID at the end of the viewer's proxy URL, …/api/imgur/3/(gallery/)album/<id>. */
    static String proxyAlbumId(String url) {
        List<String> segments = segments(url);
        String path = "/" + String.join("/", segments) + "/";
        int size = segments.size();
        if (!path.startsWith(PROXY_PATH) || size < 5 || !"album".equals(segments.get(size - 2))) {
            throw new IllegalArgumentException("Unexpected Imgur album URL: " + url);
        }
        return id(segments.get(size - 1), url);
    }

    /**
     * The album ID of an Imgur album link, as the app reads it: {@code /a/<id>}, {@code /gallery/<id>} or
     * {@code /t/<tag>/<id>}.
     */
    static String linkAlbumId(String url) {
        List<String> segments = segments(url);
        String segment = null;
        if (segments.size() >= 2 && ("a".equals(segments.get(0)) || "gallery".equals(segments.get(0)))) {
            segment = segments.get(1);
        } else if (segments.size() >= 3 && "t".equals(segments.get(0))) {
            segment = segments.get(2);
        }
        if (segment == null) throw new IllegalArgumentException("Not an Imgur album link: " + url);
        return id(segment, url);
    }

    private static String id(String segment, String url) {
        String id = withoutTitle(segment);
        int dot = id.indexOf('.');
        if (dot >= 0) id = id.substring(0, dot);
        if (!isId(id)) throw new IllegalArgumentException("No Imgur ID in " + url);
        return id;
    }

    private static List<String> segments(String url) {
        String path;
        try {
            path = new URI(url).getPath();
        } catch (URISyntaxException error) {
            throw new IllegalArgumentException("Bad URL: " + url, error);
        }
        List<String> segments = new ArrayList<>();
        if (path == null) return segments;
        for (String segment : Arrays.asList(path.split("/"))) {
            if (!segment.isEmpty()) segments.add(segment);
        }
        return segments;
    }

    private static boolean isId(String id) {
        return id.matches("[A-Za-z0-9]+");
    }

    /**
     * Newer Imgur links put a title before the ID ({@code /a/funny-cat-AbC1234}), which the app takes for the ID.
     * Returns the ID with whatever followed it, such as an extension; every other segment as it was.
     */
    static String withoutTitle(String segment) {
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
