/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-20.
 * Modified by lavinhoque33, 2026-11-18.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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

    @FunctionalInterface
    interface Browse {
        JSONObject next(String token) throws Exception;
    }

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

    /** Read the entire current list before changing saved membership, including when resuming. */
    static List<String> readPlaylist(@Nullable String sourceId, JSONObject first, Browse browse) throws Exception {
        return readPlaylist(sourceId, first, browse, false);
    }

    /** An album tag must come from the one unambiguous shelf for the verified album playlist. */
    static List<String> readAlbum(String sourceId, JSONObject first, Browse browse) throws Exception {
        return readPlaylist(sourceId, first, browse, true);
    }

    private static List<String> readPlaylist(@Nullable String sourceId, JSONObject first, Browse browse,
                                             boolean album) throws Exception {
        List<String> tracks = new ArrayList<>();
        Set<String> continuations = new HashSet<>();
        JSONObject response = first;
        boolean continuation = false;
        while (true) {
            Page page = read(response, sourceId, continuation, album);
            tracks.addAll(page.videoIds());
            String token = page.continuation();
            if (token == null) return tracks;
            if (!continuations.add(token)) throw new IOException("Music repeated a playlist continuation");

            response = browse.next(token);
            continuation = true;
        }
    }

    static Page read(JSONObject response) throws IOException {
        return read(response, null, false, false);
    }

    private static Page read(JSONObject response, @Nullable String source, boolean continuation, boolean album)
            throws IOException {
        List<String> ids = new ArrayList<>();
        String[] next = new String[1];
        boolean[] found = new boolean[1];
        collectShelves(response, ids, next, found, false, source, continuation, album);
        if (!album && !found[0]) collectShelves(response, ids, next, found, true, source, continuation, false);
        if (!found[0] || source != null && continuation && ids.isEmpty()) {
            throw new IOException("Music did not return a complete playlist shelf");
        }
        return new Page(ids, next[0]);
    }

    private static void collectShelves(Object node, List<String> ids, String[] next, boolean[] found,
                                      boolean legacyShelf, @Nullable String source, boolean continuation,
                                      boolean album)
            throws IOException {
        if (node instanceof JSONObject object) {
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                Object value = object.opt(key);
                boolean append = key.equals("appendContinuationItemsAction")
                        || key.equals("reloadContinuationItemsCommand");
                boolean shelf = key.equals("musicPlaylistShelfRenderer") || key.equals("musicPlaylistShelfContinuation")
                        || (legacyShelf && !found[0]
                        && (key.equals("musicShelfRenderer") || key.equals("musicShelfContinuation")));
                if (shelf || append) {
                    if (source != null) {
                        if (continuation != (append || key.endsWith("Continuation"))) continue;
                        validateShelf(value, source, append ? "continuationItems" : "contents");
                    }
                    if (album && found[0]) throw new IOException("Music returned multiple album shelves");
                    found[0] = true;
                    if (album) {
                        JSONObject albumShelf = (JSONObject) value;
                        boolean identified = !albumShelf.optString("playlistId").isEmpty();
                        collectItems(albumShelf.optJSONArray(append ? "continuationItems" : "contents"),
                                ids, next, true, source, identified);
                        collectItems(albumShelf.optJSONArray("continuations"), ids, next, true, source, identified);
                    } else {
                        collectItems(value, ids, next, source != null, null, false);
                    }
                } else if (!key.equals("header") && !key.equals("menu") && !key.equals("menus")
                        && !key.equals("frameworkUpdates") && !key.equals("musicCarouselShelfRenderer")) {
                    collectShelves(value, ids, next, found, legacyShelf, source, continuation, album);
                }
            }
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) {
                collectShelves(array.opt(i), ids, next, found, legacyShelf, source, continuation, album);
            }
        }
    }

    private static void validateShelf(Object value, String source, String items) throws IOException {
        if (!(value instanceof JSONObject shelf) || shelf.optJSONArray(items) == null) {
            throw new IOException("Music returned a malformed playlist shelf");
        }
        String id = shelf.optString("playlistId");
        if (!id.isEmpty() && !id.equals(source) && !id.equals("VL" + source)) {
            throw new IOException("Music returned a different playlist");
        }
    }

    private static void collectItems(Object node, List<String> ids, String[] next, boolean strict,
                                     @Nullable String albumId, boolean identifiedShelf) throws IOException {
        if (node instanceof JSONObject object) {
            for (String key : ROW_RENDERERS) {
                JSONObject row = object.optJSONObject(key);
                if (row == null) continue;
                JSONObject itemData = row.optJSONObject("playlistItemData");
                String id = itemData == null ? "" : itemData.optString("videoId");
                JSONObject endpoint = id.isEmpty() || albumId != null ? row.optJSONObject("navigationEndpoint") : null;
                JSONObject watch = endpoint == null ? null : endpoint.optJSONObject("watchEndpoint");
                if (id.isEmpty()) {
                    // an owned playlist lists an "Add a song" search row, not a track.
                    if (itemData == null && endpoint != null && endpoint.has("searchEndpoint")) return;
                    if (watch != null) id = watch.optString("videoId");
                }
                if (id.isEmpty() && !isGreyedOut(row)) throw new IOException("A playlist track has no video id");
                if (strict && !id.isEmpty() && !RawAudioFiles.validId(id)) {
                    throw new IOException("A playlist track has an invalid video id");
                }
                if (albumId != null && !id.isEmpty()) {
                    String rowPlaylist = watch == null ? "" : watch.optString("playlistId");
                    if (!rowPlaylist.equals(albumId) && (!rowPlaylist.isEmpty() || !identifiedShelf)) {
                        throw new IOException("Album track belongs to an unverified playlist");
                    }
                    if (watch != null && !id.equals(watch.optString("videoId"))) {
                        throw new IOException("Album track has conflicting video ids");
                    }
                }
                // Deliberate duplicate positions must remain in the playlist, and so must the position of an
                // unavailable track: the app numbers the rows after it with it counted.
                ids.add(id.isEmpty() ? UNAVAILABLE : id);
                return; // Never mistake a row's menus/recommendations for additional playlist tracks.
            }
            JSONObject continuation = object.optJSONObject("nextContinuationData");
            if (continuation == null) continuation = object.optJSONObject("continuationCommand");
            if (continuation != null) {
                String token = continuation.optString("continuation", continuation.optString("token"));
                if (strict && (token.isBlank() || next[0] != null && !next[0].equals(token))) {
                    throw new IOException("Music returned an invalid playlist continuation");
                }
                if (!token.isEmpty()) next[0] = token;
                return;
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                collectItems(object.opt(keys.next()), ids, next, strict, albumId, identifiedShelf);
            }
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) {
                collectItems(array.opt(i), ids, next, strict, albumId, identifiedShelf);
            }
        }
    }
}
