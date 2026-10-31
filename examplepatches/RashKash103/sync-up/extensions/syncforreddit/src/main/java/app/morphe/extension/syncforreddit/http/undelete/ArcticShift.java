/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.extension.syncforreddit.http.undelete;

import androidx.annotation.Nullable;

import android.net.Uri;
import android.text.TextUtils;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.http.ArchiveRequests;

/**
 * Reads archived Reddit content from Project Arctic Shift.
 *
 * <p>Ported from Patcheddit's Boost implementation, reworked to use org.json rather than
 * Jackson, since Sync already depends on org.json and reads raw markdown rather than the
 * rendered {@code _html} fields Boost had to produce.
 */
public class ArcticShift {
    private static final String BASE_URL = "https://arctic-shift.photon-reddit.com/api/";

    /** Arctic Shift is a free community service, so repeat views of a thread are served locally. */
    private static final int CACHE_SIZE = 32;

    private static final Map<String, Map<String, JSONObject>> commentCache =
            Collections.synchronizedMap(new LinkedHashMap<String, Map<String, JSONObject>>(
                    CACHE_SIZE + 1, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Map<String, JSONObject>> eldest) {
                    return size() > CACHE_SIZE;
                }
            });

    private ArcticShift() {}

    private static JSONObject get(String url) throws IOException, JSONException {
        Logger.printDebug(() -> "Arctic Shift: " + url);

        String body = ArchiveRequests.get(url, "application/json");
        if (body == null || body.isEmpty()) {
            return null;
        }
        return new JSONObject(body);
    }

    /**
     * @return The archived submission, or null if Arctic Shift has nothing for it.
     */
    @Nullable
    public static JSONObject getSubmission(String submissionId) throws IOException, JSONException {
        JSONObject response = get(BASE_URL + "posts/ids?ids=" + submissionId);
        if (response == null) {
            return null;
        }
        JSONArray data = response.optJSONArray("data");
        if (data == null || data.length() == 0) {
            return null;
        }
        return data.optJSONObject(0);
    }

    /**
     * Fetches the whole archived comment tree in a single call, rather than one request per
     * removed comment.
     *
     * @return Comment id to archived comment, empty when Arctic Shift has nothing.
     */
    public static Map<String, JSONObject> getCommentTree(String submissionId)
            throws IOException, JSONException {
        Map<String, JSONObject> cached = commentCache.get(submissionId);
        if (cached != null) {
            return cached;
        }

        Map<String, JSONObject> byId = new HashMap<>();
        JSONObject response = get(BASE_URL + "comments/tree?limit=25000&link_id=" + submissionId);
        if (response != null) {
            JSONArray data = response.optJSONArray("data");
            if (data != null) {
                collect(data, byId);
            }
        }

        commentCache.put(submissionId, byId);
        return byId;
    }

    /**
     * When something was written, for an entry named in a page cursor that is no longer held in
     * memory, such as after the app has been restarted mid scroll.
     *
     * @return The moment it was written, or zero if the archive does not have it.
     */
    public static long writtenAt(String kind, String id) throws IOException, JSONException {
        JSONObject response = get(BASE_URL + kind + "/ids?ids=" + id);
        if (response == null) {
            return 0;
        }
        JSONArray data = response.optJSONArray("data");
        if (data == null || data.length() == 0) {
            return 0;
        }
        JSONObject entry = data.optJSONObject(0);
        return entry == null ? 0 : entry.optLong("created_utc", 0);
    }

    /**
     * Several submissions at once, for filling in what a comment says about the post it is on.
     *
     * @param ids Submission ids without their type prefix.
     * @return Id to archived submission, holding only those the archive has.
     */
    public static Map<String, JSONObject> getSubmissions(Collection<String> ids)
            throws IOException, JSONException {
        Map<String, JSONObject> byId = new HashMap<>();
        if (ids.isEmpty()) {
            return byId;
        }

        JSONObject response = get(BASE_URL + "posts/ids?ids=" + TextUtils.join(",", ids));
        if (response == null) {
            return byId;
        }

        JSONArray data = response.optJSONArray("data");
        if (data == null) {
            return byId;
        }
        for (int i = 0; i < data.length(); i++) {
            JSONObject post = data.optJSONObject(i);
            if (post == null) continue;
            String id = post.optString("id", null);
            if (id != null) {
                byId.put(id, post);
            }
        }
        return byId;
    }

    /**
     * What an author wrote, newest first, for a profile Reddit will not list.
     *
     * @param kind   Either posts or comments, which the archive keeps apart.
     * @param limit  How many to ask for.
     * @param before Only what was written before this moment, or zero to start from the newest.
     * @return The archived entries, empty when the archive has nothing for them.
     */
    public static JSONArray searchByAuthor(String kind, String author, int limit, long before)
            throws IOException, JSONException {
        // Newest first, and "before" is older than that moment, which is how the archive pages:
        // the time the last entry served was written carries on from where it left off.
        String olderThan = before > 0 ? "&before=" + before : "";
        JSONObject response = get(BASE_URL + kind + "/search?author=" + Uri.encode(author)
                + "&limit=" + limit + "&sort=desc" + olderThan);
        if (response == null) {
            return new JSONArray();
        }
        JSONArray data = response.optJSONArray("data");
        return data == null ? new JSONArray() : data;
    }

    /**
     * Walks the Reddit shaped tree, which nests replies as a listing under each comment.
     */
    private static void collect(JSONArray children, Map<String, JSONObject> byId) {
        for (int i = 0; i < children.length(); i++) {
            JSONObject child = children.optJSONObject(i);
            if (child == null) continue;

            JSONObject data = child.optJSONObject("data");
            if (data == null) continue;

            String id = data.optString("id", null);
            if (id != null) {
                byId.put(id, data);
            }

            // "replies" is an empty string when there are none, so only recurse into an object.
            JSONObject replies = data.optJSONObject("replies");
            if (replies != null) {
                JSONObject repliesData = replies.optJSONObject("data");
                if (repliesData != null) {
                    JSONArray grandChildren = repliesData.optJSONArray("children");
                    if (grandChildren != null) {
                        collect(grandChildren, byId);
                    }
                }
            }
        }
    }
}
