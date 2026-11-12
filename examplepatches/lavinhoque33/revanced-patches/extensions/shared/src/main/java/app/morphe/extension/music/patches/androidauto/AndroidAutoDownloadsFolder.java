/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-01.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.androidauto;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.support.v4.media.MediaBrowserCompat;
import android.support.v4.media.MediaDescriptionCompat;

import androidx.annotation.Nullable;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import app.morphe.extension.music.patches.downloads.DownloadMethod;
import app.morphe.extension.music.patches.downloads.OfflineStreamBrowse;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;

import static app.morphe.extension.music.patches.androidauto.AndroidAutoDownloadsData.*;

/** Reads only the fork's published native playlists; it never needs a phone browse client or login headers. */
final class AndroidAutoDownloadsFolder {
    private static final String DATABASE_NAME = "music_sideloaded_playlist_database";

    private AndroidAutoDownloadsFolder() {}

    /** The device-file playlists are the fork's own downloads: they need a device files download method. */
    static boolean deviceFilesEnabled() {
        return AndroidAutoPatch.downloadedPlaylistsSupported()
                && Settings.DOWNLOAD_METHOD.get() == DownloadMethod.DEVICE_FILES
                && Settings.ANDROID_AUTO_DOWNLOADED_PLAYLISTS.get();
    }

    /** The stream copies are played by the offline replay, whatever the download methods are now. */
    static boolean streamEnabled() {
        return AndroidAutoPatch.downloadedPlaylistsSupported()
                && Settings.ANDROID_AUTO_DOWNLOADED_PLAYLISTS.get() && OfflineStreamBrowse.enabled();
    }

    static boolean enabled() {
        return deviceFilesEnabled() || streamEnabled();
    }

    /** Whether the Downloaded playlists folder has anything to show. Reads the disk: not for the main thread. */
    static boolean hasEntries() {
        return !readPlaylists().isEmpty() || streamHasEntries();
    }

    private static boolean streamHasEntries() {
        return streamEnabled() && !OfflineStreamBrowse.sources().isEmpty();
    }

    static MediaBrowserCompat.MediaItem folder() {
        return item(ROOT_ID, ResourceUtils.getString("morphe_music_android_auto_downloaded_playlists_folder"),
                null, MediaBrowserCompat.MediaItem.FLAG_BROWSABLE, null, null);
    }

    /** The subfolder of the Downloaded playlists folder that holds the stream copies. */
    private static MediaBrowserCompat.MediaItem streamFolder() {
        return item(AndroidAutoStreamIds.FOLDER_ID,
                ResourceUtils.getString("morphe_music_android_auto_stream_copies_folder"),
                null, MediaBrowserCompat.MediaItem.FLAG_BROWSABLE, null, null);
    }

    static MediaBrowserCompat.MediaItem library() {
        return item(LIBRARY_ID, ResourceUtils.getString("morphe_music_android_auto_downloaded_playlists_library"),
                null, MediaBrowserCompat.MediaItem.FLAG_BROWSABLE, null, null);
    }

    static List<MediaBrowserCompat.MediaItem> load(String requestedId) {
        List<MediaBrowserCompat.MediaItem> items = new ArrayList<>();
        if (!enabled()) return items;
        if (AndroidAutoStreamIds.isStream(requestedId)) return loadStream(requestedId);

        List<Playlist> playlists = readPlaylists();
        if (LIBRARY_ID.equals(requestedId)) {
            if (!playlists.isEmpty() || streamHasEntries()) items.add(folder());
            return items;
        }
        if (ROOT_ID.equals(requestedId)) {
            var artwork = new AndroidAutoDownloadsArtwork.Batch();
            // The stream copies are a folder of their own, first, never mixed with the device-file playlists.
            if (streamHasEntries()) items.add(streamFolder());
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

    /**
     * The stream folder lists the downloaded albums and playlists and a list of every song; a list holds a Play all
     * row and its songs. Only songs with stored data are shown, in the order of the offline queue, so a row's index
     * is the index the offline command plays.
     */
    private static List<MediaBrowserCompat.MediaItem> loadStream(String requestedId) {
        List<MediaBrowserCompat.MediaItem> items = new ArrayList<>();
        if (!streamEnabled()) return items;

        var artwork = new AndroidAutoDownloadsArtwork.Batch();
        String sourceId = AndroidAutoStreamIds.parseSource(requestedId);
        if (AndroidAutoStreamIds.FOLDER_ID.equals(requestedId)) {
            for (OfflineStreamBrowse.Source source : OfflineStreamBrowse.sources()) {
                if (!AndroidAutoStreamIds.isValidSource(source.id())) continue;

                items.add(streamItem(AndroidAutoStreamIds.sourceId(source.id()), streamSourceTitle(source),
                        tracksText(source.trackCount()), MediaBrowserCompat.MediaItem.FLAG_BROWSABLE,
                        source.coverVideoId(), artwork));
            }
        } else if (sourceId != null) {
            List<OfflineStreamBrowse.Track> tracks = OfflineStreamBrowse.tracksOf(sourceId);
            int count = tracks.size();
            if (count > 0) {
                items.add(streamItem(AndroidAutoStreamIds.playAllId(sourceId, count),
                        ResourceUtils.getString("morphe_music_android_auto_stream_play_all"), tracksText(count),
                        MediaBrowserCompat.MediaItem.FLAG_PLAYABLE, tracks.get(0).videoId(), artwork));
            }
            for (int index = 0; index < count; index++) {
                OfflineStreamBrowse.Track track = tracks.get(index);
                items.add(streamItem(AndroidAutoStreamIds.playId(sourceId, index, count), track.title(),
                        track.subtitle(), MediaBrowserCompat.MediaItem.FLAG_PLAYABLE, track.videoId(), artwork));
            }
        }
        artwork.finish(items.size());
        return items;
    }

    private static String streamSourceTitle(OfflineStreamBrowse.Source source) {
        if (OfflineStreamBrowse.SONGS.equals(source.id())) {
            return ResourceUtils.getString("morphe_music_downloads_no_playlist");
        }
        return source.title().isEmpty()
                ? ResourceUtils.getString("morphe_music_offline_library_untitled") : source.title();
    }

    private static String tracksText(int count) {
        return count + " " + ResourceUtils.getString("morphe_music_android_auto_downloaded_playlists_tracks");
    }

    static List<Playlist> readPlaylists() {
        Utils.verifyOffMainThread();
        if (!deviceFilesEnabled()) return List.of();
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
        Bundle extras = extras();
        MediaDescriptionCompat description = artwork == null
                ? new MediaDescriptionCompat(id, title, subtitle, null, null, categoryIconUri(), extras, null)
                : artwork.description(id, title, subtitle, extras, cover);
        return new MediaBrowserCompat.MediaItem(description, flags);
    }

    /** A row of the stream branch; {@code coverVideoId} names the song whose stored cover it shows. */
    private static MediaBrowserCompat.MediaItem streamItem(String id, String title, String subtitle, int flags,
            @Nullable String coverVideoId, AndroidAutoDownloadsArtwork.Batch artwork) {
        return new MediaBrowserCompat.MediaItem(
                artwork.streamDescription(id, title, subtitle, extras(), coverVideoId), flags);
    }

    private static Bundle extras() {
        Bundle extras = new Bundle();
        extras.putInt("android.media.browse.CONTENT_STYLE_BROWSABLE_HINT", 1);
        extras.putInt("android.media.browse.CONTENT_STYLE_PLAYABLE_HINT", 1);
        return extras;
    }
}
