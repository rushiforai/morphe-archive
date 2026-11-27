/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-26.
 * Written by lavinhoque33, 2026-11-08.
 * Modified by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.util.List;

import app.morphe.extension.music.patches.downloads.OfflineWatchNext.Item;

public class OfflineWatchNextTest {
    private static final String PLAYLIST = "PPSVrvx:OLAK5uy_album";

    private static Item item(String videoId, String title, String artist, String album, long durationMs,
                             String thumbnail) {
        return new Item(videoId, title, artist, album, durationMs, thumbnail);
    }

    private static List<Item> items() {
        return List.of(
                item("aaaaaaaaaaa", "First", "Artist", "Album", 215_000, "https://lh3/x=w544-h544-l90-rj"),
                item("bbbbbbbbbbb", "Second", "Artist", "Album", 3_725_000, null),
                item("ccccccccccc", "Third", "", "", 0, ""));
    }

    /** Walks the response down to the playlist panel, asserting each wrapper field on the way. */
    private static byte[] panel(byte[] response) throws Exception {
        byte[] contents = ProtoFields.one(response, 7);
        byte[] queue = ProtoFields.one(contents, 125_354_411);
        byte[] tabsHolder = ProtoFields.one(queue, 7);
        byte[] tabList = ProtoFields.one(tabsHolder, 91_700_600);
        byte[] tabEntry = ProtoFields.one(tabList, 1);
        byte[] tab = ProtoFields.one(tabEntry, 58_174_010);
        assertEquals("Up next", ProtoFields.string(tab, 2));
        byte[] tabContent = ProtoFields.one(tab, 4);
        byte[] panelHolder = ProtoFields.one(tabContent, 278_751_218);
        byte[] panelRenderer = ProtoFields.one(panelHolder, 1);
        return ProtoFields.one(panelRenderer, 50_631_000);
    }

    private static byte[] track(byte[] panel, int index) throws Exception {
        return ProtoFields.one(ProtoFields.all(panel, 2).get(index), 51_779_701);
    }

    private static String texts(byte[] text) throws Exception {
        StringBuilder joined = new StringBuilder();
        for (byte[] run : ProtoFields.all(text, 1)) joined.append(ProtoFields.string(run, 1));
        return joined.toString();
    }

    @Test
    public void capturedNativeRowsKeepOrderDuplicatesEndpointsAndUnknownFields() throws Exception {
        byte[] endpoint = OnlineWatchCommand.build("bbbbbbbbbbb", "PL-native", 1);
        byte[] first = new ProtoWriter().string(10, "aaaaaaaaaaa").int32(6, 1)
                .message(7, OnlineWatchCommand.build("aaaaaaaaaaa", "PL-native", 0))
                .string(99, "unknown native metadata").toByteArray();
        byte[] second = new ProtoWriter().string(10, "bbbbbbbbbbb").int32(6, 0)
                .message(7, endpoint).toByteArray();
        byte[] response = OfflineWatchNext.buildCaptured("PL-native", List.of(first, second, first), 1, endpoint);
        byte[] captured = panel(response);

        assertEquals(3, ProtoFields.all(captured, 2).size());
        assertEquals("aaaaaaaaaaa", ProtoFields.string(track(captured, 0), 10));
        assertEquals("bbbbbbbbbbb", ProtoFields.string(track(captured, 1), 10));
        assertEquals("aaaaaaaaaaa", ProtoFields.string(track(captured, 2), 10));
        assertEquals("unknown native metadata", ProtoFields.string(track(captured, 0), 99));
        assertEquals(0, ProtoFields.varint(track(captured, 0), 6));
        assertEquals(1, ProtoFields.varint(track(captured, 1), 6));
        assertEquals(0, ProtoFields.varint(track(captured, 2), 6));
        assertArrayEquals(endpoint, ProtoFields.one(track(captured, 1), 7));
        assertArrayEquals(endpoint, ProtoFields.one(response, 9));
    }

    @Test
    public void capturedSavedContinuationSelectsTheLiveOccurrenceWithoutAddingShuffleMetadata() throws Exception {
        String playlist = "PPSVrvx:PLsaved_header";
        List<Item> saved = items();
        byte[] original = panel(OfflineWatchNext.build(playlist,
                List.of(saved.get(0), saved.get(1), saved.get(0), saved.get(2)), 0, true));
        byte[] first = track(original, 0);
        byte[] otherOccurrence = track(original, 2);
        byte[] endpoint = ProtoFields.one(otherOccurrence, 7);
        byte[] response = OfflineWatchNext.buildCaptured(playlist,
                List.of(first, track(original, 3), track(original, 1), otherOccurrence), 3, endpoint);
        byte[] captured = panel(response);

        assertFalse(ProtoFields.has(captured, 34));
        assertEquals(playlist, ProtoFields.string(captured, 5));
        assertEquals(3, ProtoFields.varint(captured, 3));
        assertEquals(0, ProtoFields.varint(track(captured, 0), 6));
        assertEquals(1, ProtoFields.varint(track(captured, 3), 6));
        assertArrayEquals(endpoint, ProtoFields.one(track(captured, 3), 7));
        assertArrayEquals(endpoint, ProtoFields.one(response, 9));
        assertEquals(2, OfflineReplayLogic.offlineWatchOf(endpoint).index());
    }

    @Test public void theResponseHoldsTheQueueAndTheCurrentEndpointOnly() throws Exception {
        byte[] response = OfflineWatchNext.build(PLAYLIST, items(), 1);

        assertEquals(List.of(7, 9), ProtoFields.numbers(response));
    }

    @Test public void thePanelCarriesTheIndexPlaylistAndCount() throws Exception {
        byte[] panel = panel(OfflineWatchNext.build(PLAYLIST, items(), 1));

        assertEquals(List.of(2, 2, 2, 3, 5, 6), ProtoFields.numbers(panel));
        assertEquals(1, ProtoFields.varint(panel, 3));
        assertEquals(PLAYLIST, ProtoFields.string(panel, 5));
        assertEquals(3, ProtoFields.varint(panel, 6));
    }

    @Test public void onlyTheFreshShuffleReplyPublishesNativeModeWithoutChangingOccurrences() throws Exception {
        String playlist = "PPSVrvx:PLsaved_header";
        List<Item> saved = itemsShowingTheVideoOfTheSecond();
        List<Item> withDuplicate = List.of(saved.get(0), saved.get(1), saved.get(0), saved.get(2));
        byte[] plain = OfflineWatchNext.build(playlist, withDuplicate, 0);
        byte[] shuffled = OfflineWatchNext.build(playlist, withDuplicate, 0, true);
        byte[] plainPanel = panel(plain);
        byte[] shuffledPanel = panel(shuffled);

        assertFalse(ProtoFields.has(plainPanel, 34));
        byte[] state = ProtoFields.one(ProtoFields.one(shuffledPanel, 34), 79_971_800);
        assertEquals(1, ProtoFields.varint(state, 3));
        assertEquals(0, ProtoFields.varint(shuffledPanel, 3));
        assertEquals(4, ProtoFields.varint(shuffledPanel, 6));
        assertArrayEquals(ProtoFields.one(plain, 9), ProtoFields.one(shuffled, 9));
        for (int index = 0; index < withDuplicate.size(); index++) {
            byte[] row = track(shuffledPanel, index);
            assertArrayEquals(track(plainPanel, index), row);
            assertEquals(withDuplicate.get(index).videoId(), ProtoFields.string(row, 10));
            byte[] endpoint = ProtoFields.one(ProtoFields.one(row, 7), 57_703_777);
            assertEquals(index, ProtoFields.varint(endpoint, 3));
            assertFalse(ProtoFields.has(ProtoFields.one(endpoint, 10), 3));
        }
    }

    @Test public void everyItemWrapsItsTrackInTheTrackField() throws Exception {
        byte[] panel = panel(OfflineWatchNext.build(PLAYLIST, items(), 0));

        for (byte[] item : ProtoFields.all(panel, 2)) {
            assertEquals(List.of(51_779_701), ProtoFields.numbers(item));
        }
    }

    @Test public void aTrackHasTitleBylineThumbnailLengthPositionSelectionEndpointIdAndShortByline()
            throws Exception {
        byte[] track = track(panel(OfflineWatchNext.build(PLAYLIST, items(), 0)), 0);

        assertEquals(List.of(1, 2, 3, 4, 5, 6, 7, 10, 12), ProtoFields.numbers(track));
        assertEquals("First", ProtoFields.string(ProtoFields.one(track, 1), 4));
        assertEquals("aaaaaaaaaaa", ProtoFields.string(track, 10));
        assertEquals("Artist", ProtoFields.string(ProtoFields.one(track, 12), 4));
    }

    @Test public void theBylineIsArtistSeparatorAlbumRuns() throws Exception {
        byte[] byline = ProtoFields.one(track(panel(OfflineWatchNext.build(PLAYLIST, items(), 0)), 0), 2);

        assertEquals(3, ProtoFields.all(byline, 1).size());
        assertEquals("Artist", ProtoFields.string(ProtoFields.all(byline, 1).get(0), 1));
        assertEquals(" \u2022 ", ProtoFields.string(ProtoFields.all(byline, 1).get(1), 1));
        assertEquals("Album", ProtoFields.string(ProtoFields.all(byline, 1).get(2), 1));
    }

    @Test public void aMissingAlbumDropsTheSeparator() throws Exception {
        List<Item> items = List.of(item("aaaaaaaaaaa", "T", "Artist", "", 1000, null));
        byte[] byline = ProtoFields.one(track(panel(OfflineWatchNext.build(PLAYLIST, items, 0)), 0), 2);

        assertEquals("Artist", texts(byline));
    }

    @Test public void aMissingArtistKeepsTheAlbumAlone() throws Exception {
        List<Item> items = List.of(item("aaaaaaaaaaa", "T", "", "Album", 1000, null));
        byte[] byline = ProtoFields.one(track(panel(OfflineWatchNext.build(PLAYLIST, items, 0)), 0), 2);

        assertEquals("Album", texts(byline));
    }

    @Test public void theLengthIsMinutesAndSecondsRuns() throws Exception {
        byte[] panel = panel(OfflineWatchNext.build(PLAYLIST, items(), 0));

        assertEquals("3:35", texts(ProtoFields.one(track(panel, 0), 4)));
        assertEquals("1:02:05", texts(ProtoFields.one(track(panel, 1), 4)));
    }

    @Test public void lengthFormatMatchesTheApp() {
        assertEquals("0:00", OfflineWatchNext.formatLength(999));
        assertEquals("0:09", OfflineWatchNext.formatLength(9_999));
        assertEquals("1:00", OfflineWatchNext.formatLength(60_000));
        assertEquals("59:59", OfflineWatchNext.formatLength(3_599_999));
        assertEquals("1:00:00", OfflineWatchNext.formatLength(3_600_000));
        assertEquals("10:01:01", OfflineWatchNext.formatLength(36_061_000));
    }

    @Test public void thePositionIsOneBasedRuns() throws Exception {
        byte[] panel = panel(OfflineWatchNext.build(PLAYLIST, items(), 0));

        assertEquals("1", texts(ProtoFields.one(track(panel, 0), 5)));
        assertEquals("3", texts(ProtoFields.one(track(panel, 2), 5)));
    }

    @Test public void onlyTheCurrentTrackIsSelected() throws Exception {
        byte[] panel = panel(OfflineWatchNext.build(PLAYLIST, items(), 1));

        assertEquals(0, ProtoFields.varint(track(panel, 0), 6));
        assertEquals(1, ProtoFields.varint(track(panel, 1), 6));
        assertEquals(0, ProtoFields.varint(track(panel, 2), 6));
    }

    @Test public void theThumbnailHasTheUrlAndTheSizeOfItsRequest() throws Exception {
        byte[] thumbnail = ProtoFields.one(track(panel(OfflineWatchNext.build(PLAYLIST, items(), 0)), 0), 3);
        byte[] source = ProtoFields.one(thumbnail, 1);

        assertEquals(List.of(1), ProtoFields.numbers(thumbnail));
        assertEquals(List.of(1, 2, 3), ProtoFields.numbers(source));
        assertEquals("https://lh3/x=w544-h544-l90-rj", ProtoFields.string(source, 1));
        assertEquals(544, ProtoFields.varint(source, 2));
        assertEquals(544, ProtoFields.varint(source, 3));
    }

    @Test public void aThumbnailUrlWithoutASizeHasNoSize() throws Exception {
        List<Item> items = List.of(item("aaaaaaaaaaa", "T", "A", "B", 1000, "https://t/plain.jpg"));
        byte[] source = ProtoFields.one(
                ProtoFields.one(track(panel(OfflineWatchNext.build(PLAYLIST, items, 0)), 0), 3), 1);

        assertEquals(List.of(1), ProtoFields.numbers(source));
    }

    @Test public void aTrackWithoutThumbnailLengthOrBylineOmitsThem() throws Exception {
        byte[] track = track(panel(OfflineWatchNext.build(PLAYLIST, items(), 0)), 2);

        assertEquals(List.of(1, 5, 6, 7, 10, 12), ProtoFields.numbers(track));
        assertEquals("Third", ProtoFields.string(ProtoFields.one(track, 1), 4));
        assertEquals("", ProtoFields.string(ProtoFields.one(track, 12), 4));
    }

    @Test public void everyTrackEndpointIsItsOfflineWatchCommand() throws Exception {
        byte[] panel = panel(OfflineWatchNext.build(PLAYLIST, items(), 0));
        List<Item> items = items();

        for (int index = 0; index < items.size(); index++) {
            assertArrayEquals(OfflineWatchCommand.build(items.get(index).videoId(), PLAYLIST, index),
                    ProtoFields.one(track(panel, index), 7));
        }
    }

    @Test public void theResponseCurrentEndpointIsTheCurrentTracksCommand() throws Exception {
        byte[] response = OfflineWatchNext.build(PLAYLIST, items(), 2);

        assertArrayEquals(OfflineWatchCommand.build("ccccccccccc", PLAYLIST, 2), ProtoFields.one(response, 9));
    }

    @Test public void aSingleItemQueueWorks() throws Exception {
        byte[] response = OfflineWatchNext.build(PLAYLIST, items().subList(0, 1), 0);
        byte[] panel = panel(response);

        assertEquals(1, ProtoFields.all(panel, 2).size());
        assertEquals(1, ProtoFields.varint(panel, 6));
        assertEquals(0, ProtoFields.varint(panel, 3));
    }

    @Test(expected = IllegalArgumentException.class)
    public void anEmptyQueueIsRejected() {
        OfflineWatchNext.build(PLAYLIST, List.of(), 0);
    }

    @Test(expected = IllegalArgumentException.class)
    public void anIndexPastTheEndIsRejected() {
        OfflineWatchNext.build(PLAYLIST, items(), 3);
    }

    @Test(expected = IllegalArgumentException.class)
    public void aNegativeIndexIsRejected() {
        OfflineWatchNext.build(PLAYLIST, items(), -1);
    }

    @Test(expected = IllegalArgumentException.class)
    public void anEmptyPlaylistIdIsRejected() {
        OfflineWatchNext.build("", items(), 0);
    }

    @Test(expected = IllegalArgumentException.class)
    public void anItemWithoutAVideoIdIsRejected() {
        OfflineWatchNext.build(PLAYLIST, List.of(item("", "T", "A", "B", 1, null)), 0);
    }

    private static long typeOf(byte[] track) throws Exception {
        byte[] endpoint = ProtoFields.one(ProtoFields.one(track, 7), 57_703_777);
        return ProtoFields.varint(ProtoFields.one(endpoint, 10), 6);
    }

    private static List<Item> itemsShowingTheVideoOfTheSecond() {
        List<Item> items = items();
        return List.of(items.get(0), items.get(1).showingVideo("VVVVVVVVVVV"), items.get(2));
    }

    @Test public void anItemShowingAVideoCarriesItsIdItsEndpointAndTheSongsDecoration() throws Exception {
        byte[] panel = panel(OfflineWatchNext.build(PLAYLIST, itemsShowingTheVideoOfTheSecond(), 1));
        byte[] video = track(panel, 1);

        assertEquals("VVVVVVVVVVV", ProtoFields.string(video, 10));
        assertEquals(2, typeOf(video));
        assertArrayEquals(OfflineWatchCommand.build("VVVVVVVVVVV", PLAYLIST, 1, 2), ProtoFields.one(video, 7));
        assertEquals("Second", ProtoFields.string(ProtoFields.one(video, 1), 4));
        assertEquals("2", texts(ProtoFields.one(video, 5)));
        assertEquals(1, typeOf(track(panel, 0)));
        assertEquals(1, typeOf(track(panel, 2)));
    }

    @Test public void theCurrentEndpointNamesTheVideoWhenTheCurrentItemShowsIt() throws Exception {
        byte[] response = OfflineWatchNext.build(PLAYLIST, itemsShowingTheVideoOfTheSecond(), 1);

        assertArrayEquals(OfflineWatchCommand.build("VVVVVVVVVVV", PLAYLIST, 1, 2), ProtoFields.one(response, 9));
    }

    @Test public void everyItemStaysAPlainItem() throws Exception {
        byte[] panel = panel(OfflineWatchNext.build(PLAYLIST, itemsShowingTheVideoOfTheSecond(), 0));

        for (byte[] item : ProtoFields.all(panel, 2)) assertEquals(List.of(51_779_701), ProtoFields.numbers(item));
        assertEquals(List.of(2, 2, 2, 3, 5, 6), ProtoFields.numbers(panel));
    }
}
