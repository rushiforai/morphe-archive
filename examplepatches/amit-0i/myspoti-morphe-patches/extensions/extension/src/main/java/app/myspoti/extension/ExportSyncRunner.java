package app.myspoti.extension;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.util.Log;

import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/** Background counterpart of DownloadToolsActivity's manual sync, used by the native-index observer. */
final class ExportSyncRunner {
    private static final String TAG = "MyspotiStoragePatch";

    private ExportSyncRunner() {}

    static void sync(Context context, Uri tree, boolean deleteRemoved) throws Exception {
        Context app = context.getApplicationContext();
        if (!ExportSyncCoordinator.tryStart("Auto-sync", false, "Preparing automatic export…")) {
            DownloadPatch.deferAutoSync(app);
            Log.i(TAG, "Skipped an automatic export pass because another sync is already active; one retry was queued");
            return;
        }
        boolean completed = false;
        try {
        synchronized (DownloadPatch.exportSyncLock()) {
            List<?> tracks = DownloadPatch.downloadedTracks(app);
            List<DownloadPatch.CollectionSnapshot> collections = null;
            Throwable collectionReadError = null;
            try {
                collections = DownloadPatch.downloadedCollections();
            } catch (Throwable error) {
                collectionReadError = error;
                Log.w(TAG, "Background sync could not read downloaded playlists/albums; keeping existing manifests", error);
            }

            Set<String> activeTrackIds = new LinkedHashSet<>();
            for (Object track : tracks) {
                String id = DownloadPatch.trackId(track);
                if (id != null && !id.trim().isEmpty()) activeTrackIds.add(id);
            }
            Set<String> activeCollectionKeys = collectionReadError == null ? new HashSet<String>() : null;
            if (activeCollectionKeys != null && collections != null) for (DownloadPatch.CollectionSnapshot collection : collections) {
                if (collection != null && collection.uri != null && !collection.uri.isEmpty()) {
                    activeCollectionKeys.add(collection.type + "|" + collection.uri);
                }
            }
            Set<String> activeSingleIds = null;
            try { activeSingleIds = DownloadPatch.downloadedSingles(); }
            catch (Throwable error) { Log.w(TAG, "Could not snapshot individual download membership", error); }

            ExportIndex index = ExportIndex.open(app, tree);
            try {
                if (activeSingleIds != null) index.mergeSingleTrackIds(activeSingleIds);
            } catch (Throwable error) {
                Log.w(TAG, "Could not snapshot individual download membership", error);
            }

            int exported = 0;
            int skipped = 0;
            int failed = 0;
            int lyricsSaved = 0;
            int lyricsFailed = 0;
            String lastError = null;
            final long lyricsRetryIntervalMs = 12L * 60L * 60L * 1000L;
            int done = 0;
            ExportSyncCoordinator.update("Exporting downloaded songs…", 0, tracks.size());
            for (Object track : tracks) {
                Uri destination = null;
                boolean created = false;
                boolean lyricsLookupAttempted = false;
                boolean lyricsRepairLookupAttempted = false;
                try {
                    File source = DownloadPatch.audioFile(app, track);
                    if (!source.isFile()) throw new java.io.FileNotFoundException("Downloaded audio is missing: " + source.getName());
                    String trackId = DownloadPatch.trackId(track);
                    if (trackId == null || trackId.isEmpty()) throw new IllegalStateException("Track ID is missing; cannot safely de-duplicate this song.");
                    String fingerprint = DownloadPatch.exportFingerprint(track, source);
                    String extension = extension(source.getName());
                    String title = DownloadPatch.trackTitle(track);
                    String artist = DownloadPatch.trackArtist(track);
                    String album = DownloadPatch.trackAlbum(track);
                    String displayName = exportDisplayName(artist, title, source);
                    String relativePath = index.relativePathFromRoot(trackId);
                    destination = index.existingDocument(trackId);
                    boolean sameFingerprint = destination != null && index.sameFingerprint(trackId, fingerprint);

                    boolean canEmbedLyrics = AudioMetadataWriter.supportsLyricsEmbedding(extension);
                    boolean lyricsSidecarsMissing = false;
                    if (index.hasLyricsAvailable(trackId)) {
                        try { lyricsSidecarsMissing = index.lyricsSidecarsNeedRepair(trackId); }
                        catch (Throwable inspectLyricsError) {
                            // Lyrics inspection must not prevent an otherwise valid audio export.
                            Log.w(TAG, "Could not inspect portable lyric sidecars for " + trackId, inspectLyricsError);
                        }
                    }
                    boolean needLyricsJson = !index.hasLyricsAvailable(trackId) || lyricsSidecarsMissing
                            || (canEmbedLyrics && !index.hasLyricsEmbedded(trackId));
                    JSONObject lyricsJson = needLyricsJson ? index.readLyricsJson(trackId) : null;
                    // First consume MySpoti's durable lyrics cache. A track can acquire lyrics
                    // after its audio export, and that cache write triggers another auto-sync.
                    if (needLyricsJson && lyricsJson == null) lyricsJson = LyricsStore.readNativeCache(app, trackId);
                    // If the JSON sidecar and native cache are unavailable, a surviving LRC is
                    // still enough to recreate both portable lyric formats.
                    if (needLyricsJson && lyricsJson == null) {
                        String savedLrc = index.readLyricsLrc(trackId);
                        lyricsJson = LyricsStore.fromLrc(trackId, savedLrc, "Portable LRC backup");
                    }
                    // Retry missing lyrics even when audio was exported earlier, but throttle the
                    // provider lookup so repeated collection/index events don't block on the same miss.
                    boolean shouldLookupMissingLyrics = lyricsSidecarsMissing
                            ? index.shouldRetryMissingLyrics(trackId, lyricsRetryIntervalMs)
                            : index.shouldLookupLyrics(trackId, lyricsRetryIntervalMs);
                    if (needLyricsJson && lyricsJson == null && shouldLookupMissingLyrics) {
                        lyricsLookupAttempted = true;
                        lyricsRepairLookupAttempted = lyricsSidecarsMissing;
                        // Never hold the SAF export pass open while waiting for lyrics networking.
                        // MySpoti writes its durable cache when prefetch completes; the cache
                        // observer schedules a short follow-up pass that archives the result.
                        LyricsStore.requestPrefetch(app, trackId, title, artist, album,
                                DownloadPatch.trackDurationMs(track), DownloadPatch.trackCoverUrl(track),
                                lyricsSidecarsMissing);
                    }
                    boolean hasLyrics = LyricsStore.validLyricsJson(lyricsJson);
                    // Avoid rewriting an existing cache file: its FileObserver would otherwise
                    // schedule an endless chain of identical background syncs.
                    if (hasLyrics && LyricsStore.readNativeCache(app, trackId) == null) {
                        try { LyricsStore.restoreNativeCache(app, trackId, lyricsJson); }
                        catch (Throwable cacheError) {
                            Log.w(TAG, "Could not restore native lyrics cache for " + trackId, cacheError);
                        }
                    }
                    String lyricsText = hasLyrics ? LyricsStore.toPlainText(lyricsJson) : "";
                    String lyricsLrc = hasLyrics ? LyricsStore.toLrc(lyricsJson, title, artist, album) : "";

                    boolean legacyImported = false;
                    if (destination == null) {
                        Uri legacy = index.uniqueLegacyMatch(displayName);
                        if (legacy != null) {
                            destination = legacy;
                            relativePath = displayName;
                            legacyImported = true;
                            index.record(trackId, fingerprint, legacy, displayName, title, artist, album,
                                    DownloadPatch.trackDurationMs(track), extension, source.length(), true, displayName,
                                    DownloadPatch.trackAlbumId(track), DownloadPatch.trackCoverUrl(track),
                                    DownloadPatch.trackSource(track), DownloadPatch.trackVerified(track),
                                    DownloadPatch.trackKind(track), DownloadPatch.trackProviderId(track),
                                    DownloadPatch.trackExtensionQuality(track));
                        } else {
                            displayName = addTrackIdSuffix(displayName, trackId);
                            destination = index.createDocumentInPath(mime(extension), displayName, "Tracks");
                            created = true;
                            relativePath = "Tracks/" + displayName;
                        }
                    } else if (relativePath.isEmpty()) {
                        relativePath = displayName;
                    }

                    boolean needAudioWrite = created || (!sameFingerprint && !legacyImported)
                            || (hasLyrics && canEmbedLyrics && !index.hasLyricsEmbedded(trackId));
                    boolean embeddedLyrics = index.hasLyricsEmbedded(trackId);
                    if (needAudioWrite) {
                        try (OutputStream output = app.getContentResolver().openOutputStream(destination, "w")) {
                            if (output == null) throw new IOException("Could not open " + displayName);
                            boolean tagged = DownloadPatch.exportTagged(app, source, track, output, lyricsText);
                            embeddedLyrics = tagged && hasLyrics;
                        }
                        long exportedBytes = queryDocumentSize(app, destination);
                        if (exportedBytes <= 0) exportedBytes = source.length();
                        index.record(trackId, fingerprint, destination, displayName, title, artist, album,
                                DownloadPatch.trackDurationMs(track), extension, exportedBytes, legacyImported, relativePath,
                                DownloadPatch.trackAlbumId(track), DownloadPatch.trackCoverUrl(track),
                                DownloadPatch.trackSource(track), DownloadPatch.trackVerified(track),
                                DownloadPatch.trackKind(track), DownloadPatch.trackProviderId(track),
                                DownloadPatch.trackExtensionQuality(track));
                        exported++;
                    } else {
                        skipped++;
                    }

                    if (hasLyrics && !lyricsLrc.isEmpty()) {
                        try {
                            index.writeLyrics(trackId, lyricsJson, lyricsLrc,
                                    embeddedLyrics || index.hasLyricsEmbedded(trackId));
                            lyricsSaved++;
                        } catch (Throwable error) {
                            lyricsFailed++;
                            Log.w(TAG, "Audio exported but lyric sidecars could not be saved for " + title, error);
                        }
                    } else if (lyricsLookupAttempted) {
                        // Keep a lookup timestamp so unrelated index events don't repeatedly
                        // fetch a known miss. Missing previously-exported sidecars have their own
                        // repair throttle because their normal lookup timestamp may be stale.
                        index.markLyricsLookupAttempted(trackId);
                        if (lyricsRepairLookupAttempted) index.markMissingLyricsLookupAttempted(trackId);
                    }
                } catch (Throwable error) {
                    failed++;
                    if (created && destination != null) index.deleteDocument(destination);
                    lastError = error.getMessage() == null ? error.getClass().getSimpleName() : error.getMessage();
                    Log.w(TAG, "Background export failed for " + DownloadPatch.trackTitle(track), error);
                }
                done++;
                ExportSyncCoordinator.update("Exported " + exported + " new · " + skipped
                        + " present · " + failed + " failed", done, tracks.size());
            }

            ExportSyncCoordinator.update("Updating playlist & album lists…", tracks.size(), tracks.size());
            int deletedTracks = 0;
            int deletedCollections = 0;
            boolean deletionSyncSafe = deleteRemoved && DownloadPatch.canMirrorDeletedDownloads(
                    app, activeTrackIds, activeCollectionKeys, activeSingleIds);
            if (deletionSyncSafe) {
                // Prune stale audio before regenerating manifests, so no M3U8 points at a
                // file that this same sync is about to remove.
                deletedTracks = index.removeTracksNotIn(activeTrackIds);
                index.replaceSingleTrackIds(activeSingleIds);
            }

            int manifestCount = 0;
            int collectionFailures = 0;
            if (collectionReadError == null && collections != null) {
                for (DownloadPatch.CollectionSnapshot collection : collections) {
                    if (collection == null || collection.uri == null || collection.uri.isEmpty()) continue;
                    try {
                        writeCollectionManifest(app, index, collection);
                        manifestCount++;
                    } catch (Throwable error) {
                        collectionFailures++;
                        Log.w(TAG, "Could not write background collection manifest for " + collection.name, error);
                    }
                }
            }
            if (deletionSyncSafe && activeCollectionKeys != null) {
                deletedCollections = index.removeCollectionsNotIn(activeCollectionKeys);
            }

            Log.i(TAG, "Background export sync complete: exported=" + exported + ", present=" + skipped
                    + ", failed=" + failed + ", lyrics=" + lyricsSaved + ", lyricsFailed=" + lyricsFailed
                    + ", manifests=" + manifestCount + ", collectionFailures=" + collectionFailures
                    + ", deletedExports=" + deletedTracks + ", deletedManifests=" + deletedCollections
                    + (lastError == null ? "" : ", lastError=" + lastError));
        }
        completed = true;
        } finally {
            ExportSyncCoordinator.finish(completed
                    ? "Automatic background sync complete. The export archive is up to date."
                    : "Automatic background sync did not complete. Check the sync log for details.");
        }
    }

    private static void writeCollectionManifest(Context context, ExportIndex index,
            DownloadPatch.CollectionSnapshot collection) throws Exception {
        Map<String, Boolean> availableCache = new HashMap<>();
        boolean album = "album".equalsIgnoreCase(collection.type);
        String collectionName = ExportIndex.cleanCollectionName(cleanText(collection.name));
        if (collectionName.isEmpty()) collectionName = album ? "Unknown album" : "Untitled playlist";
        String token = stableToken(collection.uri);
        List<String> folderPath = new ArrayList<>();
        String fileName;
        String albumArtist = "Unknown Artist";
        if (album) {
            String firstArtist = null;
            boolean mixedArtists = false;
            for (String id : collection.trackIds) {
                JSONObject item = index.entry(id);
                if (item == null) continue;
                String trackArtist = cleanText(item.optString("artist", ""));
                if (trackArtist.isEmpty()) continue;
                if (firstArtist == null) firstArtist = trackArtist;
                else if (!firstArtist.equalsIgnoreCase(trackArtist)) { mixedArtists = true; break; }
            }
            albumArtist = mixedArtists ? "Various Artists" : (firstArtist == null ? "Unknown Artist" : firstArtist);
            folderPath.add("Albums");
            folderPath.add(safeSegment(albumArtist, "Unknown Artist"));
            folderPath.add(safeSegment(collectionName, "Unknown album") + " [" + token + "]");
            fileName = "Album.m3u8";
        } else {
            folderPath.add("Playlists");
            String playlistSegment = safeSegment(collectionName, "Untitled playlist");
            folderPath.add(playlistSegment + " [" + token + "]");
            fileName = playlistSegment + ".m3u8";
        }
        String prefix = repeat("../", folderPath.size());
        StringBuilder m3u = new StringBuilder("#EXTM3U\n");
        m3u.append("#PLAYLIST:").append(cleanM3uField(collectionName)).append("\n");
        List<String> exportedIds = new ArrayList<>();
        int missing = 0;
        for (String trackId : collection.trackIds) {
            JSONObject item = index.entry(trackId);
            if (item == null) { missing++; continue; }
            Boolean available = availableCache.get(trackId);
            if (available == null) {
                try { available = index.existingDocument(trackId) != null; }
                catch (Throwable ignored) { available = false; }
                availableCache.put(trackId, available);
            }
            if (!available) { missing++; continue; }
            String relativePath = index.relativePathFromRoot(trackId);
            if (relativePath.isEmpty()) { missing++; continue; }
            String title = cleanM3uField(item.optString("title", "Untitled"));
            String artist = cleanM3uField(item.optString("artist", ""));
            long durationMs = item.optLong("durationMs", 0L);
            long seconds = durationMs > 0 ? Math.max(1L, durationMs / 1000L) : -1L;
            m3u.append("#EXTINF:").append(seconds).append(',');
            if (!artist.isEmpty()) m3u.append(artist).append(" - ");
            m3u.append(title).append("\n");
            m3u.append(prefix).append(relativePath.replace('\\', '/')).append("\n");
            exportedIds.add(trackId);
        }
        index.writeCollectionManifest(collection.type + "|" + collection.uri, collection.uri,
                collection.type, collectionName, fileName, m3u.toString(), collection.trackIds,
                exportedIds, missing, folderPath.toArray(new String[0]));
    }

    private static long queryDocumentSize(Context context, Uri document) {
        try (Cursor cursor = context.getContentResolver().query(document,
                new String[] { DocumentsContract.Document.COLUMN_SIZE }, null, null, null)) {
            if (cursor != null && cursor.moveToFirst() && !cursor.isNull(0)) return cursor.getLong(0);
        } catch (Throwable ignored) {}
        return -1L;
    }

    private static String exportDisplayName(String artist, String title, File source) {
        String name = sanitize((artist == null || artist.isEmpty() ? "" : artist + " - ")
                + (title == null || title.isEmpty() ? source.getName() : title));
        if (name.isEmpty()) name = source.getName();
        String ext = extension(source.getName());
        if (!ext.isEmpty() && !name.toLowerCase(Locale.ROOT).endsWith("." + ext.toLowerCase(Locale.ROOT))) name += "." + ext;
        return name;
    }

    private static String addTrackIdSuffix(String filename, String trackId) {
        int dot = filename.lastIndexOf('.');
        // Keep the entire Spotify ID: six-character tails can collide across tracks.
        String suffix = trackId == null ? "unknown" : trackId.replaceAll("[^A-Za-z0-9._-]", "_");
        return dot > 0 ? filename.substring(0, dot) + " [" + suffix + "]" + filename.substring(dot)
                : filename + " [" + suffix + "]";
    }

    private static String extension(String filename) {
        int dot = filename.lastIndexOf('.');
        return dot < 0 ? "" : filename.substring(dot + 1);
    }

    private static String mime(String ext) {
        if ("flac".equalsIgnoreCase(ext)) return "audio/flac";
        if ("mp3".equalsIgnoreCase(ext)) return "audio/mpeg";
        if ("m4a".equalsIgnoreCase(ext) || "mp4".equalsIgnoreCase(ext)) return "audio/mp4";
        return "application/octet-stream";
    }

    private static String sanitize(String name) {
        return name.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]", "_").trim();
    }

    private static String cleanText(String value) {
        return value == null ? "" : value.replace('\n', ' ').replace('\r', ' ').trim();
    }

    private static String cleanM3uField(String value) {
        return cleanText(value).replace(',', ' ').replaceAll("[\\p{Cntrl}]", " ");
    }

    private static String safeSegment(String value, String fallback) {
        String safe = sanitize(cleanText(value)).replaceAll("\\s+", " ").replaceAll("[. ]+$", "").trim();
        if (safe.isEmpty() || safe.equals(".") || safe.equals("..")) safe = fallback;
        return safe.length() > 100 ? safe.substring(0, 100).trim() : safe;
    }

    private static String stableToken(String value) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
            StringBuilder token = new StringBuilder();
            for (int i = 0; i < 4; i++) token.append(String.format(Locale.ROOT, "%02x", digest[i] & 0xff));
            return token.toString();
        } catch (Throwable ignored) { return Integer.toHexString(value.hashCode()); }
    }

    private static String repeat(String value, int count) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < count; i++) result.append(value);
        return result.toString();
    }
}
