/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.nio.file.Files;
import java.util.Set;

public class VideoCopyFilesTest {
    private static final String MP4 = "video/mp4; codecs=\"avc1.4D401E\"";
    private static final String OPUS = "audio/webm; codecs=\"opus\"";
    private static final byte[] RESPONSE = {1, 2, 3, 4};

    @Rule public TemporaryFolder temporary = new TemporaryFolder();
    private VideoCopyFiles files;

    @Before public void createFiles() throws Exception {
        files = new VideoCopyFiles(new File(temporary.getRoot(), "rvx_video"));
    }

    private File download(int length) throws Exception {
        File file = temporary.newFile();
        Files.write(file.toPath(), new byte[length]);
        return file;
    }

    /** A copy whose video file has {@code length} bytes and whose audio file has half as many. */
    private boolean retain(String video, String song, int length) throws Exception {
        return files.retain(video, song, "PLlist", download(length), download(length / 2), copy(length, length / 2));
    }

    private static VideoCopyLogic.Download copy(int videoLength, int audioLength) {
        return new VideoCopyLogic.Download(new VideoCopyLogic.Stream(134, MP4, videoLength, 123),
                new VideoCopyLogic.Stream(251, OPUS, audioLength, 456), 213_000, RESPONSE);
    }

    @Test public void aRetainedCopyIsFoundWithItsPairAndItsStoredResponse() throws Exception {
        assertTrue(retain("omvOne00000", "atvOne00000", 100));

        VideoCopyFiles.Entry entry = files.find("omvOne00000");
        assertNotNull(entry);
        assertEquals("atvOne00000", entry.songId());
        assertEquals("PLlist", entry.sourceId());
        assertEquals(100, entry.video().length());
        assertEquals(50, entry.audio().length());
        assertEquals(213_000, entry.durationMs());
        assertEquals(134, entry.video().itag());
        assertEquals(251, entry.audio().itag());
        assertEquals(MP4, entry.video().mime());
        assertArrayEquals(RESPONSE, files.response("omvOne00000"));
        assertEquals("omvOne00000", files.videoOf("atvOne00000"));
        assertTrue(files.has("omvOne00000"));
        assertEquals(1, files.stats().count());
        assertEquals(150, files.stats().bytes());
    }

    @Test public void selectedAudioCodecsReopenWithoutInvalidatingEarlierPairs() throws Exception {
        assertTrue(retain("earlier", "songEarlier", 100));
        File commit = new File(temporary.getRoot(), "rvx_video/earlier.json");
        byte[] previous = Files.readAllBytes(commit.toPath());
        for (int itag : new int[]{139, 140, 141, 249, 250, 251, 774}) {
            String mime = itag == 139 ? "audio/mp4; codecs=\"mp4a.40.5\""
                    : itag < 200 ? "audio/mp4; codecs=\"mp4a.40.2\"" : OPUS;
            VideoCopyLogic.Download copy = new VideoCopyLogic.Download(
                    new VideoCopyLogic.Stream(134, MP4, 100, 123),
                    new VideoCopyLogic.Stream(itag, mime, 50, 456), 213000, RESPONSE);
            assertTrue(files.retain("video" + itag, "song" + itag, "PLlist", download(100), download(50), copy));
            VideoCopyFiles reopened = new VideoCopyFiles(new File(temporary.getRoot(), "rvx_video"));
            assertEquals(itag, reopened.find("video" + itag).audio().itag());
            assertEquals(mime, reopened.find("video" + itag).audio().mime());
        }
        assertEquals(251, files.find("earlier").audio().itag());
        assertArrayEquals(previous, Files.readAllBytes(commit.toPath()));
    }

    private static void assertArrayEquals(byte[] expected, byte[] actual) {
        org.junit.Assert.assertArrayEquals(expected, actual);
    }

    @Test public void theCommittedPairsAreReadBackFromTheDisk() throws Exception {
        retain("omvOne00000", "atvOne00000", 100);

        VideoCopyFiles reopened = new VideoCopyFiles(new File(temporary.getRoot(), "rvx_video"));
        assertFalse(reopened.has("omvOne00000"));
        reopened.ensureLoaded();

        assertTrue(reopened.has("omvOne00000"));
        assertEquals("atvOne00000", reopened.pairs().get("omvOne00000"));
    }

    @Test public void aCopyThatIsNotAnAdaptivePairOfTheSupportedStreamsIsRefused() throws Exception {
        VideoCopyLogic.Stream audio = new VideoCopyLogic.Stream(251, OPUS, 10, 1);
        assertFalse(files.retain("omvOne00000", "atvOne00000", null, download(10), download(10),
                new VideoCopyLogic.Download(new VideoCopyLogic.Stream(137, MP4, 10, 1), audio, 1, RESPONSE)));
        assertFalse(files.retain("omvOne00000", "atvOne00000", null, download(10), download(10),
                new VideoCopyLogic.Download(new VideoCopyLogic.Stream(18, MP4, 10, 1), audio, 1, RESPONSE)));
        assertFalse(files.retain("omvOne00000", "atvOne00000", null, download(10), download(10),
                new VideoCopyLogic.Download(new VideoCopyLogic.Stream(134, MP4, 10, 1),
                        new VideoCopyLogic.Stream(140, "audio/mp4", 10, 1), 1, RESPONSE)));
        assertFalse(files.has("omvOne00000"));
    }

    @Test public void aFileOfAnotherLengthThanTheRecordedOneIsRefused() throws Exception {
        VideoCopyLogic.Stream video = new VideoCopyLogic.Stream(134, MP4, 10, 1);
        VideoCopyLogic.Stream audio = new VideoCopyLogic.Stream(251, OPUS, 10, 1);
        assertFalse(files.retain("omvOne00000", "atvOne00000", null, download(11), download(10),
                new VideoCopyLogic.Download(video, audio, 1, RESPONSE)));
        assertFalse(files.retain("omvOne00000", "atvOne00000", null, download(10), download(9),
                new VideoCopyLogic.Download(video, audio, 1, RESPONSE)));
        assertFalse(files.retain("omvOne00000", "atvOne00000", null, download(10), download(10),
                new VideoCopyLogic.Download(video, audio, 1, new byte[0])));
        assertFalse(files.has("omvOne00000"));
    }

    @Test public void aCopyOfTheEarlierMuxedFormatIsNoCopy() throws Exception {
        File directory = new File(temporary.getRoot(), "rvx_video");
        assertTrue(directory.mkdirs());
        Files.write(new File(directory, "omvOne00000.mp4").toPath(), new byte[10]);
        Files.write(new File(directory, "omvOne00000.resp").toPath(), RESPONSE);
        Files.write(new File(directory, "omvOne00000.json").toPath(), ("{\"itag\":18,\"mime\":\"video/mp4\","
                + "\"length\":10,\"songId\":\"atvOne00000\",\"responseBytes\":4,\"sha256\":\"x\"}").getBytes());

        VideoCopyFiles reopened = new VideoCopyFiles(directory);
        reopened.ensureLoaded();

        assertFalse(reopened.has("omvOne00000"));
        assertNull(reopened.find("omvOne00000"));
        assertEquals(0, reopened.stats().count());

        // The cleanup of orphans takes the old files away, so a new download starts clean.
        reopened.retainOnly(Set.of("atvOne00000"), System.currentTimeMillis() + 60_000);
        assertFalse(new File(directory, "omvOne00000.mp4").exists());
    }

    @Test public void aCopyRecordedInAnEarlierFormatIsNoCopyUntilTheNextSaveReplacesIt() throws Exception {
        retain("omvOne00000", "atvOne00000", 100);
        File commit = new File(new File(temporary.getRoot(), "rvx_video"), "omvOne00000.json");
        String recorded = new String(Files.readAllBytes(commit.toPath()));
        assertTrue(recorded.contains("\"format\":" + VideoCopyLogic.COPY_FORMAT));
        Files.write(commit.toPath(), recorded.replace("\"format\":" + VideoCopyLogic.COPY_FORMAT, "\"format\":1")
                .getBytes());

        VideoCopyFiles reopened = new VideoCopyFiles(new File(temporary.getRoot(), "rvx_video"));
        reopened.ensureLoaded();

        assertFalse(reopened.has("omvOne00000"));
        assertNull(reopened.find("omvOne00000"));
        assertEquals(0, reopened.stats().count());
    }

    @Test public void theOnlineResponseKeptBesideACopyIsReadBackAndGoesWithTheCopy() throws Exception {
        assertFalse(files.keepLive("omvOne00000", new byte[]{9, 9}));
        retain("omvOne00000", "atvOne00000", 100);
        assertNull(files.live("omvOne00000"));

        assertTrue(files.keepLive("omvOne00000", new byte[]{9, 9}));
        assertArrayEquals(new byte[]{9, 9}, files.live("omvOne00000"));
        assertTrue(files.keepLive("omvOne00000", new byte[]{7}));
        assertArrayEquals(new byte[]{7}, files.live("omvOne00000"));
        assertNotNull(files.find("omvOne00000"));

        files.retainOnly(Set.of("atvOne00000"), System.currentTimeMillis() + 60_000);
        assertArrayEquals(new byte[]{7}, files.live("omvOne00000"));

        files.delete("omvOne00000");
        assertFalse(new File(new File(temporary.getRoot(), "rvx_video"), "omvOne00000.live").exists());
    }

    @Test public void aWholeFetchedResponseOfTensOfKilobytesIsRetained() throws Exception {
        VideoCopyLogic.Download whole = new VideoCopyLogic.Download(new VideoCopyLogic.Stream(134, MP4, 10, 1),
                new VideoCopyLogic.Stream(251, OPUS, 5, 1), 1, new byte[100 * 1024]);

        assertTrue(files.retain("omvOne00000", "atvOne00000", null, download(10), download(5), whole));
        assertEquals(100 * 1024, files.response("omvOne00000").length);
    }

    @Test public void aChangedFileIsNotPlayed() throws Exception {
        retain("omvOne00000", "atvOne00000", 100);
        File video = files.find("omvOne00000").video().file();

        Files.write(video.toPath(), new byte[100]);
        assertNotNull(files.find("omvOne00000"));

        byte[] other = new byte[100];
        other[50] = 1;
        Files.write(video.toPath(), other);
        // A file system with a coarse clock may give both writes one modification time, which is not what is tested.
        assertTrue(video.setLastModified(video.lastModified() + 2_000));
        assertNull(files.find("omvOne00000"));
    }

    @Test public void aChangedAudioFileIsNotPlayedEither() throws Exception {
        retain("omvOne00000", "atvOne00000", 100);
        File audio = files.find("omvOne00000").audio().file();

        byte[] other = new byte[50];
        other[7] = 1;
        Files.write(audio.toPath(), other);
        assertTrue(audio.setLastModified(audio.lastModified() + 2_000));

        assertNull(files.find("omvOne00000"));
    }

    @Test public void aTruncatedFileIsNoCopy() throws Exception {
        retain("omvOne00000", "atvOne00000", 100);
        File video = files.find("omvOne00000").video().file();

        Files.write(video.toPath(), new byte[40]);

        assertNull(files.find("omvOne00000"));
        assertEquals(0, files.stats().count());
    }

    @Test public void deletingACopyRemovesItsFilesAndItsPair() throws Exception {
        retain("omvOne00000", "atvOne00000", 100);

        files.delete("omvOne00000");

        assertFalse(files.has("omvOne00000"));
        assertNull(files.videoOf("atvOne00000"));
        assertNull(files.find("omvOne00000"));
        assertEquals(0, new File(temporary.getRoot(), "rvx_video").list().length);
    }

    @Test public void clearingRemovesEveryCopyAndCountsThem() throws Exception {
        retain("omvOne00000", "atvOne00000", 100);
        retain("omvTwo00000", "atvTwo00000", 50);

        assertEquals(2, files.clear());
        assertEquals(0, files.stats().count());
        assertTrue(files.pairs().isEmpty());
    }

    @Test public void theOrphanCleanupKeepsOnlyTheCopiesOfSongsThatStillHaveAudio() throws Exception {
        retain("omvOne00000", "atvOne00000", 100);
        retain("omvTwo00000", "atvTwo00000", 50);

        Set<String> removed = files.retainOnly(Set.of("atvOne00000"), System.currentTimeMillis() + 60_000);

        assertEquals(Set.of("omvTwo00000"), removed);
        assertTrue(files.has("omvOne00000"));
        assertFalse(files.has("omvTwo00000"));
        assertNotNull(files.find("omvOne00000"));
    }

    @Test public void theOrphanCleanupRemovesLeftoversButNotFilesPublishedAfterTheIdsWereRead() throws Exception {
        retain("omvOne00000", "atvOne00000", 100);
        File directory = new File(temporary.getRoot(), "rvx_video");
        File leftover = new File(directory, "omvTwo00000.resp.part");
        Files.write(leftover.toPath(), new byte[3]);

        files.retainOnly(Set.of("atvOne00000"), 0);
        assertTrue("newer than the read, kept", leftover.exists());

        files.retainOnly(Set.of("atvOne00000"), System.currentTimeMillis() + 60_000);
        assertFalse(leftover.exists());
        assertTrue(files.has("omvOne00000"));
    }

    @Test public void aReplacedCopyForAnotherSongTakesOverThePair() throws Exception {
        retain("omvOne00000", "atvOne00000", 100);
        retain("omvOne00000", "atvTwo00000", 120);

        assertEquals("atvTwo00000", files.find("omvOne00000").songId());
        assertNull(files.videoOf("atvOne00000"));
        assertEquals(180, files.stats().bytes());
    }
}
