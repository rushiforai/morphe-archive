/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-01.
 */
package app.morphe.extension.music.patches.androidauto;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

/** Canonical cache names and the bounded, downloaded-media-only artwork namespace. */
final class AndroidAutoDownloadsArtworkData {
    static final String DIRECTORY = "rvx-aa-art";
    static final long MAX_CACHE_BYTES = 8L * 1024 * 1024;
    static final int MAX_CACHE_ENTRIES = 256;
    static final int MAX_IMAGE_BYTES = 256 * 1024;

    record Key(long mediaId, long modifiedSeconds, long fileSize) {
        Key {
            if (mediaId <= 0 || modifiedSeconds < 0 || fileSize <= 0) {
                throw new IllegalArgumentException("Invalid downloaded audio metadata");
            }
        }

        String fileName() {
            return "v1-" + mediaId + "-" + modifiedSeconds + "-" + fileSize + ".jpg";
        }
    }

    record Entry(String name, long bytes, long accessed) {}

    private AndroidAutoDownloadsArtworkData() {}

    static Key parseFileName(String name) {
        if (name == null || !name.startsWith("v1-") || !name.endsWith(".jpg")) return null;
        String[] numbers = name.substring(3, name.length() - 4).split("-", -1);
        if (numbers.length != 3) return null;
        for (String number : numbers) {
            if (number.isEmpty()) return null;
            for (int index = 0; index < number.length(); index++) {
                if (number.charAt(index) < '0' || number.charAt(index) > '9') return null;
            }
        }
        try {
            Key key = new Key(Long.parseLong(numbers[0]), Long.parseLong(numbers[1]), Long.parseLong(numbers[2]));
            return key.fileName().equals(name) ? key : null;
        } catch (IllegalArgumentException ignored) {
            return null;
        }
    }

    static String uriPrefix(String authority, String root) {
        if (!safeSegment(authority, true) || !safeSegment(root, false)) {
            throw new IllegalArgumentException("Invalid artwork provider namespace");
        }
        return "content://" + authority + "/" + root + "/" + DIRECTORY + "/";
    }

    static String uri(String authority, String root, Key key) {
        return uriPrefix(authority, root) + key.fileName();
    }

    static Key parseUri(String authority, String root, String uri) {
        if (uri == null) return null;
        String prefix = uriPrefix(authority, root);
        return uri.startsWith(prefix) ? parseFileName(uri.substring(prefix.length())) : null;
    }

    private static boolean safeSegment(String value, boolean authority) {
        if (value == null || value.isEmpty() || value.equals(".") || value.equals("..")) return false;
        for (int index = 0; index < value.length(); index++) {
            char character = value.charAt(index);
            if (character >= 'a' && character <= 'z' || character >= 'A' && character <= 'Z'
                    || character >= '0' && character <= '9' || character == '_' || character == '-'
                    || authority && character == '.') continue;
            return false;
        }
        return true;
    }

    static AndroidAutoDownloadsData.Track coverTrack(AndroidAutoDownloadsData.Playlist playlist) {
        return playlist.tracks().isEmpty() ? null : playlist.tracks().get(0);
    }

    /** Stale downloads/revisions first, then least-recently-used entries; never evict the image being opened. */
    static List<String> evictions(List<Entry> entries, Set<Long> downloadedIds, Key current,
                                  long maxBytes, int maxEntries) {
        List<String> remove = new ArrayList<>();
        List<Entry> retained = new ArrayList<>();
        long bytes = 0;
        int count = 0;
        for (Entry entry : entries) {
            // Stream covers are evicted by AndroidAutoStreamArtworkData.
            if (AndroidAutoStreamArtworkData.parseFileName(entry.name()) != null) continue;

            Key key = parseFileName(entry.name());
            if (key == null || !downloadedIds.contains(key.mediaId())
                    || current != null && key.mediaId() == current.mediaId() && !key.equals(current)) {
                remove.add(entry.name());
                continue;
            }
            bytes += entry.bytes();
            count++;
            if (!key.equals(current)) retained.add(entry);
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
