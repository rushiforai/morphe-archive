/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.androidauto;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.function.Predicate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.music.patches.androidauto.AndroidAutoDownloadsArtworkData.Entry;

/**
 * Names and eviction of the covers of stream copies in the artwork cache the device-file covers share. A cover is
 * named after its video id ({@code s1-<id>.jpg}); the device-file names ({@code v1-...}) never collide with it.
 */
final class AndroidAutoStreamArtworkData {
    static final long MAX_CACHE_BYTES = 4L * 1024 * 1024;
    static final int MAX_CACHE_ENTRIES = 128;

    private static final Pattern FILE_NAME = Pattern.compile("s1-([A-Za-z0-9_-]{1,20})\\.jpg");

    private AndroidAutoStreamArtworkData() {}

    static String fileName(String videoId) {
        String name = "s1-" + videoId + ".jpg";
        if (!FILE_NAME.matcher(name).matches()) throw new IllegalArgumentException("Invalid video id");
        return name;
    }

    /** The video id a cache file name is of, or null for any other name. */
    @Nullable
    static String parseFileName(@Nullable String name) {
        if (name == null) return null;

        Matcher matcher = FILE_NAME.matcher(name);
        return matcher.matches() ? matcher.group(1) : null;
    }

    /** The address of a cover in the provider's cache, in the namespace of {@link AndroidAutoDownloadsArtworkData}. */
    static String uri(String authority, String root, String videoId) {
        return AndroidAutoDownloadsArtworkData.uriPrefix(authority, root) + fileName(videoId);
    }

    /** The video id an address names, or null when it is not a stream cover address of this provider. */
    @Nullable
    static String parseUri(String authority, String root, @Nullable String uri) {
        if (uri == null) return null;

        String prefix = AndroidAutoDownloadsArtworkData.uriPrefix(authority, root);
        return uri.startsWith(prefix) ? parseFileName(uri.substring(prefix.length())) : null;
    }

    /**
     * The stream covers to delete from {@code entries}: those of songs no longer stored, then the least recently
     * used until the cache fits. Files of other names are not stream covers and are never listed here; the cover
     * named {@code current} is kept.
     */
    static List<String> evictions(List<Entry> entries, Predicate<String> stored, @Nullable String current,
                                  long maxBytes, int maxEntries) {
        List<String> remove = new ArrayList<>();
        List<Entry> retained = new ArrayList<>();
        long bytes = 0;
        int count = 0;
        for (Entry entry : entries) {
            String videoId = parseFileName(entry.name());
            if (videoId == null) continue;

            if (!stored.test(videoId)) {
                remove.add(entry.name());
                continue;
            }
            bytes += entry.bytes();
            count++;
            if (!entry.name().equals(current)) retained.add(entry);
        }
        retained.sort(Comparator.comparingLong(Entry::accessed).thenComparing(Entry::name));
        for (Entry entry : retained) {
            if (bytes <= maxBytes && count <= maxEntries) break;

            remove.add(entry.name());
            bytes -= entry.bytes();
            count--;
        }
        return remove;
    }
}
