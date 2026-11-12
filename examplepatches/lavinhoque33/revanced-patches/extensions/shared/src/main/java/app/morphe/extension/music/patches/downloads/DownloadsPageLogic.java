/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.WireFormat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.function.IntFunction;

import app.morphe.extension.music.patches.downloads.OfflineLibraryLogic.SourceRow;

/**
 * The page of the Library's Downloads chip with the stream copies in it, with no Android dependency. The app builds
 * that page itself from its own downloads and delivers it as a section list; the downloaded albums and playlists of
 * the stream copies are added to those bytes as a shelf of rows (with one more row, No Playlist, for the songs no
 * downloaded list holds; a song is never listed as a song of its own), and the app's empty state ("Music and podcasts you download will appear here") is taken
 * out when it is the only thing the page has. Everything is wire level, so the same code serves every version: the
 * field numbers of these messages are the same in all of them.
 *
 * <p>Section list: 1 repeated content item, 2 repeated continuation item, 6 chip row (never touched). Content item:
 * 91,303,872 music shelf. Shelf: 1 title, 2 repeated entry. Entry: 161,429,595 row, 58,508,690 empty state. Row: 1
 * image, 3 title, 4 subtitle, 5 tap command. Text: 1 repeated run, run: 1 text. Image: extension 164,480,666, in it
 * 1 thumbnails, in it 1 repeated thumbnail (1 url, 2 width, 3 height).
 */
final class DownloadsPageLogic {
    /** What the stream copies add to a page of the Downloads chips. */
    enum Layout {
        /** The page stays as the app built it. */
        NONE,
        /** The Downloads chip itself: the albums and playlists, then No Playlist. */
        ALL,
        /** The Playlists chip: the playlists, then No Playlist. */
        PLAYLISTS,
        /** The Albums chip. */
        ALBUMS
    }

    /** The commands the rows run when tapped; null leaves a row out. */
    interface Taps {
        /**
         * A downloaded album or playlist: its page while online, its songs from the first one while offline. The
         * songs list (No Playlist) opens our own list on any network.
         */
        @Nullable
        byte[] source(SourceRow row);
    }

    /** The url of a cover: the song's cover file when it has one, else the url recorded for it. */
    interface CoverOf {
        @Nullable
        String of(@Nullable String videoId, @Nullable String recordedUrl);
    }

    /** The texts of the shelf and rows; {@code songCount} formats a count of songs. */
    record Labels(String sources, String noPlaylist, String untitled, IntFunction<String> songCount) {}

    private static final String TOKEN_PREFIX = "CONTENT_RELOAD_CONTINUATION_TOKEN_";

    private static final String SUBCHIP_SUFFIX = "_DOWNLOADED_SUBCHIP";
    private static final String ALBUM_PREFIX = "OLAK5uy_";
    private static final String BROWSE_PLAYLIST_PREFIX = "VL";

    private static final int REQUEST_TOKEN_FIELD = 7;

    private static final int SECTION_CONTENT_FIELD = 1;
    private static final int MUSIC_SHELF = 91_303_872;
    private static final int SHELF_TITLE_FIELD = 1;
    private static final int SHELF_ENTRY_FIELD = 2;
    private static final int SHELF_FLAG_FIELD = 20;
    private static final int ENTRY_ROW = 161_429_595;
    private static final int ENTRY_EMPTY_STATE = 58_508_690;
    private static final int ROW_IMAGE = 1;
    private static final int ROW_TITLE = 3;
    private static final int ROW_SUBTITLE = 4;
    private static final int ROW_TAP = 5;
    private static final int THUMBNAIL_EXTENSION = 164_480_666;
    private static final int THUMBNAILS_FIELD = 1;
    private static final int THUMBNAIL_FIELD = 1;
    private static final int THUMBNAIL_URL = 1;
    private static final int THUMBNAIL_WIDTH = 2;
    private static final int THUMBNAIL_HEIGHT = 3;
    private static final int THUMBNAIL_PIXELS = 226;
    private static final int TEXT_RUN_FIELD = 1;
    private static final int RUN_TEXT_FIELD = 1;

    private DownloadsPageLogic() {}

    /** The global device-files choice keeps the chip inside the Library, using its native local-media service. */
    static String libraryToken(DownloadMethod method, String token) {
        if (method != DownloadMethod.DEVICE_FILES || token == null || !token.startsWith(TOKEN_PREFIX)) return token;
        String name = token.substring(TOKEN_PREFIX.length());
        if (name.endsWith(SUBCHIP_SUFFIX)) name = name.substring(0, name.length() - SUBCHIP_SUFFIX.length());
        return switch (name) {
            case "DEFAULT", "TRACKS" -> "SIDELOADED_LIBRARY_RELOAD_CONTINUATION_TOKEN_TRACKS";
            case "PLAYLISTS" -> "SIDELOADED_LIBRARY_RELOAD_CONTINUATION_TOKEN_PLAYLISTS";
            case "ALBUMS" -> "SIDELOADED_LIBRARY_RELOAD_CONTINUATION_TOKEN_ALBUMS";
            default -> token;
        };
    }

    /** The continuation token of a page request (field 7 of its message), or null when it has none. */
    @Nullable
    static String tokenOf(byte[] request) {
        try {
            CodedInputStream input = CodedInputStream.newInstance(request);
            while (!input.isAtEnd()) {
                int tag = input.readTag();
                boolean token = WireFormat.getTagFieldNumber(tag) == REQUEST_TOKEN_FIELD
                        && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED;
                if (token) return input.readString();
                if (!input.skipField(tag)) return null;
            }
        } catch (IOException ignored) {
            // Not a request this knows: the page stays as the app built it.
        }
        return null;
    }

    /**
     * What a request adds to its page. The Downloads chip asks with {@code DEFAULT}, and its sub-chips with
     * {@code PLAYLISTS} and {@code ALBUMS} followed by {@code _DOWNLOADED_SUBCHIP} on the device; both spellings of a
     * chip get the same layout. The Songs sub-chip ({@code TRACKS}), podcasts and any token this does not know are
     * left alone: no song of a stream copy is listed as a song.
     */
    static Layout layoutOf(@Nullable String token) {
        if (token == null || !token.startsWith(TOKEN_PREFIX)) return Layout.NONE;

        String name = token.substring(TOKEN_PREFIX.length());
        if (name.endsWith(SUBCHIP_SUFFIX)) name = name.substring(0, name.length() - SUBCHIP_SUFFIX.length());

        return switch (name) {
            case "DEFAULT" -> Layout.ALL;
            case "PLAYLISTS" -> Layout.PLAYLISTS;
            case "ALBUMS" -> Layout.ALBUMS;
            default -> Layout.NONE;
        };
    }

    /** Whether a downloaded source is an album, which the Albums chip lists; every other one is a playlist. */
    static boolean isAlbum(String sourceId) {
        return sourceId.startsWith(ALBUM_PREFIX);
    }

    /**
     * The content items the layout adds, in page order; none when there is nothing to show for it. A source without
     * a song that can play offline is left out while offline. {@code noPlaylist} is the row of the songs no
     * downloaded list holds, or null when there are none; it ends the playlists.
     */
    static List<byte[]> sections(Layout layout, boolean online, List<SourceRow> sources,
                                 @Nullable SourceRow noPlaylist, Labels labels, Taps taps, CoverOf covers) {
        List<byte[]> items = new ArrayList<>();
        boolean all = layout == Layout.ALL;
        List<byte[]> sourceRows = new ArrayList<>();
        for (SourceRow source : sources) {
            if (listsSource(layout, source.sourceId()) && (online || source.availableCount() > 0)) {
                byte[] row = sourceRow(source, labels, taps, covers);
                if (row != null) sourceRows.add(row);
            }
        }
        boolean listsNoPlaylist = layout == Layout.ALL || layout == Layout.PLAYLISTS;
        if (noPlaylist != null && listsNoPlaylist) {
            byte[] row = sourceRow(noPlaylist, labels, taps, covers);
            if (row != null) sourceRows.add(row);
        }
        addShelf(items, all ? labels.sources() : null, sourceRows);
        return items;
    }

    private static boolean listsSource(Layout layout, String sourceId) {
        return switch (layout) {
            case ALL -> true;
            case ALBUMS -> isAlbum(sourceId);
            case PLAYLISTS -> !isAlbum(sourceId);
            default -> false;
        };
    }

    private static void addShelf(List<byte[]> items, @Nullable String title, List<byte[]> rows) {
        if (rows.isEmpty()) return;

        ProtoWriter shelf = new ProtoWriter();
        if (title != null) shelf.message(SHELF_TITLE_FIELD, text(title));
        for (byte[] row : rows) {
            shelf.message(SHELF_ENTRY_FIELD, new ProtoWriter().message(ENTRY_ROW, row).toByteArray());
        }
        shelf.bool(SHELF_FLAG_FIELD, true);
        items.add(new ProtoWriter().message(MUSIC_SHELF, shelf.toByteArray()).toByteArray());
    }

    @Nullable
    private static byte[] sourceRow(SourceRow source, Labels labels, Taps taps, CoverOf covers) {
        byte[] tap = taps.source(source);
        if (tap == null) return null;

        String title = source.title().isEmpty() ? labels.untitled() : source.title();
        String cover = covers.of(source.coverVideoId(), source.thumbnailUrl());
        return row(title, labels.songCount().apply(source.songCount()), cover, tap);
    }

    private static byte[] row(String title, String subtitle, @Nullable String coverUrl, byte[] tap) {
        ProtoWriter row = new ProtoWriter();
        if (coverUrl != null && !coverUrl.isEmpty()) row.message(ROW_IMAGE, image(coverUrl));
        row.message(ROW_TITLE, text(title));
        if (!subtitle.isEmpty()) row.message(ROW_SUBTITLE, text(subtitle));
        return row.message(ROW_TAP, tap).toByteArray();
    }

    private static byte[] text(String value) {
        byte[] run = new ProtoWriter().string(RUN_TEXT_FIELD, value).toByteArray();
        return new ProtoWriter().message(TEXT_RUN_FIELD, run).toByteArray();
    }

    private static byte[] image(String url) {
        byte[] thumbnail = new ProtoWriter().string(THUMBNAIL_URL, url).int32(THUMBNAIL_WIDTH, THUMBNAIL_PIXELS)
                .int32(THUMBNAIL_HEIGHT, THUMBNAIL_PIXELS).toByteArray();
        byte[] thumbnails = new ProtoWriter().message(THUMBNAIL_FIELD, thumbnail).toByteArray();
        byte[] extension = new ProtoWriter().message(THUMBNAILS_FIELD, thumbnails).toByteArray();
        return new ProtoWriter().message(THUMBNAIL_EXTENSION, extension).toByteArray();
    }

    /**
     * The page with the empty state taken out and the content items appended, or null when the page cannot be read
     * or there is nothing to add. A shelf that held the empty state and no row is dropped with it; a shelf with
     * rows of the app's own downloads stays, and ours follow it.
     */
    @Nullable
    static byte[] merge(byte[] page, List<byte[]> items) {
        if (items.isEmpty()) return null;

        try {
            ProtoWriter merged = new ProtoWriter();
            CodedInputStream input = CodedInputStream.newInstance(page);
            while (!input.isAtEnd()) {
                int tag = input.readTag();
                int field = WireFormat.getTagFieldNumber(tag);
                if (field == 0) return null;

                boolean content = field == SECTION_CONTENT_FIELD
                        && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED;
                if (content) {
                    byte[] item = input.readByteArray();
                    byte[] kept = withoutEmptyState(item);
                    if (kept != null) merged.message(SECTION_CONTENT_FIELD, kept);
                } else {
                    byte[] skipped = copyField(input, tag);
                    if (skipped == null) return null;

                    merged.raw(skipped, 0, skipped.length);
                }
            }
            for (byte[] item : items) merged.message(SECTION_CONTENT_FIELD, item);
            return merged.toByteArray();
        } catch (IOException ex) {
            return null;
        }
    }

    /** The content item without the empty state of its shelf, the item itself when it has none, null when dropped. */
    @Nullable
    private static byte[] withoutEmptyState(byte[] item) throws IOException {
        byte[] shelf = fieldOf(item, MUSIC_SHELF);
        if (shelf == null || !holdsEmptyState(shelf)) return item;

        boolean rows = false;
        ProtoWriter kept = new ProtoWriter();
        CodedInputStream input = CodedInputStream.newInstance(shelf);
        while (!input.isAtEnd()) {
            int tag = input.readTag();
            boolean entry = WireFormat.getTagFieldNumber(tag) == SHELF_ENTRY_FIELD
                    && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED;
            if (entry) {
                byte[] value = input.readByteArray();
                if (fieldOf(value, ENTRY_EMPTY_STATE) != null) continue;

                rows |= fieldOf(value, ENTRY_ROW) != null;
                kept.message(SHELF_ENTRY_FIELD, value);
            } else {
                byte[] skipped = copyField(input, tag);
                if (skipped == null) return item;

                kept.raw(skipped, 0, skipped.length);
            }
        }
        return rows ? new ProtoWriter().message(MUSIC_SHELF, kept.toByteArray()).toByteArray() : null;
    }

    private static boolean holdsEmptyState(byte[] shelf) throws IOException {
        CodedInputStream input = CodedInputStream.newInstance(shelf);
        while (!input.isAtEnd()) {
            int tag = input.readTag();
            boolean entry = WireFormat.getTagFieldNumber(tag) == SHELF_ENTRY_FIELD
                    && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED;
            if (entry) {
                if (fieldOf(input.readByteArray(), ENTRY_EMPTY_STATE) != null) return true;
            } else if (!input.skipField(tag)) {
                return false;
            }
        }
        return false;
    }

    /** The first length-delimited field with the number, or null. */
    @Nullable
    private static byte[] fieldOf(byte[] message, int number) throws IOException {
        CodedInputStream input = CodedInputStream.newInstance(message);
        while (!input.isAtEnd()) {
            int tag = input.readTag();
            boolean wanted = WireFormat.getTagFieldNumber(tag) == number
                    && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED;
            if (wanted) return input.readByteArray();
            if (!input.skipField(tag)) return null;
        }
        return null;
    }

    /** The field the tag started, re-encoded as it was, or null for an end-group tag. */
    @Nullable
    private static byte[] copyField(CodedInputStream input, int tag) throws IOException {
        ProtoWriter copy = new ProtoWriter();
        int field = WireFormat.getTagFieldNumber(tag);
        switch (WireFormat.getTagWireType(tag)) {
            case WireFormat.WIRETYPE_VARINT -> copy.int64(field, input.readInt64());
            case WireFormat.WIRETYPE_FIXED64 -> copy.fixed64(field, input.readFixed64());
            case WireFormat.WIRETYPE_LENGTH_DELIMITED -> copy.message(field, input.readByteArray());
            case WireFormat.WIRETYPE_FIXED32 -> copy.fixed32(field, input.readFixed32());
            default -> {
                return null;
            }
        }
        return copy.toByteArray();
    }
}
