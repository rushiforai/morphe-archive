/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import com.google.protobuf.CodedOutputStream;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;

public class DownloadedRegistryTest {
    private static final String SONG = "dQw4w9WgXcQ";
    private static final String OTHER = "9bZkp7q19f0";
    private static final String THIRD = "kJQP7kiw5Fk";

    private static byte[] message(Object... fields) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream output = CodedOutputStream.newInstance(bytes);
        for (int index = 0; index < fields.length; index += 2) {
            int number = (Integer) fields[index];
            if (fields[index + 1] instanceof byte[] nested) output.writeByteArray(number, nested);
            else output.writeString(number, (String) fields[index + 1]);
        }
        output.flush();
        return bytes.toByteArray();
    }

    private static DownloadedRegistry registryOf(String... videoIds) {
        DownloadedRegistry registry = new DownloadedRegistry();
        registry.addAll(Arrays.asList(videoIds));
        return registry;
    }

    @Test public void addAndRemoveTrackMembership() {
        DownloadedRegistry registry = new DownloadedRegistry();
        assertFalse(registry.hasTracks());

        registry.add(SONG);
        assertTrue(registry.hasTracks());
        assertTrue(registry.isDownloaded(SONG));
        assertFalse(registry.isDownloaded(OTHER));

        registry.remove(SONG);
        assertFalse(registry.isDownloaded(SONG));
        assertFalse(registry.hasTracks());
    }

    @Test public void pruneForgetsOnlyWhatWasKnownBeforeTheCheckAndIsGone() {
        DownloadedRegistry registry = registryOf(SONG, OTHER);
        Set<String> knownBefore = registry.snapshot();

        // A download finishes while MediaStore is being asked: it is not in the answer, and must survive.
        registry.add(THIRD);
        registry.prune(knownBefore, Collections.singleton(SONG));

        assertTrue(registry.isDownloaded(SONG));
        assertFalse(registry.isDownloaded(OTHER));
        assertTrue(registry.isDownloaded(THIRD));
    }

    @Test public void loadingAfterConcurrentAddsLosesNothing() throws Exception {
        DownloadedRegistry registry = new DownloadedRegistry();
        List<String> remembered = new ArrayList<>();
        for (int index = 0; index < 500; index++) remembered.add(String.format("track%06d", index));
        CountDownLatch go = new CountDownLatch(1);
        Thread loader = new Thread(() -> {
            await(go);
            registry.addAll(remembered);
        });
        Thread downloader = new Thread(() -> {
            await(go);
            for (int index = 0; index < 500; index++) registry.add(String.format("later%06d", index));
        });
        loader.start();
        downloader.start();
        go.countDown();
        loader.join();
        downloader.join();

        assertEquals(1000, registry.snapshot().size());
    }

    private static void await(CountDownLatch latch) {
        try {
            latch.await();
        } catch (InterruptedException ex) {
            throw new IllegalStateException(ex);
        }
    }

    @Test public void aSourceIsDownloadedOnlyWhileEveryTrackIs() {
        DownloadedRegistry registry = registryOf(SONG, OTHER, THIRD);
        registry.putSource("OLAK5uy_album", Arrays.asList(SONG, OTHER, THIRD));
        assertTrue(registry.isSourceDownloaded("OLAK5uy_album"));

        registry.remove(OTHER);
        assertFalse(registry.isSourceDownloaded("OLAK5uy_album"));

        registry.add(OTHER);
        assertTrue(registry.isSourceDownloaded("OLAK5uy_album"));
    }

    @Test public void anUnavailableTrackNeedsNoCopyForTheSourceToBeDownloaded() {
        DownloadedRegistry registry = registryOf(SONG, THIRD);
        registry.putSource("PLghost", Arrays.asList(SONG, PlaylistPage.UNAVAILABLE, THIRD));
        assertTrue(registry.isSourceDownloaded("PLghost"));

        registry.remove(THIRD);
        assertFalse(registry.isSourceDownloaded("PLghost"));
    }

    @Test public void aSourceOfUnavailableTracksOnlyIsNeverDownloaded() {
        DownloadedRegistry registry = registryOf(SONG);
        registry.putSource("PLghosts", Arrays.asList(PlaylistPage.UNAVAILABLE, PlaylistPage.UNAVAILABLE));
        assertFalse(registry.isSourceDownloaded("PLghosts"));
    }

    @Test public void aSourceWithoutRecordOrTracksIsNeverDownloaded() {
        DownloadedRegistry registry = registryOf(SONG);
        registry.putSource("empty", Collections.emptyList());

        assertFalse(registry.isSourceDownloaded("empty"));
        assertFalse(registry.isSourceDownloaded("PLunknown"));
        assertFalse(registry.isSourceDownloaded(null));
    }

    @Test public void repeatedTracksOfAPlaylistNeedBeDownloadedOnce() {
        DownloadedRegistry registry = registryOf(SONG);
        registry.putSource("PLrepeat", Arrays.asList(SONG, SONG));

        assertTrue(registry.isSourceDownloaded("PLrepeat"));
    }

    @Test public void aRememberedSourceIsACopy() {
        DownloadedRegistry registry = registryOf(SONG, OTHER);
        List<String> tracks = new ArrayList<>(Arrays.asList(SONG, OTHER));
        registry.putSource("PLcopy", tracks);
        tracks.add(THIRD);

        assertEquals(Arrays.asList(SONG, OTHER), registry.sourceTracks("PLcopy"));
    }

    @Test public void scannerFindsADownloadedIdAnywhereInTheModel() throws Exception {
        byte[] navigation = message(1, SONG);
        byte[] menu = message(5, "unrelated", 7, navigation);
        byte[] row = message(1, "title", 2, menu, 9, "subtitle");

        assertEquals(SONG, registryOf(SONG).findDownloaded(row));
    }

    @Test public void scannerIgnoresIdsThatAreNotDownloaded() throws Exception {
        byte[] row = message(1, message(1, OTHER), 2, "plain text here");

        assertNull(registryOf(SONG).findDownloaded(row));
        assertNull(new DownloadedRegistry().findDownloaded(row));
    }

    @Test public void scannerOnlyReadsWholeElevenCharacterStrings() throws Exception {
        // The id is part of a longer string (not length 11): not a video id field.
        byte[] longer = message(1, "x" + SONG + "y");
        // A downloaded id whose characters are not even valid cannot match.
        byte[] punctuation = message(1, "dQw4w9WgXc!");

        DownloadedRegistry registry = registryOf(SONG, "dQw4w9WgXc!");
        assertNull(registry.findDownloaded(longer));
        assertNull(registry.findDownloaded(punctuation));
    }

    @Test public void scannerReachesTheLastBytesAndPicksTheDownloadedOneOfSeveral() throws Exception {
        byte[] row = message(1, OTHER, 2, THIRD, 3, SONG);

        assertEquals(SONG, registryOf(SONG).findDownloaded(row));
        assertNull(registryOf(SONG).findDownloaded(Arrays.copyOf(row, row.length - 1)));
        assertNull(registryOf(SONG).findDownloaded(new byte[0]));
    }

    @Test public void looseScanFindsAnIdThatIsNotAWholeProtobufString() {
        byte[] url = "https://music.youtube.com/watch?v=dQw4w9WgXcQ&list=PLx".getBytes(StandardCharsets.US_ASCII);
        byte[] atEdges = SONG.getBytes(StandardCharsets.US_ASCII);

        DownloadedRegistry registry = registryOf(SONG);
        assertNull(registry.findDownloaded(url));
        assertEquals(SONG, registry.findDownloadedLoose(url));
        assertEquals(SONG, registry.findDownloadedLoose(atEdges));
    }

    @Test public void looseScanNeedsAWholeElevenCharacterWord() {
        DownloadedRegistry registry = registryOf(SONG);

        assertNull(registry.findDownloadedLoose(("x" + SONG).getBytes(StandardCharsets.US_ASCII)));
        assertNull(registry.findDownloadedLoose((SONG + "y").getBytes(StandardCharsets.US_ASCII)));
        assertNull(registry.findDownloadedLoose(("v=" + OTHER).getBytes(StandardCharsets.US_ASCII)));
        assertNull(new DownloadedRegistry().findDownloadedLoose(SONG.getBytes(StandardCharsets.US_ASCII)));
    }

    @Test public void candidatesAreEveryDistinctVideoIdShapedStringUpToTheLimit() throws Exception {
        byte[] row = message(1, OTHER, 2, "not an id!", 3, OTHER, 4, THIRD, 5, SONG, 6, THIRD);

        assertEquals(Arrays.asList(OTHER, THIRD), DownloadedRegistry.candidateIds(row, 2));
        assertEquals(Arrays.asList(OTHER, THIRD, SONG), DownloadedRegistry.candidateIds(row, 10));
        assertTrue(DownloadedRegistry.candidateIds(new byte[0], 3).isEmpty());
    }

    @Test public void earlierPlaylistsAreRecoveredOnlyWhenEveryTrackIsADownload() {
        Map<Long, String> videoIdByMedia = new HashMap<>();
        videoIdByMedia.put(10L, SONG);
        videoIdByMedia.put(11L, OTHER);

        assertEquals(Arrays.asList(OTHER, SONG, OTHER),
                DownloadedRegistry.resolveTracks(Arrays.asList(11L, 10L, 11L), videoIdByMedia));
        assertNull(DownloadedRegistry.resolveTracks(Arrays.asList(10L, 99L), videoIdByMedia));
        assertNull(DownloadedRegistry.resolveTracks(Collections.emptyList(), videoIdByMedia));
    }

    @Test public void trackListsSurviveTheirStoredForm() {
        List<String> tracks = Arrays.asList(SONG, OTHER, SONG);

        assertEquals(tracks, DownloadedRegistry.decode(DownloadedRegistry.encode(tracks)));
        assertEquals(new HashSet<>(), new HashSet<>(DownloadedRegistry.decode("")));
    }

    // The registry holds the ids that have a valid stream copy and nothing else: a song that exists only as a
    // local file (Download in app without Play downloads locally) is never added to it.

    @Test public void aRememberedPlaylistWhoseTracksHaveNoStreamCopyShowsNoCheck() {
        DownloadedRegistry registry = new DownloadedRegistry();
        // A playlist saved as local files (recorded by an earlier build or recovered from the native playlist
        // database) has its track list but none of its tracks has a stream copy.
        registry.putSource("PLlocal", Arrays.asList(SONG, OTHER));

        assertFalse(registry.isSourceDownloaded("PLlocal"));
        assertFalse(registry.isDownloaded(SONG));
        assertNull(registry.findDownloaded(SONG.getBytes(StandardCharsets.ISO_8859_1)));
    }

    @Test public void aPlaylistIsCheckedOnlyWhenEveryTrackHasAStreamCopy() {
        DownloadedRegistry registry = new DownloadedRegistry();
        registry.putSource("PLmixed", Arrays.asList(SONG, OTHER, THIRD));
        registry.add(SONG);
        registry.add(OTHER);
        assertFalse(registry.isSourceDownloaded("PLmixed"));

        registry.add(THIRD);
        assertTrue(registry.isSourceDownloaded("PLmixed"));
    }

    @Test public void aDeletedStreamCopyRemovesItsCheckAndItsPlaylistsCheck() {
        DownloadedRegistry registry = registryOf(SONG, OTHER);
        registry.putSource("PLpair", Arrays.asList(SONG, OTHER));
        assertTrue(registry.isSourceDownloaded("PLpair"));

        registry.remove(OTHER);

        assertFalse(registry.isDownloaded(OTHER));
        assertTrue(registry.isDownloaded(SONG));
        assertFalse(registry.isSourceDownloaded("PLpair"));
    }

    @Test public void clearingAllStreamCopiesRemovesEveryCheckButKeepsTheRememberedPlaylists() {
        DownloadedRegistry registry = registryOf(SONG, OTHER);
        registry.putSource("PLpair", Arrays.asList(SONG, OTHER));

        registry.clear();

        assertFalse(registry.hasTracks());
        assertFalse(registry.isDownloaded(SONG));
        assertFalse(registry.isSourceDownloaded("PLpair"));
        assertTrue(registry.hasSource("PLpair"));

        // Downloading the playlist again brings the check back without remembering it twice.
        registry.addAll(Arrays.asList(SONG, OTHER));
        assertTrue(registry.isSourceDownloaded("PLpair"));
    }

    @Test public void aRescanForgetsCopiesThatVanishedAndNeverOnesKeptWhileItRan() {
        DownloadedRegistry registry = registryOf(SONG, OTHER);
        Set<String> knownBefore = registry.snapshot();
        registry.add(THIRD);

        registry.prune(knownBefore, Collections.singleton(SONG));

        assertTrue(registry.isDownloaded(SONG));
        assertFalse(registry.isDownloaded(OTHER));
        assertTrue(registry.isDownloaded(THIRD));
    }

    @Test public void aSourceKeepsTheOrderOfItsTracksAndDuplicates() {
        DownloadedRegistry registry = registryOf(SONG, OTHER, THIRD);
        registry.putSource("OLAK5uy_album", Arrays.asList(THIRD, SONG, THIRD));

        assertEquals(Arrays.asList(THIRD, SONG, THIRD), registry.sourceTracks("OLAK5uy_album"));
        assertNull(registry.sourceTracks("PLunknown"));
        assertNull(registry.sourceTracks(null));
    }

    @Test public void findsARememberedPlaylistThatIsAWholeStringOfTheCommand() throws Exception {
        DownloadedRegistry registry = registryOf(SONG);
        registry.putSource("OLAK5uy_album", Arrays.asList(SONG));
        registry.putSource("PLother", Arrays.asList(SONG));

        byte[] watch = message(1, "dQw4w9WgXcQ", 2, "OLAK5uy_album");
        assertEquals("OLAK5uy_album", registry.findSource(message(7, watch)));
        assertNull(registry.findSource(message(7, message(1, "dQw4w9WgXcQ", 2, "PLunrelated"))));
    }

    @Test public void aRadioOfAPlaylistIsNotThePlaylist() throws Exception {
        DownloadedRegistry registry = registryOf(SONG);
        registry.putSource("OLAK5uy_album", Arrays.asList(SONG));

        assertNull(registry.findSource(message(2, "RDAMPLOLAK5uy_album")));
    }

    @Test public void aMusicVideoSavedAsItsSongCountsAsDownloadedThroughTheAlias() throws Exception {
        DownloadedRegistry registry = new DownloadedRegistry();
        registry.add(SONG);
        registry.addAlias(OTHER, SONG);

        assertTrue(registry.isDownloaded(OTHER));
        assertFalse(registry.hasOwnCopy(OTHER));
        assertEquals(SONG, registry.canonicalId(OTHER));
        assertEquals(SONG, registry.canonicalId(SONG));
        assertEquals(SONG, registry.findDownloaded(message(1, OTHER)));
        assertEquals(SONG, registry.findDownloadedLoose(("watch?v=" + OTHER + "&x").getBytes(StandardCharsets.UTF_8)));
    }

    @Test public void anAliasOfASongWithoutACopyIsNothing() {
        DownloadedRegistry registry = new DownloadedRegistry();
        registry.add(THIRD);
        registry.addAlias(OTHER, SONG);

        assertFalse(registry.isDownloaded(OTHER));
        assertEquals(OTHER, registry.canonicalId(OTHER));
    }

    @Test public void aliasesGoWhenTheirSongsCopyIsRemovedPrunedOrCleared() {
        DownloadedRegistry registry = new DownloadedRegistry();
        registry.addAll(List.of(SONG, THIRD));
        registry.addAlias(OTHER, SONG);
        registry.addAlias("alias123456", THIRD);

        registry.remove(SONG);
        assertFalse(registry.isDownloaded(OTHER));
        assertEquals(OTHER, registry.canonicalId(OTHER));

        registry.prune(Set.of(THIRD), Set.of());
        assertFalse(registry.isDownloaded("alias123456"));

        registry.addAll(List.of(SONG));
        registry.setAliases(Map.of(OTHER, SONG));
        assertTrue(registry.isDownloaded(OTHER));
        registry.clear();
        assertFalse(registry.isDownloaded(OTHER));
    }

    @Test public void aListWhoseDownloadStartedIsNotSavedUntilItFinishes() {
        DownloadedRegistry registry = registryOf(SONG, OTHER, THIRD);

        registry.start("OLAK5uy_album", Arrays.asList(SONG, OTHER, THIRD));

        assertTrue(registry.isPending("OLAK5uy_album"));
        assertFalse("every copy is there, but the download did not end", registry.isSourceDownloaded("OLAK5uy_album"));

        registry.finish("OLAK5uy_album");

        assertFalse(registry.isPending("OLAK5uy_album"));
        assertTrue(registry.isSourceDownloaded("OLAK5uy_album"));
    }

    @Test public void anInterruptedListKeepsItsTracksAndIsNotSavedAfterARestart() {
        DownloadedRegistry afterRestart = registryOf(SONG);
        afterRestart.putSource("OLAK5uy_album", Arrays.asList(SONG, OTHER, THIRD));
        afterRestart.setPending(Collections.singleton("OLAK5uy_album"));

        assertEquals(Arrays.asList(SONG, OTHER, THIRD), afterRestart.sourceTracks("OLAK5uy_album"));
        assertFalse(afterRestart.isSourceDownloaded("OLAK5uy_album"));
    }

    @Test public void removingAListForgetsThatItWasPending() {
        DownloadedRegistry registry = registryOf(SONG);
        registry.start("OLAK5uy_album", Collections.singletonList(SONG));

        registry.removeSource("OLAK5uy_album");

        assertFalse(registry.isPending("OLAK5uy_album"));
        assertFalse(registry.hasSource("OLAK5uy_album"));
    }
}
