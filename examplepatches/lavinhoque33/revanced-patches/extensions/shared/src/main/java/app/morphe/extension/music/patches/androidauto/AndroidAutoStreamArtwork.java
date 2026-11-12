/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.androidauto;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.music.patches.androidauto.AndroidAutoDownloadsArtworkData.Entry;
import app.morphe.extension.music.patches.downloads.OfflineStreamBrowse;
import app.morphe.extension.shared.utils.Utils;

/**
 * The covers of stream copies for Android Auto: the thumbnail stored with a song, made once into the small square
 * JPEG the device-file covers are, in the same cache directory and served by the same provider hook. Nothing is
 * downloaded; a song without a stored thumbnail has no cover.
 */
final class AndroidAutoStreamArtwork {
    private static final Object LOCK = new Object();
    private static final Set<String> missing = new HashSet<>();

    private AndroidAutoStreamArtwork() {}

    /** Whether a cover is known to be unavailable, so that a row need not offer one. */
    static boolean isMissing(String videoId) {
        synchronized (LOCK) {
            return missing.contains(videoId);
        }
    }

    /**
     * The cover file of a song, made from its stored thumbnail when it is not in the cache yet; null when the song
     * is no longer stored or has no thumbnail. Serial, so that several requests of the car decode one at a time.
     */
    @Nullable
    static File ensureImage(File directory, String videoId) throws IOException {
        Utils.verifyOffMainThread();
        File file = new File(directory, AndroidAutoStreamArtworkData.fileName(videoId)).getCanonicalFile();
        if (!directory.equals(file.getParentFile())) throw new IOException("Invalid artwork cache path");

        synchronized (LOCK) {
            if (!OfflineStreamBrowse.holds(videoId)) {
                file.delete();
                return null;
            }
            long maxBytes = AndroidAutoDownloadsArtworkData.MAX_IMAGE_BYTES;
            if (file.isFile() && file.length() > 0 && file.length() <= maxBytes) {
                file.setLastModified(System.currentTimeMillis());
                return file;
            }
            if (missing.contains(videoId)) return null;

            byte[] thumbnail = OfflineStreamBrowse.thumbnail(videoId);
            if (!AndroidAutoDownloadsArtwork.encodeCover(thumbnail, file)) {
                missing.add(videoId);
                return null;
            }

            trim(directory, file.getName());
            return file;
        }
    }

    /** Deletes the covers of songs that are gone and the least recently used when the cache is over its limits. */
    static void trim(File directory, @Nullable String current) {
        File[] files = directory.listFiles();
        if (files == null) return;

        List<Entry> entries = new ArrayList<>(files.length);
        for (File file : files) {
            if (file.isFile()) entries.add(new Entry(file.getName(), file.length(), file.lastModified()));
        }
        synchronized (LOCK) {
            for (String name : AndroidAutoStreamArtworkData.evictions(entries, OfflineStreamBrowse::holds, current,
                    AndroidAutoStreamArtworkData.MAX_CACHE_BYTES, AndroidAutoStreamArtworkData.MAX_CACHE_ENTRIES)) {
                new File(directory, name).delete();
            }
        }
    }
}
