// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import android.util.Log;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Answers the app's requests for one post from {@code /api/info.json?id=t3_<post>}, which Reddit refuses (403) for
 * every id, from the post's page {@code /comments/<post>.json?limit=1}, whose first element is the same listing. The
 * gallery viewer asks this way, and so does the inline v.redd.it player; so do the comment page's post refresh and
 * the reply screen's lock check for a post, which carry on without it when it fails.
 *
 * <p>Reddit sends some gallery images as {@code {"status":"failed"}} (or {@code "unprocessed"}), without sizes, and
 * the app then rejects the whole gallery. The images are still on i.redd.it as {@code <media id>.<ext>}; the
 * extension comes from the entry's type or the post's thumbnail when Reddit sends one, else from a HEAD request per
 * likely extension. An image that isn't found is left out, so the rest of the gallery shows.
 */
public final class Galleries {
    static final RequestHook.Handler HANDLER = new Handler();

    /** At most this many HEAD requests per gallery, so a gallery of lost images doesn't keep the viewer waiting. */
    static final int MAX_PROBES = 40;

    /** Every extension Reddit gives gallery images, most common first. */
    static final List<String> EXTENSIONS = Arrays.asList("jpg", "jpeg", "png", "gif", "webp");

    private Galleries() {}

    /** Turned on by the "Fix galleries" patch. */
    public static boolean isEnabled() {
        return false;
    }

    /** Whether an image exists at a URL. */
    interface Probe {
        boolean exists(String url) throws IOException;
    }

    private static final class Handler extends RequestHook.Handler {
        @Override
        protected boolean isOn() {
            return isEnabled();
        }

        @Override
        protected boolean handles(RequestHook.Request request) {
            return request.appUrl != null && request.appUrl.contains("/api/info") && postId(request.appUrl) != null;
        }

        @Override
        protected void rewrite(RequestHook.Request request) throws Exception {
            request.url = pageUrl(request.appUrl, postId(request.appUrl));
        }

        @Override
        protected InputStream response(RequestHook.Request request, InputStream body) throws Exception {
            return new ByteArrayInputStream(answer(Http.readAll(body), postId(request.appUrl), Galleries::headOk));
        }
    }

    /** The answer {@code /api/info} would give from the post's page: its listing, with a gallery repaired. */
    static byte[] answer(byte[] body, String post, Probe probe) throws JSONException {
        JSONObject listing = listing(new JSONArray(new String(body, StandardCharsets.UTF_8)), post);
        JSONObject data = listing.getJSONObject("data").getJSONArray("children").getJSONObject(0).getJSONObject("data");
        repair(data, probe);
        return listing.toString().getBytes(StandardCharsets.UTF_8);
    }

    /**
     * The post ID, lowercased, of a request for exactly one post from {@code /api/info}, or null for any other request:
     * several ids, a comment, a lookup by URL.
     */
    static String postId(String url) {
        if (url == null) return null;
        URI uri;
        try {
            uri = new URI(url);
        } catch (URISyntaxException error) {
            return null;
        }
        String path = uri.getPath();
        if (!"/api/info.json".equals(path) && !"/api/info".equals(path) && !"/api/info/".equals(path)) return null;
        Map<String, List<String>> query = query(uri.getRawQuery());
        if (query == null) return null;
        for (String key : query.keySet()) {
            if (!key.equals("id") && !key.equals("raw_json")) return null;
        }
        List<String> ids = query.get("id");
        if (ids == null || ids.size() != 1) return null;
        String id = ids.get(0).toLowerCase(Locale.ROOT);
        return id.matches("t3_[a-z0-9]+") ? id.substring(3) : null;
    }

    /** The post's page with just the post, on the app's host, as raw JSON if the app asked for that. */
    static String pageUrl(String appUrl, String post) throws URISyntaxException {
        URI app = new URI(appUrl);
        Map<String, List<String>> query = query(app.getRawQuery());
        String raw = query != null && query.containsKey("raw_json") ? "&raw_json=" + query.get("raw_json").get(0) : "";
        return app.getScheme() + "://" + app.getRawAuthority() + "/comments/" + post + ".json?limit=1" + raw;
    }

    /** The query's parameters, still encoded, or null for one that doesn't read as {@code name=value&...}. */
    private static Map<String, List<String>> query(String raw) {
        Map<String, List<String>> parameters = new LinkedHashMap<>();
        if (raw == null || raw.isEmpty()) return parameters;
        for (String pair : raw.split("&", -1)) {
            int equals = pair.indexOf('=');
            if (equals <= 0) return null;
            String name = pair.substring(0, equals);
            List<String> values = parameters.get(name);
            if (values == null) parameters.put(name, values = new ArrayList<>());
            values.add(pair.substring(equals + 1));
        }
        return parameters;
    }

    /** The page's listing of the post, checked to hold that post and nothing else, as {@code /api/info} answers. */
    static JSONObject listing(JSONArray page, String post) throws JSONException {
        JSONObject listing = page.getJSONObject(0);
        JSONArray children = listing.getJSONObject("data").getJSONArray("children");
        JSONObject first = children.getJSONObject(0);
        if (children.length() != 1 || !"t3".equals(first.optString("kind")) || !post.equals(first.getJSONObject("data").optString("id"))) {
            throw new JSONException("The page is not about post " + post);
        }
        return listing;
    }

    /**
     * Gives a gallery's images without sizes an image URL on i.redd.it, and leaves out those it finds none for. Changes
     * nothing for a post that isn't a gallery, a gallery whose images all have sizes, or one none of whose images is
     * found, which the app then reports as it would.
     */
    static void repair(JSONObject post, Probe probe) throws JSONException {
        JSONObject media = post.optJSONObject("media_metadata");
        JSONObject gallery = post.optJSONObject("gallery_data");
        JSONArray items = gallery == null ? null : gallery.optJSONArray("items");
        if (media == null || items == null) return;
        Set<String> broken = new LinkedHashSet<>();
        for (Iterator<String> keys = media.keys(); keys.hasNext(); ) {
            String key = keys.next();
            JSONObject entry = media.optJSONObject(key);
            if (entry == null || !hasImage(entry)) broken.add(key);
        }
        if (broken.isEmpty()) return;

        String thumbnail = post.optString("thumbnail", null);
        Map<String, JSONObject> found = new LinkedHashMap<>();
        Prober prober = new Prober(probe);
        for (int i = 0; i < items.length(); i++) {
            String id = items.getJSONObject(i).optString("media_id", null);
            if (id == null || !broken.contains(id) || found.containsKey(id) || !id.matches("[a-z0-9]+")) continue;
            String extension = extension(media.optJSONObject(id), id, thumbnail);
            if (extension == null) extension = prober.find(id);
            if (extension != null) found.put(id, imageEntry(id, extension));
        }

        JSONArray kept = new JSONArray();
        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.getJSONObject(i);
            String id = item.optString("media_id", null);
            if (id == null || !broken.contains(id) || found.containsKey(id)) kept.put(item);
        }
        boolean keepsAnImage = false;
        for (int i = 0; i < kept.length(); i++) {
            String id = kept.getJSONObject(i).optString("media_id", null);
            if (id != null && media.has(id)) keepsAnImage = true;
        }
        if (!keepsAnImage) return;

        for (String id : broken) {
            if (found.containsKey(id)) media.put(id, found.get(id));
            else media.remove(id);
        }
        gallery.put("items", kept);
    }

    /** Whether the app finds an image in the entry: a source, or a preview with a size. */
    static boolean hasImage(JSONObject entry) {
        if (entry.optJSONObject("s") != null) return true;
        JSONArray previews = entry.optJSONArray("p");
        if (previews == null) return false;
        for (int i = 0; i < previews.length(); i++) {
            JSONObject preview = previews.optJSONObject(i);
            if (preview != null && preview.optLong("x") * preview.optLong("y") > 0) return true;
        }
        return false;
    }

    /**
     * The image's extension from what Reddit sent: the entry's type ({@code "m":"image/png"}, which matches the
     * extension of every image Reddit lists), or the post's thumbnail, a preview named after the first image.
     */
    static String extension(JSONObject entry, String id, String thumbnail) {
        if (entry != null) {
            String type = entry.optString("m", "");
            if (type.startsWith("image/") && EXTENSIONS.contains(type.substring("image/".length()))) {
                return type.substring("image/".length());
            }
        }
        if (thumbnail == null) return null;
        try {
            URI uri = new URI(thumbnail);
            String host = uri.getHost();
            String path = uri.getPath();
            if (host == null || !(host.equals("preview.redd.it") || host.equals("i.redd.it")) || path == null) return null;
            String prefix = "/" + id + ".";
            if (!path.startsWith(prefix)) return null;
            String extension = path.substring(prefix.length());
            return EXTENSIONS.contains(extension) ? extension : null;
        } catch (URISyntaxException error) {
            return null;
        }
    }

    static String imageUrl(String id, String extension) {
        return "https://i.redd.it/" + id + "." + extension;
    }

    /** An entry the app shows: the full image as the source, its size unknown. */
    static JSONObject imageEntry(String id, String extension) throws JSONException {
        String url = imageUrl(id, extension);
        boolean animated = extension.equals("gif");
        JSONObject source = new JSONObject().put("u", url).put("x", 0).put("y", 0);
        if (animated) source.put("gif", url);
        return new JSONObject()
                .put("status", "valid")
                .put("e", animated ? "AnimatedImage" : "Image")
                .put("m", "image/" + extension)
                .put("s", source)
                .put("id", id);
    }

    /** Finds images by trying each extension, the last one that worked first, within {@link #MAX_PROBES}. */
    static final class Prober {
        private final Probe probe;
        private String last;
        private int probes;
        private boolean offline;

        Prober(Probe probe) {
            this.probe = probe;
        }

        String find(String id) {
            Set<String> order = new LinkedHashSet<>();
            if (last != null) order.add(last);
            order.addAll(EXTENSIONS);
            for (String extension : order) {
                if (offline || probes >= MAX_PROBES) return null;
                probes++;
                try {
                    if (probe.exists(imageUrl(id, extension))) {
                        last = extension;
                        return extension;
                    }
                } catch (IOException error) {
                    // Without a network the other images won't be found either.
                    Log.w(App.TAG, "Gallery image lookup failed for " + id, error);
                    offline = true;
                }
            }
            return null;
        }
    }

    /** i.redd.it answers a missing image with 404 and a placeholder image, and an existing one with 200. */
    private static boolean headOk(String url) throws IOException {
        Map<String, String> headers = new LinkedHashMap<>();
        headers.put("User-Agent", Http.systemUserAgent());
        headers.put("Accept", "image/*");
        return Http.send("HEAD", url, headers, null, false).status == 200;
    }
}
