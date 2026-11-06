/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-01.
 */
package app.morphe.extension.music.patches.androidauto;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.support.v4.media.MediaBrowserCompat;
import android.support.v4.media.MediaDescriptionCompat;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;

import static app.morphe.extension.music.patches.androidauto.AndroidAutoDownloadsData.*;

/** Reads only the fork's published native playlists; it never needs a phone browse client or login headers. */
final class AndroidAutoDownloadsFolder {
    private static final String DATABASE_NAME = "music_sideloaded_playlist_database";

    private AndroidAutoDownloadsFolder() {}

    static boolean enabled() {
        return AndroidAutoPatch.downloadedPlaylistsSupported()
                && Settings.IN_APP_DOWNLOADS.get() && Settings.ANDROID_AUTO_DOWNLOADED_PLAYLISTS.get();
    }

    static MediaBrowserCompat.MediaItem folder() {
        return item(ROOT_ID, ResourceUtils.getString("morphe_music_android_auto_downloaded_playlists_folder"),
                null, MediaBrowserCompat.MediaItem.FLAG_BROWSABLE, null, null);
    }

    static MediaBrowserCompat.MediaItem library() {
        return item(LIBRARY_ID, ResourceUtils.getString("morphe_music_android_auto_downloaded_playlists_library"),
                null, MediaBrowserCompat.MediaItem.FLAG_BROWSABLE, null, null);
    }

    static List<MediaBrowserCompat.MediaItem> load(String requestedId) {
        List<MediaBrowserCompat.MediaItem> items = new ArrayList<>();
        if (!enabled()) return items;
        List<Playlist> playlists = readPlaylists();
        if (LIBRARY_ID.equals(requestedId)) {
            if (!playlists.isEmpty()) items.add(folder());
            return items;
        }
        if (ROOT_ID.equals(requestedId)) {
            var artwork = new AndroidAutoDownloadsArtwork.Batch();
            for (Playlist playlist : playlists) {
                items.add(item(playlistId(playlist.id()), playlist.title(),
                        playlist.tracks().size() + " " + ResourceUtils.getString(
                                "morphe_music_android_auto_downloaded_playlists_tracks"),
                        MediaBrowserCompat.MediaItem.FLAG_BROWSABLE,
                        AndroidAutoDownloadsArtworkData.coverTrack(playlist), artwork));
            }
            artwork.finish(items.size());
        } else {
            long playlistId = parsePlaylistId(requestedId);
            for (Playlist playlist : playlists) {
                if (playlist.id() != playlistId) continue;
                int count = playlist.tracks().size();
                var artwork = new AndroidAutoDownloadsArtwork.Batch();
                for (int index = 0; index < count; index++) {
                    Track track = playlist.tracks().get(index);
                    long seconds = track.durationMs() / 1000;
                    String duration = seconds / 60 + ":" + (seconds % 60 < 10 ? "0" : "") + seconds % 60;
                    String subtitle = track.artist() + " · " + track.album() + " · " + duration;
                    items.add(item(playId(playlistId, index, count), track.title(), subtitle,
                            MediaBrowserCompat.MediaItem.FLAG_PLAYABLE, track, artwork));
                }
                artwork.finish(items.size());
                break;
            }
        }
        return items;
    }

    static List<Playlist> readPlaylists() {
        Utils.verifyOffMainThread();
        if (!enabled()) return List.of();
        File file = Utils.getContext().getDatabasePath(DATABASE_NAME);
        if (!file.isFile()) return List.of();

        Map<Long, String> sources = new HashMap<>();
        Utils.getContext().getSharedPreferences("rvx_native_playlists", 0).getAll().forEach((key, value) -> {
            if (value instanceof Long id && id >= 0) sources.put(id, key);
        });
        if (sources.isEmpty()) return List.of();

        Map<Long, String> titles = new LinkedHashMap<>();
        Map<Long, List<long[]>> positions = new HashMap<>();
        StringJoiner audioIds = new StringJoiner(",");
        try (SQLiteDatabase database = SQLiteDatabase.openDatabase(file.getPath(), null,
                SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.NO_LOCALIZED_COLLATORS);
             Cursor cursor = database.rawQuery(
                     "SELECT p.id, p.title, t.audio_media_id, t.position FROM music_sideloaded_playlist p"
                             + " JOIN music_sideloaded_playlist_track t ON p.id = t.playlist_id"
                             + " ORDER BY p.id, t.position", null)) {
            while (cursor.moveToNext()) {
                long playlist = cursor.getLong(0);
                if (!sources.containsKey(playlist)) continue;
                long audio = cursor.getLong(2);
                titles.put(playlist, cursor.getString(1));
                positions.computeIfAbsent(playlist, ignored -> new ArrayList<>())
                        .add(new long[]{audio, cursor.getLong(3)});
                audioIds.add(Long.toString(audio));
            }
        }
        if (titles.isEmpty()) return List.of();

        Map<Long, Track> audio = readAudio(audioIds.toString());
        List<Playlist> playlists = new ArrayList<>();
        for (var entry : titles.entrySet()) {
            List<Track> tracks = new ArrayList<>();
            for (long[] position : positions.get(entry.getKey())) {
                Track track = audio.get(position[0]);
                if (track == null) continue;
                tracks.add(new Track(track.mediaId(), position[1], track.title(), track.artist(),
                        track.album(), track.durationMs(), track.modifiedSeconds(), track.fileSize()));
            }
            playlists.add(playlist(entry.getKey(), sources.get(entry.getKey()), entry.getValue(),
                    ResourceUtils.getString("morphe_music_not_in_playlist"), tracks));
        }
        return nonemptyPlaylists(playlists);
    }

    private static Map<Long, Track> readAudio(String ids) {
        Map<Long, Track> audio = new HashMap<>();
        String[] projection = {MediaStore.Audio.Media._ID, MediaStore.Audio.Media.TITLE,
                MediaStore.Audio.Media.ARTIST, MediaStore.Audio.Media.ALBUM, MediaStore.Audio.Media.DURATION,
                MediaStore.Audio.Media.DATE_MODIFIED, MediaStore.Audio.Media.SIZE};
        try (Cursor cursor = Utils.getContext().getContentResolver().query(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
                projection, MediaStore.Audio.Media._ID + " IN (" + ids + ")", null, null)) {
            while (cursor != null && cursor.moveToNext()) {
                long id = cursor.getLong(0);
                audio.put(id, new Track(id, 0, text(cursor, 1), text(cursor, 2), text(cursor, 3),
                        cursor.getLong(4), cursor.getLong(5), cursor.getLong(6)));
            }
        }
        return audio;
    }

    private static String text(Cursor cursor, int column) {
        return cursor.isNull(column) ? "" : cursor.getString(column);
    }

    /** Stock white PNG avoids the theme-dependent tint of Music's vector download drawable. */
    private static Uri categoryIconUri() {
        var context = Utils.getContext();
        var resources = context.getResources();
        String packageName = context.getPackageName();
        String name = "yt_outline_download_white_24";
        if (resources.getIdentifier(name, "drawable", packageName) == 0) {
            name = "yt_outline_experimental_playlist_vd_theme_24";
            if (resources.getIdentifier(name, "drawable", packageName) == 0) return null;
        }
        return Uri.parse("android.resource://" + packageName + "/drawable/" + name);
    }

    private static MediaBrowserCompat.MediaItem item(String id, String title, String subtitle, int flags,
            Track cover, AndroidAutoDownloadsArtwork.Batch artwork) {
        Bundle extras = new Bundle();
        extras.putInt("android.media.browse.CONTENT_STYLE_BROWSABLE_HINT", 1);
        extras.putInt("android.media.browse.CONTENT_STYLE_PLAYABLE_HINT", 1);
        MediaDescriptionCompat description = artwork == null
                ? new MediaDescriptionCompat(id, title, subtitle, null, null, categoryIconUri(), extras, null)
                : artwork.description(id, title, subtitle, extras, cover);
        return new MediaBrowserCompat.MediaItem(description, flags);
    }
}
