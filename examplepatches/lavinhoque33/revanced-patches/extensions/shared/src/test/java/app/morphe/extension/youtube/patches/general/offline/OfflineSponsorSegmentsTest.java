/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-05.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.util.List;
import java.util.Set;
import java.util.function.Function;

import app.morphe.extension.youtube.patches.general.offline.OfflineSponsorSegments.Segment;
import static org.junit.Assert.*;

public class OfflineSponsorSegmentsTest {
    private static final Segment SPONSOR = new Segment("sponsor", 1000, 5000);
    private static final Segment INTRO = new Segment("intro", 2000, 8000);
    private static final List<Segment> SEGMENTS = List.of(SPONSOR, INTRO);
    private static final List<String> SELECTED = List.of("sponsor", "intro");

    @Test public void exactBoundariesAndOverlapsChooseTheFurthestEnd() {
        assertNull(OfflineSponsorSegments.at(SEGMENTS, SELECTED, 999, true, Set.of(), key -> "skip"));
        assertEquals(SPONSOR, OfflineSponsorSegments.at(SEGMENTS, SELECTED, 1000, true, Set.of(), key -> "skip"));
        assertEquals(INTRO, OfflineSponsorSegments.at(SEGMENTS, SELECTED, 2000, true, Set.of(), key -> "skip"));
        assertNull(OfflineSponsorSegments.at(SEGMENTS, SELECTED, 8000, true, Set.of(), key -> "skip"));
    }

    @Test public void categoryChoicesAndLiveBehaviorsControlSkipping() {
        assertNull(OfflineSponsorSegments.at(SEGMENTS, List.of(), 2500, true, Set.of(), key -> "skip"));
        for (String mode : List.of("ignore", "seekbar-only", "manual-skip")) {
            assertNull(OfflineSponsorSegments.at(SEGMENTS, SELECTED, 2500, true, Set.of(), key -> mode));
        }
        Function<String, String> behavior = key -> key.equals("sponsor") ? "manual-skip" : "ignore";
        assertEquals(SPONSOR, OfflineSponsorSegments.at(SEGMENTS, SELECTED, 2500, false, Set.of(), behavior));
        assertEquals(INTRO, OfflineSponsorSegments.at(SEGMENTS, SELECTED, 2500, true,
                Set.of(SPONSOR), key -> "skip-once"));
        assertNull(OfflineSponsorSegments.at(SEGMENTS, SELECTED, 2500, true,
                Set.of(SPONSOR, INTRO), key -> "skip-once"));
    }

    @Test public void durationGuardAndRepeatGuardRejectUnsafeSkips() {
        assertTrue(OfflineSponsorSegments.durationMatches(100_000, 105_000));
        assertFalse(OfflineSponsorSegments.durationMatches(100_000, 105_001));
        assertFalse(OfflineSponsorSegments.durationMatches(0, 100_000));
        assertFalse(OfflineSponsorSegments.durationMatches(100_000, 0));
        assertTrue(OfflineSponsorSegments.canRepeat(1000, 0));
        assertFalse(OfflineSponsorSegments.canRepeat(1499, 1000));
        assertTrue(OfflineSponsorSegments.canRepeat(1500, 1000));
    }

    @Test public void nextStartIsScheduledSoonerThanTickerAndAccountsForSpeed() {
        assertEquals(250, OfflineSponsorSegments.nextDelay(SEGMENTS, 0, 1f));
        assertEquals(100, OfflineSponsorSegments.nextDelay(SEGMENTS, 900, 1f));
        assertEquals(50, OfflineSponsorSegments.nextDelay(SEGMENTS, 900, 2f));
        assertEquals(20, OfflineSponsorSegments.nextDelay(SEGMENTS, 999, 2f));
        assertEquals(250, OfflineSponsorSegments.nextDelay(List.of(), 0, 1f));
    }

    @Test public void categoryParserDropsUnknownDuplicateAndHighlightKeys() {
        assertEquals(List.of("sponsor", "intro"), OfflineSponsorSegments.categories(
                " sponsor,poi_highlight,wrong,intro,sponsor,,"));
    }

    @Test public void apiAndIndexSegmentsRoundTripWithoutObfuscatedTypes() throws Exception {
        JSONArray api = new JSONArray().put(new JSONObject().put("category", "sponsor")
                .put("segment", new JSONArray().put(1).put(5)));
        assertEquals(List.of(SPONSOR), OfflineSponsorSegments.fromJson(api, true));
        assertEquals(SEGMENTS, OfflineSponsorSegments.fromJson(OfflineSponsorSegments.toJson(SEGMENTS), false));
        api.put(new JSONObject().put("category", "intro").put("segment", new JSONArray().put(5).put(4)));
        assertEquals(List.of(SPONSOR), OfflineSponsorSegments.fromJson(api, true));
    }

    @Test public void oldIndexLoadsAndNewFieldsRoundTrip() throws Exception {
        OfflineVideo video = OfflineVideo.fromJson(new JSONObject().put("videoId", "abcdefghijk")
                .put("contentUri", "content://test/video"));
        assertNotNull(video);
        assertFalse(video.sponsorChecked);
        assertTrue(video.sponsorSegments.isEmpty());
        video.sponsorChecked = true;
        video.sponsorDurationMs = 100_000;
        video.sponsorCategories = SELECTED;
        video.sponsorSegments = SEGMENTS;
        OfflineVideo copy = OfflineVideo.fromJson(video.toJson());
        assertNotNull(copy);
        assertTrue(copy.sponsorChecked);
        assertEquals(100_000, copy.sponsorDurationMs);
        assertEquals(SELECTED, copy.sponsorCategories);
        assertEquals(SEGMENTS, copy.sponsorSegments);
    }

    @Test public void skippedOnceSegmentsBecomeManualWhenSeekingBack() {
        assertEquals(SPONSOR, OfflineSponsorSegments.at(List.of(SPONSOR), SELECTED, 2000,
                true, Set.of(), key -> "skip-once"));
        assertNull(OfflineSponsorSegments.at(List.of(SPONSOR), SELECTED, 2000,
                false, Set.of(), key -> "skip-once"));
        assertNull(OfflineSponsorSegments.at(List.of(SPONSOR), SELECTED, 2000,
                true, Set.of(SPONSOR), key -> "skip-once"));
        assertEquals(SPONSOR, OfflineSponsorSegments.at(List.of(SPONSOR), SELECTED, 2000,
                false, Set.of(SPONSOR), key -> "skip-once"));
        assertNull(OfflineSponsorSegments.at(List.of(SPONSOR), SELECTED, 5000,
                false, Set.of(SPONSOR), key -> "skip-once"));
    }

    @Test public void toleratedOutroEndClampsToTheFileDuration() {
        Segment outro = new Segment("outro", 95_000, 105_000);
        assertEquals(100_000, OfflineSponsorSegments.skipTarget(outro, 98_000, 105_000, 100_000));
        assertEquals(105_000, OfflineSponsorSegments.skipTarget(outro, 98_000, 105_000, 106_000));
        assertEquals(-1, OfflineSponsorSegments.skipTarget(outro, 100_000, 105_000, 100_000));
        assertEquals(-1, OfflineSponsorSegments.skipTarget(outro, 94_999, 105_000, 100_000));
        assertEquals(-1, OfflineSponsorSegments.skipTarget(outro, 98_000, 105_001, 100_000));
        assertEquals(-1, OfflineSponsorSegments.skipTarget(new Segment("outro", 95_000, 105_001),
                98_000, 105_000, 100_000));
    }
}
