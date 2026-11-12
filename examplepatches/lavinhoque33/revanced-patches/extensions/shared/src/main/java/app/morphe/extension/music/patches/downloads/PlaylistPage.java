/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * The tracks of one page of a playlist or album response, in order, and what is a track there. Contains no Android
 * code.
 *
 * <p>A track the service lists but cannot play (deleted, private, blocked) is a greyed-out row that names no video:
 * its {@code musicItemRendererDisplayPolicy} is {@link #GREY_OUT_POLICY}, its tap only toasts "Content is
 * unavailable", and its {@code playlistItemData} carries a {@code playlistSetVideoId} but no {@code videoId}.
 * Such a row keeps its place in the list as {@link #UNAVAILABLE}, so that the position of every later track stays
 * the one the app shows; it never has a copy. A row without a video id that is not greyed out is a malformed
 * page and fails the read.
 */
final class PlaylistPage {
    /** Stands for the position of an unavailable track in a recorded track list; no video id looks like this. */
    static final String UNAVAILABLE = "-";

    private static final String GREY_OUT_POLICY = "MUSIC_ITEM_RENDERER_DISPLAY_POLICY_GREY_OUT";
    private static final String[] ROW_RENDERERS = {
            "musicResponsiveListItemRenderer", "musicTwoColumnItemRenderer", "musicMultiRowListItemRenderer"};

    /** The tracks of a page with the unavailable ones as {@link #UNAVAILABLE}, and the next page's token or null. */
    record Page(List<String> videoIds, String continuation) {}

    private PlaylistPage() {}

    static boolean isAvailable(String videoId) {
        return !UNAVAILABLE.equals(videoId);
    }

    /** The tracks that can be downloaded, in order. */
    static List<String> available(List<String> tracks) {
        List<String> available = new ArrayList<>(tracks.size());
        for (String track : tracks) if (isAvailable(track)) available.add(track);
        return available;
    }

    private static boolean isGreyedOut(JSONObject row) {
        return GREY_OUT_POLICY.equals(row.optString("musicItemRendererDisplayPolicy"));
    }

    static Page read(JSONObject response) throws IOException {
        List<String> ids = new ArrayList<>();
        String[] next = new String[1];
        boolean[] found = new boolean[1];
        collectShelves(response, ids, next, found, false);
        if (!found[0]) collectShelves(response, ids, next, found, true);
        if (!found[0]) throw new IOException("Music did not return a playlist shelf");
        return new Page(ids, next[0]);
    }

    private static void collectShelves(Object node, List<String> ids, String[] next, boolean[] found,
                                      boolean legacyShelf) throws IOException {
        if (node instanceof JSONObject object) {
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                Object value = object.opt(key);
                if (key.equals("musicPlaylistShelfRenderer") || key.equals("musicPlaylistShelfContinuation")
                        || (legacyShelf && !found[0]
                        && (key.equals("musicShelfRenderer") || key.equals("musicShelfContinuation")))) {
                    found[0] = true;
                    collectItems(value, ids, next);
                } else if (key.equals("appendContinuationItemsAction")
                        || key.equals("reloadContinuationItemsCommand")) {
                    found[0] = true;
                    collectItems(value, ids, next);
                } else if (!key.equals("header") && !key.equals("menu") && !key.equals("menus")
                        && !key.equals("frameworkUpdates") && !key.equals("musicCarouselShelfRenderer")) {
                    collectShelves(value, ids, next, found, legacyShelf);
                }
            }
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) collectShelves(array.opt(i), ids, next, found, legacyShelf);
        }
    }

    private static void collectItems(Object node, List<String> ids, String[] next) throws IOException {
        if (node instanceof JSONObject object) {
            for (String key : ROW_RENDERERS) {
                JSONObject row = object.optJSONObject(key);
                if (row == null) continue;
                JSONObject itemData = row.optJSONObject("playlistItemData");
                String id = itemData == null ? "" : itemData.optString("videoId");
                if (id.isEmpty()) {
                    JSONObject endpoint = row.optJSONObject("navigationEndpoint");
                    // an owned playlist lists an "Add a song" search row, not a track.
                    if (itemData == null && endpoint != null && endpoint.has("searchEndpoint")) return;
                    JSONObject watch = endpoint == null ? null : endpoint.optJSONObject("watchEndpoint");
                    if (watch != null) id = watch.optString("videoId");
                }
                if (id.isEmpty() && !isGreyedOut(row)) throw new IOException("A playlist track has no video id");
                // Deliberate duplicate positions must remain in the playlist, and so must the position of an
                // unavailable track: the app numbers the rows after it with it counted.
                ids.add(id.isEmpty() ? UNAVAILABLE : id);
                return; // Never mistake a row's menus/recommendations for additional playlist tracks.
            }
            JSONObject continuation = object.optJSONObject("nextContinuationData");
            if (continuation == null) continuation = object.optJSONObject("continuationCommand");
            if (continuation != null) {
                String token = continuation.optString("continuation", continuation.optString("token"));
                if (!token.isEmpty()) next[0] = token;
                return;
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) collectItems(object.opt(keys.next()), ids, next);
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) collectItems(array.opt(i), ids, next);
        }
    }
}
