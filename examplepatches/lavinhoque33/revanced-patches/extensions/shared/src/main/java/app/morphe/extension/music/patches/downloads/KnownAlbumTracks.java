/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.music.patches.misc.requests.MusicBrowseRequest;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * The track lists of the albums whose page was opened, for the green checks of songs downloaded one by one. An album
 * that was downloaded as a whole has its track list recorded with the download; any other album has none, so its list
 * is read once, from the page the app itself opens, and kept in memory until the app restarts. At most one request
 * is made for an album, and only when the device holds a stream copy at all.
 */
final class KnownAlbumTracks {
    private static final Map<String, List<String>> LISTS = new ConcurrentHashMap<>();
    private static final Set<String> ASKED = ConcurrentHashMap.newKeySet();

    private KnownAlbumTracks() {}

    /** The track list of an album page that was read before, in the album's order, or null. */
    @Nullable
    static List<String> tracksOf(String albumId) {
        return LISTS.get(albumId);
    }

    /**
     * Reads the track list of the album unless it was asked for before, then runs {@code onReady} on the main
     * thread. A failed read is not repeated until the app restarts.
     */
    static void readLater(String albumId, Runnable onReady) {
        if (LISTS.containsKey(albumId) || !ASKED.add(albumId)) return;

        Utils.runOnBackgroundThread(() -> {
            try {
                LISTS.put(albumId, read(albumId));
                Utils.runOnMainThread(onReady);
            } catch (Exception ex) {
                Logger.printDebug(() -> "KnownAlbumTracks: no track list for " + albumId, ex);
            }
        });
    }

    private static List<String> read(String albumId) throws Exception {
        List<String> tracks = new ArrayList<>();
        Set<String> continuations = new HashSet<>();
        String continuation = null;
        do {
            JSONObject response = MusicBrowseRequest.browse(Utils.getContext(), "VL" + albumId, continuation, null);
            PlaylistPage.Page page = PlaylistPage.read(response);
            tracks.addAll(page.videoIds());
            continuation = page.continuation();
            if (continuation != null && !continuations.add(continuation)) {
                throw new IOException("Music repeated an album continuation");
            }
        } while (continuation != null);
        return tracks;
    }
}
