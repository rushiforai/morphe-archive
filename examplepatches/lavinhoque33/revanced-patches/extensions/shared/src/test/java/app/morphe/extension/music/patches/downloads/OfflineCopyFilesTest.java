/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Set;

public class OfflineCopyFilesTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    private OfflineCopyFiles files() {
        return new OfflineCopyFiles(new File(temporary.getRoot(), "rvx_offline"));
    }

    private File stored(String name) {
        return new File(temporary.getRoot(), "rvx_offline/" + name);
    }

    private static OfflineCopyMetadata metadata(String id, String source) {
        return new OfflineCopyMetadata(id, "Title " + id, "Artist", "Album", 200_000, "https://t/" + id, 1000, source);
    }

    private static byte[] bytes(int length) {
        byte[] bytes = new byte[length];
        Arrays.fill(bytes, (byte) 7);
        return bytes;
    }

    @Test public void writesResponseCoverAndMetadataAndReadsThemBack() throws Exception {
        OfflineCopyFiles files = files();
        OfflineCopyFiles.Written written = files.write(metadata("track", "download"), bytes(100), bytes(10));
        assertEquals(new OfflineCopyFiles.Written(100, 10), written);
        OfflineCopyFiles.Stored stored = files.read("track");
        assertEquals(metadata("track", "download"), stored.metadata());
        assertArrayEquals(bytes(100), stored.response());
        assertArrayEquals(bytes(10), stored.thumbnail());
        assertTrue(files.has("track"));
        assertFalse(files.hasOnlineResponse("track"));
        assertEquals(metadata("track", "download"), files.metadata("track"));
    }

    @Test public void aCopyWithoutCoverReadsWithoutOne() throws Exception {
        OfflineCopyFiles files = files();
        assertEquals(0, files.write(metadata("track", "download"), bytes(10), null).thumbnailBytes());
        assertNull(files.read("track").thumbnail());
        assertFalse(stored("track.thumb").exists());
    }

    @Test public void commitRecordIsPublishedLastAndNoPartFileRemains() throws Exception {
        OfflineCopyFiles files = files();
        files.write(metadata("track", "download"), bytes(10), bytes(5));
        assertTrue(stored("track.json").isFile());
        assertTrue(stored("track.resp").isFile());
        assertTrue(stored("track.thumb").isFile());
        assertFalse(stored("track.resp.part").exists());
        assertFalse(stored("track.thumb.part").exists());
        assertFalse(stored("track.json.part").exists());
    }

    @Test public void aFailedReplacementLeavesNoCommitAndNoStaleBytes() throws Exception {
        OfflineCopyFiles files = files();
        files.write(metadata("track", "download"), bytes(10), null);
        // A directory where the cover's temporary file goes makes the second write fail midway.
        assertTrue(stored("track.thumb.part").mkdir());
        try {
            files.write(metadata("track", "online"), bytes(12), bytes(5));
            fail("the cover cannot be written onto a directory");
        } catch (IOException expected) {
            assertNull(files().read("track"));
        }
        assertFalse(files.has("track"));
        assertFalse(stored("track.json").exists());
        assertFalse(stored("track.resp").exists());
    }

    @Test public void aTornCommitIsNotAStoredCopy() throws Exception {
        OfflineCopyFiles files = files();
        files.write(metadata("track", "download"), bytes(10), bytes(5));
        Files.write(stored("track.resp").toPath(), bytes(9));
        assertNull(files().read("track"));
        Files.write(stored("track.resp").toPath(), bytes(10));
        Files.write(stored("track.thumb").toPath(), bytes(4));
        assertNull(files().read("track"));
        Files.write(stored("track.json").toPath(), "{".getBytes(StandardCharsets.UTF_8));
        assertNull(files().read("track"));
    }

    @Test public void rejectsAResponseOverTheCapAndWritesNothing() throws Exception {
        OfflineCopyFiles files = files();
        assertNull(files.write(metadata("track", "online"), bytes(OfflineCopyFiles.MAX_RESPONSE_BYTES + 1), null));
        assertFalse(files.has("track"));
        assertFalse(stored("track.json").exists());
        assertFalse(stored("track.resp").exists());
        assertNotNull(files.write(metadata("track", "online"), bytes(OfflineCopyFiles.MAX_RESPONSE_BYTES), null));
        assertNull(files.write(metadata("track", "online"), new byte[0], null));
    }

    @Test public void rejectsAnInvalidVideoId() throws Exception {
        assertNull(files().write(metadata("../escape", "online"), bytes(10), null));
    }

    @Test public void dropsACoverOverTheCapButStoresTheCopy() throws Exception {
        OfflineCopyFiles files = files();
        OfflineCopyFiles.Written written = files.write(metadata("track", "download"), bytes(10),
                bytes(OfflineCopyFiles.MAX_THUMBNAIL_BYTES + 1));
        assertEquals(0, written.thumbnailBytes());
        assertNull(files.read("track").thumbnail());
    }

    @Test public void replacingKeepsOneCopyAndTracksTheSource() throws Exception {
        OfflineCopyFiles files = files();
        files.write(metadata("track", "download"), bytes(10), bytes(5));
        files.write(metadata("track", "online"), bytes(20), null);
        assertTrue(files.hasOnlineResponse("track"));
        assertEquals(20, files.read("track").response().length);
        assertNull(files.read("track").thumbnail());
        assertFalse(stored("track.thumb").exists());
    }

    @Test public void deleteRemovesEveryFileOfTheCopyOnly() throws Exception {
        OfflineCopyFiles files = files();
        files.write(metadata("track", "download"), bytes(10), bytes(5));
        files.write(metadata("other", "download"), bytes(10), null);
        files.delete("track");
        assertFalse(files.has("track"));
        assertNull(files.read("track"));
        assertFalse(stored("track.json").exists());
        assertFalse(stored("track.resp").exists());
        assertFalse(stored("track.thumb").exists());
        assertTrue(files.has("other"));
    }

    @Test public void clearRemovesEverything() throws Exception {
        OfflineCopyFiles files = files();
        files.write(metadata("a", "download"), bytes(10), null);
        files.write(metadata("b", "download"), bytes(10), bytes(3));
        files.clear();
        assertTrue(files.ids().isEmpty());
        assertEquals(0, stored("").list().length);
    }

    @Test public void loadingFindsCommittedCopiesAndIgnoresBrokenOnes() throws Exception {
        OfflineCopyFiles writer = files();
        writer.write(metadata("good", "online"), bytes(10), null);
        writer.write(metadata("torn", "download"), bytes(10), null);
        Files.write(stored("torn.resp").toPath(), bytes(3));
        OfflineCopyFiles reader = files();
        assertFalse(reader.has("good"));
        reader.ensureLoaded();
        assertTrue(reader.has("good"));
        assertTrue(reader.hasOnlineResponse("good"));
        assertFalse(reader.has("torn"));
        assertEquals(1, reader.allMetadata().size());
    }

    @Test public void orphanCleanupRemovesCopiesWithoutARawCopyAndLeftovers() throws Exception {
        OfflineCopyFiles files = files();
        files.write(metadata("kept", "download"), bytes(10), bytes(5));
        files.write(metadata("gone", "download"), bytes(10), bytes(5));
        Files.write(stored("lonely.resp").toPath(), bytes(10));
        Files.write(stored("kept.resp.part").toPath(), bytes(10));
        files.retainOnly(Set.of("kept", "lonely"), System.currentTimeMillis() + 10_000);
        assertTrue(files.has("kept"));
        assertNotNull(files.read("kept"));
        assertFalse(files.has("gone"));
        assertFalse(stored("gone.json").exists());
        assertFalse(stored("gone.resp").exists());
        assertFalse(stored("gone.thumb").exists());
        assertFalse(stored("lonely.resp").exists());
        assertFalse(stored("kept.resp.part").exists());
    }

    @Test public void orphanCleanupKeepsDataPublishedAfterTheIdListWasRead() throws Exception {
        OfflineCopyFiles files = files();
        long readAt = System.currentTimeMillis() - 60_000;
        files.write(metadata("fresh", "download"), bytes(10), null);
        files.retainOnly(Set.of(), readAt);
        assertNotNull(files.read("fresh"));
    }
}
