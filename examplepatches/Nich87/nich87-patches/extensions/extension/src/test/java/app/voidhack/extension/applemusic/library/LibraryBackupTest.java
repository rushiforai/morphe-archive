package app.voidhack.extension.applemusic.library;

import org.junit.Test;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

public class LibraryBackupTest {
    @Test public void backupPreservesUnicodeCatalogIdsAndRepeatedPlaylistPositions() throws Exception {
        LibraryBackup.Track first = new LibraryBackup.Track("9223372036854775807", "夜の曲", "歌手", "アルバム", false);
        LibraryBackup.Track second = new LibraryBackup.Track("12", "Second", "Artist", "Album", true);
        LibraryBackup source = new LibraryBackup(List.of(first), List.of(
                new LibraryBackup.Playlist("お気に入り", "Line one\nLine two", List.of(second, first, second))));
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();

        source.write(bytes, new AtomicBoolean());
        LibraryBackup restored = LibraryBackup.read(new ByteArrayInputStream(bytes.toByteArray()), new AtomicBoolean());

        assertEquals("夜の曲", restored.library.get(0).title);
        assertEquals("歌手", restored.library.get(0).artist);
        assertEquals("アルバム", restored.library.get(0).album);
        assertEquals("お気に入り", restored.playlists.get(0).name);
        assertEquals("Line one\nLine two", restored.playlists.get(0).description);
        assertTrue(restored.playlists.get(0).tracks.get(0).musicVideo);
        assertEquals(List.of("12", "9223372036854775807", "12"), List.of(
                restored.playlists.get(0).tracks.get(0).catalogId,
                restored.playlists.get(0).tracks.get(1).catalogId,
                restored.playlists.get(0).tracks.get(2).catalogId));
    }

    @Test public void unsupportedFormatVersionAndTypedFieldsAreRejected() {
        for (String json : List.of(
                "{\"format\":\"other\",\"version\":1,\"library\":[],\"playlists\":[]}",
                "{\"format\":\"app.voidhack.applemusic.library\",\"version\":2,\"library\":[],\"playlists\":[]}",
                "{\"format\":\"app.voidhack.applemusic.library\",\"version\":\"1\",\"library\":[],\"playlists\":[]}",
                backupWithTrack("{\"catalogId\":12,\"title\":\"Title\",\"artist\":\"Artist\",\"album\":\"Album\"}"),
                backupWithTrack("{\"catalogId\":\"12\",\"title\":null,\"artist\":\"Artist\",\"album\":\"Album\"}"),
                backupWithTrack("{\"catalogId\":\"12\",\"title\":\"T\",\"artist\":\"A\",\"album\":\"B\",\"musicVideo\":\"true\"}"))) {
            assertThrows(IOException.class, () -> read(json));
        }
    }

    @Test public void invalidCatalogIdsAreRejectedBeforeNativeCalls() {
        for (String id : List.of("9223372036854775808", "0", "-12", "01", "1.2", " 12")) {
            assertThrows(IOException.class, () -> read(backupWithTrack(
                    "{\"catalogId\":\"" + id + "\",\"title\":\"Title\",\"artist\":\"Artist\",\"album\":\"Album\"}")));
        }
    }

    @Test public void malformedUtf8IsRejected() {
        byte[] bytes = {(byte) 0xc3, (byte) 0x28};
        assertThrows(IOException.class, () -> LibraryBackup.read(new ByteArrayInputStream(bytes), new AtomicBoolean()));
    }

    @Test public void cancelledFileOperationsDoNotReturnBackupOrWriteData() {
        AtomicBoolean cancelled = new AtomicBoolean(true);
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        LibraryBackup empty = new LibraryBackup(List.of(), List.of());

        assertThrows(CancellationException.class, () -> LibraryBackup.read(new ByteArrayInputStream(new byte[0]), cancelled));
        assertThrows(CancellationException.class, () -> empty.write(bytes, cancelled));
        assertEquals(0, bytes.size());
    }

    @Test public void bomAndTracksWithoutCatalogIdsCanBeRead() throws Exception {
        LibraryBackup restored = read("\ufeff" + backupWithTrack(
                "{\"catalogId\":\"\",\"title\":\"Upload\",\"artist\":\"Me\",\"album\":\"Local\"}"));

        assertEquals("", restored.library.get(0).catalogId);
        assertTrue(restored.playlists.isEmpty());
    }

    private static LibraryBackup read(String json) throws IOException {
        return LibraryBackup.read(new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8)), new AtomicBoolean());
    }

    private static String backupWithTrack(String track) {
        return "{\"format\":\"app.voidhack.applemusic.library\",\"version\":1,\"library\":["
                + track + "],\"playlists\":[]}";
    }
}
