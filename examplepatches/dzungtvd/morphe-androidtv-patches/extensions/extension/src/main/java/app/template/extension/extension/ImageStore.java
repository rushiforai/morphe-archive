package app.template.extension.extension;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Caches image-post albums read from raw TikTok Lite responses. */
@SuppressWarnings("unused")
public final class ImageStore {

    private static final String TAG = "TikTokTVImagePost";

    private static final int MAX_ENTRIES = 120;

    /** Item lists run about a megabyte; anything far above that is not a payload worth parsing. */
    private static final long MAX_BODY_BYTES = 8L << 20;

    private static final Map<String, List<String>> IMAGES = Collections.synchronizedMap(
            new LinkedHashMap<String, List<String>>(64, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, List<String>> eldest) {
                    return size() > MAX_ENTRIES;
                }
            });

    private ImageStore() {
    }

    /** Called with the raw response object, whose a() is the request url and whose e() is the body. */
    public static void scan(Object response) {
        if (response == null) return;

        try {
            Object url = response.getClass().getMethod("a").invoke(response);
            if (!(url instanceof String)) return;

            String requestUrl = (String) url;
            Subtitles.noteOrigin(requestUrl);
            String path = scannedPath(requestUrl);
            if (path == null) return;

            Object body = response.getClass().getMethod("e").invoke(response);
            if (body == null) return;

            Object size = body.getClass().getMethod("length").invoke(body);
            if (size instanceof Number && ((Number) size).longValue() > MAX_BODY_BYTES) return;

            Object bytes = body.getClass().getMethod("getBytes").invoke(body);
            if (!(bytes instanceof byte[])) return;

            String json = new String((byte[]) bytes, "UTF-8");
            Subtitles.scan(path, json);
            if (!json.contains("\"image_post_info\"")) return;

            int[] stored = remember(new JSONObject(json).optJSONArray("aweme_list"));
            if (stored[0] > 0) {
                Log.i(TAG, "captured " + stored[0] + " albums from " + path
                        + ", largest " + stored[1] + " pictures");
            }
        } catch (Throwable ignored) {
            // A moved accessor means the response shape changed; the renderer keeps using covers.
        }
    }

    /** @return the post's pictures in posting order, or null when this post is not an album. */
    public static List<String> imagesOf(String awemeId) {
        return awemeId == null ? null : IMAGES.get(awemeId);
    }

    /** @return the endpoint that serves this url, without its query, or null when unscanned. */
    private static String scannedPath(String url) {
        return Subtitles.scannedPath(url);
    }

    /** @return how many image posts the page carried, and how large its biggest album is. */
    private static int[] remember(JSONArray awemes) {
        if (awemes == null) return new int[2];

        int stored = 0;
        int largest = 0;

        for (int i = 0; i < awemes.length(); i++) {
            JSONObject aweme = awemes.optJSONObject(i);
            if (aweme == null) continue;

            JSONArray images = object(aweme, "image_post_info", "images");
            if (images == null || images.length() == 0) continue;

            List<String> urls = new ArrayList<>(images.length());
            for (int j = 0; j < images.length(); j++) {
                JSONObject image = images.optJSONObject(j);
                if (image == null) continue;

                String url = firstUrl(object(image, "display_image"));
                if (url == null) url = firstUrl(object(image, "thumbnail"));
                if (url != null) urls.add(url);
            }

            String id = aweme.optString("aweme_id");
            if (id.isEmpty() || urls.isEmpty()) continue;

            IMAGES.put(id, urls);
            stored++;
            largest = Math.max(largest, urls.size());
        }
        return new int[]{stored, largest};
    }

    /** Walks two levels of keys, tolerating either being absent. */
    private static JSONArray object(JSONObject parent, String key, String arrayKey) {
        JSONObject child = parent.optJSONObject(key);
        return child == null ? null : child.optJSONArray(arrayKey);
    }

    private static JSONObject object(JSONObject parent, String key) {
        return parent.optJSONObject(key);
    }

    private static String firstUrl(JSONObject urlModel) {
        if (urlModel == null) return null;

        JSONArray urls = urlModel.optJSONArray("url_list");
        if (urls == null || urls.length() == 0) return null;

        String url = urls.optString(0);
        return url.isEmpty() ? null : url;
    }
}
