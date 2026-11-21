/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.music.patches.misc.requests.MusicBrowseRequest;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Album positions for new Device files, from each track's own album, never the list being downloaded. */
final class AlbumFileTracks {
    private static final String[] WATCH_TABS = {"contents", "singleColumnMusicWatchNextResultsRenderer",
            "tabbedRenderer", "watchNextTabbedResultsRenderer"};
    private static final String[] WATCH_QUEUE = {"tabRenderer", "content", "musicQueueRenderer", "content",
            "playlistPanelRenderer"};
    private static final String[] MENU = {"menu", "menuRenderer"};
    private static final String[] MENU_BROWSE = {"menuNavigationItemRenderer", "navigationEndpoint", "browseEndpoint"};
    private static final String[] PAGE_TYPE = {"browseEndpointContextSupportedConfigs",
            "browseEndpointContextMusicConfig"};
    private static final String[] ALBUM_PLAY = {"fab", "buttonRenderer", "command", "watchPlaylistEndpoint"};

    private static final Browse NETWORK = (id, token) -> MusicBrowseRequest.browse(Utils.getContext(), id, token, null);
    private static final Album NO_ALBUM = new Album(Map.of(), 0);

    @FunctionalInterface
    interface Browse {
        JSONObject read(String browseId, @Nullable String continuation) throws Exception;
    }

    record Position(int number, int total) {}

    private record Album(Map<String, Integer> numbers, int total) {}

    // Each job has its own results, so a batch does not fetch the same album for every track.
    private final Map<String, Album> albums = new HashMap<>();
    private final Browse browse;

    AlbumFileTracks(Browse browse) {
        this.browse = browse;
    }

    static AlbumFileTracks single() {
        return new AlbumFileTracks(NETWORK);
    }

    static AlbumFileTracks batch(String browseId, JSONObject first) {
        return new AlbumFileTracks((id, token) -> token == null && id.equals(browseId)
                ? first : NETWORK.read(id, token));
    }

    /** The caller has verified the watch response is for this exact video. */
    @Nullable
    Position resolve(String videoId, JSONObject watchResponse) {
        String pageId = albumPageId(watchResponse, videoId);
        if (pageId == null) return null;

        Album album = albums.computeIfAbsent(pageId, this::readAlbum);
        int number = album.numbers().getOrDefault(videoId, 0);
        return number == 0 ? null : new Position(number, album.total());
    }

    private Album readAlbum(String pageId) {
        try {
            // The album page's primary Play button points to its ordered audio playlist. Menus, recommendations
            // and the current playback queue can name other OLAK playlists, even when they contain this track.
            JSONObject play = objectAt(browse.read(pageId, null), ALBUM_PLAY);
            String playlistId = play == null ? "" : play.optString("playlistId");
            if (!playlistId.startsWith("OLAK5uy_")) return NO_ALBUM;

            String browseId = "VL" + playlistId;
            List<String> tracks = PlaylistPage.readAlbum(playlistId, browse.read(browseId, null),
                    token -> browse.read(browseId, token));
            if (tracks.size() > 0xFFFF) return NO_ALBUM; // iTunes trkn stores uint16 values.

            Map<String, Integer> numbers = new HashMap<>();
            for (int index = 0; index < tracks.size(); index++) {
                String id = tracks.get(index);
                if (!PlaylistPage.isAvailable(id)) continue;

                // If the same video really occurs twice on the album there is no unique position for its file.
                if (numbers.putIfAbsent(id, index + 1) != null) numbers.put(id, 0);
            }
            return new Album(numbers, tracks.size());
        } catch (Exception ex) {
            if (ex instanceof InterruptedException) Thread.currentThread().interrupt();
            Logger.printDebug(() -> "Could not verify track positions for " + pageId, ex);
            return NO_ALBUM;
        }
    }

    @Nullable
    private static String albumPageId(JSONObject response, String videoId) {
        JSONObject watchTabs = objectAt(response, WATCH_TABS);
        JSONArray tabs = watchTabs == null ? null : watchTabs.optJSONArray("tabs");
        if (tabs == null) return null;

        String found = null;
        for (int tab = 0; tab < tabs.length(); tab++) {
            JSONObject queue = objectAt(tabs.optJSONObject(tab), WATCH_QUEUE);
            JSONArray items = queue == null ? null : queue.optJSONArray("contents");
            if (items == null) continue;

            for (int index = 0; index < items.length(); index++) {
                JSONObject item = items.optJSONObject(index);
                JSONObject video = item == null ? null : item.optJSONObject("playlistPanelVideoRenderer");
                if (video == null || !videoId.equals(video.optString("videoId"))) continue;

                JSONObject menu = objectAt(video, MENU);
                JSONArray actions = menu == null ? null : menu.optJSONArray("items");
                if (actions == null) continue;

                for (int action = 0; action < actions.length(); action++) {
                    JSONObject endpoint = objectAt(actions.optJSONObject(action), MENU_BROWSE);
                    JSONObject type = objectAt(endpoint, PAGE_TYPE);
                    if (type == null || !"MUSIC_PAGE_TYPE_ALBUM".equals(type.optString("pageType"))) continue;

                    String id = endpoint.optString("browseId");
                    if (!id.startsWith("MPREb_")) continue;
                    if (found != null && !found.equals(id)) return null;
                    found = id;
                }
            }
        }
        return found;
    }

    @Nullable
    private static JSONObject objectAt(@Nullable JSONObject object, String[] keys) {
        for (String key : keys) {
            if (object == null) return null;
            object = object.optJSONObject(key);
        }
        return object;
    }
}
