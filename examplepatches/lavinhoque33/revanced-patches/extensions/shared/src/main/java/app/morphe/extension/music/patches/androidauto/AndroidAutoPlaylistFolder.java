/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.music.patches.androidauto;

import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.media.MediaBrowserCompat;
import android.support.v4.media.MediaDescriptionCompat;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.music.patches.downloads.OfflineStreamBrowse;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;

/** Disk work stays on the browse/playback workers; connectivity and account changes refresh active subscriptions. */
final class AndroidAutoPlaylistFolder {
    private static final class Storage {
        static final AndroidAutoPlaylistCatalog catalog = new AndroidAutoPlaylistCatalog(
                new File(Utils.getContext().getFilesDir(), "rvx_aa_playlists"));
        static final AndroidAutoPlaylistTrackStore tracks = new AndroidAutoPlaylistTrackStore(
                new File(Utils.getContext().getFilesDir(), "rvx_aa_playlists"));
    }

    private static volatile String account = "";
    private static boolean monitoring;

    private AndroidAutoPlaylistFolder() {}

    static synchronized void selectAccount(String identity) {
        String selected = identity.isEmpty() ? "" : hash(identity);
        if (account.equals(selected)) return;

        account = selected;
        Storage.catalog.selectAccount(selected);
        AndroidAutoPatch.onPlaylistsChanged();
    }

    static String account() {
        AndroidAutoPlaylistAccount.refresh();
        return account.isEmpty() ? hash("device-stream-copies") : account;
    }

    static AndroidAutoPlaylistCatalog.Load begin() {
        AndroidAutoPlaylistAccount.refresh();
        return Storage.catalog.begin();
    }

    static boolean owns(AndroidAutoPlaylistCatalog.Load load) {
        AndroidAutoPlaylistAccount.refresh();
        return Storage.catalog.owns(load);
    }

    static boolean hasSnapshot() {
        AndroidAutoPlaylistAccount.refresh();
        return Storage.catalog.hasSnapshot();
    }

    static List<AndroidAutoPlaylistCatalog.Entry> snapshot() {
        AndroidAutoPlaylistAccount.refresh();
        try {
            return Storage.catalog.read();
        } catch (IOException ex) {
            Logger.printException(() -> "Could not read Android Auto playlist catalog", ex);
            return List.of();
        }
    }

    static void publish(AndroidAutoPlaylistCatalog.Load load, List<AndroidAutoPlaylistCatalog.Entry> entries) {
        AndroidAutoPlaylistAccount.refresh();
        try {
            if (Storage.catalog.publish(load, entries, true)) AndroidAutoPatch.onPlaylistsChanged();
        } catch (IOException ex) {
            Logger.printException(() -> "Could not store Android Auto playlist catalog", ex);
        }
    }

    static List<AndroidAutoPlaylists.Source> sources() {
        if (!AndroidAutoDownloadsFolder.streamEnabled()) return List.of();

        List<AndroidAutoPlaylists.Source> result = new ArrayList<>();
        for (OfflineStreamBrowse.Source source : OfflineStreamBrowse.sources()) {
            result.add(new AndroidAutoPlaylists.Source(source.id(), source.canonicalId(), source.title(),
                    source.totalCount(), source.trackCount(), source.album(), source.coverVideoId()));
        }
        return result;
    }

    static AndroidAutoPlaylists.Source source(String id) {
        AndroidAutoPlaylists.Source selected = null;
        for (AndroidAutoPlaylists.Source source : sources()) {
            if (!id.equals(source.id()) && !id.equals(AndroidAutoPlaylists.canonical(source.canonicalId()))) continue;
            if (selected == null || source.ready() > selected.ready()) selected = source;
        }
        return selected;
    }

    static List<MediaBrowserCompat.MediaItem> items(List<AndroidAutoPlaylistCatalog.Entry> catalog) {
        boolean online = Utils.isInternetReachable();
        String selected = account();
        List<MediaBrowserCompat.MediaItem> result = new ArrayList<>();
        var artwork = new AndroidAutoDownloadsArtwork.Batch();
        var labels = new AndroidAutoPlaylists.Labels(text("album"), text("unavailable_offline"),
                text("partial_offline"), text("available_offline"));
        for (AndroidAutoPlaylists.Row row : AndroidAutoPlaylists.merge(catalog, sources(), online)) {
            String id = row.entry().id();

            boolean songs = AndroidAutoPlaylists.SONGS.equals(id);
            String mediaId = AndroidAutoPlaylistChildren.listId(selected, id);
            String title = songs ? text("downloaded_songs") : row.entry().title();
            if (title.isEmpty()) title = ResourceUtils.getString("morphe_music_offline_library_untitled");
            String subtitle = AndroidAutoPlaylists.subtitle(row, labels);
            MediaDescriptionCompat description;
            if (row.source() != null) {
                description = artwork.streamDescription(mediaId, title, subtitle, null, row.source().coverVideoId());
            } else {
                Uri icon = online && !row.entry().artwork().isEmpty() ? Uri.parse(row.entry().artwork())
                        : Uri.parse("android.resource://" + Utils.getContext().getPackageName()
                                + "/drawable/yt_outline_experimental_playlist_vd_theme_24");
                description = new MediaDescriptionCompat(mediaId, title, subtitle, null, null, icon, null, null);
            }
            result.add(new MediaBrowserCompat.MediaItem(description, MediaBrowserCompat.MediaItem.FLAG_BROWSABLE));
        }
        artwork.finish(result.size());
        return result;
    }

    static String localSourceId(String sourceId) {
        AndroidAutoPlaylists.Source source = source(sourceId);
        return source == null ? OfflineStreamBrowse.sourceId(sourceId) : source.id();
    }

    static List<String> readyIds(String sourceId) {
        return AndroidAutoDownloadsFolder.streamEnabled()
                ? OfflineStreamBrowse.readyIds(localSourceId(sourceId)) : List.of();
    }

    static AndroidAutoPlaylistChildren.Page localPage(String sourceId) {
        AndroidAutoPlaylistChildren.Page cached = savedTrackPage(sourceId);
        String localId = localSourceId(sourceId);
        List<OfflineStreamBrowse.Track> local = OfflineStreamBrowse.tracksOf(localId);
        if (local.isEmpty()) {
            return cached == null ? new AndroidAutoPlaylistChildren.Page(nativeId(sourceId), List.of(), "") : cached;
        }

        Map<String, AndroidAutoPlaylistChildren.Track> known = new HashMap<>();
        if (cached != null) for (var track : cached.tracks()) known.putIfAbsent(track.videoId(), track);
        List<AndroidAutoPlaylistChildren.Track> tracks = new ArrayList<>(local.size());
        for (var track : local) {
            var recorded = known.get(track.videoId());
            if (recorded != null && (track.title().isEmpty() || track.title().equals(track.videoId()))) {
                tracks.add(recorded);
            } else {
                tracks.add(recorded == null
                        ? new AndroidAutoPlaylistChildren.Track(track.videoId(), track.title(),
                                track.artist(), track.artwork())
                        : new AndroidAutoPlaylistChildren.Track(track.videoId(), track.title(),
                                track.artist(), track.artwork(), recorded.command()));
            }
        }
        String playlistId = cached == null || cached.playlistId().isEmpty() ? nativeId(sourceId) : cached.playlistId();
        return new AndroidAutoPlaylistChildren.Page(playlistId, List.copyOf(tracks), "");
    }

    static AndroidAutoPlaylistChildren.Page savedTrackPage(String sourceId) {
        try {
            var page = Storage.tracks.read(account(), sourceId);
            if (page != null) return page;
        } catch (IOException ex) {
            Logger.printException(() -> "Could not read Android Auto playlist tracks", ex);
        }
        byte[] saved = OfflineStreamBrowse.savedPage(sourceId);
        if (saved == null) return null;
        try {
            return AndroidAutoBrowseResponseParser.playlistPage(saved);
        } catch (IllegalArgumentException ex) {
            Logger.printException(() -> "Could not read songs from the saved playlist page", ex);
            return null;
        }
    }

    static void publishTracks(AndroidAutoPlaylistCatalog.Load load, String scope, String sourceId,
                              AndroidAutoPlaylistChildren.Page page) {
        if (!owns(load) || !scope.equals(account())) return;
        try {
            Storage.tracks.publish(scope, sourceId, load.number(), page, true);
        } catch (IOException ex) {
            Logger.printException(() -> "Could not store complete Android Auto playlist tracks", ex);
        }
    }

    static String nativeId(String sourceId) {
        return sourceId.startsWith("MPREb_") || OfflineStreamBrowse.SONGS.equals(sourceId) ? "" : sourceId;
    }

    static List<MediaBrowserCompat.MediaItem> children(String sourceId, AndroidAutoPlaylistChildren.Page page) {
        boolean online = Utils.isInternetReachable();
        String scope = account();
        List<String> readyQueue = readyIds(sourceId);
        Set<String> ready = new HashSet<>(readyQueue);
        Map<String, String> aliases = OfflineStreamBrowse.aliases();
        List<MediaBrowserCompat.MediaItem> items = new ArrayList<>();
        var artwork = new AndroidAutoDownloadsArtwork.Batch();
        for (var row : AndroidAutoPlaylistChildren.rows(page, online, ready, aliases)) {
            var track = row.track();
            String videoId = track == null ? "" : track.videoId();
            String canonical = aliases.getOrDefault(videoId, videoId);
            String id = row.playAll() ? AndroidAutoPlaylists.mediaId(scope, sourceId)
                    : AndroidAutoPlaylistChildren.trackId(scope, sourceId, videoId, row.index());
            String title = row.playAll() ? text("stream_play_all")
                    : track == null ? text(online ? "songs_unavailable" : "unavailable_offline") : track.title();
            if (title.isEmpty()) title = text("track_unavailable");
            String subtitle = track == null ? "" : track.artist();
            if (row.unavailable() && !online) {
                subtitle = subtitle.isEmpty() ? text("unavailable_offline")
                        : subtitle + " · " + text("unavailable_offline");
            }
            Bundle extras = new Bundle();
            extras.putInt("android.media.browse.CONTENT_STYLE_SINGLE_ITEM_HINT", 1);
            MediaDescriptionCompat description;
            String cover = row.playAll() ? readyQueue.isEmpty() ? null : readyQueue.get(0)
                    : ready.contains(canonical) ? canonical : null;
            if (cover != null) {
                description = artwork.streamDescription(id, title, subtitle, extras, cover);
            } else {
                Uri icon = online && track != null && !track.artwork().isEmpty() ? Uri.parse(track.artwork()) : null;
                if (icon == null) {
                    icon = Uri.parse("android.resource://" + Utils.getContext().getPackageName()
                            + "/drawable/yt_outline_experimental_audio_vd_theme_24");
                }
                description = new MediaDescriptionCompat(id, title, subtitle, null, null, icon, extras, null);
            }
            items.add(new MediaBrowserCompat.MediaItem(description, MediaBrowserCompat.MediaItem.FLAG_PLAYABLE));
        }
        artwork.finish(items.size());
        return items;
    }


    static String text(String suffix) {
        return ResourceUtils.getString("morphe_music_android_auto_" + suffix);
    }

    /** Default-network callbacks are notifications only; every selection still checks current reachability. */
    static synchronized void monitorConnectivity() {
        if (monitoring) return;
        Object service = Utils.getContext().getSystemService(android.content.Context.CONNECTIVITY_SERVICE);
        if (!(service instanceof ConnectivityManager manager)) return;

        try {
            manager.registerDefaultNetworkCallback(new ConnectivityManager.NetworkCallback() {
                @Override public void onAvailable(Network network) {
                    AndroidAutoPatch.onPlaylistsChanged();
                }

                @Override public void onLost(Network network) {
                    AndroidAutoPatch.onPlaylistsChanged();
                }

                @Override public void onCapabilitiesChanged(Network network, NetworkCapabilities capabilities) {
                    AndroidAutoPatch.onPlaylistsChanged();
                }
            });
            monitoring = true;
        } catch (RuntimeException ex) {
            Logger.printException(() -> "Could not monitor Android Auto connectivity", ex);
        }
    }

    private static String hash(String identity) {
        try {
            byte[] bytes = MessageDigest.getInstance("SHA-256").digest(identity.getBytes(StandardCharsets.UTF_8));
            StringBuilder result = new StringBuilder(64);
            for (byte value : bytes) result.append(Character.forDigit((value >>> 4) & 15, 16))
                    .append(Character.forDigit(value & 15, 16));
            return result.toString();
        } catch (NoSuchAlgorithmException ex) {
            throw new IllegalStateException(ex);
        }
    }
}
