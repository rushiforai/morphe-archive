package app.morphe.extension.syncforreddit.http.comments;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URLDecoder;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Loads the comments behind a "view more" from the thread, since Reddit stopped answering the
 * endpoint Sync asks.
 *
 * <p>Reddit now refuses {@code /api/morechildren} with the same block page it serves anyone it
 * will not answer, so tapping a "view more" only ever raised an error. The comments themselves
 * are still published under the thread, where {@code /comments/<link>/_/<id>} serves any comment
 * and everything hanging from it.
 *
 * <p>What is asked for is a list of sibling comments, which could be a hundred of them, and
 * fetching each in turn would be a hundred requests for one tap. They all hang from the same
 * comment, so the one they hang from is fetched instead and the answer cut down to the ones
 * that were asked for: two requests however many were named, and one where only a single
 * comment was. Whatever came back is flattened the way the old endpoint answered, a list of
 * things each naming its parent, which is what Sync rebuilds the tree from.
 *
 * <p>The comments already on screen are deliberately left out. The old endpoint returned only
 * what was asked for, and handing back the siblings around them would draw them all twice.
 *
 * @noinspection unused
 */
public class FixMoreCommentsPatch extends PatchedditInterceptor {
    private static final String HOST = "oauth.reddit.com";
    private static final String PATH = "/api/morechildren";

    /** Reddit serves at most this many comments in one answer. */
    private static final String MOST_COMMENTS = "500";

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

        if (!HOST.equals(url.host()) || !PATH.equals(url.encodedPath())) {
            return chain.proceed(request);
        }

        String link = idOf(asked(request, "link_id"));
        List<String> children = named(asked(request, "children"));
        if (link == null || children.isEmpty()) {
            // Nothing to go on, so it is left to fail the way it would have anyway rather than
            // guessed at.
            Logger.printInfo(() -> "A view more named no comments, left alone: " + url);
            return chain.proceed(request);
        }

        try {
            // The first of them carries the comment they all hang from, which is what is asked
            // for next.
            Response first = chain.proceed(comment(request, link, children.get(0)));
            if (!first.isSuccessful() || first.body() == null) {
                Logger.printInfo(() -> "Could not read a view more: HTTP " + first.code());
                return first;
            }
            String firstBody = first.body().string();
            first.close();

            Set<String> wanted = new HashSet<>(children);
            JSONArray things = new JSONArray();
            Response last = first;

            if (children.size() == 1) {
                gather(commentsIn(firstBody), wanted, false, things);
            } else {
                String parent = parentIn(firstBody);
                Response whole = chain.proceed(parent == null
                        ? thread(request, link)
                        : comment(request, link, parent));
                if (!whole.isSuccessful() || whole.body() == null) {
                    Logger.printInfo(() -> "Could not read a view more: HTTP " + whole.code());
                    return whole;
                }
                String wholeBody = whole.body().string();
                whole.close();
                last = whole;
                gather(commentsIn(wholeBody), wanted, false, things);
            }

            int found = things.length();
            Logger.printDebug(() -> "A view more asked for " + children.size()
                    + " comments under " + link + "; answered with " + found);
            return respond(request, last, envelope(things));
        } catch (JSONException ex) {
            Logger.printInfo(() -> "Could not read the comments behind a view more", ex);
            return gone(request);
        }
    }

    /**
     * What was sent with the request. Sync sends these as a form in the body rather than in the
     * address, and the body is bytes by the time it reaches here because the copy of Volley it
     * carries builds one from the parameters itself.
     *
     * <p>The body is read out of the object rather than written to a sink, because writing one
     * needs okio and Sync keeps okio under another name: asking for {@code okio.Buffer} by name
     * throws {@link NoClassDefFoundError} on a device and takes the app down with it. What
     * {@code RequestBody.create} returns holds the bytes it was given in a field of its own, and
     * a field is found here by its type, since the names do not survive the app being built.
     */
    @Nullable
    private static String asked(Request request, String name) {
        String inAddress = request.url().queryParameter(name);
        if (inAddress != null && !inAddress.isEmpty()) {
            return inAddress;
        }

        byte[] sent = bytesOf(request.body());
        if (sent == null) {
            return null;
        }
        return formValue(new String(sent, StandardCharsets.UTF_8), name);
    }

    /**
     * @return The bytes the body was built from, or null where they are not held in one field
     *         that can be reached.
     */
    @Nullable
    private static byte[] bytesOf(@Nullable RequestBody body) {
        if (body == null) {
            return null;
        }

        try {
            for (Class<?> held = body.getClass(); held != null; held = held.getSuperclass()) {
                for (Field field : held.getDeclaredFields()) {
                    if (field.getType() != byte[].class) {
                        continue;
                    }
                    field.setAccessible(true);
                    Object value = field.get(body);
                    if (value instanceof byte[]) {
                        return (byte[]) value;
                    }
                }
            }
        } catch (Throwable ex) {
            Logger.printInfo(() -> "Could not read what a view more asked for: " + ex);
        }
        return null;
    }

    @Nullable
    private static String formValue(String form, String name) {
        for (String pair : form.split("&")) {
            int equals = pair.indexOf('=');
            if (equals < 0 || !name.equals(pair.substring(0, equals))) {
                continue;
            }
            try {
                return URLDecoder.decode(pair.substring(equals + 1), "UTF-8");
            } catch (Exception ex) {
                return pair.substring(equals + 1);
            }
        }
        return null;
    }

    /** Drops the kind from a fullname, which the thread is named without. */
    @Nullable
    private static String idOf(@Nullable String fullname) {
        if (fullname == null || fullname.isEmpty()) {
            return null;
        }
        int underscore = fullname.indexOf('_');
        String id = underscore < 0 ? fullname : fullname.substring(underscore + 1);
        return id.isEmpty() ? null : id;
    }

    private static List<String> named(@Nullable String children) {
        List<String> ids = new ArrayList<>();
        if (children == null || children.isEmpty()) {
            return ids;
        }
        for (String id : children.split(",")) {
            String trimmed = id.trim();
            if (!trimmed.isEmpty()) {
                ids.add(trimmed);
            }
        }
        return ids;
    }

    /** A comment and everything hanging from it, without the ancestors above it. */
    private static Request comment(Request request, String link, String id) {
        return request.newBuilder()
                .get()
                .url(new HttpUrl.Builder()
                        .scheme("https").host(HOST)
                        .addPathSegment("comments").addPathSegment(link)
                        .addPathSegment("_").addPathSegment(id + ".json")
                        .addQueryParameter("limit", MOST_COMMENTS)
                        .addQueryParameter("context", "0")
                        .build())
                .build();
    }

    /** The whole thread, for the comments that hang from the post rather than from a comment. */
    private static Request thread(Request request, String link) {
        return request.newBuilder()
                .get()
                .url(new HttpUrl.Builder()
                        .scheme("https").host(HOST)
                        .addPathSegment("comments").addPathSegment(link + ".json")
                        .addQueryParameter("limit", MOST_COMMENTS)
                        .build())
                .build();
    }

    /** A thread is two listings, the post first and its comments second. */
    @Nullable
    private static JSONArray commentsIn(String body) throws JSONException {
        JSONArray listings = new JSONArray(body);
        if (listings.length() < 2) {
            return null;
        }
        JSONObject comments = listings.optJSONObject(1);
        JSONObject data = comments == null ? null : comments.optJSONObject("data");
        return data == null ? null : data.optJSONArray("children");
    }

    /** What the comment that was fetched hangs from. */
    @Nullable
    private static String parentIn(String body) throws JSONException {
        JSONArray children = commentsIn(body);
        JSONObject first = children == null ? null : children.optJSONObject(0);
        JSONObject data = first == null ? null : first.optJSONObject("data");
        String parent = data == null ? null : data.optString("parent_id", "");
        if (parent == null || !parent.startsWith("t1_")) {
            // Hanging from the post rather than from a comment, so the thread is what to read.
            return null;
        }
        return idOf(parent);
    }

    /**
     * Flattens what was asked for, and everything hanging from it, into the list the old
     * endpoint answered with. A comment is taken once its own id was named or once something
     * above it was, which is how the replies to a named comment come along with it.
     */
    private static void gather(@Nullable JSONArray children, Set<String> wanted, boolean inside,
                               JSONArray things) throws JSONException {
        if (children == null) {
            return;
        }

        for (int i = 0; i < children.length(); i++) {
            JSONObject node = children.optJSONObject(i);
            JSONObject data = node == null ? null : node.optJSONObject("data");
            if (data == null) {
                continue;
            }

            String kind = node.optString("kind", "");
            boolean take = inside || wanted.contains(data.optString("id", ""));

            if ("more".equals(kind)) {
                // Kept so that what is left behind this one can be asked for in turn.
                if (take) {
                    things.put(node);
                }
                continue;
            }
            if (!"t1".equals(kind)) {
                continue;
            }

            // Read before the replies are cleared, since the tree is walked from them.
            JSONArray replies = repliesOf(data);
            if (take) {
                // Flattened: every thing names its parent, and Sync builds the tree from that.
                // Leaving the replies nested as well would have each of them put in twice.
                data.put("replies", "");
                things.put(node);
            }
            gather(replies, wanted, take, things);
        }
    }

    @Nullable
    private static JSONArray repliesOf(JSONObject comment) {
        Object replies = comment.opt("replies");
        if (!(replies instanceof JSONObject)) {
            // Reddit writes an empty string where a comment has none.
            return null;
        }
        JSONObject data = ((JSONObject) replies).optJSONObject("data");
        return data == null ? null : data.optJSONArray("children");
    }

    /** The shape the old endpoint answered in. */
    private static JSONObject envelope(JSONArray things) throws JSONException {
        JSONObject data = new JSONObject();
        data.put("things", things);

        JSONObject json = new JSONObject();
        json.put("errors", new JSONArray());
        json.put("data", data);

        JSONObject root = new JSONObject();
        root.put("json", json);
        return root;
    }

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
