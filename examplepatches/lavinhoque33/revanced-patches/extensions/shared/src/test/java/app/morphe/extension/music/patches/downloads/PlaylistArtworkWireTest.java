/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

public class PlaylistArtworkWireTest {
    private static final String SONG = "AAAAAAAAAAA";
    private static final String OTHER = "BBBBBBBBBBB";
    private static final String ROW_IMAGE = "https://i.ytimg.com/vi/AAAAAAAAAAA/hq.jpg";
    private static final String OTHER_IMAGE = "https://i.ytimg.com/vi/BBBBBBBBBBB/hq.jpg";
    private static final String COVER = "https://yt3.googleusercontent.com/example-cover=s576";
    private static final String COVER_SMALL = "https://yt3.googleusercontent.com/example-cover=s192";
    private static final String COVER_LARGE = "https://yt3.googleusercontent.com/example-cover=s1200";
    private static final String SOURCE = "PLsynthetic";
    private static final String OWNER = "https://yt3.ggpht.com/example-owner=s48";
    private static final String LOCAL_ROW = "file:///data/user/0/music/files/AAAAAAAAAAA.thumb";
    private static final String LOCAL_COVER = "file:///data/user/0/music/files/remembered.cover";
    private static final byte[] SENTINEL = {0x48, (byte) 0x80, 0x00};

    @Test
    public void changesOnlyImageSourcesAndKeepsDuplicateRowsAndDimensions() throws Exception {
        byte[] before = playlist(row(SONG, 0, ROW_IMAGE), row(OTHER, 1, OTHER_IMAGE), row(SONG, 2, ROW_IMAGE));
        byte[] after = playlist(LOCAL_COVER, false, false,
                row(SONG, 0, LOCAL_ROW), row(OTHER, 1, OTHER_IMAGE), row(SONG, 2, LOCAL_ROW));
        AtomicInteger lookups = new AtomicInteger();

        byte[] localized = PlaylistArtworkWire.localize(before, SOURCE, id -> {
            if (!SONG.equals(id)) return null;
            lookups.incrementAndGet();
            return LOCAL_ROW;
        }, key -> key.equals(PlaylistArtworkWire.imageKey(COVER)) ? LOCAL_COVER : null);

        assertArrayEquals(after, localized);
        assertEquals(1, lookups.get());
    }

    @Test
    public void usesTheSavedHeaderEvenWhenNoSongHasAThumbnail() throws Exception {
        byte[] before = playlist(row(SONG, 0, ROW_IMAGE));
        byte[] after = playlist(LOCAL_COVER, false, false, row(SONG, 0, ROW_IMAGE));
        assertArrayEquals(after, PlaylistArtworkWire.localize(before, SOURCE, id -> null, key -> LOCAL_COVER));
    }

    @Test
    public void legacyHeaderLocalizesBothRenditionsAndKeepsTheOriginalSnapshot() throws Exception {
        byte[] before = playlist(null, true, true, row(SONG, 0, ROW_IMAGE));
        byte[] expected = playlist(LOCAL_ROW, true, true, row(SONG, 0, LOCAL_ROW));

        assertEquals(COVER, PlaylistArtworkWire.headerCover(before));
        byte[] local = PlaylistArtworkWire.localize(before, SOURCE, Map.of(SONG, LOCAL_ROW)::get, key -> null);
        assertArrayEquals(expected, local);
        assertEquals(COVER, PlaylistArtworkWire.headerCover(before));
        assertNull(PlaylistArtworkWire.headerCover(local));
    }

    @Test
    public void localizesTheClassicNativeFallbackHeader() throws Exception {
        byte[] before = classicPlaylist(COVER, ROW_IMAGE);
        byte[] after = classicPlaylist(LOCAL_ROW, LOCAL_ROW);

        assertEquals(COVER, PlaylistArtworkWire.headerCover(before));
        assertArrayEquals(after,
                PlaylistArtworkWire.localize(before, SOURCE, Map.of(SONG, LOCAL_ROW)::get, key -> null));
    }

    @Test
    public void prefersAnExactSavedCoverAssetOverTheFirstTrack() throws Exception {
        String otherLocal = "file:///tracks/other.thumb";
        byte[] before = playlist(OTHER_IMAGE, false, false, row(SONG, 0, ROW_IMAGE), row(OTHER, 1, OTHER_IMAGE));
        byte[] after = playlist(otherLocal, false, false, row(SONG, 0, LOCAL_ROW), row(OTHER, 1, otherLocal));
        Map<String, String> copies = Map.of(SONG, LOCAL_ROW, OTHER, otherLocal);
        assertArrayEquals(after, PlaylistArtworkWire.localize(before, SOURCE, copies::get, key -> null));
    }

    @Test
    public void neverUsesAnotherSongCoverForAnUnmatchedOrNonPlayableRow() throws Exception {
        byte[] before = playlist(row("invalid", 0, ROW_IMAGE), row(OTHER, 1, ROW_IMAGE), row(SONG, 2, ROW_IMAGE));
        byte[] expected = playlist(LOCAL_ROW, false, false,
                row("invalid", 0, ROW_IMAGE), row(OTHER, 1, ROW_IMAGE), row(SONG, 2, LOCAL_ROW));
        assertArrayEquals(expected,
                PlaylistArtworkWire.localize(before, SOURCE, Map.of(SONG, LOCAL_ROW)::get, key -> null));
    }

    @Test
    public void doesNotCopyOrRewriteAnythingWithoutMatchingArtwork() throws Exception {
        byte[] before = playlist(row(SONG, 0, ROW_IMAGE));
        assertSame(before, PlaylistArtworkWire.localize(before, SOURCE, id -> null, key -> null));
        assertSame(before, PlaylistArtworkWire.localize(before, "PLunrelated", id -> LOCAL_ROW, key -> LOCAL_COVER));
        byte[] unrelated = new ProtoWriter().string(30, ROW_IMAGE).message(777, before).toByteArray();
        assertSame(unrelated, PlaylistArtworkWire.localize(unrelated, SOURCE, id -> LOCAL_ROW, key -> null));
        assertNull(PlaylistArtworkWire.headerCover(unrelated));
    }

    @Test
    public void matchesCoverSizesButNotOwnerOrUnrelatedImageHosts() {
        assertEquals(PlaylistArtworkWire.imageKey(COVER), PlaylistArtworkWire.imageKey(COVER_SMALL));
        assertNull(PlaylistArtworkWire.imageKey("https://yt3.googleusercontent.com.example/test=s192"));
        assertNull(PlaylistArtworkWire.imageKey("https://example.org/" + COVER));
        assertNull(PlaylistArtworkWire.imageKey(LOCAL_ROW));
    }

    private static byte[] playlist(byte[]... rows) {
        return playlist(null, false, false, rows);
    }

    private static byte[] playlist(String cover, boolean legacy, boolean itemSection, byte[]... rows) {
        ProtoWriter shelf = new ProtoWriter().string(1, SOURCE);
        for (byte[] row : rows) shelf.message(3, wrap(row, 161_429_595));
        shelf.string(10, "native-continuation-token");
        byte[] nativeShelf = wrap(shelf.toByteArray(), 175_617_300);
        byte[] child = itemSection ? wrap(nativeShelf, 50_195_462, 1) : nativeShelf;
        return page(child, cover, legacy);
    }

    private static byte[] classicPlaylist(String cover, String trackImage) {
        byte[] shelf = new ProtoWriter().string(1, SOURCE)
                .message(3, wrap(row(SONG, 0, trackImage), 161_429_595)).toByteArray();
        byte[] contents = wrap(shelf, 49_399_797, 1, 175_617_300);
        byte[] header = new ProtoWriter().string(1, "Playlist")
                .message(5, wrap(thumbnail(cover), 164_480_666, 1, 1)).toByteArray();
        return new ProtoWriter().message(9, contents).message(13, wrap(header, 173_602_558)).toByteArray();
    }

    private static byte[] row(String id, int index, String image) {
        byte[] watch = new ProtoWriter().string(1, id).string(2, SOURCE).int32(3, index).toByteArray();
        byte[] artwork = wrap(thumbnail(image), 66_439_850, 5, 72_399_185, 3, 164_480_666, 1, 1);
        byte[] menu = new ProtoWriter().string(11, ROW_IMAGE).string(12, OWNER)
                .raw(artwork, 0, artwork.length).toByteArray();
        return new ProtoWriter().message(1, wrap(thumbnail(image), 164_480_666, 1, 1))
                .message(3, wrap(ROW_IMAGE.getBytes(StandardCharsets.UTF_8), 1, 1))
                .message(5, wrap(watch, 48_687_757)).message(9, menu)
                .message(12, new ProtoWriter().string(1, "uniqueOccurrence").int32(4, index).toByteArray())
                .raw(SENTINEL, 0, SENTINEL.length).toByteArray();
    }

    private static byte[] page(byte[] child, String cover, boolean legacy) {
        byte[] contents = wrap(child, 58_173_949, 1, 58_174_010, 4, 49_399_797, 1);
        byte[] header;
        if (legacy) {
            byte[] sources = headerSources(cover);
            header = wrap(new ProtoWriter().message(2, sources).message(3, sources).string(16, OWNER).toByteArray(),
                    373_186_255, 14);
        } else {
            header = wrap(new ProtoWriter().message(10, wrap(headerSources(cover), 1)).string(24, OWNER).toByteArray(),
                    413_471_385, 1258);
        }
        return new ProtoWriter().message(9, contents)
                .message(13, wrap(header, 361_650_780, 2, 153_515_154, 172_660_663, 1, 168_777_401, 5))
                .string(777, ROW_IMAGE).raw(SENTINEL, 0, SENTINEL.length).toByteArray();
    }

    private static byte[] headerSources(String local) {
        return new ProtoWriter().message(1, headerSource(local == null ? COVER_SMALL : local, 192))
                .message(1, headerSource(local == null ? COVER : local, 576))
                .message(1, headerSource(local == null ? COVER_LARGE : local, 1200)).toByteArray();
    }

    private static byte[] headerSource(String url, int width) {
        return new ProtoWriter().int32(4, width).string(1, url).int32(5, width).toByteArray();
    }

    private static byte[] thumbnail(String url) {
        return new ProtoWriter().int32(2, 400).string(1, url).int32(3, 225).toByteArray();
    }

    private static byte[] wrap(byte[] leaf, int... path) {
        for (int i = path.length - 1; i >= 0; i--) leaf = new ProtoWriter().message(path[i], leaf).toByteArray();
        return leaf;
    }
}
