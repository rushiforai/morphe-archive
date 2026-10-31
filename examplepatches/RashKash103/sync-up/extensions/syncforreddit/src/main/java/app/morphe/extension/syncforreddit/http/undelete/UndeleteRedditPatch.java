/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.extension.syncforreddit.http.undelete;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Restores what Reddit has taken down, from Project Arctic Shift.
 *
 * <p>Sync requests a thread as {@code /r/<sub>/comments/<id>/...json}, so unlike Boost the
 * path does not begin with {@code /comments/}. Sync also reads raw markdown rather than the
 * rendered {@code _html} fields.
 *
 * <p>Nothing is written into what is restored: what happened to it is said on the line under
 * its author instead, so that what is shown as the text is only ever the text.
 */
public class UndeleteRedditPatch extends PatchedditInterceptor {
    private static final String REMOVED = "[removed]";
    private static final String DELETED = "[deleted]";

    /**
     * Reddit does not have one way of saying it took something away. Beside the two bare words
     * it also writes out who did it, as "[ Removed by Reddit ]" and the like, and a title it
     * has taken down reads that way rather than being blank.
     */
    /** The thread last asked for, which is the one any "view more" under it belongs to. */
    private static volatile String lastThread;

    private static final Pattern TAKEN_DOWN = Pattern.compile(
            "\\[\\s*(removed|deleted)\\s*(by\\s+[^\\]]+)?\\]", Pattern.CASE_INSENSITIVE);

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

        // A thread, and the further comments Sync asks for when a "view more" is tapped, which
        // it fetches from an endpoint of its own with a shape of its own.
        boolean thread = url.encodedPath().contains("/comments/");
        boolean more = url.encodedPath().contains("/api/morechildren");
        // A feed shows a post's title and author before anything is opened, and a post taken
        // down reads as Reddit's wording there too.
        boolean listing = !thread && !more && url.host().equals("oauth.reddit.com");
        if (!url.host().endsWith("reddit.com") || (!thread && !more && !listing)) {
            return chain.proceed(request);
        }

        Response response = chain.proceed(request);
        if (!response.isSuccessful() || response.body() == null) {
            return response;
        }

        // Reading the body consumes it, so the response has to be rebuilt either way.
        String original = response.body().string();
        MediaType contentType = response.body().contentType();

        String restored;
        try {
            if (more) {
                restored = restoreMore(original, submissionIdFrom(url, request));
            } else if (listing) {
                restored = restoreListing(original);
            } else {
                restored = restore(original, submissionIdFrom(url, request));
            }
        } catch (JSONException ex) {
            Logger.printInfo(() -> "Could not restore removed content", ex);
            restored = null;
        } catch (IOException ex) {
            // Arctic Shift being unreachable must not take the thread down with it.
            // Expected from time to time: these are free community services, and one being
            // slow or briefly unreachable is not a fault worth putting in front of the user.
            Logger.printInfo(() -> "Arctic Shift request failed: " + ex);
            restored = null;
        } catch (Throwable ex) {
            // Whatever went wrong, the thread is worth more than what could have been put back.
            Logger.printInfo(() -> "Could not restore removed content: " + ex);
            restored = null;
        }

        String served = restored != null ? restored : original;
        boolean putBack = restored != null;
        Logger.printDebug(() -> "Answering " + url.encodedPath() + " with " + served.length()
                + " characters" + (putBack ? ", some of it put back" : ""));

        return response.newBuilder()
                .body(ResponseBody.create(served, contentType))
                .build();
    }

    /**
     * Sync asks for {@code /r/<sub>/comments/<id>/_/...}, so the id follows the "comments"
     * segment.
     */
    @Nullable
    private static String submissionIdFrom(HttpUrl url, Request request) {
        // Fetching more comments names the thread in what is sent rather than in the path, and
        // what is sent can only be read through a library the app keeps under another name. The
        // thread is the one being read, so remembering which that is answers it without looking.
        String asked = url.queryParameter("link_id");
        if (asked != null && !asked.isEmpty()) {
            int prefix = asked.indexOf('_');
            return prefix < 0 ? asked : asked.substring(prefix + 1);
        }
        if (!url.encodedPath().contains("/comments/")) {
            return lastThread;
        }

        java.util.List<String> segments = url.pathSegments();
        for (int i = 0; i < segments.size() - 1; i++) {
            if (segments.get(i).equals("comments")) {
                // Sync asks for a thread as <id>.json rather than putting the suffix on a
                // later segment, and the archive knows nothing about an id carrying it.
                String id = segments.get(i + 1);
                int suffix = id.indexOf('.');
                if (suffix >= 0) {
                    id = id.substring(0, suffix);
                }
                if (id.isEmpty()) {
                    return null;
                }
                lastThread = id;
                return id;
            }
        }
        return null;
    }

    /**
     * @return The rewritten body, or null when nothing needed restoring.
     */
    @Nullable
    private static String restore(String body, @Nullable String submissionId)
            throws JSONException, IOException {
        if (submissionId == null) {
            return null;
        }

        JSONArray listings = new JSONArray(body);
        if (listings.length() < 2) {
            return null;
        }

        JSONObject submission = firstChildData(listings.optJSONObject(0));
        JSONArray comments = childrenOf(listings.optJSONObject(1));

        boolean submissionRemoved = submission != null
                && (isRemoved(submission, "selftext") || isRemoved(submission, "title")
                    || isDeletedAuthor(submission));
        Set<String> removedComments = new HashSet<>();
        if (comments != null) {
            collectRemoved(comments, removedComments);
        }

        if (!submissionRemoved && removedComments.isEmpty()) {
            return null;
        }

        boolean changed = false;

        if (submissionRemoved) {
            JSONObject archived = ArcticShift.getSubmission(submissionId);
            if (archived != null) {
                // A title is taken down with the rest of a post, and a post with nothing else to
                // it is only its title.
                String placeholder = isRemoved(submission, "title")
                        ? submission.optString("title", "")
                        : submission.optString("selftext", "");

                boolean textRestored = isRemoved(submission, "title")
                        && merge(submission, archived, "title");
                textRestored |= isRemoved(submission, "selftext")
                        && merge(submission, archived, "selftext");
                boolean nameRestored = restoreAuthor(submission, archived);

                if (textRestored) {
                    RestoredNotes.remember(submission.optString("id", ""),
                            RemovalReason.describe(archived, placeholder));
                } else if (nameRestored) {
                    RestoredNotes.remember(submission.optString("id", ""), "account deleted");
                }
                changed |= textRestored || nameRestored;
            }

            // The name is gone from the archive as well, which is what a deleted account leaves
            // everywhere. Saying so is still worth more than a post by nobody.
            if (submission != null && isDeletedAuthor(submission)) {
                RestoredNotes.remember(submission.optString("id", ""), "account deleted");
            }
        }

        if (!removedComments.isEmpty()) {
            int wanted = removedComments.size();
            Map<String, JSONObject> archived = ArcticShift.getCommentTree(submissionId);

            if (!archived.isEmpty()) {
                removedComments.retainAll(archived.keySet());
                int found = removedComments.size();
                if (found < wanted) {
                    Logger.printInfo(() -> "Thread " + submissionId + ": the archive has "
                            + found + " of the " + wanted + " taken down");
                }
                changed |= restoreComments(comments, archived);
            }
        }

        return changed ? listings.toString() : null;
    }

    /**
     * A feed, which is posts without their comments. Each one taken down is asked after together
     * rather than one at a time, and a feed with nothing taken down asks nothing at all.
     *
     * @return The rewritten body, or null when nothing needed restoring.
     */
    @Nullable
    private static String restoreListing(String body) throws JSONException, IOException {
        if (body.isEmpty() || body.charAt(0) != '{') {
            return null;
        }

        JSONObject root = new JSONObject(body);
        JSONArray children = childrenOf(root);
        if (children == null || children.length() == 0) {
            return null;
        }

        Set<String> ids = new HashSet<>();
        for (int i = 0; i < children.length(); i++) {
            JSONObject data = postOf(children.optJSONObject(i));
            if (data == null) continue;

            if (isRemoved(data, "title") || isRemoved(data, "selftext") || isDeletedAuthor(data)) {
                String id = data.optString("id", "");
                if (!id.isEmpty()) {
                    ids.add(id);
                }
            }
        }
        if (ids.isEmpty()) {
            return null;
        }

        Map<String, JSONObject> archived = ArcticShift.getSubmissions(ids);
        boolean changed = false;

        for (int i = 0; i < children.length(); i++) {
            JSONObject data = postOf(children.optJSONObject(i));
            if (data == null) continue;

            String placeholder = isRemoved(data, "title")
                    ? data.optString("title", "")
                    : data.optString("selftext", "");

            JSONObject source = archived.get(data.optString("id", ""));
            boolean textRestored = false;
            boolean nameRestored = false;
            if (source != null) {
                textRestored = isRemoved(data, "title") && merge(data, source, "title");
                textRestored |= isRemoved(data, "selftext") && merge(data, source, "selftext");
                nameRestored = restoreAuthor(data, source);
            }

            if (textRestored) {
                RestoredNotes.remember(data.optString("id", ""),
                        RemovalReason.describe(source, placeholder));
            } else if (nameRestored || isDeletedAuthor(data)) {
                RestoredNotes.remember(data.optString("id", ""), "account deleted");
            }
            changed |= textRestored || nameRestored;
        }

        return changed ? root.toString() : null;
    }

    /**
     * @return The post a listing entry carries, or null for an entry that is not one.
     */
    @Nullable
    private static JSONObject postOf(@Nullable JSONObject child) {
        return child == null ? null : child.optJSONObject("data");
    }

    /**
     * The further comments behind a "view more", which Reddit answers with the comments
     * themselves rather than a thread: one flat run of them, under the request's own envelope.
     * They are otherwise shaped alike, so what puts a thread's comments back does for these.
     *
     * @return The rewritten body, or null when nothing needed restoring.
     */
    @Nullable
    private static String restoreMore(String body, @Nullable String submissionId)
            throws JSONException, IOException {
        if (submissionId == null) {
            return null;
        }

        JSONObject root = new JSONObject(body);
        JSONObject envelope = root.optJSONObject("json");
        JSONObject data = envelope == null ? null : envelope.optJSONObject("data");
        JSONArray things = data == null ? null : data.optJSONArray("things");
        if (things == null) {
            return null;
        }

        Set<String> removedComments = new HashSet<>();
        collectRemoved(things, removedComments);
        if (removedComments.isEmpty()) {
            return null;
        }

        Map<String, JSONObject> archived = ArcticShift.getCommentTree(submissionId);
        if (archived.isEmpty()) {
            return null;
        }

        removedComments.retainAll(archived.keySet());
        int found = removedComments.size();
        Logger.printInfo(() -> "Restoring " + found + " of the comments behind a view more");
        return restoreComments(things, archived) ? root.toString() : null;
    }

    @Nullable
    private static JSONObject firstChildData(@Nullable JSONObject listing) {
        JSONArray children = childrenOf(listing);
        if (children == null || children.length() == 0) {
            return null;
        }
        JSONObject first = children.optJSONObject(0);
        return first == null ? null : first.optJSONObject("data");
    }

    @Nullable
    private static JSONArray childrenOf(@Nullable JSONObject listing) {
        if (listing == null) return null;
        JSONObject data = listing.optJSONObject("data");
        return data == null ? null : data.optJSONArray("children");
    }

    private static boolean isRemoved(JSONObject node, String field) {
        String value = node.optString(field, "").trim();
        return !value.isEmpty() && TAKEN_DOWN.matcher(value).matches();
    }

    private static void collectRemoved(JSONArray children, Set<String> into) {
        for (int i = 0; i < children.length(); i++) {
            JSONObject child = children.optJSONObject(i);
            if (child == null) continue;

            JSONObject data = child.optJSONObject("data");
            if (data == null) continue;

            // An account that has been deleted takes the name off comments whose text is
            // still there, so the text is not the only thing worth asking about.
            if (isRemoved(data, "body") || isDeletedAuthor(data)) {
                String id = data.optString("id", null);
                if (id != null) into.add(id);
            }

            JSONArray replies = repliesOf(data);
            if (replies != null) collectRemoved(replies, into);
        }
    }

    private static boolean restoreComments(JSONArray children, Map<String, JSONObject> archived)
            throws JSONException {
        boolean changed = false;
        for (int i = 0; i < children.length(); i++) {
            JSONObject child = children.optJSONObject(i);
            if (child == null) continue;

            JSONObject data = child.optJSONObject("data");
            if (data == null) continue;

            JSONObject source = archived.get(data.optString("id", ""));
            if (source != null) {
                // Read before the text is put back, since that is what replaces it.
                String placeholder = data.optString("body", "");
                boolean textRestored = isRemoved(data, "body") && merge(data, source, "body");
                // Restored on its own as well, since a comment can keep its text and lose only
                // the name above it.
                boolean nameRestored = restoreAuthor(data, source);

                // What happened to the text is the better description of the two. A comment its
                // author deleted loses its name along with it, so saying only that the name came
                // back would describe a deleted account, which is a different thing and usually
                // not what happened.
                if (textRestored) {
                    RestoredNotes.remember(data.optString("id", ""),
                            RemovalReason.describe(source, placeholder));
                } else if (nameRestored || isDeletedAuthor(data)) {
                    // Whether or not the name could be put back: a deleted account takes it off
                    // everything it wrote, and saying so beats a comment by nobody.
                    RestoredNotes.remember(data.optString("id", ""), "account deleted");
                }

                changed |= textRestored || nameRestored;
            } else if (isDeletedAuthor(data)) {
                RestoredNotes.remember(data.optString("id", ""), "account deleted");
            }

            JSONArray replies = repliesOf(data);
            if (replies != null) changed |= restoreComments(replies, archived);
        }
        return changed;
    }

    /**
     * "replies" is an empty string when a comment has none, so only an object counts.
     */
    @Nullable
    private static JSONArray repliesOf(JSONObject comment) {
        JSONObject replies = comment.optJSONObject("replies");
        if (replies == null) return null;
        JSONObject data = replies.optJSONObject("data");
        return data == null ? null : data.optJSONArray("children");
    }

    /**
     * Copies the archived text back in. A submission carries the marker inline, having no line
     * of its own to put it on, while a comment's is recorded for the header instead so that what
     * is shown as the comment is only ever what was written.
     */
    private static boolean merge(JSONObject target, JSONObject source, String textField)
            throws JSONException {
        String text = source.optString(textField, "");
        if (text.isEmpty() || isRemoved(source, textField)) {
            return false;
        }

        target.put(textField, text);
        return true;
    }

    private static boolean isDeletedAuthor(JSONObject node) {
        return DELETED.equals(node.optString("author", ""));
    }

    /**
     * Puts back a name Reddit no longer serves, left plain rather than marked: the text it sits
     * above is what was removed, and the name is only missing because the account went with it.
     */
    private static boolean restoreAuthor(JSONObject target, JSONObject source)
            throws JSONException {
        if (!isDeletedAuthor(target)) {
            return false;
        }
        String author = source.optString("author", "");
        if (author.isEmpty() || DELETED.equals(author) || REMOVED.equals(author)) {
            return false;
        }
        target.put("author", author);
        return true;
    }
}
