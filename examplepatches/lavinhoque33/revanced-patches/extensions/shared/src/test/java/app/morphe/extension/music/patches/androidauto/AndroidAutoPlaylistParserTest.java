/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.androidauto;

import com.google.protobuf.CodedOutputStream;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import static org.junit.Assert.*;

/** Native wire field numbers verified against the 9.40/9.15 generated protobuf schemas, not JSON names. */
public class AndroidAutoPlaylistParserTest {
    private static final int PLAYLIST = 175_617_300;
    private static final int MUSIC = 91_303_872;
    private static final int ITEM = 161_429_595;
    private static final int SECTION = 49_399_797;
    private static final int WATCH = 48_687_757;

    private static byte[] join(byte[]... fields) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        for (byte[] field : fields) bytes.write(field, 0, field.length);
        return bytes.toByteArray();
    }

    private static byte[] msg(int field, byte[]... fields) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try {
            CodedOutputStream output = CodedOutputStream.newInstance(bytes);
            output.writeByteArray(field, join(fields));
            output.flush();
        } catch (IOException ex) {
            throw new AssertionError(ex);
        }
        return bytes.toByteArray();
    }

    private static byte[] text(int field, String value) {
        return msg(field, value.getBytes(StandardCharsets.UTF_8));
    }

    private static byte[] integer(int field, int value) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try {
            CodedOutputStream output = CodedOutputStream.newInstance(bytes);
            output.writeInt32(field, value);
            output.flush();
        } catch (IOException ex) {
            throw new AssertionError(ex);
        }
        return bytes.toByteArray();
    }

    private static byte[] command(String video, String playlist, int index) {
        return msg(WATCH, text(1, video), text(2, playlist), integer(3, index), text(40, "native-context"));
    }

    private static byte[] row(String title, byte[] command) {
        return msg(ITEM, msg(3, msg(1, text(1, title))), msg(4, msg(1, text(1, "Artist • 3:25"))),
                msg(5, command), msg(12, text(1, "playlist-set-id")),
                msg(1, msg(164_480_666, msg(1, msg(1, text(1, "https://art/song"))))));
    }

    private static byte[] next(int field, String token) {
        return msg(field, msg(52_047_593, text(1, token)));
    }

    private static byte[] initial(byte[] sections) {
        return msg(9, msg(58_173_949, msg(1, msg(58_174_010, msg(4, msg(SECTION, sections))))));
    }

    @Test public void nativePlaylistPreservesDuplicateUnavailablePositionsMetadataAndFullWatchCommand() {
        byte[] watch = command("first", "PLone", 0);
        byte[] available = row("First", watch);
        byte[] unavailable = row("Deleted song", new byte[0]);
        byte[] addSong = msg(ITEM, msg(3, msg(1, text(1, "Add a song"))), msg(5, msg(48_687_709, text(1, "search"))));
        byte[] shelf = msg(PLAYLIST, msg(3, available), msg(3, unavailable), msg(3, available), msg(3, addSong));
        var page = AndroidAutoBrowseResponseParser.playlistPage(initial(join(msg(1, shelf), next(2, "native-token"))));
        assertEquals("PLone", page.playlistId());
        assertEquals("native-token", page.continuation());
        assertEquals(List.of("first", "", "first"), page.tracks().stream().map(t -> t.videoId()).toList());
        assertEquals("Deleted song", page.tracks().get(1).title());
        assertEquals("Artist • 3:25", page.tracks().get(0).artist());
        assertEquals("https://art/song", page.tracks().get(0).artwork());
        assertArrayEquals(watch, page.tracks().get(0).command());
    }

    @Test public void directPlaylistContinuationReadsShelfTokenAndIgnoresReload() {
        byte[] shelf = msg(PLAYLIST, msg(3, row("Second", command("second", "PLone", 1))),
                next(10, "more"), msg(10, msg(60_487_319, text(1, "reload-not-next"))));
        var page = AndroidAutoBrowseResponseParser.playlistPage(msg(10, shelf));
        assertEquals("second", page.tracks().get(0).videoId());
        assertEquals("more", page.continuation());
    }

    @Test public void musicShelfAlbumAndItsDirectContinuationUseMusicContentsAndTokenFields() {
        byte[] shelf = msg(MUSIC, msg(2, row("Album track", command("album", "OLAK5uy_album", 0))),
                next(13, "album-next"));
        var initial = AndroidAutoBrowseResponseParser.playlistPage(initial(msg(1, shelf)));
        var continued = AndroidAutoBrowseResponseParser.playlistPage(msg(10, shelf));
        assertEquals("OLAK5uy_album", initial.playlistId());
        assertEquals("album-next", initial.continuation());
        assertEquals("album", continued.tracks().get(0).videoId());
        assertEquals("album-next", continued.continuation());
    }

    @Test public void sectionListContinuationAndDirectInitialSectionListAreBothRecognized() {
        byte[] shelf = msg(PLAYLIST, msg(3, row("Track", command("track", "PLone", 3))));
        byte[] sections = join(msg(1, shelf), next(2, "next"));
        assertEquals("next", AndroidAutoBrowseResponseParser.playlistPage(msg(10, msg(SECTION, sections)))
                .continuation());
        assertEquals("track", AndroidAutoBrowseResponseParser.playlistPage(msg(9, msg(SECTION, sections)))
                .tracks().get(0).videoId());
    }

    @Test public void nativePlainTextAndNestedItemSectionAreNotLost() {
        byte[] track = msg(ITEM, msg(3, text(4, "Plain title")), msg(4, text(4, "Plain artist")),
                msg(5, command("plain", "PLone", 0)));
        byte[] shelf = msg(PLAYLIST, msg(3, track));
        byte[] nested = msg(1, msg(50_195_462, msg(1, shelf)));
        var page = AndroidAutoBrowseResponseParser.playlistPage(initial(nested));
        assertEquals("Plain title", page.tracks().get(0).title());
        assertEquals("Plain artist", page.tracks().get(0).artist());
    }

    /** D1's stack proves both scopes contain different tokens; the raw response/token values were not logged. */
    @Test public void playlistShelfOwnsPaginationWhenTheEnclosingSectionContinuesSomethingElse() {
        byte[] shelf = msg(PLAYLIST, msg(3, row("Classics first", command("first", "PLclassics", 0))),
                next(10, "playlist-tracks-next"));
        byte[] response = initial(join(msg(1, shelf), next(2, "other-page-sections-next")));
        var first = AndroidAutoBrowseResponseParser.playlistPage(response);
        assertEquals("playlist-tracks-next", first.continuation());
        assertEquals("Classics first", first.tracks().get(0).title());

        byte[] continued = msg(10, msg(PLAYLIST, msg(3, row("Classics second",
                command("second", "PLclassics", 1)))));
        var second = AndroidAutoBrowseResponseParser.playlistPage(continued);
        assertEquals("second", second.tracks().get(0).videoId());
        assertEquals("", second.continuation());
    }

    @Test public void repeatedAndDifferentShelfNextEntriesUseNativeLastEntryWithoutRejectingTracks() {
        byte[] shelf = msg(PLAYLIST, msg(3, row("Track", command("track", "PLone", 0))),
                next(10, "old-next"), next(10, "current-next"), next(10, "current-next"));
        var page = AndroidAutoBrowseResponseParser.playlistPage(initial(join(msg(1, shelf),
                next(2, "outer-next"), next(2, "another-outer-next"))));
        assertEquals("current-next", page.continuation());
        assertEquals(1, page.tracks().size());
        assertEquals("current-next", AndroidAutoBrowseResponseParser.playlistPage(msg(10, shelf)).continuation());
    }

    @Test public void sectionNextIsOnlyAFallbackAndRepeatedSectionEntriesAreAccepted() {
        byte[] shelf = msg(PLAYLIST, msg(3, row("Track", command("track", "PLone", 0))),
                msg(10, msg(60_487_319, text(1, "reload-not-next"))));
        var page = AndroidAutoBrowseResponseParser.playlistPage(initial(join(msg(1, shelf),
                next(2, "old-outer"), next(2, "current-outer"), next(2, "current-outer"))));
        assertEquals("current-outer", page.continuation());
        assertEquals("track", page.tracks().get(0).videoId());
    }

    @Test public void albumMusicShelfAlsoOwnsItsNextTokenAndAcceptsDuplicates() {
        byte[] shelf = msg(MUSIC, msg(2, row("Album song", command("album", "OLAK5uy_album", 0))),
                next(13, "old-album"), next(13, "album-next"), next(13, "album-next"));
        var page = AndroidAutoBrowseResponseParser.playlistPage(initial(join(msg(1, shelf), next(2, "outer"))));
        assertEquals("album-next", page.continuation());
        assertEquals("OLAK5uy_album", page.playlistId());
        assertEquals("album", page.tracks().get(0).videoId());
    }

    @Test public void unknownLayoutsCannotMasqueradeAsCompletePages() {
        assertThrows(IllegalArgumentException.class, () -> AndroidAutoBrowseResponseParser.playlistPage(new byte[0]));
        byte[] unknown = initial(msg(1, msg(123, text(1, "unknown-renderer"))));
        assertThrows(IllegalArgumentException.class,
                () -> AndroidAutoBrowseResponseParser.playlistPage(unknown));
    }
}
