/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-26.
 * Modified by lavinhoque33, 2026-11-17.
 * Modified by lavinhoque33, 2026-11-14
 * Modified by lavinhoque33, 2026-11-13
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.function.BooleanSupplier;
import java.util.function.Function;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Worker-thread native detail snapshots backed by the stream source index, with support for legacy page files. */
public final class OfflineBrowsePages {
    /** Added by the Downloads patch to the browse result the app's success callback receives. */
    public interface Bytes {
        /** The serialized browse response the result holds. */
        byte[] rvxBrowseBytes();
    }

    private static final String DIRECTORY = "rvx_offline_pages";
    private static final String SUFFIX = ".page";
    private static final String OWNER_SUFFIX = ".list";

    private static final Set<String> ids = ConcurrentHashMap.newKeySet();
    /** The list of the pages whose id is not the list's own, by page id. */
    private static final Map<String, String> owners = new ConcurrentHashMap<>();
    private static volatile boolean loaded;

    private OfflineBrowsePages() {}

    private static File directory() {
        return new File(Utils.getContext().getFilesDir(), DIRECTORY);
    }

    private static File fileOf(String pageId) {
        return new File(directory(), pageId + SUFFIX);
    }

    private static File ownerFileOf(String pageId) {
        return new File(directory(), pageId + OWNER_SUFFIX);
    }

    /** Learns which pages are recorded. A worker thread; the answers of {@link #has} are false until it ran. */
    static synchronized void load() {
        if (loaded) return;
        File[] files = directory().listFiles();
        if (files == null) {
            loaded = true;
            return;
        }

        for (File file : files) {
            String name = file.getName();
            if (name.endsWith(SUFFIX)) {
                ids.add(name.substring(0, name.length() - SUFFIX.length()));
            } else if (name.endsWith(OWNER_SUFFIX)) {
                readOwner(file, name.substring(0, name.length() - OWNER_SUFFIX.length()));
            }
        }
        loaded = true;
    }

    private static void readOwner(File file, String pageId) {
        try {
            owners.put(pageId, new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8));
        } catch (IOException ex) {
            Logger.printException(() -> "OfflineBrowsePages: could not read the list of the page " + pageId, ex);
        }
    }

    /** Whether a page is recorded under the id. In memory, so the main thread may ask; false until loaded. */
    static boolean has(String pageId) {
        OfflineSourceStore.Source source = OfflineCopyStore.source(pageId);
        return (source != null && source.browsePage() != null) || ids.contains(pageId);
    }

    /** Canonical playback playlist of a saved album page, when its recorded response established the mapping. */
    static String sourceOf(String pageId) {
        return owners.getOrDefault(pageId, pageId);
    }

    /** Cheap warm negative only; cold routing must let the authoritative worker check run. */
    static boolean mayOpen(String pageId) {
        return OfflineBrowsePagesLogic.isPlaylistId(pageId) && OfflineCopyStore.mayHaveSource(pageId);
    }

    /** The genuine complete local page, or a native renderer built from the current stream source's local metadata. */
    @Nullable
    static byte[] readForOpening(String pageId) {
        Utils.verifyOffMainThread();
        if (!OfflineBrowsePagesLogic.isPlaylistId(pageId)) return null;

        OfflineSourceStore.Source source = OfflineCopyStore.sourceForOpening(pageId);
        if (source == null || source.videoIds().isEmpty() || !OfflineCopyStore.ownsStreamSource(source)) return null;

        DownloadedRegistry markers = DownloadedMarkers.loadedRegistry();
        if (markers != null && !hasResidentTrack(source, markers)) return null;

        byte[] page = committed(source);
        if (page == null) page = fromMetadata(source, markers);

        // This read owns one coherent saved revision. A concurrent sync may publish its next revision, but an
        // explicit removal must not turn into a stock or stale local open for this playlist.
        OfflineSourceStore.Source current = OfflineCopyStore.sourceForOpening(pageId);
        if (current == source) return page;
        return current != null && OfflineCopyStore.ownsStreamSource(current) ? page : null;
    }

    private static boolean hasResidentTrack(OfflineSourceStore.Source source, DownloadedRegistry markers) {
        for (String track : source.videoIds()) {
            if (markers.isDownloaded(track)) return true;
        }
        return false;
    }

    @Nullable
    static byte[] committed(OfflineSourceStore.Source source) {
        try {
            byte[] page = OfflineCopyStore.readPlaylistPage(source);
            if (page == null) return null;
            return PlaylistSyncPage.matchesComplete(source.id(), page, source.videoIds()) ? page : null;
        } catch (IOException ex) {
            Logger.printDebug(() -> "OfflineBrowsePages: could not read committed page " + source.id(), ex);
            return null;
        }
    }

    private static byte[] fromMetadata(OfflineSourceStore.Source source, @Nullable DownloadedRegistry markers) {
        var metadata = new HashMap<String, OfflineBrowsePagesLogic.TrackMetadata>();
        Function<String, OfflineBrowsePagesLogic.TrackMetadata> lookup = track -> {
            if (!RawAudioFiles.validId(track)) return null;
            String id = markers == null ? track : markers.canonicalId(track);
            if (!metadata.containsKey(id)) metadata.put(id, OfflineCopyStore.openingMetadata(id));
            return metadata.get(id);
        };
        String unavailable = str("morphe_music_player_unavailable_offline");
        if (!loaded) load();
        byte[] original = readLegacy(source.id());
        if (original != null) {
            byte[] repaired = PlaylistSyncPage.repairLegacy(source.id(), original, source.videoIds(), position -> {
                String track = source.videoIds().get(position);
                return OfflineBrowsePagesLogic.fallbackRow(source.id(), position, track, lookup.apply(track),
                        unavailable);
            });
            if (repaired != null) return repaired;
        }

        String title = source.title().isEmpty() ? str("morphe_music_offline_library_untitled") : source.title();
        return OfflineBrowsePagesLogic.fallback(source.id(), title, source.subtitle(), source.thumbnailUrl(),
                source.videoIds(), lookup, unavailable);
    }

    /** Records a complete, genuine detail from the app without allowing an ordinary revisit to replace sync state. */
    static int capture(String pageId, String sourceId, byte[] response) throws Exception {
        Utils.verifyOffMainThread();
        OfflineSourceStore.Source source = OfflineCopyStore.source(sourceId);
        if (source == null) return -1;
        if (source.kind() == OfflineSourceStore.Kind.ALBUM) return captureAlbum(pageId, source, response);
        if (!sourceId.equals(pageId) || !OfflineBrowsePagesLogic.isPlaylistId(pageId)
                || !OfflineCopyStore.ownsStreamSource(source) || committed(source) != null) return -1;

        byte[] complete = PlaylistSyncPage.completeLegacy(sourceId, response, source.videoIds());
        if (complete == null) return -1;
        return publishCapture(source, complete, () -> true);
    }

    /** Keep the existing album browse-id mapping and capture format separate from playlist reconstruction. */
    private static int captureAlbum(String pageId, OfflineSourceStore.Source source, byte[] response)
            throws IOException {
        if (!OfflineBrowsePagesLogic.isFileSafe(pageId) || source.browsePage() != null) return -1;
        byte[] packed = OfflineBrowsePagesLogic.gzip(response);
        if (!loaded) load();

        synchronized (PlaylistSync.MUTATION) {
            if (OfflineCopyStore.source(source.id()) != source) return -1;

            File directory = directory();
            if (!directory.isDirectory() && !directory.mkdirs() && !directory.isDirectory()) {
                throw new IOException("No pages directory");
            }
            if (!source.id().equals(pageId)) {
                replace(ownerFileOf(pageId), source.id().getBytes(StandardCharsets.UTF_8));
                owners.put(pageId, source.id());
            }
            replace(fileOf(pageId), packed);
            ids.add(pageId);
        }
        return packed.length;
    }

    private static void replace(File file, byte[] content) throws IOException {
        File pending = File.createTempFile(file.getName(), ".part", file.getParentFile());
        try {
            Files.write(pending.toPath(), content);
            Files.move(pending.toPath(), file.toPath(), StandardCopyOption.ATOMIC_MOVE,
                    StandardCopyOption.REPLACE_EXISTING);
        } finally {
            Files.deleteIfExists(pending.toPath());
        }
    }

    /** Staging and artwork I/O are deliberately outside the source mutation and transfer locks. */
    static int publishCapture(OfflineSourceStore.Source source, byte[] response, BooleanSupplier allowed)
            throws Exception {
        File staged = OfflineCopyStore.stagePlaylistPage(response);
        boolean committed = false;
        try {
            committed = OfflineCopyStore.commitPlaylist(source, source.videoIds(), staged, allowed);
            if (!committed) return -1;

            int compressed = (int) staged.length();
            rememberCover(source.id(), response, source.thumbnailUrl());
            return compressed;
        } finally {
            if (!committed) staged.delete();
        }
    }

    static void rememberCover(String sourceId, byte[] response, @Nullable String rememberedUrl) {
        String cover = OfflinePlaylistArtwork.headerCover(response);
        if (cover == null) cover = rememberedUrl;
        OfflinePlaylistArtwork.rememberCover(sourceId, cover);
    }

    /** The recorded page under the id, or null when there is none or it cannot be read. */
    @Nullable
    static byte[] read(String pageId) {
        OfflineSourceStore.Source source = OfflineCopyStore.source(pageId);
        if (source != null && source.browsePage() != null) {
            try {
                return OfflineCopyStore.readPlaylistPage(pageId);
            } catch (IOException ex) {
                Logger.printException(() -> "OfflineBrowsePages: could not read synced page " + pageId, ex);
                return null;
            }
        }

        return readLegacy(pageId);
    }

    @Nullable
    private static byte[] readLegacy(String pageId) {
        if (!ids.contains(pageId) || !OfflineBrowsePagesLogic.isFileSafe(pageId)) return null;

        try {
            return OfflineBrowsePagesLogic.gunzip(Files.readAllBytes(fileOf(pageId).toPath()));
        } catch (IOException ex) {
            Logger.printException(() -> "OfflineBrowsePages: could not read the page " + pageId, ex);
            return null;
        }
    }

    /** AA may read a catalog-only saved page as metadata without enabling native offline playback. */
    @Nullable
    static byte[] readSource(String sourceId) {
        load();
        byte[] direct = read(sourceId);
        if (direct != null) return direct;
        for (var owner : owners.entrySet()) {
            if (sourceId.equals(owner.getValue())) {
                byte[] page = read(owner.getKey());
                if (page != null) return page;
            }
        }
        return null;
    }

    /** Forgets the pages of the lists that are no longer kept. A worker thread. */
    static void retainOnly(Set<String> listIds) {
        if (!loaded) load();
        Set<String> artworkIds = new HashSet<>(listIds);
        for (String id : Set.copyOf(ids)) {
            if (listIds.contains(owners.getOrDefault(id, id))) {
                artworkIds.add(id);
                continue;
            }

            try {
                Files.deleteIfExists(fileOf(id).toPath());
                Files.deleteIfExists(ownerFileOf(id).toPath());
                ids.remove(id);
                owners.remove(id);
            } catch (IOException ex) {
                Logger.printException(() -> "OfflineBrowsePages: could not delete the page " + id, ex);
            }
        }
        OfflinePlaylistArtwork.retainOnly(artworkIds);
    }
}
