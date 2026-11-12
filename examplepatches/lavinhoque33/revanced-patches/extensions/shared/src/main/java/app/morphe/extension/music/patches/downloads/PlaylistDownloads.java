/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.music.patches.misc.requests.MusicBrowseRequest;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

// download the complete playlist, then publish a native offline queue in its original order.
public final class PlaylistDownloads {
    private static final Set<String> active = ConcurrentHashMap.newKeySet();

    private PlaylistDownloads() {}

    /**
     * The header Download of a playlist or album: a stream download that is saved already offers Remove instead,
     * so the playlist is never saved twice, and while its download runs a tap says so ({@link HeaderDownloadState}).
     */
    static void onDownloadButton(String playlistId) {
        boolean streamCopy = LocalDownloadManager.downloadMode().streamCopy();
        boolean running = isRunning(playlistId);
        HeaderDownloadState.Tap tap = HeaderDownloadState.tapOf(streamCopy,
                streamCopy && DownloadedMarkers.isSourceDownloaded(playlistId), running);
        Logger.printDebug(() -> "PlaylistDownloads: header Download of " + playlistId + ", tap=" + tap);
        switch (tap) {
            case REMOVE -> DownloadRemoval.confirmSource(playlistId);
            case IN_PROGRESS -> Utils.showToastShort(str("morphe_music_downloads_already_running"));
            case DOWNLOAD -> enqueue(playlistId);
        }
    }

    /** Whether any list is being downloaded. */
    static boolean anyRunning() {
        return !active.isEmpty();
    }

    /** Whether a download of the list is running. */
    static boolean isRunning(@Nullable String playlistId) {
        return playlistId != null && active.contains(playlistId);
    }

    public static void enqueue(String playlistId) {
        // Decided once for the whole playlist, so a setting changed mid-way cannot split it between modes.
        DownloadMode mode = LocalDownloadManager.downloadMode();
        DownloadQuality quality = Settings.DOWNLOAD_QUALITY.get();
        if (mode == DownloadMode.OFF) return;
        if (mode.localFiles() && !NativeDownloads.ensureStoragePermission()) return;
        if (!active.add(playlistId)) {
            Utils.showToastShort(str("morphe_music_downloads_already_running"));
            return;
        }
        Utils.showToastShort(str("morphe_music_playlist_download_started"));
        Utils.submitOnBackgroundThread(() -> {
            String title = playlistId;
            SourceHeader header = SourceHeader.EMPTY;
            try {
                if (mode.localFiles()) NativeDownloads.migrateLegacy();
                List<String> tracks = new ArrayList<>();
                Set<String> continuations = new HashSet<>();
                String continuation = null;
                do {
                    JSONObject response = MusicBrowseRequest.browse(Utils.getContext(), "VL" + playlistId,
                            continuation, null);
                    if (continuation == null) {
                        header = header(playlistId, response);
                        if (!header.hasTitle()) throw new IOException("Playlist title is unavailable");
                        title = header.title();
                    }
                    PlaylistPage.Page page = PlaylistPage.read(response);
                    tracks.addAll(page.videoIds());
                    continuation = page.continuation();
                    if (continuation != null && !continuations.add(continuation)) {
                        throw new IOException("Music repeated a playlist continuation");
                    }
                } while (continuation != null);
                // Unavailable tracks keep their place in the recorded list but are never downloaded.
                List<String> available = PlaylistPage.available(tracks);
                int skipped = tracks.size() - available.size();
                if (available.isEmpty()) throw new IOException("Playlist contains no downloadable tracks");
                if (skipped > 0) Logger.printDebug(() -> "PlaylistDownloads: " + playlistId + " skips " + skipped
                        + " unavailable of " + tracks.size() + " tracks");

                // Recorded as not finished before the first copy: a download cut off here is resumed, not lost.
                if (mode.streamCopy()) DownloadedMarkers.onPlaylistStarted(playlistId, tracks, header);

                List<Long> mediaIds = new ArrayList<>(available.size());
                int downloaded = 0;
                for (int index = 0; index < available.size(); index++) {
                    // already-saved tracks finish in milliseconds; unpaced
                    // updates exceed Android's per-app rate limit, which then drops the final notification.
                    if (LocalDownloadManager.canPostProgress()) {
                        LocalDownloadManager.showDownloadNotification("playlist:" + playlistId, title,
                                index * 100 / available.size(), true,
                                str("morphe_music_playlist_download_progress", index + 1, available.size()));
                    }
                    LocalDownloadManager.Saved saved = LocalDownloadManager.download(available.get(index), mode, quality);
                    if (saved.downloaded()) downloaded++;
                    if (mode.localFiles()) mediaIds.add(NativeAudioStore.mediaId(saved.nativeTrack()));
                }
                // The playlist in Device files exists only for local files; a stream copy is invisible there.
                if (mode.localFiles()) NativePlaylistStore.save(playlistId, title, mediaIds);
                // The videos of the songs that have one follow the audio copies; a video that fails fails nothing.
                VideoCopyDownloader.Outcome videos = mode.streamCopy()
                        ? VideoCopyDownloader.ensure(playlistId, title, available, quality)
                        : VideoCopyDownloader.Outcome.NONE;
                // Every copy and video is in: the header may show the check and offer Remove.
                if (mode.streamCopy()) DownloadedMarkers.onPlaylistCompleted(playlistId);
                String done = completionText(mode, downloaded, available.size(), skipped, videos);
                LocalDownloadManager.awaitNotificationSlot();
                LocalDownloadManager.showDownloadNotification("playlist:" + playlistId, title, 100, false, done);
                Utils.showToastShort(done);
            } catch (Exception ex) {
                Logger.printException(() -> "Playlist download failed", ex);
                // Completed songs remain playable, but never label a truncated playlist complete.
                LocalDownloadManager.awaitNotificationSlot();
                String failed = str("morphe_music_playlist_download_failed", PlaylistText.failureReason(ex));
                LocalDownloadManager.showDownloadNotification("playlist:" + playlistId, title, 0, false, failed);
                Utils.showToastLong(failed);
            } finally {
                active.remove(playlistId);
                if (mode.streamCopy()) DownloadedMarkers.onPlaylistFinished();
                // tracks now in a playlist leave "Not in a playlist";
                // songs kept from a failed download join it.
                if (mode.localFiles()) NativePlaylistStore.refreshUnsortedLater();
            }
            return null;
        });
    }

    /**
     * The text of a finished playlist download: {@code total} tracks were available and {@code skipped} were not. A
     * stream-only download that found every copy already saved, audio and videos, says so, because nothing was
     * downloaded. The videos the list has are counted; videos that failed are said last.
     */
    static String completionText(DownloadMode mode, int downloaded, int total, int skipped,
                                 VideoCopyDownloader.Outcome videos) {
        String done;
        if (mode.localFiles()) {
            done = str("morphe_music_playlist_download_complete", total);
        } else {
            String key = VideoCopyLogic.completionKey(downloaded, videos.saved(), videos.videos());
            done = videos.videos() > 0 ? str(key, total, videos.videos()) : str(key, total);
        }
        if (mode.streamCopy() && videos.failed() > 0) {
            done += " (" + str("morphe_music_playlist_videos_failed", videos.failed()) + ")";
        }
        return skipped == 0 ? done : done + " (" + str("morphe_music_playlist_unavailable_skipped", skipped) + ")";
    }

    /** The header of a playlist or album, read off the network. For use on a worker thread. */
    static SourceHeader fetchHeader(String playlistId) throws Exception {
        return header(playlistId, MusicBrowseRequest.browse(Utils.getContext(), "VL" + playlistId, null, null));
    }

    private static SourceHeader header(String playlistId, JSONObject response) throws Exception {
        SourceHeader header = SourceHeader.read(response);
        return header.hasTitle() ? header : albumHeader(playlistId, response);
    }

    /**
     * Album playlists (OLAK…) have no header in their playlist response. Every row links to
     * the album page instead; use that page's header only if all rows agree on one album and
     * the album page itself points back at this playlist.
     */
    private static SourceHeader albumHeader(String playlistId, JSONObject response) throws Exception {
        Set<String> albums = new HashSet<>();
        collectAlbums(response, albums);
        if (albums.size() != 1) return SourceHeader.EMPTY;
        JSONObject album = MusicBrowseRequest.browse(Utils.getContext(), albums.iterator().next(), null, null);
        return album.toString().contains("\"" + playlistId + "\"") ? SourceHeader.read(album) : SourceHeader.EMPTY;
    }

    private static void collectAlbums(Object node, Set<String> albums) {
        if (node instanceof JSONObject object) {
            JSONObject endpoint = object.optJSONObject("browseEndpoint");
            String id = endpoint == null ? "" : endpoint.optString("browseId");
            if (id.startsWith("MPREb_")) albums.add(id);
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) collectAlbums(object.opt(keys.next()), albums);
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) collectAlbums(array.opt(i), albums);
        }
    }
}
