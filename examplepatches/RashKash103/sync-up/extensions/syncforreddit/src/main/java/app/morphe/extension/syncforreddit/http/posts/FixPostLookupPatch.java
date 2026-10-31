package app.morphe.extension.syncforreddit.http.posts;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Answers a post looked up by id from the thread endpoint, since Reddit stopped answering the
 * one Sync asks.
 *
 * <p>Sync resolves a post by its fullname through {@code /api/info}, and its album viewer is
 * built on that: {@code MultiImageActivity} asks for the post to read the pictures out of its
 * gallery. Reddit now refuses that endpoint, and {@code /by_id} beside it, with the same block
 * page it serves anyone it will not answer, so an album cannot be opened at all. Ordinary
 * listings are untouched, and so is {@code /r/<sub>/comments/<id>}, which carries the very same
 * post object including the {@code gallery_data} and {@code media_metadata} the viewer reads.
 *
 * <p>So the ask is reissued against the thread and the reply cut back to the shape
 * {@code /api/info} had. A thread comes back as two listings, the post and its comments; only
 * the first is wanted, and {@code limit=1} keeps the second from being built for nothing.
 *
 * <p>This stays correct if Reddit starts answering again: the thread endpoint is not a stand-in
 * that degrades, it is where the same object is published.
 *
 * @noinspection unused
 */
public class FixPostLookupPatch extends PatchedditInterceptor {
    private static final String HOST = "oauth.reddit.com";

    /** The prefix of a link's fullname. Only a link is published under a thread. */
    private static final String LINK_PREFIX = "t3_";

    /**
     * Sync asks about one post at a time, from both of the two places it asks from. The cap is
     * only so that something unexpected cannot turn one ask into a burst of requests.
     */
    private static final int MOST_IDS = 8;

    @Override
    public boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    @NonNull
    @Override
    protected Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        HttpUrl url = request.url();

        if (!HOST.equals(url.host()) || !isLookup(url.encodedPath())) {
            return chain.proceed(request);
        }

        List<String> ids = linkIds(url.queryParameter("id"));
        if (ids.isEmpty()) {
            // Something other than posts was asked about, which a thread cannot answer. Passed
            // on as it was rather than guessed at: it fails the way it would have anyway.
            Logger.printDebug(() -> "Not a post lookup, left alone: " + url);
            return chain.proceed(request);
        }

        JSONArray children = new JSONArray();
        Response last = null;
        try {
            for (String id : ids) {
                Response answered = chain.proceed(request.newBuilder().url(thread(id)).build());
                if (!answered.isSuccessful() || answered.body() == null) {
                    // Handed back as it came, so Sync reports the failure it would have had.
                    Logger.printInfo(() -> "Could not look up post " + id + ": HTTP "
                            + answered.code());
                    return answered;
                }

                String body = answered.body().string();
                answered.close();
                last = answered;
                add(children, body);
            }

            int found = children.length();
            Logger.printDebug(() -> "Looked up " + ids + " through the thread endpoint, "
                    + found + " of " + ids.size() + " answered");
            return respond(request, last, listing(children));
        } catch (JSONException ex) {
            Logger.printInfo(() -> "Could not read the post looked up by " + url, ex);
            return gone(request);
        }
    }

    /** Whether this is the lookup, in either of the two spellings Sync uses. */
    private static boolean isLookup(String path) {
        String withoutSlash = path.endsWith("/") ? path.substring(0, path.length() - 1) : path;
        return "/api/info".equals(withoutSlash) || "/api/info.json".equals(withoutSlash);
    }

    /**
     * @return The ids of the posts asked about, or nothing where anything but a post was, since
     *         the whole ask then has to be left alone rather than half answered.
     */
    private static List<String> linkIds(@Nullable String asked) {
        List<String> ids = new ArrayList<>();
        if (asked == null || asked.isEmpty()) {
            return ids;
        }

        for (String fullname : asked.split(",")) {
            String trimmed = fullname.trim();
            if (!trimmed.startsWith(LINK_PREFIX) || ids.size() >= MOST_IDS) {
                return new ArrayList<>();
            }

            String id = trimmed.substring(LINK_PREFIX.length());
            if (id.isEmpty()) {
                return new ArrayList<>();
            }
            ids.add(id);
        }
        return ids;
    }

    /**
     * The thread the post is published under. The subreddit is not needed and is not known here
     * anyway, since the ask names the post and nothing else.
     */
    private static HttpUrl thread(String id) {
        return new HttpUrl.Builder()
                .scheme("https")
                .host(HOST)
                .addPathSegment("comments")
                .addPathSegment(id + ".json")
                // The comments are discarded; this keeps them from being built to be thrown away.
                .addQueryParameter("limit", "1")
                .build();
    }

    /**
     * Takes the post out of a thread and puts it among the others. A thread is two listings, the
     * post first and its comments second.
     */
    private static void add(JSONArray children, String body) throws JSONException {
        JSONArray listings = new JSONArray(body);
        if (listings.length() == 0) {
            return;
        }

        JSONObject posts = listings.optJSONObject(0);
        JSONObject data = posts == null ? null : posts.optJSONObject("data");
        JSONArray found = data == null ? null : data.optJSONArray("children");
        if (found == null) {
            return;
        }

        for (int i = 0; i < found.length(); i++) {
            children.put(found.get(i));
        }
    }

    /** The shape {@code /api/info} answered in: one listing holding the posts asked about. */
    private static JSONObject listing(JSONArray children) throws JSONException {
        JSONObject data = new JSONObject();
        data.put("after", JSONObject.NULL);
        data.put("before", JSONObject.NULL);
        data.put("dist", children.length());
        data.put("modhash", "");
        data.put("geo_filter", "");
        data.put("children", children);

        JSONObject listing = new JSONObject();
        listing.put("kind", "Listing");
        listing.put("data", data);
        return listing;
    }

    /**
     * Built on the reply that carried the post where there is one, so that what the connection
     * settled on is kept rather than asserted.
     */
    private static Response respond(Request request, @Nullable Response answered, JSONObject body) {
        Response.Builder built = answered != null
                ? answered.newBuilder()
                : new Response.Builder().protocol(Protocol.HTTP_1_1);

        return built
                .message("OK")
                .code(HttpURLConnection.HTTP_OK)
                .request(request)
                .removeHeader("Content-Length")
                .header("Content-Type", "application/json")
                .body(ResponseBody.create(body.toString(), MediaType.get("application/json")))
                .build();
    }

    private static Response gone(Request request) {
        return new Response.Builder()
                .message("Gone")
                .code(HttpURLConnection.HTTP_GONE)
                .protocol(Protocol.HTTP_1_1)
                .request(request)
                .header("Content-Type", "application/json")
                .body(ResponseBody.create("{}", MediaType.get("application/json")))
                .build();
    }
}
