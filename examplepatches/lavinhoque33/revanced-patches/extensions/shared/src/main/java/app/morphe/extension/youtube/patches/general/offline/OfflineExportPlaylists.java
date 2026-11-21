/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.youtube.patches.general.offline;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Build;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.shared.downloads.PortableExport;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** YouTube's flat offline index has no playlist association. Keep ordered metadata for confirmed batches. */
final class OfflineExportPlaylists {
    private OfflineExportPlaylists() {}

    private static SharedPreferences preferences() {
        return Utils.getContext().getSharedPreferences("rvx_offline_export_playlists", 0);
    }

    static void remember(String playlistId, OfflinePlaylist.Result playlist, List<OfflinePlaylistSelection.Item> selected) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) return; // pre-Q files are app-specific, not MediaStore.
        Set<String> preferAudio = new HashSet<>();
        for (var item : selected) if (item.audioOnly()) preferAudio.add(item.videoId());
        JSONArray entries = new JSONArray();
        for (var entry : playlist.entries()) {
            String videoId = entry.videoId();
            // Video IDs contain exactly 11 characters; appending the audio suffix retains the original identity.
            entries.put(OfflineVideo.keyOf(videoId, preferAudio.contains(videoId)));
        }
        try {
            JSONObject record = new JSONObject().put("title", playlist.title()).put("entries", entries);
            preferences().edit().putString(playlistId, record.toString()).apply();
        } catch (JSONException | RuntimeException ex) {
            Logger.printDebug(() -> "Could not remember the offline playlist's ordering", ex);
        }
    }

    static List<PortableExport.Request> saved() {
        Map<String, Uri> published = publishedMedia();
        if (published.isEmpty()) return List.of();
        List<PortableExport.Request> choices = new ArrayList<>();
        for (Object value : preferences().getAll().values()) {
            if (!(value instanceof String record)) continue;
            try {
                JSONObject playlist = new JSONObject(record);
                JSONArray entries = playlist.getJSONArray("entries");
                List<Uri> files = new ArrayList<>();
                for (int index = 0; index < entries.length(); index++) {
                    addPublished(files, published, entries.getString(index));
                }
                var request = request(playlist.optString("title"), files);
                if (request != null) choices.add(request);
            } catch (JSONException ex) {
                Logger.printDebug(() -> "Could not read the offline playlist's ordering", ex);
            }
        }
        choices.sort(Comparator.comparing(PortableExport.Request::title, String.CASE_INSENSITIVE_ORDER));
        return choices;
    }

    /** Old downloads did not retain ordering; an explicit lookup reads playlist metadata, never media. */
    @Nullable
    static PortableExport.Request resolve(OfflinePlaylist.Result playlist) {
        Map<String, Uri> published = publishedMedia();
        List<Uri> files = new ArrayList<>();
        for (var entry : playlist.entries()) addPublished(files, published, entry.videoId());
        return request(playlist.title(), files);
    }

    private static Map<String, Uri> publishedMedia() {
        Map<String, Uri> published = new HashMap<>();
        for (OfflineVideo video : OfflineIndex.getAll()) {
            Uri uri = Uri.parse(video.contentUri);
            if (PortableExport.isPublicMedia(uri)) published.put(video.key(), uri);
        }
        return published;
    }

    private static void addPublished(List<Uri> files, Map<String, Uri> published, String key) {
        Uri uri = published.get(key);
        if (uri == null && key.length() >= 11) {
            uri = published.get(key.length() == 11 ? OfflineVideo.keyOf(key, true) : key.substring(0, 11));
        }
        if (uri != null) files.add(uri);
    }

    @Nullable
    private static PortableExport.Request request(String title, List<Uri> files) {
        if (files.isEmpty()) return null;
        return new PortableExport.Request(title.isBlank() ? str("revanced_offline_batch_title") : title, true, files);
    }
}
