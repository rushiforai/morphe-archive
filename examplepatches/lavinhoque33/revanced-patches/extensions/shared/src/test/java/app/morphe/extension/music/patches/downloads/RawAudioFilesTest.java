/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.json.JSONObject;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;

public class RawAudioFilesTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();
    private static final String MIME = "audio/webm; codecs=\"opus\"";
    private static final String MUXED = "content://media/external/audio/media/42";

    private RawAudioFiles store() throws Exception {
        return new RawAudioFiles(new File(temporary.getRoot(), "rvx_raw"));
    }

    /** The native lookup of a track whose current native URI is {@code uri}. */
    private static Function<String, String> muxed(String uri) {
        return id -> uri;
    }

    private File raw(String name) {
        return new File(temporary.getRoot(), "rvx_raw/" + name);
    }

    private File input() throws Exception {
        File input = temporary.newFile();
        Files.write(input.toPath(), new byte[]{0x1a, 0x45, (byte) 0xdf, (byte) 0xa3, 1, 2, 3, 4});
        return input;
    }

    private void retain(RawAudioFiles store, String id) throws Exception {
        store.retain(id, input(), 251, MIME, 8, 123, MUXED, false);
    }

    private void write(File file, String text) throws Exception {
        Files.write(file.toPath(), text.getBytes(StandardCharsets.UTF_8));
    }

    @Test public void publishesOriginalBytesAndIdentityLast() throws Exception {
        RawAudioFiles store = store();
        File input = input();
        byte[] expected = Files.readAllBytes(input.toPath());
        store.retain("track", input, 251, MIME, 8, 123, MUXED, false);
        RawAudioFiles.Entry entry = store.find("track", muxed(MUXED));
        assertNotNull(entry);
        assertArrayEquals(expected, Files.readAllBytes(entry.file().toPath()));
        assertEquals(251, entry.itag());
        assertEquals(MIME, entry.mime());
        assertEquals(8, entry.length());
        assertEquals(123, entry.modified());
        assertEquals(64, entry.digest().length());
        assertFalse(input.exists());
        assertFalse(raw("track.json.part").exists());
    }

    @Test public void newQualityCopiesAndEarlier251CopiesKeepTheirBytesIdentityAndOwnership() throws Exception {
        RawAudioFiles store = store();
        retain(store, "earlier");
        byte[] earlierCommit = Files.readAllBytes(raw("earlier.json").toPath());
        byte[] earlierBytes = Files.readAllBytes(raw("earlier.251").toPath());
        for (int itag : new int[]{139, 140, 141, 249, 250, 251, 774}) {
            String mime = itag == 139 ? "audio/mp4; codecs=\"mp4a.40.5\""
                    : itag < 200 ? "audio/mp4; codecs=\"mp4a.40.2\"" : MIME;
            assertTrue(store.retain("new" + itag, input(), itag, mime, 8, 123, null, true));
            RawAudioFiles.Entry entry = store.find("new" + itag, id -> null);
            assertNotNull(entry);
            assertEquals(itag, entry.itag());
            assertEquals(mime, entry.mime());
            assertFalse(entry.tiedToNativeTrack());
        }
        assertNotNull(store.find("earlier", muxed(MUXED)));
        assertArrayEquals(earlierCommit, Files.readAllBytes(raw("earlier.json").toPath()));
        assertArrayEquals(earlierBytes, Files.readAllBytes(raw("earlier.251").toPath()));
    }

    @Test public void corruptJsonDeclinesWithoutBreakingPlayback() throws Exception {
        RawAudioFiles store = store();
        retain(store, "track");
        write(raw("track.json"), "not json");
        assertNull(store.find("track", muxed(MUXED)));
    }

    @Test public void oldDownloadsAndInProgressCopiesDecline() throws Exception {
        RawAudioFiles store = store();
        assertNull(store.find("old", muxed(MUXED)));
        File directory = raw("unused").getParentFile();
        assertTrue(directory.mkdir());
        Files.write(raw("track.251").toPath(), new byte[8]);
        write(raw("track.json.part"), "{}");
        assertNull(store.find("track", muxed(MUXED)));
    }

    @Test public void nativeMappingIsPartOfTheIdentity() throws Exception {
        RawAudioFiles store = store();
        retain(store, "track");
        assertNull(store.find("track", muxed(null)));
        assertNull(store.find("track", muxed(MUXED + "9")));
    }

    @Test public void missingAndShortFilesDecline() throws Exception {
        RawAudioFiles store = store();
        retain(store, "track");
        Files.write(raw("track.251").toPath(), new byte[7]);
        assertNull(store.find("track", muxed(MUXED)));
        assertTrue(raw("track.251").delete());
        assertNull(store.find("track", muxed(MUXED)));
    }

    @Test public void sameLengthCorruptionDeclines() throws Exception {
        RawAudioFiles store = store();
        retain(store, "track");
        byte[] changed = new byte[8];
        Arrays.fill(changed, (byte) 9);
        Files.write(raw("track.251").toPath(), changed);
        assertNull(store.find("track", muxed(MUXED)));
    }

    @Test public void jsonIdentityMismatchDeclines() throws Exception {
        RawAudioFiles store = store();
        retain(store, "track");
        JSONObject metadata = new JSONObject(new String(
                Files.readAllBytes(raw("track.json").toPath()), StandardCharsets.UTF_8));
        metadata.put("itag", 140);
        write(raw("track.json"), metadata.toString());
        assertNull(store.find("track", muxed(MUXED)));
    }

    @Test public void deletionRemovesOnlyTheTrackAndItsPendingWrites() throws Exception {
        RawAudioFiles store = store();
        retain(store, "track");
        retain(store, "other");
        write(raw("track.json.part"), "{}");
        store.delete("track");
        assertNull(store.find("track", muxed(MUXED)));
        assertFalse(raw("track.251").exists());
        assertFalse(raw("track.json.part").exists());
        assertNotNull(store.find("other", muxed(MUXED)));
    }

    @Test public void cleanupRetainsOnlyStructurallyValidDownloadedCommits() throws Exception {
        RawAudioFiles store = store();
        retain(store, "valid");
        retain(store, "deleted");
        retain(store, "short");
        Files.write(raw("short.251").toPath(), new byte[7]);
        write(raw("bad.json"), "not json");
        Files.write(raw("orphan.251").toPath(), new byte[8]);
        write(raw("pending.json.part"), "{}");
        store.cleanup(id -> id.equals("deleted") ? null : MUXED);
        assertNotNull(store.find("valid", muxed(MUXED)));
        String[] remaining = raw("unused").getParentFile().list();
        Arrays.sort(remaining);
        assertArrayEquals(new String[]{"valid.251", "valid.json"}, remaining);
    }

    @Test public void cleanupDoesNotHashAndAdmissionStillRejectsSameLengthCorruption() throws Exception {
        RawAudioFiles store = store();
        retain(store, "corrupt");
        Files.write(raw("corrupt.251").toPath(), new byte[8]);
        store.cleanup(id -> MUXED);
        assertTrue(raw("corrupt.251").exists());
        assertNull(store.find("corrupt", muxed(MUXED)));
    }

    @Test public void cleanupRemovesACommitWhoseNativeMappingChanged() throws Exception {
        RawAudioFiles store = store();
        retain(store, "moved");
        store.cleanup(id -> MUXED + "9");
        assertFalse(raw("moved.251").exists());
        assertFalse(raw("moved.json").exists());
    }

    @Test public void verifiedCopyIsNotHashedAgainWhileLengthAndTimeAreUnchanged() throws Exception {
        RawAudioFiles store = store();
        retain(store, "track");
        File file = raw("track.251");
        long modified = file.lastModified();
        assertNotNull(store.find("track", muxed(MUXED)));

        // Same length and mtime: the memoized verification is reused (the digest is not recomputed).
        Files.write(file.toPath(), new byte[8]);
        assertTrue(file.setLastModified(modified));
        assertNotNull(store.find("track", muxed(MUXED)));
    }

    @Test public void changedModifiedTimeLengthOrReplacementIsVerifiedAgain() throws Exception {
        RawAudioFiles store = store();
        retain(store, "track");
        File file = raw("track.251");
        long modified = file.lastModified();
        assertNotNull(store.find("track", muxed(MUXED)));

        Files.write(file.toPath(), new byte[8]);
        assertTrue(file.setLastModified(modified + 5000));
        assertNull(store.find("track", muxed(MUXED)));

        retain(store, "track");
        assertNotNull(store.find("track", muxed(MUXED)));
        Files.write(file.toPath(), new byte[7]);
        assertNull(store.find("track", muxed(MUXED)));
    }

    @Test public void deletionAndRetainDropTheVerificationMemo() throws Exception {
        RawAudioFiles store = store();
        retain(store, "track");
        File file = raw("track.251");
        long modified = file.lastModified();
        assertNotNull(store.find("track", muxed(MUXED)));

        store.delete("track");
        retain(store, "track");
        Files.write(raw("track.251").toPath(), new byte[8]);
        assertTrue(raw("track.251").setLastModified(modified));
        assertNull(store.find("track", muxed(MUXED)));
    }

    @Test public void invalidMetadataCannotPublishAndPathTraversalCannotDelete() throws Exception {
        RawAudioFiles store = store();
        File input = input();
        store.retain("../escape", input, 251, MIME, 8, 123, MUXED, false);
        store.retain("track", input, 251, MIME, 7, 123, MUXED, false);
        store.retain("track", input, 140, "audio/mp4", 8, 123, MUXED, false);
        store.retain("track", input, 251, MIME, 8, 0, MUXED, false);
        assertTrue(input.exists());
        assertNull(store.find("track", muxed(MUXED)));
        store.delete("../escape");
        assertTrue(input.exists());
    }

    @Test public void replacementInvalidatesOldMetadata() throws Exception {
        RawAudioFiles store = store();
        retain(store, "track");
        File replacement = input();
        Files.write(replacement.toPath(), new byte[8]);
        store.retain("track", replacement, 251, MIME, 8, 456, MUXED, false);
        assertEquals(456, store.find("track", muxed(MUXED)).modified());
        assertArrayEquals(new byte[8], Files.readAllBytes(raw("track.251").toPath()));
    }

    private boolean retainStreamOnly(RawAudioFiles store, String id) throws Exception {
        return store.retain(id, input(), 251, MIME, 8, 123, null, false);
    }

    @Test public void streamOnlyCopyIsSelfContainedAndNeedsNoNativeTrack() throws Exception {
        RawAudioFiles store = store();
        assertTrue(retainStreamOnly(store, "stream"));

        // The native lookup is never asked for a stream-only copy.
        RawAudioFiles.Entry entry = store.find("stream", id -> {
            throw new AssertionError("asked for the native track of a stream-only copy");
        });
        assertNotNull(entry);
        assertNull(entry.muxed());
        assertFalse(entry.tiedToNativeTrack());
        JSONObject metadata = new JSONObject(new String(
                Files.readAllBytes(raw("stream.json").toPath()), StandardCharsets.UTF_8));
        assertEquals("stream", metadata.getString("origin"));
        assertFalse(metadata.has("muxed"));
    }

    @Test public void tiedCopyNeedsItsNativeTrackAndSaysSo() throws Exception {
        RawAudioFiles store = store();
        retain(store, "tied");
        JSONObject metadata = new JSONObject(new String(
                Files.readAllBytes(raw("tied.json").toPath()), StandardCharsets.UTF_8));
        assertEquals("native", metadata.getString("origin"));
        assertEquals(MUXED, metadata.getString("muxed"));
        assertTrue(store.find("tied", muxed(MUXED)).tiedToNativeTrack());
        assertNull(store.find("tied", muxed(null)));
    }

    @Test public void streamOnlyCopyStillNeedsEveryOtherCheck() throws Exception {
        RawAudioFiles store = store();
        retainStreamOnly(store, "short");
        Files.write(raw("short.251").toPath(), new byte[7]);
        assertNull(store.find("short", muxed(null)));

        retainStreamOnly(store, "corrupt");
        Files.write(raw("corrupt.251").toPath(), new byte[8]);
        assertNull(store.find("corrupt", muxed(null)));

        assertFalse(store.retain("bad", input(), 140, "audio/mp4", 8, 123, null, false));
        assertNull(store.find("bad", muxed(null)));
    }

    @Test public void jsonFromEarlierTestBuildsWithoutAnOriginIsATiedCopy() throws Exception {
        RawAudioFiles store = store();
        retain(store, "old");
        JSONObject metadata = new JSONObject(new String(
                Files.readAllBytes(raw("old.json").toPath()), StandardCharsets.UTF_8));
        metadata.remove("origin");
        write(raw("old.json"), metadata.toString());

        RawAudioFiles.Entry entry = store.find("old", muxed(MUXED));
        assertNotNull(entry);
        assertEquals(MUXED, entry.muxed());
        assertNull(store.find("old", muxed(MUXED + "9")));
    }

    @Test public void jsonWithoutAnOriginAndWithoutANativeUriIsRejected() throws Exception {
        RawAudioFiles store = store();
        retainStreamOnly(store, "none");
        JSONObject metadata = new JSONObject(new String(
                Files.readAllBytes(raw("none.json").toPath()), StandardCharsets.UTF_8));
        metadata.remove("origin");
        write(raw("none.json"), metadata.toString());

        assertNull(store.find("none", muxed(MUXED)));
    }

    @Test public void cleanupKeepsStreamOnlyCopiesAndNeverAsksForTheirNativeTrack() throws Exception {
        RawAudioFiles store = store();
        retainStreamOnly(store, "stream");
        retain(store, "tiedAlive");
        retain(store, "tiedGone");
        Files.write(raw("orphan.251").toPath(), new byte[8]);
        write(raw("pending.json.part"), "{}");
        java.util.List<String> asked = new java.util.ArrayList<>();

        store.cleanup(id -> {
            asked.add(id);
            return id.equals("tiedGone") ? null : MUXED;
        });

        assertFalse(asked.contains("stream"));
        String[] remaining = raw("unused").getParentFile().list();
        Arrays.sort(remaining);
        assertArrayEquals(new String[]{"stream.251", "stream.json", "tiedAlive.251", "tiedAlive.json"}, remaining);
        assertNotNull(store.find("stream", muxed(null)));
    }

    @Test public void cleanupStillRemovesAStreamOnlyCopyThatIsStructurallyBroken() throws Exception {
        RawAudioFiles store = store();
        retainStreamOnly(store, "short");
        Files.write(raw("short.251").toPath(), new byte[7]);

        store.cleanup(id -> null);

        assertFalse(raw("short.251").exists());
        assertFalse(raw("short.json").exists());
    }

    @Test public void deleteForAGoneNativeTrackLeavesAStreamOnlyCopy() throws Exception {
        RawAudioFiles store = store();
        retainStreamOnly(store, "stream");
        retain(store, "tied");
        write(raw("junk.json"), "not json");
        Files.write(raw("junk.251").toPath(), new byte[8]);

        assertFalse(store.deleteUnlessStreamOnly("stream"));
        assertTrue(store.deleteUnlessStreamOnly("tied"));
        assertTrue(store.deleteUnlessStreamOnly("junk"));

        assertNotNull(store.find("stream", muxed(null)));
        assertFalse(raw("tied.251").exists());
        assertFalse(raw("junk.json").exists());
    }

    @Test public void committedIdsAreTheValidCopiesOfBothOrigins() throws Exception {
        RawAudioFiles store = store();
        retainStreamOnly(store, "stream");
        retain(store, "tied");
        retainStreamOnly(store, "short");
        Files.write(raw("short.251").toPath(), new byte[7]);
        write(raw("bad.json"), "not json");
        Files.write(raw("orphan.251").toPath(), new byte[8]);

        assertEquals(new java.util.HashSet<>(Arrays.asList("stream", "tied")), store.committedIds());
    }

    @Test public void statsCountCommittedCopiesAndTheirBytes() throws Exception {
        RawAudioFiles store = store();
        assertEquals(new RawAudioFiles.Stats(0, 0), store.stats());

        retainStreamOnly(store, "stream");
        retain(store, "tied");
        Files.write(raw("orphan.251").toPath(), new byte[8]);

        assertEquals(new RawAudioFiles.Stats(2, 16), store.stats());
    }

    @Test public void clearRemovesEveryCopyAndLeftoverAndReportsTheCopies() throws Exception {
        RawAudioFiles store = store();
        retainStreamOnly(store, "stream");
        retain(store, "tied");
        Files.write(raw("orphan.251").toPath(), new byte[8]);
        write(raw("pending.json.part"), "{}");
        assertNotNull(store.find("stream", muxed(null)));

        assertEquals(2, store.clear());

        assertEquals(0, raw("unused").getParentFile().list().length);
        assertNull(store.find("stream", muxed(null)));
        assertNull(store.find("tied", muxed(MUXED)));
        assertEquals(0, store.clear());
    }

    @Test public void streamOnlyCopyReplacesATiedCopyAndBack() throws Exception {
        RawAudioFiles store = store();
        retain(store, "track");
        retainStreamOnly(store, "track");
        assertFalse(store.find("track", muxed(null)).tiedToNativeTrack());

        retain(store, "track");
        assertTrue(store.find("track", muxed(MUXED)).tiedToNativeTrack());
        assertNull(store.find("track", muxed(null)));
    }

    @Test public void aCopyIsIndividualOnlyWhenTheUserAskedForTheSongItself() throws Exception {
        RawAudioFiles store = store();
        retain(store, "listed");
        store.retain("single", input(), 251, MIME, 8, 123, null, true);
        assertEquals(Set.of("single"), store.individualIds());

        assertTrue(store.markIndividual("listed"));
        assertEquals(Set.of("single", "listed"), store.individualIds());
        assertNotNull(store.find("listed", muxed(MUXED)));
    }

    @Test public void markingAnUnknownCopyDoesNothing() throws Exception {
        RawAudioFiles store = store();
        assertFalse(store.markIndividual("missing"));
        assertFalse(store.addAlias("missing", "video123456"));
        assertTrue(store.individualIds().isEmpty());
        assertTrue(store.aliases().isEmpty());
    }

    @Test public void aliasesNameTheSongAndGoWithItsCopy() throws Exception {
        RawAudioFiles store = store();
        retain(store, "song");
        assertTrue(store.addAlias("song", "video123456"));
        assertTrue(store.addAlias("song", "video123456"));
        assertTrue(store.addAlias("song", "other123456"));
        assertEquals(Map.of("video123456", "song", "other123456", "song"), store.aliases());

        store.delete("song");
        assertTrue(store.aliases().isEmpty());
    }

    @Test public void aRecordWithoutNotesIsNotIndividualAndHasNoAlias() throws Exception {
        RawAudioFiles store = store();
        retain(store, "plain");
        assertTrue(store.individualIds().isEmpty());
        assertTrue(store.aliases().isEmpty());
    }
}
