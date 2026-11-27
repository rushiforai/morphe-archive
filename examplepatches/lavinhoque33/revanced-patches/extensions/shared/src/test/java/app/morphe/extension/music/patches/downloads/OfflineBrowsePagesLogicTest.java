/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-26.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.WireFormat;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class OfflineBrowsePagesLogicTest {
    private static final Set<String> SOURCES = Set.of("PLa", "MPREb_c");

    @Test public void thePageOfADownloadedListIsRecorded() {
        assertTrue(OfflineBrowsePagesLogic.recordable("VLPLa", SOURCES::contains, () -> false));
        assertTrue(OfflineBrowsePagesLogic.recordable("MPREb_c", SOURCES::contains, () -> false));
    }

    @Test public void anOtherPageIsNotRecorded() {
        assertFalse(OfflineBrowsePagesLogic.recordable("VLPLother", SOURCES::contains, () -> true));
        assertFalse(OfflineBrowsePagesLogic.recordable("FEmusic_home", SOURCES::contains, () -> true));
    }

    @Test public void anAlbumPageMayBelongToADownloadedAlbumPlaylist() {
        assertTrue(OfflineBrowsePagesLogic.recordable("MPREb_x", SOURCES::contains, () -> true));
        assertFalse(OfflineBrowsePagesLogic.recordable("MPREb_x", SOURCES::contains, () -> false));
    }

    @Test public void aPageOfTheListsOwnIdBelongsToIt() {
        assertEquals("PLa", OfflineBrowsePagesLogic.ownerOf("VLPLa", new byte[0], SOURCES));
        assertEquals("MPREb_c", OfflineBrowsePagesLogic.ownerOf("MPREb_c", new byte[0], SOURCES));
    }

    @Test public void anAlbumPageBelongsToThePlaylistItNamesMost() {
        Set<String> sources = Set.of("PLa", "OLAK5uy_one", "OLAK5uy_two");
        byte[] page = utf8("OLAK5uy_one;OLAK5uy_one;OLAK5uy_two;OLAK5uy_one");

        assertEquals("OLAK5uy_one", OfflineBrowsePagesLogic.ownerOf("MPREb_x", page, sources));
    }

    @Test public void anAlbumPageThatNamesNoPlaylistOrTiesHasNoOwner() {
        Set<String> sources = Set.of("OLAK5uy_one", "OLAK5uy_two");

        assertNull(OfflineBrowsePagesLogic.ownerOf("MPREb_x", utf8("nothing"), sources));
        assertNull(OfflineBrowsePagesLogic.ownerOf("MPREb_x", utf8("OLAK5uy_one OLAK5uy_two"), sources));
    }

    @Test public void aPlaylistPageOfAnOtherListHasNoOwner() {
        assertNull(OfflineBrowsePagesLogic.ownerOf("VLPLother", utf8("OLAK5uy_one"), Set.of("OLAK5uy_one")));
    }

    @Test public void theOccurrencesDoNotOverlap() {
        assertEquals(2, OfflineBrowsePagesLogic.occurrences(utf8("aaaa"), utf8("aa")));
        assertEquals(0, OfflineBrowsePagesLogic.occurrences(utf8("ab"), utf8("abc")));
        assertEquals(0, OfflineBrowsePagesLogic.occurrences(utf8("ab"), new byte[0]));
    }

    private static byte[] utf8(String text) {
        return text.getBytes(StandardCharsets.UTF_8);
    }

    @Test public void theNextRowsOfAListAreNotItsPage() {
        byte[] page = new ProtoWriter().message(9, new byte[10]).message(13, new byte[5]).toByteArray();
        byte[] rows = new ProtoWriter().message(OfflineBrowsePagesLogic.CONTINUATION_FIELD, new byte[10]).toByteArray();

        assertFalse(OfflineBrowsePagesLogic.isContinuation(page));
        assertTrue(OfflineBrowsePagesLogic.isContinuation(rows));
    }

    @Test public void theFieldsOfAResponseAreListedWithTheirSizes() {
        byte[] page = new ProtoWriter().message(9, new byte[10]).message(13, new byte[5]).toByteArray();

        assertEquals("9:11,13:6", OfflineBrowsePagesLogic.fieldSizes(page));
    }

    @Test public void onlyPlainIdsAreFileNames() {
        assertTrue(OfflineBrowsePagesLogic.isFileSafe("PL16FEhKJOy-bj-NlgyArbVsr_Yg_8ZqLg"));
        assertTrue(OfflineBrowsePagesLogic.isFileSafe("MPREb_abc123"));
        assertFalse(OfflineBrowsePagesLogic.isFileSafe(""));
        assertFalse(OfflineBrowsePagesLogic.isFileSafe("../x"));
        assertFalse(OfflineBrowsePagesLogic.isFileSafe("a/b"));
        assertFalse(OfflineBrowsePagesLogic.isFileSafe("x".repeat(65)));
    }

    @Test public void localPlaylistScopeExcludesSyntheticAndAlbumDestinations() {
        assertTrue(OfflineBrowsePagesLogic.isPlaylistId("PLsaved"));
        assertFalse(OfflineBrowsePagesLogic.isPlaylistId("FEmusic_offline"));
        assertFalse(OfflineBrowsePagesLogic.isPlaylistId("songs"));
        assertFalse(OfflineBrowsePagesLogic.isPlaylistId("MPREb_album"));
        assertFalse(OfflineBrowsePagesLogic.isPlaylistId("OLAK5uy_album"));
    }

    @Test public void metadataOnlyPlaylistUsesNativeRowsWithRealArtworkAndSavedPositions() throws Exception {
        String id = "PLsaved";
        String first = "firstSongId";
        String second = "secondTrack";
        String cover = "file:///app/files/firstSongId.thumb";
        byte[] page = OfflineBrowsePagesLogic.fallback(id, "My playlist", "By Artist", "",
                List.of(first, PlaylistPage.UNAVAILABLE, second, first),
                track -> track.equals(first)
                        ? new OfflineBrowsePagesLogic.TrackMetadata("First title", "Artist", 187_000, cover)
                        : null, "Unavailable offline");

        byte[] header = at(page, 13, 173_602_558);
        assertEquals("My playlist", string(at(header, 1, 1, 1)));
        assertEquals("By Artist", string(at(header, 13, 1, 1)));
        assertEquals(cover, string(at(header, 5, 164_480_666, 1, 1, 1)));
        byte[] shelf = at(page, 9, 58_173_949, 1, 58_174_010, 4, 49_399_797, 1, 175_617_300);
        assertEquals(id, string(at(shelf, 1)));

        List<byte[]> rows = fields(shelf, 3);
        assertEquals(4, rows.size());
        byte[] row = at(rows.get(0), 161_429_595);
        assertEquals("First title", string(at(row, 3, 1, 1)));
        assertEquals(OfflineLibraryLogic.songSubtitle("Artist", 187_000), string(at(row, 4, 1, 1)));
        assertEquals(cover, string(at(row, 1, 164_480_666, 1, 1, 1)));
        byte[] unavailable = at(rows.get(1), 161_429_595);
        assertEquals("Unavailable offline", string(at(unavailable, 3, 1, 1)));
        assertTrue(fields(unavailable, 5).isEmpty());
        assertArrayEquals(OnlineWatchCommand.build(second, id, 2), at(rows.get(2), 161_429_595, 5));
        assertArrayEquals(OnlineWatchCommand.build(first, id, 3), at(rows.get(3), 161_429_595, 5));
        assertFalse(OfflineBrowsePagesLogic.isContinuation(page));
    }

    private static String string(byte[] data) {
        return new String(data, StandardCharsets.UTF_8);
    }

    private static byte[] at(byte[] bytes, int... path) throws IOException {
        for (int field : path) bytes = fields(bytes, field).get(0);
        return bytes;
    }

    private static List<byte[]> fields(byte[] bytes, int field) throws IOException {
        var matches = new ArrayList<byte[]>();
        CodedInputStream input = CodedInputStream.newInstance(bytes);
        while (!input.isAtEnd()) {
            int tag = input.readTag();
            if (WireFormat.getTagFieldNumber(tag) == field
                    && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                matches.add(input.readByteArray());
            } else {
                if (!input.skipField(tag)) throw new IOException("Unexpected end group");
            }
        }
        return matches;
    }

    @Test public void theFrameworkUpdatesAreMeasuredInTheResponse() {
        byte[] updates = new byte[300];
        byte[] response = new ProtoWriter()
                .string(1, "header")
                .message(OfflineBrowsePagesLogic.FRAMEWORK_UPDATES_FIELD, updates)
                .string(2, "rows")
                .toByteArray();

        assertEquals(300, OfflineBrowsePagesLogic.frameworkUpdatesSize(response));
        assertEquals(0, OfflineBrowsePagesLogic.frameworkUpdatesSize(new ProtoWriter().string(1, "x").toByteArray()));
        assertEquals(0, OfflineBrowsePagesLogic.frameworkUpdatesSize(new byte[]{(byte) 0xff}));
    }

    @Test public void aPageSurvivesCompression() throws IOException {
        byte[] page = "a page ".repeat(500).getBytes(StandardCharsets.UTF_8);

        byte[] packed = OfflineBrowsePagesLogic.gzip(page);

        assertTrue(packed.length < page.length);
        assertArrayEquals(page, OfflineBrowsePagesLogic.gunzip(packed));
    }
}
