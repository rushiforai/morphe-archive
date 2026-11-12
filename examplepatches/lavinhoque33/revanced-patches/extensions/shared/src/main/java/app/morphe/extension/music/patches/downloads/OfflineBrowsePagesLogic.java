/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.WireFormat;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Set;
import java.util.function.BooleanSupplier;
import java.util.function.Predicate;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

/**
 * The decisions of {@link OfflineBrowsePages} that need no Android: which page is worth recording, whether an id is
 * safe as a file name, how big the framework updates in a recorded page are, and the compression of a page.
 */
final class OfflineBrowsePagesLogic {
    /** The field of a browse response that holds the Elements templates, fragments and the rest of the updates. */
    static final int FRAMEWORK_UPDATES_FIELD = 777;

    private static final int MAX_ID_LENGTH = 64;
    /** An album page's browse id; the page of a list that is downloaded under its audio playlist id. */
    private static final String ALBUM_PAGE_PREFIX = "MPREb_";
    /** The playlist id of an album's audio playlist, which a list of an album is downloaded under. */
    private static final String ALBUM_PLAYLIST_PREFIX = "OLAK5uy_";

    private OfflineBrowsePagesLogic() {}

    /** The field of a browse response that holds the next rows of a list instead of its page. */
    static final int CONTINUATION_FIELD = 10;

    /**
     * Whether the page a browse id opens may be the page of a downloaded list: the id of a playlist page has the
     * {@code VL} prefix, which is not part of the list's id, and an album page ({@code MPREb_}) of a list downloaded
     * under its audio playlist id is only known by its content, see {@link #ownerOf}.
     */
    static boolean recordable(String browseId, Predicate<String> isSource, BooleanSupplier hasAlbumPlaylist) {
        String pageId = OfflineReplayLogic.sourceOfBrowseId(browseId);
        return isSource.test(pageId) || pageId.startsWith(ALBUM_PAGE_PREFIX) && hasAlbumPlaylist.getAsBoolean();
    }

    /**
     * The downloaded list a page belongs to, or null. A page of the list's own id belongs to it. An album page
     * ({@code MPREb_}) belongs to the album playlist (a source id of {@code OLAK5uy_}) its content names most often:
     * the play and shuffle buttons and every row carry it, other albums' ids appear only in shelves. A tie or no
     * name is no owner.
     */
    @Nullable
    static String ownerOf(String browseId, byte[] response, Set<String> sourceIds) {
        String pageId = OfflineReplayLogic.sourceOfBrowseId(browseId);
        if (sourceIds.contains(pageId)) return pageId;

        if (!pageId.startsWith(ALBUM_PAGE_PREFIX)) return null;

        String owner = null;
        int most = 0;
        boolean tie = false;
        for (String id : sourceIds) {
            if (!id.startsWith(ALBUM_PLAYLIST_PREFIX)) continue;

            int count = occurrences(response, id.getBytes(StandardCharsets.UTF_8));
            if (count > most) {
                owner = id;
                most = count;
                tie = false;
            } else if (count == most && count > 0) {
                tie = true;
            }
        }
        return tie ? null : owner;
    }

    /** How many times the bytes occur in the response, without overlapping. */
    static int occurrences(byte[] response, byte[] needle) {
        int count = 0;
        int start = 0;
        while (needle.length > 0 && start <= response.length - needle.length) {
            if (matchesAt(response, needle, start)) {
                count++;
                start += needle.length;
            } else {
                start++;
            }
        }
        return count;
    }

    private static boolean matchesAt(byte[] response, byte[] needle, int at) {
        for (int i = 0; i < needle.length; i++) {
            if (response[at + i] != needle[i]) return false;
        }
        return true;
    }

    /**
     * Whether a browse response is the next rows of a list (a continuation) and not its page. The page is replaced
     * by every later online open of it, so only the page itself is recorded.
     */
    static boolean isContinuation(byte[] response) {
        return OfflineReplayLogic.hasField(response, CONTINUATION_FIELD);
    }

    /** The top-level fields of a browse response with their sizes, such as {@code 9:1200,13:80}: for the log. */
    static String fieldSizes(byte[] response) {
        StringBuilder sizes = new StringBuilder();
        try {
            CodedInputStream input = CodedInputStream.newInstance(response);
            while (!input.isAtEnd()) {
                int tag = input.readTag();
                int start = input.getTotalBytesRead();
                if (!input.skipField(tag)) break;

                if (sizes.length() > 0) sizes.append(',');
                sizes.append(WireFormat.getTagFieldNumber(tag)).append(':').append(input.getTotalBytesRead() - start);
            }
        } catch (IOException ex) {
            sizes.append("unreadable");
        }
        return sizes.toString();
    }

    /** Whether the id is made of what a file name can hold, so that it names the recorded page's file. */
    static boolean isFileSafe(String id) {
        if (id.isEmpty() || id.length() > MAX_ID_LENGTH) return false;

        for (int i = 0; i < id.length(); i++) {
            char c = id.charAt(i);
            boolean safe = c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9' || c == '_' || c == '-';
            if (!safe) return false;
        }
        return true;
    }

    /** The size in bytes of the framework updates of a browse response, 0 when it has none or is unreadable. */
    static int frameworkUpdatesSize(byte[] response) {
        try {
            CodedInputStream input = CodedInputStream.newInstance(response);
            while (!input.isAtEnd()) {
                int tag = input.readTag();
                boolean updates = WireFormat.getTagFieldNumber(tag) == FRAMEWORK_UPDATES_FIELD
                        && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED;
                if (updates) return input.readByteArray().length;

                if (!input.skipField(tag)) return 0;
            }
        } catch (IOException ex) {
            return 0;
        }
        return 0;
    }

    static byte[] gzip(byte[] bytes) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(Math.max(64, bytes.length / 4));
        try (GZIPOutputStream gzip = new GZIPOutputStream(out)) {
            gzip.write(bytes);
        }
        return out.toByteArray();
    }

    static byte[] gunzip(byte[] bytes) throws IOException {
        try (GZIPInputStream gzip = new GZIPInputStream(new ByteArrayInputStream(bytes))) {
            return gzip.readAllBytes();
        }
    }
}
