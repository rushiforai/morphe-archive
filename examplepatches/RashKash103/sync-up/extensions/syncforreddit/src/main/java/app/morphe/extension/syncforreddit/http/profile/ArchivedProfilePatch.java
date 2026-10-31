package app.morphe.extension.syncforreddit.http.profile;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;
import app.morphe.extension.syncforreddit.http.undelete.ArcticShift;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Fills in a profile Reddit will not list.
 *
 * <p>Reddit lets an account hide what it has written from its own profile, and answers a
 * request for that profile with a listing holding nothing at all, which Sync shows as a user
 * with no posts. Project Arctic Shift recorded the same posts and comments when they were
 * public and still serves them, so the empty listing is answered with those instead.
 *
 * <p>Only a profile that comes back empty is filled in. A profile Reddit does list is left
 * exactly as Reddit sent it, so nothing here decides what is current: it only stands in where
 * Reddit has stopped answering.
 *
 * @noinspection unused
 */
public class ArchivedProfilePatch extends PatchedditInterceptor {
    /** A page, matching what Reddit serves for a profile. */
    private static final int PAGE = 25;

    /**
     * Where each page served leaves off. Reddit pages by naming the last entry of a page and
     * being handed that name back; the archive pages by the moment something was written. This
     * is what joins the two, so that following the cursor Sync was given asks the archive for
     * what comes after it. Bounded, and a miss is looked up rather than being an end of list.
     */
    private static final int CURSORS_HELD = 256;

    private static final Map<String, Long> cursors =
            new LinkedHashMap<String, Long>(CURSORS_HELD, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Long> eldest) {
                    return size() > CURSORS_HELD;
                }
            };

    @Override
    public boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    @NonNull
    @Override
    protected Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        Tab tab = tabOf(request.url());
        if (tab == null) {
            return chain.proceed(request);
        }

        Response response = chain.proceed(request);

        // A profile can be hidden in more than one way and Reddit does not answer them alike:
        // one comes back as a listing with nothing in it, another is refused outright. Both mean
        // the same thing here, and an account that is merely hidden goes on writing, so being
        // refused says nothing about whether there is anything to show.
        boolean refused = isRefusal(response);
        if (!refused && !response.isSuccessful()) {
            return response;
        }
        if (response.body() == null) {
            return response;
        }

        // Reading the body consumes it, so the response has to be rebuilt either way.
        MediaType contentType = response.body().contentType();
        String original = response.body().string();
        response.close();

        try {
            if (!refused && !isEmptyListing(original)) {
                return rebuilt(response, request, contentType, original);
            }

            long before = startOf(request.url().queryParameter("after"));
            JSONArray archived = fetch(tab, before);
            if (archived.length() == 0) {
                Logger.printDebug(() -> "The archive has no more " + tab.kind + " by " + tab.author);
                // Nothing to put in its place, so a refusal is left as one rather than being
                // dressed up as an empty profile.
                return refused
                        ? rebuilt(response, request, contentType, original)
                        : rebuilt(response, request, contentType, listing(archived, false));
            }

            Logger.printInfo(() -> "Serving " + archived.length() + " archived " + tab.kind
                    + " by " + tab.author + ", whose profile Reddit "
                    + (refused ? "will not show" : "lists as empty"));
            // A short page is the end of what the archive holds, so say so rather than offering
            // a cursor that would come back empty.
            return served(response, request, contentType,
                    listing(archived, archived.length() >= PAGE));
        } catch (JSONException ex) {
            Logger.printInfo(() -> "Could not read the archived profile of " + tab.author, ex);
            return rebuilt(response, request, contentType, original);
        } catch (IOException ex) {
            // The archive being unreachable leaves the profile as Reddit gave it.
            Logger.printInfo(() -> "Could not reach the archive for " + tab.author + ": " + ex);
            return rebuilt(response, request, contentType, original);
        }
    }

    /**
     * @param before Where the previous page left off, or zero for the newest.
     */
    private static JSONArray fetch(Tab tab, long before) throws IOException, JSONException {
        if (!tab.kind.equals("overview")) {
            JSONArray entries = ArcticShift.searchByAuthor(tab.kind, tab.author, PAGE, before);
            if (tab.kind.equals("comments")) {
                describeParents(entries);
            }
            return entries;
        }

        // An overview is both, in the order they were written. Each side is asked for a whole
        // page from the same moment and the two are merged, since which of them the next entry
        // comes from is not known until both have been seen.
        JSONArray posts = ArcticShift.searchByAuthor("posts", tab.author, PAGE, before);
        JSONArray comments = ArcticShift.searchByAuthor("comments", tab.author, PAGE, before);
        describeParents(comments);
        return newestFirst(posts, comments);
    }

    /**
     * Merges the two into one page, newest first, and keeps only a page of it. What is dropped
     * is older than everything kept, so the next page picks it up again from the cursor.
     */
    private static JSONArray newestFirst(JSONArray posts, JSONArray comments) {
        List<JSONObject> all = new ArrayList<>();
        for (JSONArray side : new JSONArray[]{posts, comments}) {
            for (int i = 0; i < side.length(); i++) {
                JSONObject entry = side.optJSONObject(i);
                if (entry != null) {
                    all.add(entry);
                }
            }
        }

        Collections.sort(all, (left, right) ->
                Long.compare(right.optLong("created_utc", 0), left.optLong("created_utc", 0)));

        JSONArray merged = new JSONArray();
        for (int i = 0; i < Math.min(all.size(), PAGE); i++) {
            merged.put(all.get(i));
        }
        return merged;
    }

    /**
     * @return The moment the entry a cursor names was written, or zero to start from the newest.
     */
    private static long startOf(@Nullable String after) {
        if (after == null || after.isEmpty()) {
            return 0;
        }

        synchronized (cursors) {
            Long held = cursors.get(after);
            if (held != null) {
                return held;
            }
        }

        // Not held any more, which happens when a scroll resumes after a restart. The entry the
        // cursor names says when it was written, so ask about that one rather than starting over.
        try {
            int underscore = after.indexOf('_');
            if (underscore <= 0) {
                return 0;
            }
            String kind = after.startsWith("t1_") ? "comments" : "posts";
            return ArcticShift.writtenAt(kind, after.substring(underscore + 1));
        } catch (IOException | JSONException ex) {
            Logger.printInfo(() -> "Could not place the cursor " + after + ": " + ex);
            return 0;
        }
    }

    /**
     * A comment listing says which post each comment is on, and Reddit is asked for a title,
     * not only an id. The archive records the id alone, so the posts are looked up together and
     * what it knows of them written in. Every field is set either way: a listing that leaves one
     * out is one Sync will not read.
     */
    private static void describeParents(JSONArray comments) throws IOException, JSONException {
        Set<String> ids = new LinkedHashSet<>();
        for (int i = 0; i < comments.length(); i++) {
            JSONObject comment = comments.optJSONObject(i);
            if (comment == null) continue;
            String id = withoutPrefix(comment.optString("link_id", ""));
            if (!id.isEmpty()) {
                ids.add(id);
            }
        }

        Map<String, JSONObject> posts = ArcticShift.getSubmissions(ids);

        for (int i = 0; i < comments.length(); i++) {
            JSONObject comment = comments.optJSONObject(i);
            if (comment == null) continue;

            JSONObject post = posts.get(withoutPrefix(comment.optString("link_id", "")));
            comment.put("link_title", post == null ? "" : post.optString("title", ""));
            comment.put("link_author", post == null ? "" : post.optString("author", ""));
            comment.put("link_url", post == null ? "" : post.optString("url", ""));
            comment.put("link_permalink", post == null ? "" : post.optString("permalink", ""));
        }
    }

    private static String withoutPrefix(String fullName) {
        int underscore = fullName.indexOf('_');
        return underscore < 0 ? fullName : fullName.substring(underscore + 1);
    }

    /**
     * Reddit answers a hidden profile with a listing carrying no children rather than saying so.
     */
    private static boolean isEmptyListing(String body) throws JSONException {
        JSONObject listing = new JSONObject(body);
        JSONObject data = listing.optJSONObject("data");
        if (data == null) {
            return false;
        }
        JSONArray children = data.optJSONArray("children");
        return children != null && children.length() == 0;
    }

    /**
     * Wraps what the archive holds in the shape Reddit would have sent. Each entry already
     * carries its full name, which is where its kind comes from and what a cursor is made of.
     */
    private static String listing(JSONArray archived, boolean more) throws JSONException {
        JSONArray children = new JSONArray();
        for (int i = 0; i < archived.length(); i++) {
            JSONObject entry = archived.optJSONObject(i);
            if (entry == null) continue;

            String name = entry.optString("name", "");
            int underscore = name.indexOf('_');
            if (underscore <= 0) continue;

            JSONObject child = new JSONObject();
            child.put("kind", name.substring(0, underscore));
            child.put("data", entry);
            children.put(child);
        }

        String cursor = null;
        if (more && children.length() > 0) {
            JSONObject last = children.getJSONObject(children.length() - 1).getJSONObject("data");
            cursor = last.optString("name", "");
            if (!cursor.isEmpty()) {
                synchronized (cursors) {
                    cursors.put(cursor, last.optLong("created_utc", 0));
                }
            }
        }

        JSONObject data = new JSONObject();
        data.put("children", children);
        data.put("after", cursor == null || cursor.isEmpty() ? JSONObject.NULL : cursor);
        data.put("before", JSONObject.NULL);
        data.put("dist", children.length());

        JSONObject listing = new JSONObject();
        listing.put("kind", "Listing");
        listing.put("data", data);
        return listing.toString();
    }

    /**
     * Reddit refuses a profile it will not show rather than saying it is empty.
     */
    private static boolean isRefusal(Response response) {
        return response.code() == HttpURLConnection.HTTP_NOT_FOUND
                || response.code() == HttpURLConnection.HTTP_FORBIDDEN;
    }

    /**
     * A listing that stands in for what Reddit would not give, which has to arrive as an answer
     * rather than as the refusal it is replacing.
     */
    private static Response served(Response response, Request request, MediaType contentType,
                                   String body) {
        return rebuilt(response, request, contentType, body).newBuilder()
                .code(HttpURLConnection.HTTP_OK)
                .message("OK")
                .body(ResponseBody.create(body,
                        contentType == null ? MediaType.get("application/json") : contentType))
                .build();
    }

    private static Response rebuilt(Response response, Request request, MediaType contentType,
                                    String body) {
        return response.newBuilder()
                .request(request)
                .body(ResponseBody.create(body, contentType))
                .build();
    }

    /**
     * A profile listing, which is a user, then what of theirs is being asked for.
     */
    private static final class Tab {
        final String author;
        final String kind;

        Tab(String author, String kind) {
            this.author = author;
            this.kind = kind;
        }
    }

    @Nullable
    private static Tab tabOf(HttpUrl url) {
        if (!url.host().endsWith("reddit.com")) {
            return null;
        }

        List<String> segments = url.pathSegments();
        if (segments.size() < 3) {
            return null;
        }
        // Sync asks for /user/<name>/<what>, and for /u/<name>/<what> where the patch that
        // brings it onto the current endpoint has not been applied.
        String root = segments.get(0);
        if (!root.equals("user") && !root.equals("u")) {
            return null;
        }

        String author = segments.get(1);
        String what = segments.get(2).toLowerCase(Locale.ROOT);
        int suffix = what.indexOf('.');
        if (suffix >= 0) {
            what = what.substring(0, suffix);
        }

        if (author.isEmpty()) {
            return null;
        }
        if (what.equals("submitted")) {
            return new Tab(author, "posts");
        }
        if (what.equals("comments")) {
            return new Tab(author, "comments");
        }
        // The archive keeps the two apart, so an overview is made by merging them here.
        if (what.equals("overview") || what.isEmpty()) {
            return new Tab(author, "overview");
        }
        return null;
    }
}
