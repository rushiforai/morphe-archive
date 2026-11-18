// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import android.util.Log;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Answers the app's gallery request, {@code GET /api/info.json?id=t3_<post>}, which Reddit refuses this client (403),
 * from the post's own page {@code /comments/<post>}, which it still serves. The page's first element is the same
 * listing, holding the post with its {@code gallery_data} and {@code media_metadata}.
 */
public final class Galleries {
    private static final String API = "https://oauth.reddit.com/";
    private static final String ENDPOINT = API + "api/info.json?id=t3_";

    private Galleries() {}

    /** Turned on by the "Fix galleries" patch. */
    public static boolean isEnabled() {
        return false;
    }

    static boolean handles(String url) {
        return url != null && url.startsWith(ENDPOINT);
    }

    /**
     * Never returns null: the app's own request would only get Reddit's 403. A failure becomes an error response, which
     * the app reports as "Error loading album".
     */
    static NetworkResponse answer(Request<?> request) {
        String url = request.getUrl();
        try {
            String post = postId(url);
            if (post == null) throw new IllegalArgumentException("Unexpected gallery URL: " + url);
            Http.Reply reply = Http.send("GET", pageUrl(post), request.getHeaders(), null, true);
            if (reply.status != 200) return VolleyHook.response(reply);
            JSONArray page = new JSONArray(new String(reply.body, StandardCharsets.UTF_8));
            return VolleyHook.json(200, listing(page, post).toString().getBytes(StandardCharsets.UTF_8));
        } catch (Exception error) {
            Log.w(VolleyHook.TAG, "Gallery request failed: " + url, error);
            return VolleyHook.json(502, new byte[0]);
        }
    }

    /** The post ID from the app's URL, lowercased, or null if it isn't base 36. */
    static String postId(String url) {
        if (!handles(url)) return null;
        String id = url.substring(ENDPOINT.length()).toLowerCase(Locale.ROOT);
        return id.matches("[a-z0-9]+") ? id : null;
    }

    /** The post's page with just the post: the app reads only the listing. */
    static String pageUrl(String post) {
        return API + "comments/" + post + ".json?limit=1";
    }

    /** The page's listing of the post, checked to hold that post, as {@code /api/info} would answer it. */
    static JSONObject listing(JSONArray page, String post) throws JSONException {
        JSONObject listing = page.getJSONObject(0);
        JSONArray children = listing.getJSONObject("data").getJSONArray("children");
        JSONObject first = children.getJSONObject(0);
        if (!"t3".equals(first.optString("kind")) || !post.equals(first.getJSONObject("data").optString("id"))) {
            throw new JSONException("The page is not about post " + post);
        }
        return listing;
    }
}
