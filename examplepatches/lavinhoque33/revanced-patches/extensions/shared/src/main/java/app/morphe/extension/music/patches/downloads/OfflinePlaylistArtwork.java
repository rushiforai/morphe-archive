/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.extension.music.patches.downloads;

import android.graphics.BitmapFactory;
import android.net.Uri;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.function.BooleanSupplier;
import java.util.function.Function;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Local artwork on the app's own saved playlist/album page; no network access when opening the page. */
final class OfflinePlaylistArtwork {
    private static final int MAX_IMAGE_DIMENSION = 4096;

    private static final class Storage {
        private static final OfflinePlaylistCoverFiles covers = new OfflinePlaylistCoverFiles(
                new File(Utils.getContext().getFilesDir(), "rvx_offline_covers"));
    }

    private OfflinePlaylistArtwork() {}

    /** Worker only. The stored snapshot remains unchanged, including the original online artwork URLs. */
    static byte[] localize(String pageId, byte[] response) {
        Utils.verifyOffMainThread();
        if (!OfflineBrowsePagesLogic.isFileSafe(pageId)) return response;

        try {
            String owner = OfflineBrowsePages.sourceOf(pageId);
            HeaderCover cover = new HeaderCover(pageId, owner);
            TrackCovers tracks = new TrackCovers();
            return PlaylistArtworkWire.localize(response, owner, tracks::uri, cover::uri);
        } catch (IOException | RuntimeException ex) {
            Logger.printDebug(() -> "OfflinePlaylistArtwork: could not localize saved artwork", ex);
            return response;
        }
    }

    /** The primary cover from a native response, not its owner image or a related shelf. Worker only. */
    @Nullable
    static String headerCover(byte[] response) {
        Utils.verifyOffMainThread();
        try {
            return PlaylistArtworkWire.headerCover(response);
        } catch (IOException ex) {
            return null;
        }
    }

    /**
     * Captures the actual cover while recording a saved page, independently of opening it. Never called from the
     * local replay path. The network request is outside both the playlist mutation lock and the cover store lock.
     */
    static void rememberCover(String pageId, @Nullable String remoteUrl) {
        Utils.verifyOffMainThread();
        if (remoteUrl == null || !OfflineBrowsePagesLogic.isFileSafe(pageId)) return;
        String key = PlaylistArtworkWire.imageKey(remoteUrl);
        if (key == null) return;

        String owner = OfflineBrowsePages.sourceOf(pageId);
        OfflineSourceStore.Source source = OfflineCopyStore.source(owner);
        if (source == null) return;
        BooleanSupplier stillRetained = () -> source == OfflineCopyStore.source(owner);

        try {
            OfflinePlaylistCoverFiles files = Storage.covers;
            String asset = OfflinePlaylistCoverFiles.assetHash(key);
            if (referenceUri(files.read(pageId), asset) != null) return;
            if (files.linkShared(pageId, asset, stillRetained)) return;

            String copiedCover = matchingTrack(source, key);
            if (copiedCover != null) {
                files.linkTrack(pageId, asset, copiedCover, stillRetained);
                return;
            }

            byte[] bytes = TrackMetadata.artwork(pageId, remoteUrl);
            if (bytes != null && validImage(bytes)) files.remember(pageId, asset, bytes, stillRetained);
        } catch (IOException | RuntimeException ex) {
            Logger.printDebug(() -> "OfflinePlaylistArtwork: could not remember a saved cover", ex);
        }
    }

    /** Removes only cover data not referenced by any retained source or page. Worker only. */
    static void retainOnly(Set<String> pageIds) {
        Utils.verifyOffMainThread();
        try {
            Storage.covers.retainOnly(pageIds);
        } catch (IOException | RuntimeException ex) {
            Logger.printDebug(() -> "OfflinePlaylistArtwork: could not clean up saved covers", ex);
        }
    }

    private static boolean validImage(byte[] bytes) {
        if (bytes.length > OfflinePlaylistCoverFiles.MAX_IMAGE_BYTES) return false;
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
        return bounds.outWidth > 0 && bounds.outHeight > 0
                && bounds.outWidth <= MAX_IMAGE_DIMENSION && bounds.outHeight <= MAX_IMAGE_DIMENSION;
    }

    @Nullable
    private static String matchingTrack(OfflineSourceStore.Source source, String key) {
        TrackCovers tracks = new TrackCovers();
        Set<String> tried = new HashSet<>();
        for (String videoId : source.videoIds()) {
            if (matches(videoId, key, tried)) return videoId;
            String partner = tracks.partnerOf(videoId);
            if (partner != null && matches(partner, key, tried)) return partner;
        }
        return null;
    }

    private static boolean matches(String id, String key, Set<String> tried) {
        if (!RawAudioFiles.validId(id) || !tried.add(id) || ownTrackUri(id) == null) return false;
        OfflineCopyMetadata metadata = OfflineCopyStore.metadataOf(id);
        String url = metadata == null ? null : metadata.thumbnailUrl();
        return url != null && key.equals(PlaylistArtworkWire.imageKey(url));
    }

    @Nullable
    private static String ownTrackUri(String videoId) {
        return RawAudioFiles.validId(videoId) ? OfflineCopyStore.coverUrl(videoId, null) : null;
    }

    @Nullable
    private static String referenceUri(@Nullable OfflinePlaylistCoverFiles.Ref ref, String asset) {
        if (ref == null || !asset.equals(ref.asset())) return null;
        if (ref.isTrack()) return ownTrackUri(ref.target());
        File file = Storage.covers.image(ref);
        return file == null ? null : Uri.fromFile(file).toString();
    }

    private static final class HeaderCover {
        private final String pageId;
        private final String owner;
        private final Map<String, String> byAsset = new HashMap<>();
        private boolean loaded;
        private OfflinePlaylistCoverFiles.Ref pageCover;
        private OfflinePlaylistCoverFiles.Ref ownerCover;

        HeaderCover(String pageId, String owner) {
            this.pageId = pageId;
            this.owner = owner;
        }

        @Nullable
        String uri(String key) {
            if (!loaded) {
                pageCover = Storage.covers.read(pageId);
                if (!owner.equals(pageId)) ownerCover = Storage.covers.read(owner);
                loaded = true;
            }
            if (pageCover == null && ownerCover == null) return null;
            if (!byAsset.containsKey(key)) {
                String asset = OfflinePlaylistCoverFiles.assetHash(key);
                String local = referenceUri(pageCover, asset);
                byAsset.put(key, local == null ? referenceUri(ownerCover, asset) : local);
            }
            return byAsset.get(key);
        }
    }

    /** Own track first; an alias or committed Song/Video counterpart is safe, never another row by position. */
    static final class TrackCovers {
        private final Function<String, String> files;
        private final Function<String, String> partner;

        TrackCovers() {
            this(OfflinePlaylistArtwork::ownTrackUri, id -> {
                DownloadedRegistry registry = DownloadedMarkers.loadedRegistry();
                String song = registry == null ? null : registry.canonicalId(id);
                return VideoCopyStore.artworkPartner(id, id.equals(song) ? null : song);
            });
        }

        TrackCovers(Function<String, String> files, Function<String, String> partner) {
            this.files = files;
            this.partner = partner;
        }

        @Nullable
        String uri(String id) {
            String own = files.apply(id);
            if (own != null) return own;
            String partner = partnerOf(id);
            return partner == null ? null : files.apply(partner);
        }

        @Nullable
        String partnerOf(String id) {
            String candidate = partner.apply(id);
            return RawAudioFiles.validId(candidate) && !id.equals(candidate) ? candidate : null;
        }
    }
}
