/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class VideoPairingLogicTest {
    private static VideoPairingLogic.Song song(String id, long seconds, String title) {
        return new VideoPairingLogic.Song(id, seconds, title, "Artist");
    }

    private static VideoPairingLogic.Song song(String id, long seconds) {
        return song(id, seconds, "Song " + id);
    }

    private static WatchQueueLogic.NextItem item(int index, String id, String length, String title) {
        return new WatchQueueLogic.NextItem(index, "plain", id, "", title, "Artist", length, "", "", "");
    }

    private static WatchQueueLogic.NextItem item(int index, String id, String length) {
        return item(index, id, length, "Queue " + id);
    }

    private static String id(String prefix, int number) {
        return String.format("%s%07d", prefix, number);
    }

    /** The album of the device round: 10 tracks, the first two have a music video of another cut. */
    @Test public void theAlbumPairsTheVideosOfAnotherCutOfTheSong() {
        List<VideoPairingLogic.Song> songs = new ArrayList<>();
        List<WatchQueueLogic.NextItem> queue = new ArrayList<>();
        for (int index = 0; index < 10; index++) songs.add(song(id("song", index), 214));
        songs.set(1, song(id("song", 1), 233, "Second"));
        queue.add(item(0, "dQw4w9WgXcQ", "3:33", "First (Official Video)"));
        queue.add(item(1, "BeyEGebJ1l4", "3:28", "Other title"));
        for (int index = 2; index < 10; index++) queue.add(item(index, id("song", index), "3:34"));

        VideoPairingLogic.Result result = VideoPairingLogic.pair(songs, queue);

        assertNull(result.skipReason());
        assertEquals(List.of(new VideoPairingLogic.Pair("song0000000", "dQw4w9WgXcQ"),
                new VideoPairingLogic.Pair("song0000001", "BeyEGebJ1l4")), result.pairs());
        assertEquals(VideoPairingLogic.BY_LENGTH, result.decisions().get(0).by());
        assertEquals(VideoPairingLogic.BY_LENGTH, result.decisions().get(1).by());
        assertEquals(VideoPairingLogic.BY_SAME, result.decisions().get(2).by());
        assertTrue(result.hasOtherIds());
    }

    @Test public void theRealLengthsOfTheDeviceRoundAreWithinTheTolerance() {
        assertTrue(VideoPairingLogic.similarLength(214, 213));
        assertTrue(VideoPairingLogic.similarLength(233, 208));
        assertTrue(VideoPairingLogic.similarLength(300, 345));
        assertFalse(VideoPairingLogic.similarLength(300, 346));
        assertTrue(VideoPairingLogic.similarLength(600, 690));
        assertFalse(VideoPairingLogic.similarLength(600, 691));
        assertFalse(VideoPairingLogic.similarLength(100, 146));
    }

    @Test public void aSameTitleIsPairedWhateverTheLength() {
        VideoPairingLogic.Result result = VideoPairingLogic.pair(
                List.of(song("aaaaaaaaaaa", 200, "Homesick")),
                List.of(item(0, "ccccccccccc", "9:59", "Homesick [Official Video]")));

        assertEquals(VideoPairingLogic.BY_TITLE, result.decisions().get(0).by());
        assertEquals(1, result.pairs().size());
    }

    @Test public void anItemThatIsNeitherTheSameTitleNorTheSameLengthIsLeftAloneAndTheRestIsPaired() {
        VideoPairingLogic.Result result = VideoPairingLogic.pair(
                List.of(song("aaaaaaaaaaa", 100), song("bbbbbbbbbbb", 100), song("ccccccccccc", 100)),
                List.of(item(0, "xxxxxxxxxxx", "1:40"), item(1, "yyyyyyyyyyy", "5:00"),
                        item(2, "zzzzzzzzzzz", "1:41")));

        assertNull(result.skipReason());
        assertEquals(List.of(new VideoPairingLogic.Pair("aaaaaaaaaaa", "xxxxxxxxxxx"),
                new VideoPairingLogic.Pair("ccccccccccc", "zzzzzzzzzzz")), result.pairs());
        VideoPairingLogic.Decision refused = result.decisions().get(1);
        assertEquals(VideoPairingLogic.BY_NONE, refused.by());
        assertEquals("title differs and 300 s is far from 100 s", refused.reason());
    }

    @Test public void anUnknownLengthWithADifferentTitleIsNotPaired() {
        VideoPairingLogic.Result result = VideoPairingLogic.pair(
                List.of(song("aaaaaaaaaaa", 100), song("bbbbbbbbbbb", 0)),
                List.of(item(0, "xxxxxxxxxxx", ""), item(1, "yyyyyyyyyyy", "1:40")));

        assertTrue(result.pairs().isEmpty());
        assertEquals("title differs and a length is unknown", result.decisions().get(0).reason());
        assertEquals("title differs and a length is unknown", result.decisions().get(1).reason());
    }

    @Test public void anItemWithoutAVideoIdIsUnpairedAndDoesNotSkipTheList() {
        VideoPairingLogic.Result result = VideoPairingLogic.pair(
                List.of(song("aaaaaaaaaaa", 100), song("bbbbbbbbbbb", 100)),
                List.of(item(0, "", "1:40"), item(1, "yyyyyyyyyyy", "1:40")));

        assertNull(result.skipReason());
        assertEquals(List.of(new VideoPairingLogic.Pair("bbbbbbbbbbb", "yyyyyyyyyyy")), result.pairs());
        assertEquals("no video id", result.decisions().get(0).reason());
    }

    /** The playlist of the device round: 23 recorded tracks, one greyed out, so 22 downloaded and 22 queued. */
    @Test public void theGreyedRowIsSkippedBeforeThePositionsAreMatched() {
        List<String> recorded = new ArrayList<>();
        for (int index = 0; index < 23; index++) {
            recorded.add(index == 9 ? PlaylistPage.UNAVAILABLE : id("song", index));
        }
        List<VideoPairingLogic.Song> songs = new ArrayList<>();
        for (String track : PlaylistPage.available(recorded)) songs.add(song(track, 200));
        List<WatchQueueLogic.NextItem> queue = new ArrayList<>();
        for (int index = 0; index < songs.size(); index++) {
            boolean video = index == 11;
            queue.add(item(index, video ? "ugcvideo001" : songs.get(index).videoId(), "3:21"));
        }

        VideoPairingLogic.Result result = VideoPairingLogic.pair(songs, queue);

        assertEquals(22, songs.size());
        assertNull(result.skipReason());
        assertEquals(List.of(new VideoPairingLogic.Pair(songs.get(11).videoId(), "ugcvideo001")), result.pairs());
    }

    @Test public void theGhostRowCountedAsATrackWouldMisalignEverythingAfterItSoTheCountDecides() {
        List<VideoPairingLogic.Song> songs = new ArrayList<>();
        for (int index = 0; index < 23; index++) songs.add(song(id("song", index), 200));
        List<WatchQueueLogic.NextItem> queue = new ArrayList<>();
        for (int index = 0; index < 22; index++) queue.add(item(index, id("song", index), "3:20"));

        VideoPairingLogic.Result result = VideoPairingLogic.pair(songs, queue);

        assertEquals("the queue has 22 items for 23 tracks", result.skipReason());
        assertTrue(result.pairs().isEmpty());
        assertTrue(result.decisions().isEmpty());
    }

    @Test public void aQueueWithTheTracksOwnIdsHasNoCounterpartsAndIsNotSkipped() {
        VideoPairingLogic.Result result = VideoPairingLogic.pair(
                List.of(song("aaaaaaaaaaa", 100), song("bbbbbbbbbbb", 100)),
                List.of(item(0, "aaaaaaaaaaa", "1:40"), item(1, "bbbbbbbbbbb", "1:40")));

        assertNull(result.skipReason());
        assertTrue(result.pairs().isEmpty());
        assertFalse(result.hasOtherIds());
    }

    @Test public void anItemThatNamesTheSongAsItsCounterpartIsPairedWithoutLookingAtTitleOrLength() {
        VideoPairingLogic.Song song = song("aaaaaaaaaaa", 100, "Homesick");
        WatchQueueLogic.NextItem video = new WatchQueueLogic.NextItem(0, "wrapper", "vvvvvvvvvvv", "OMV", "Clip",
                "A", "9:00", "aaaaaaaaaaa", "ATV", "1:40");
        WatchQueueLogic.NextItem songFirst = new WatchQueueLogic.NextItem(0, "wrapper", "aaaaaaaaaaa", "ATV",
                "Homesick", "A", "1:40", "wwwwwwwwwww", "OMV", "9:00");

        VideoPairingLogic.Result first = VideoPairingLogic.pair(List.of(song), List.of(video));
        VideoPairingLogic.Result second = VideoPairingLogic.pair(List.of(song), List.of(songFirst));

        assertEquals(List.of(new VideoPairingLogic.Pair("aaaaaaaaaaa", "vvvvvvvvvvv")), first.pairs());
        assertEquals(List.of(new VideoPairingLogic.Pair("aaaaaaaaaaa", "wwwwwwwwwww")), second.pairs());
        assertEquals(VideoPairingLogic.BY_COUNTERPART, second.decisions().get(0).by());
        assertEquals(540, second.decisions().get(0).videoSeconds());
    }

    @Test public void titlesAreComparedWithoutCaseAccentsSuffixesAndFeaturing() {
        assertEquals("beyonce halo", VideoPairingLogic.normalizeTitle("Beyonc\u00e9 Halo (Official Video)"));
        assertEquals("never gonna give you up", VideoPairingLogic.normalizeTitle(
                "Never Gonna Give You Up [Remastered 2022]"));
        assertEquals("homesick", VideoPairingLogic.normalizeTitle("Homesick (feat. Someone)"));
        assertEquals("homesick", VideoPairingLogic.normalizeTitle("Homesick feat. Someone Else"));
        assertEquals("homesick", VideoPairingLogic.normalizeTitle("HOMESICK - Official Music Video"));
        assertEquals("what s up", VideoPairingLogic.normalizeTitle("What's  Up?"));
        assertEquals("", VideoPairingLogic.normalizeTitle(null));
        assertEquals("", VideoPairingLogic.normalizeTitle("(Official Video)"));
        assertTrue(VideoPairingLogic.sameTitle("Cr\u00e8me Br\u00fbl\u00e9e", "creme brulee (Lyric Video)"));
        assertFalse(VideoPairingLogic.sameTitle("", ""));
        assertFalse(VideoPairingLogic.sameTitle("Halo", "Halo Part 2"));
    }

    @Test public void lengthTextsAreParsedInMinutesAndHours() {
        assertEquals(214, VideoPairingLogic.lengthSeconds("3:34"));
        assertEquals(5, VideoPairingLogic.lengthSeconds("0:05"));
        assertEquals(3723, VideoPairingLogic.lengthSeconds("1:02:03"));
        assertEquals(214, VideoPairingLogic.lengthSeconds(" 3:34 "));
        assertEquals(-1, VideoPairingLogic.lengthSeconds(""));
        assertEquals(-1, VideoPairingLogic.lengthSeconds("214"));
        assertEquals(-1, VideoPairingLogic.lengthSeconds("3:"));
        assertEquals(-1, VideoPairingLogic.lengthSeconds("a:bc"));
        assertEquals(-1, VideoPairingLogic.lengthSeconds("1:2:3:4"));
        assertEquals(-1, VideoPairingLogic.lengthSeconds(null));
    }
}
