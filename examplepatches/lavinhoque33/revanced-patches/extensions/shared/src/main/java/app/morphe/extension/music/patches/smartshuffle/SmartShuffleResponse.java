/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/** Android Music response shapes captured on Moto, without Android dependencies. */
final class SmartShuffleResponse {
    private static final String[] SONG_ROWS = {
            "musicTwoColumnItemRenderer", "musicResponsiveListItemRenderer", "musicMultiRowListItemRenderer"
    };
    private static final String[] ORIGINAL_SHELVES = {
            "musicPlaylistShelfRenderer", "musicPlaylistShelfContinuation"
    };
    private static final String[] SUGGESTION_SHELVES = {"musicShelfRenderer", "musicShelfContinuation"};
    private static final String[] PLAYBACK_SURFACES = {
            "navigationEndpoint", "potentialThumbnailOverlays", "overlay", "thumbnailOverlay", "flexColumns", "title"
    };

    static final class BrowsePage {
        final Set<String> originals = new LinkedHashSet<>();
        final List<SmartShuffleSource.Candidate> suggestions = new ArrayList<>();
        final List<String> originalTokens = new ArrayList<>();
        final List<String> sectionTokens = new ArrayList<>();
        String reload = "";
        boolean originalShelf;
    }

    record RadioPage(List<SmartShuffleSource.Candidate> candidates, String continuation) {}

    private SmartShuffleResponse() {}

    static BrowsePage browse(JSONObject response, String playlistId) throws IOException {
        BrowsePage page = new BrowsePage();
        readContents(response.optJSONObject("contents"), playlistId, page);
        readContents(response.optJSONObject("continuationContents"), playlistId, page);
        return page;
    }

    private static void readContents(Object node, String playlistId, BrowsePage page) throws IOException {
        if (node instanceof JSONArray array) {
            for (int index = 0; index < array.length(); index++) {
                readContents(array.opt(index), playlistId, page);
            }
            return;
        }
        if (!(node instanceof JSONObject object)) return;

        for (String name : ORIGINAL_SHELVES) {
            JSONObject shelf = object.optJSONObject(name);
            if (shelf == null) continue;

            page.originalShelf = true;
            readOriginals(shelf.optJSONArray("contents"), page.originals);
            addToken(page.originalTokens, token(shelf, "nextContinuationData"));
            return;
        }

        for (String name : SUGGESTION_SHELVES) {
            JSONObject shelf = object.optJSONObject(name);
            if (shelf == null) continue;

            String reload = token(shelf, "reloadContinuationData");
            // A sort/filter reload elsewhere in a page is NOT a suggestion shelf (notably Liked Songs).
            if (!reload.isEmpty() && shelf.optBoolean("autoReloadWhenEmpty")) {
                page.reload = reload;
                readSuggestions(shelf.optJSONArray("contents"), playlistId, page.suggestions);
            }
            return;
        }

        Iterator<String> keys = object.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            // Never descend into menus, chip-bar filters, comments, or native command item copies.
            if ("header".equals(key) || "menu".equals(key) || "panels".equals(key)) continue;
            if ("sectionListRenderer".equals(key) || "sectionListContinuation".equals(key)) {
                JSONObject section = object.optJSONObject(key);
                if (section != null) {
                    addToken(page.sectionTokens, token(section, "nextContinuationData"));
                    readContents(section.optJSONArray("contents"), playlistId, page);
                }
            } else if ("contents".equals(key) || "tabs".equals(key) || "tabRenderer".equals(key)
                    || "content".equals(key) || "singleColumnBrowseResultsRenderer".equals(key)
                    || "twoColumnBrowseResultsRenderer".equals(key) || "secondaryContents".equals(key)) {
                readContents(object.opt(key), playlistId, page);
            }
        }
    }

    private static void addToken(List<String> tokens, String token) {
        if (!token.isEmpty()) tokens.add(token);
    }

    private static void readOriginals(JSONArray rows, Set<String> originals) throws IOException {
        if (rows == null) throw new IOException("Playlist shelf has no contents");

        for (int index = 0; index < rows.length(); index++) {
            JSONObject row = songRow(rows.optJSONObject(index));
            if (row == null) continue;

            String videoId = videoId(row);
            // Playlist shelves also contain actions (for example Add a song) and unavailable rows.
            if (!videoId.isEmpty()) originals.add(videoId);
        }
    }

    private static void readSuggestions(JSONArray rows, String playlistId,
                                        List<SmartShuffleSource.Candidate> candidates) {
        if (rows == null) return;

        for (int index = 0; index < rows.length(); index++) {
            JSONObject row = songRow(rows.optJSONObject(index));
            if (row == null) continue;

            String videoId = videoId(row);
            if (!videoId.isEmpty() && editEndpoint(row, playlistId, videoId) != null) {
                // Retain the complete native menu, suggestion command, and opaque edit params for Keep.
                candidates.add(new SmartShuffleSource.Candidate(videoId, row));
            }
        }
    }

    private static JSONObject songRow(JSONObject item) {
        if (item == null) return null;

        for (String name : SONG_ROWS) {
            JSONObject row = item.optJSONObject(name);
            if (row != null) return row;
        }
        return null;
    }

    private static String videoId(JSONObject row) {
        String videoId = row.optString("videoId");
        JSONObject data = row.optJSONObject("playlistItemData");
        if (videoId.isEmpty() && data != null) videoId = data.optString("videoId");

        if (!videoId.isEmpty()) return videoId;
        // Stay within playback/title surfaces. Menus may refer to a different radio seed or queued song.
        for (String field : PLAYBACK_SURFACES) {
            videoId = playbackVideoId(row.opt(field));
            if (!videoId.isEmpty()) return videoId;
        }
        return "";
    }

    private static String playbackVideoId(Object node) {
        if (node instanceof JSONObject object) {
            String videoId = object.optString("videoId");
            if (!videoId.isEmpty()) return videoId;
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                videoId = playbackVideoId(object.opt(keys.next()));
                if (!videoId.isEmpty()) return videoId;
            }
        } else if (node instanceof JSONArray array) {
            for (int index = 0; index < array.length(); index++) {
                String videoId = playbackVideoId(array.opt(index));
                if (!videoId.isEmpty()) return videoId;
            }
        }
        return "";
    }

    static boolean editable(JSONObject response) {
        return find(response.optJSONObject("header"), "musicEditablePlaylistDetailHeaderRenderer") != null;
    }

    static JSONObject radioEndpoint(JSONObject response, String sourcePlaylistId) {
        return matchingEndpoint(response, "watchPlaylistEndpoint", endpoint ->
                ("RDAMPL" + sourcePlaylistId).equals(endpoint.optString("playlistId")),
                "watchEndpoint", endpoint ->
                        ("RDAMPL" + sourcePlaylistId).equals(endpoint.optString("playlistId")));
    }

    private interface Match {
        boolean matches(JSONObject endpoint);
    }

    private static JSONObject matchingEndpoint(Object node, String firstKey, Match firstMatch,
                                               String secondKey, Match secondMatch) {
        if (node instanceof JSONObject object) {
            JSONObject endpoint = object.optJSONObject(firstKey);
            if (endpoint != null && firstMatch.matches(endpoint)) return endpoint;
            endpoint = object.optJSONObject(secondKey);
            if (endpoint != null && secondMatch.matches(endpoint)) return endpoint;

            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                JSONObject found = matchingEndpoint(object.opt(keys.next()), firstKey, firstMatch,
                        secondKey, secondMatch);
                if (found != null) return found;
            }
        } else if (node instanceof JSONArray array) {
            for (int index = 0; index < array.length(); index++) {
                JSONObject found = matchingEndpoint(array.opt(index), firstKey, firstMatch, secondKey, secondMatch);
                if (found != null) return found;
            }
        }
        return null;
    }

    static JSONObject editEndpoint(JSONObject row, String playlistId, String videoId) {
        return matchingEndpoint(row, "playlistEditEndpoint", endpoint -> {
            if (!playlistId.equals(endpoint.optString("playlistId"))) return false;
            JSONArray actions = endpoint.optJSONArray("actions");
            if (actions == null || actions.length() != 1) return false;
            JSONObject action = actions.optJSONObject(0);
            return action != null && "ACTION_ADD_VIDEO".equals(action.optString("action"))
                    && videoId.equals(action.optString("addedVideoId"));
        }, "playlistEditEndpoint", endpoint -> false);
    }

    static JSONObject editRequest(String playlistId, SmartShuffleSource.Candidate candidate) throws JSONException {
        JSONObject endpoint = editEndpoint(candidate.command(), playlistId, candidate.videoId());
        if (endpoint != null) {
            JSONObject request = new JSONObject(endpoint.toString());
            request.remove("clientActions");
            return request;
        }

        // Radio recommendations have no suggestion-specific action; use the native playlist edit operation.
        return new JSONObject().put("playlistId", playlistId).put("actions", new JSONArray().put(new JSONObject()
                .put("action", "ACTION_ADD_VIDEO").put("addedVideoId", candidate.videoId())
                .put("dedupeOption", "DEDUPE_OPTION_CHECK")));
    }

    static boolean confirmedEdit(JSONObject response, String videoId) {
        if (!"STATUS_SUCCEEDED".equals(response.optString("status"))) return false;
        JSONArray results = response.optJSONArray("playlistEditResults");
        if (results == null) return false;

        for (int index = 0; index < results.length(); index++) {
            JSONObject result = results.optJSONObject(index);
            JSONObject added = result == null ? null : result.optJSONObject("playlistEditVideoAddedResultData");
            if (added != null && !added.optString("setVideoId").isEmpty()
                    && videoId.equals(added.optString("videoId"))) return true;
        }
        return false;
    }

    static RadioPage radio(JSONObject response) throws IOException {
        JSONObject continuation = response.optJSONObject("continuationContents");
        JSONObject panel = continuation == null ? null : continuation.optJSONObject("playlistPanelContinuation");
        if (panel == null) panel = find(response.optJSONObject("contents"), "playlistPanelRenderer");
        if (panel == null) throw new IOException("Playlist radio response has no queue panel");

        List<SmartShuffleSource.Candidate> candidates = new ArrayList<>();
        JSONArray rows = panel.optJSONArray("contents");
        if (rows == null) throw new IOException("Playlist radio panel has no contents");
        for (int index = 0; index < rows.length(); index++) {
            JSONObject item = rows.optJSONObject(index);
            if (item == null) continue;

            JSONObject row = item.optJSONObject("playlistPanelVideoRenderer");
            JSONObject wrapper = item.optJSONObject("playlistPanelVideoWrapperRenderer");
            if (row == null && wrapper != null) {
                JSONObject primary = wrapper.optJSONObject("primaryRenderer");
                if (primary != null) row = primary.optJSONObject("playlistPanelVideoRenderer");
            }
            if (row == null) continue; // Never follow an automix preview or the live autoplay lane.

            String videoId = videoId(row);
            if (!videoId.isEmpty()) candidates.add(new SmartShuffleSource.Candidate(videoId, row));
        }

        String next = token(panel, "nextRadioContinuationData");
        if (next.isEmpty()) next = token(panel, "nextContinuationData");
        return new RadioPage(candidates, next);
    }

    private static String token(JSONObject container, String name) {
        JSONArray continuations = container.optJSONArray("continuations");
        if (continuations == null) return "";

        for (int index = 0; index < continuations.length(); index++) {
            JSONObject entry = continuations.optJSONObject(index);
            JSONObject data = entry == null ? null : entry.optJSONObject(name);
            if (data != null) return data.optString("continuation");
        }
        return "";
    }

    private static JSONObject find(Object node, String name) {
        return matchingEndpoint(node, name, endpoint -> true, name, endpoint -> false);
    }
}
