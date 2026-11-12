/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.util.List;

public class AudioFirstLogicTest {
    private static final String USER_VIDEO = "OMV_PREFERRED_USER_TRIGGERED";
    private static final long TTL = AudioFirstLogic.ARM_TTL_MILLIS;

    @Test public void anArmedVideoFallbackBecomesTheAudioMode() {
        assertEquals("ATV_PREFERRED", AudioFirstLogic.decide("OMV_PREFERRED", "dQw4w9WgXcQ", 1_000, 2_000, TTL, false));
    }

    @Test public void theUserTriggeredModesAreNeverChanged() {
        assertEquals("OMV_PREFERRED_USER_TRIGGERED",
                AudioFirstLogic.decide(USER_VIDEO, "id", 1_000, 2_000, TTL, false));
        assertEquals("ATV_PREFERRED_USER_TRIGGERED",
                AudioFirstLogic.decide("ATV_PREFERRED_USER_TRIGGERED", "id", 1_000, 2_000, TTL, false));
    }

    @Test public void otherModesAreLeftAlone() {
        assertEquals("ATV_PREFERRED", AudioFirstLogic.decide("ATV_PREFERRED", "id", 1_000, 2_000, TTL, false));
        assertEquals("DONT_PLAY_VIDEO_OVERRIDE",
                AudioFirstLogic.decide("DONT_PLAY_VIDEO_OVERRIDE", "id", 1_000, 2_000, TTL, false));
    }

    @Test public void withoutAnArmedTapNothingChanges() {
        assertEquals("OMV_PREFERRED", AudioFirstLogic.decide("OMV_PREFERRED", null, 0, 2_000, TTL, false));
    }

    @Test public void theFlagExpiresAfterTenSeconds() {
        assertEquals(10_000, TTL);
        assertEquals("ATV_PREFERRED", AudioFirstLogic.decide("OMV_PREFERRED", "id", 1_000, 11_000, TTL, false));
        assertEquals("OMV_PREFERRED", AudioFirstLogic.decide("OMV_PREFERRED", "id", 1_000, 11_001, TTL, false));
    }

    @Test public void aClockBeforeTheTapNeverCounts() {
        assertFalse(AudioFirstLogic.isLive("id", 5_000, 4_999, TTL));
    }

    private static final java.util.List<String> ALBUM = java.util.List.of("atv0", "atv1", "atv2", "atv3");

    private static java.util.function.Predicate<String> copies(String... ids) {
        return java.util.Set.of(ids)::contains;
    }

    @Test public void theTracksOfThePlaylistAreLookedUpOnlyWhenNoIdHasACopy() {
        int[] lookups = {0};
        var byId = AudioFirstLogic.chooseArmLazily(true, java.util.List.of("atv1"),
                () -> {
                    lookups[0]++;
                    return ALBUM;
                }, -1, false, copies("atv1"));
        assertEquals("id", byId.rule());
        assertEquals(0, lookups[0]);

        var byIndex = AudioFirstLogic.chooseArmLazily(true, java.util.List.of("omv"),
                () -> {
                    lookups[0]++;
                    return ALBUM;
                }, 2, false, copies("atv2"));
        assertEquals("playlist-index", byIndex.rule());
        assertEquals(1, lookups[0]);
    }

    @Test public void aQueueListsTheRowTheUserChoseWhenAnItemIsKnownByItsIds() {
        var items = java.util.List.of(java.util.List.<String>of(), java.util.List.of("omv3", "atv3"));
        assertTrue(AudioFirstLogic.listsRow(items, java.util.List.of("atv3", "omv3")));
        assertFalse(AudioFirstLogic.listsRow(items, java.util.List.of("atv9", "omv9")));
        assertFalse(AudioFirstLogic.listsRow(java.util.List.of(), java.util.List.of("atv3")));
    }

    @Test public void aCommandIdWithACopyArmsByTheId() {
        var arm = AudioFirstLogic.chooseArm(true, java.util.List.of("omv", "atv1"), null, -1, false, copies("atv1"));
        assertEquals(new AudioFirstLogic.Arm("id", "atv1"), arm);
    }

    @Test public void anyIdOfTheCommandCounts() {
        var arm = AudioFirstLogic.chooseArm(true, java.util.List.of("a", "b", "c"), null, -1, false, copies("c"));
        assertEquals("c", arm.videoId());
    }

    @Test public void anOmvRowOfADownloadedAlbumArmsByTheTappedPosition() {
        var arm = AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), ALBUM, 2, false, copies("atv2"));
        assertEquals(new AudioFirstLogic.Arm("playlist-index", "atv2"), arm);
    }

    @Test public void anAbsentIndexIsTheFirstRowUnlessTheCommandHasParams() {
        assertEquals("atv0",
                AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), ALBUM, -1, false, copies("atv0")).videoId());
        assertNull(AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), ALBUM, -1, true, copies("atv0")));
    }

    @Test public void aRowWithoutACopyInAPartlyDownloadedAlbumDoesNotArm() {
        assertNull(AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), ALBUM, 3, false, copies("atv0", "atv1")));
    }

    @Test public void anUnavailableTrackKeepsThePositionOfTheTracksAfterIt() {
        var list = java.util.List.of("atv0", PlaylistPage.UNAVAILABLE, "atv2");
        var arm = AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), list, 2, false, copies("atv0", "atv2"));
        assertEquals(new AudioFirstLogic.Arm("playlist-index", "atv2"), arm);
    }

    @Test public void aTapOnTheUnavailablePositionArmsNothingByIndexEvenWhenEveryCopyExists() {
        var list = java.util.List.of("atv0", PlaylistPage.UNAVAILABLE, "atv2");
        var arm = AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), list, 1, false,
                id -> !id.equals("omv"));
        assertEquals("playlist-source", arm.rule());
    }

    @Test public void aPlaylistIsFullyDownloadedWhenEveryAvailableTrackHasACopy() {
        var list = java.util.List.of("atv0", PlaylistPage.UNAVAILABLE, "atv2");
        var arm = AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), list, 99, false, copies("atv0", "atv2"));
        assertEquals(new AudioFirstLogic.Arm("playlist-source", "omv"), arm);
        assertNull(AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), list, 99, false, copies("atv0")));
    }

    @Test public void aPlaylistOfUnavailableTracksOnlyArmsNothing() {
        var list = java.util.List.of(PlaylistPage.UNAVAILABLE, PlaylistPage.UNAVAILABLE);
        assertNull(AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), list, 99, false,
                id -> !id.equals("omv")));
    }

    @Test public void aFullyDownloadedAlbumArmsForAnyTapOfItsPlaylist() {
        var all = copies("atv0", "atv1", "atv2", "atv3");
        var arm = AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), ALBUM, 99, false, all);
        assertEquals(new AudioFirstLogic.Arm("playlist-source", "omv"), arm);
        assertEquals("playlist-source",
                AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), ALBUM, -1, true, all).rule());
        assertEquals("atv0", AudioFirstLogic.chooseArm(true, java.util.List.of(), ALBUM, -1, true, all).videoId());
    }

    @Test public void nothingTiedToACopyNeverArms() {
        assertNull(AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), null, -1, false, copies("atv0")));
        assertNull(AudioFirstLogic.chooseArm(true, java.util.List.of("omv"), java.util.List.of(), 0, false,
                copies("atv0")));
        assertNull(AudioFirstLogic.chooseArm(true, java.util.List.of(), ALBUM, 0, false, copies()));
    }

    @Test public void aDisabledStartNeverArms() {
        assertNull(AudioFirstLogic.chooseArm(false, java.util.List.of("atv1"), ALBUM, 1, false,
                copies("atv0", "atv1", "atv2", "atv3")));
    }

    @Test public void theVideoModesDeclineTheSwap() {
        assertTrue(AudioFirstLogic.declineForVideo("OMV_PREFERRED", "id", null, 0, 2_000, TTL, false));
        assertTrue(AudioFirstLogic.declineForVideo(USER_VIDEO, "id", "id", 1_000, 2_000, TTL, false));
    }

    @Test public void theAudioModesAllowTheSwap() {
        assertFalse(AudioFirstLogic.declineForVideo("ATV_PREFERRED", "id", null, 0, 2_000, TTL, false));
        assertFalse(AudioFirstLogic.declineForVideo("ATV_PREFERRED_USER_TRIGGERED", "id", null, 0, 2_000, TTL, false));
        assertFalse(AudioFirstLogic.declineForVideo("DONT_PLAY_VIDEO_OVERRIDE", "id", null, 0, 2_000, TTL, false));
    }

    @Test public void anUnknownModeDeclinesTheSwap() {
        assertTrue(AudioFirstLogic.declineForVideo(null, "id", "id", 1_000, 2_000, TTL, false));
    }

    @Test public void theSongAJustArmedTapIsSwitchingToAudioIsNotDeclined() {
        assertFalse(AudioFirstLogic.declineForVideo("OMV_PREFERRED", "id", "id", 1_000, 2_000, TTL, false));
        assertTrue(AudioFirstLogic.declineForVideo("OMV_PREFERRED", "id", "other", 1_000, 2_000, TTL, false));
        assertTrue(AudioFirstLogic.declineForVideo("OMV_PREFERRED", "id", "id", 1_000, 11_001, TTL, false));
    }

    @Test public void aTapTurnsEitherVideoModeIntoTheAudioMode() {
        assertEquals("ATV_PREFERRED", AudioFirstLogic.modeToSet(true, true, "OMV_PREFERRED"));
        assertEquals("ATV_PREFERRED", AudioFirstLogic.modeToSet(true, true, "OMV_PREFERRED_USER_TRIGGERED"));
    }

    @Test public void theModeIsLeftAloneInEveryOtherCase() {
        assertNull(AudioFirstLogic.modeToSet(true, true, "ATV_PREFERRED_USER_TRIGGERED"));
        assertNull(AudioFirstLogic.modeToSet(true, true, "DONT_PLAY_VIDEO_OVERRIDE"));
        assertNull(AudioFirstLogic.modeToSet(true, true, "ATV_PREFERRED"));
        assertNull(AudioFirstLogic.modeToSet(true, true, null));
        assertNull(AudioFirstLogic.modeToSet(true, false, "OMV_PREFERRED"));
        assertNull(AudioFirstLogic.modeToSet(true, false, "OMV_PREFERRED_USER_TRIGGERED"));
        assertNull(AudioFirstLogic.modeToSet(false, true, "OMV_PREFERRED"));
        assertNull(AudioFirstLogic.modeToSet(false, true, "OMV_PREFERRED_USER_TRIGGERED"));
    }

    @Test public void theHintIsAskedForEveryModeButTheDataSavingOverride() {
        assertTrue(AudioFirstLogic.hintsIn("OMV_PREFERRED"));
        assertTrue(AudioFirstLogic.hintsIn("OMV_PREFERRED_USER_TRIGGERED"));
        assertTrue(AudioFirstLogic.hintsIn("ATV_PREFERRED"));
        assertTrue(AudioFirstLogic.hintsIn(null));
        assertFalse(AudioFirstLogic.hintsIn("DONT_PLAY_VIDEO_OVERRIDE"));
    }

    @Test public void thePillsOwnValuesAreNeverChangedByTheModeForce() {
        // The setter hook only forces the video fallback; the two user-triggered values pass through.
        for (String user : new String[]{"OMV_PREFERRED_USER_TRIGGERED", "ATV_PREFERRED_USER_TRIGGERED"}) {
            assertEquals(user, AudioFirstLogic.decide(user, "id", 1_000, 1_500, TTL, false));
        }
        assertEquals("ATV_PREFERRED", AudioFirstLogic.decide("OMV_PREFERRED", "id", 1_000, 1_500, TTL, false));
        assertEquals("OMV_PREFERRED", AudioFirstLogic.decide("OMV_PREFERRED", null, 1_000, 1_500, TTL, false));
    }

    @Test public void theAudioModesAreTheOnesStockTreatsAsAudio() {
        assertTrue(AudioFirstLogic.isAudioMode("ATV_PREFERRED"));
        assertTrue(AudioFirstLogic.isAudioMode("ATV_PREFERRED_USER_TRIGGERED"));
        assertTrue(AudioFirstLogic.isAudioMode("DONT_PLAY_VIDEO_OVERRIDE"));
        assertFalse(AudioFirstLogic.isAudioMode("OMV_PREFERRED"));
        assertFalse(AudioFirstLogic.isAudioMode("OMV_PREFERRED_USER_TRIGGERED"));
        assertFalse(AudioFirstLogic.isAudioMode(null));
    }

    @Test public void theUsersVideoChoiceFoundByTheTapIsNotDeclinedUntilTheModeChanges() {
        // Tap in the user's Video, the direct set has not run yet: the first player request of the armed song swaps.
        assertFalse(AudioFirstLogic.declineForVideo(USER_VIDEO, "id", "id", 1_000, 1_500, TTL, true));
        // The user presses the toggle after the tap: a mode was set, the choice is new and wins.
        assertTrue(AudioFirstLogic.declineForVideo(USER_VIDEO, "id", "id", 1_000, 1_500, TTL, false));
        // Another song, or an expired arm, never swaps in the video mode.
        assertTrue(AudioFirstLogic.declineForVideo(USER_VIDEO, "id", "x", 1_000, 1_500, TTL, true));
        assertTrue(AudioFirstLogic.declineForVideo(USER_VIDEO, "id", "id", 1_000, 11_001, TTL, true));
        assertTrue(AudioFirstLogic.declineForVideo(USER_VIDEO, "id", null, 0, 1_500, TTL, true));
    }

    @Test
    public void queueItemShowsTheSongOnlyInAnAudioModeWithACopy() {
        assertTrue(AudioFirstLogic.showsSong(true, "ATV_PREFERRED", true));
        assertTrue(AudioFirstLogic.showsSong(true, "ATV_PREFERRED_USER_TRIGGERED", true));
        assertTrue(AudioFirstLogic.showsSong(true, "DONT_PLAY_VIDEO_OVERRIDE", true));
    }

    @Test
    public void queueItemShowsTheVideoInAVideoModeOrWithoutACopyOrWhenOff() {
        assertFalse(AudioFirstLogic.showsSong(true, "OMV_PREFERRED", true));
        assertFalse(AudioFirstLogic.showsSong(true, "OMV_PREFERRED_USER_TRIGGERED", true));
        assertFalse(AudioFirstLogic.showsSong(true, null, true));
        assertFalse(AudioFirstLogic.showsSong(true, "ATV_PREFERRED", false));
        assertFalse(AudioFirstLogic.showsSong(false, "ATV_PREFERRED", true));
    }

    @Test
    public void queueStartsAtTheFirstItemKnownByAWantedId() {
        List<List<String>> items = List.of(List.of("v0", "s0"), List.of("v1", "s1"), List.of("v2", "s2"));

        assertEquals(2, AudioFirstLogic.queueStart(0, items, List.of("s2", "v2")));
        assertEquals(1, AudioFirstLogic.queueStart(0, items, List.of("v1")));
        assertEquals(0, AudioFirstLogic.queueStart(0, items, List.of("s0")));
    }

    @Test
    public void queueKeepsTheAppsStartWhenNoItemIsKnownByAWantedId() {
        List<List<String>> items = List.of(List.of("v0", "s0"), List.of(), List.of("v2", "s2"));

        assertEquals(1, AudioFirstLogic.queueStart(1, items, List.of("other")));
        assertEquals(-1, AudioFirstLogic.queueStart(-1, items, List.of()));
        assertEquals(0, AudioFirstLogic.queueStart(0, List.of(), List.of("s0")));
    }

    @Test
    public void theAppsCopyOfAnItemsSongRendererIsStillTheSong() {
        assertEquals("song", AudioFirstLogic.renderedAs("lYBUbBu4W08", "lYBUbBu4W08", "dQw4w9WgXcQ"));
        assertEquals("video", AudioFirstLogic.renderedAs("dQw4w9WgXcQ", "lYBUbBu4W08", "dQw4w9WgXcQ"));
        assertEquals("other", AudioFirstLogic.renderedAs("BeyEGebJ1l4", "lYBUbBu4W08", "dQw4w9WgXcQ"));
        assertEquals("other", AudioFirstLogic.renderedAs(null, "lYBUbBu4W08", "dQw4w9WgXcQ"));
    }

    @Test
    public void pillLooksTheQueuesCurrentItemUpBeforeThePlayedId() {
        assertEquals("queue-current", AudioFirstLogic.lookupSource(true, false));
        assertEquals("played-id", AudioFirstLogic.lookupSource(false, true));
        assertEquals("none", AudioFirstLogic.lookupSource(false, false));
    }

    private static final String OMV = "dQw4w9WgXcQ";
    private static final String PLAY_ALBUM = "OLAK5uy_nmDUsWOMoEcz0SsVqUwir0oxu-k1oUyXE";

    /** The queue of the album's play button, as the device log shows it: tracked first item, answered online. */
    private static AudioFirstLogic.QueueStart playQueue() {
        return start("ATV_PREFERRED", OMV, 127, PLAY_ALBUM, 0, 0);
    }

    private static AudioFirstLogic.QueueStart start(String mode, String onlineId, long onlineAge, String playlist,
                                                    int playlistIndex, int position) {
        return new AudioFirstLogic.QueueStart(true, true, mode, onlineId, onlineAge, OMV, playlist, playlistIndex,
                position, false, false, false, Long.MAX_VALUE, Long.MAX_VALUE, null);
    }

    private static AudioFirstLogic.QueueStart with(AudioFirstLogic.QueueStart q, boolean tracked, boolean enabled,
                                                   boolean handled, boolean tap, boolean aloneNow, long sincePill,
                                                   long sinceCorrected, String corrected) {
        return new AudioFirstLogic.QueueStart(tracked, enabled, q.mode(), q.onlineVideoId(), q.onlineAgeMillis(),
                q.videoId(), q.playlistId(), q.playlistIndex(), q.position(), handled, tap, aloneNow, sincePill,
                sinceCorrected, corrected);
    }

    @Test
    public void thePlayQueueOfADownloadedAlbumIsRestartedOnItsSong() {
        assertNull(AudioFirstLogic.correctiveDecline(playQueue()));
        assertNull(AudioFirstLogic.correctiveDecline(start("OMV_PREFERRED", OMV, 2_999, PLAY_ALBUM, 0, 0)));
        assertNull(AudioFirstLogic.correctiveDecline(start("ATV_PREFERRED_USER_TRIGGERED", OMV, 10, PLAY_ALBUM, 0, 0)));
    }

    @Test
    public void aQueueWithoutATrackedCurrentItemOrTheFeatureIsLeftAlone() {
        AudioFirstLogic.QueueStart q = playQueue();
        assertEquals("not-tracked", AudioFirstLogic.correctiveDecline(
                with(q, false, true, false, false, false, Long.MAX_VALUE, Long.MAX_VALUE, null)));
        assertEquals("disabled", AudioFirstLogic.correctiveDecline(
                with(q, true, false, false, false, false, Long.MAX_VALUE, Long.MAX_VALUE, null)));
    }

    @Test
    public void onlyAnOnlineAnswerForTheSameVideoJustNowCounts() {
        assertEquals("no-online", AudioFirstLogic.correctiveDecline(start("ATV_PREFERRED", null, 0, PLAY_ALBUM, 0, 0)));
        assertEquals("no-online", AudioFirstLogic.correctiveDecline(
                start("ATV_PREFERRED", "BeyEGebJ1l4", 100, PLAY_ALBUM, 0, 0)));
        assertEquals("online-too-old", AudioFirstLogic.correctiveDecline(
                start("ATV_PREFERRED", OMV, 3_001, PLAY_ALBUM, 0, 0)));
    }

    @Test
    public void aVideoTheUserChoseAndTheDataSavingModeAreNeverChanged() {
        assertEquals("user-video", AudioFirstLogic.correctiveDecline(start(USER_VIDEO, OMV, 100, PLAY_ALBUM, 0, 0)));
        assertEquals("data-saving", AudioFirstLogic.correctiveDecline(
                start("DONT_PLAY_VIDEO_OVERRIDE", OMV, 100, PLAY_ALBUM, 0, 0)));
        assertEquals("mode-unknown", AudioFirstLogic.correctiveDecline(start(null, OMV, 100, PLAY_ALBUM, 0, 0)));
    }

    @Test
    public void radioAndShuffledQueuesAreNeverRestarted() {
        assertEquals("radio", AudioFirstLogic.correctiveDecline(
                start("ATV_PREFERRED", OMV, 100, "RDAMPLOLAK5uy_x", 0, 0)));
        assertEquals("radio", AudioFirstLogic.correctiveDecline(
                start("ATV_PREFERRED", OMV, 100, "RDAMVM" + OMV, 0, 0)));
        assertEquals("shuffled", AudioFirstLogic.correctiveDecline(start("ATV_PREFERRED", OMV, 100, PLAY_ALBUM, 6, 0)));
    }

    @Test
    public void aQueueIsRestartedOnceAndNeverAfterATapOrThePill() {
        AudioFirstLogic.QueueStart q = playQueue();
        assertEquals("queue-handled", AudioFirstLogic.correctiveDecline(
                with(q, true, true, true, false, false, Long.MAX_VALUE, Long.MAX_VALUE, null)));
        assertEquals("tap-start", AudioFirstLogic.correctiveDecline(
                with(q, true, true, false, true, false, Long.MAX_VALUE, Long.MAX_VALUE, null)));
        assertEquals("navigation-running", AudioFirstLogic.correctiveDecline(
                with(q, true, true, false, false, true, Long.MAX_VALUE, Long.MAX_VALUE, null)));
        assertEquals("pill-press", AudioFirstLogic.correctiveDecline(
                with(q, true, true, false, false, false, 9_999, Long.MAX_VALUE, null)));
        assertNull(AudioFirstLogic.correctiveDecline(
                with(q, true, true, false, false, false, 10_000, Long.MAX_VALUE, null)));
    }

    @Test
    public void theSameVideoIsNotRestartedTwiceWithinTenSeconds() {
        AudioFirstLogic.QueueStart q = playQueue();
        assertEquals("repeated", AudioFirstLogic.correctiveDecline(
                with(q, true, true, false, false, false, Long.MAX_VALUE, 9_999, OMV)));
        assertNull(AudioFirstLogic.correctiveDecline(
                with(q, true, true, false, false, false, Long.MAX_VALUE, 10_000, OMV)));
        assertNull(AudioFirstLogic.correctiveDecline(
                with(q, true, true, false, false, false, Long.MAX_VALUE, 100, "BeyEGebJ1l4")));
    }

    @Test
    public void onlyTheCommonDeclinesAreQuiet() {
        for (String quiet : new String[]{"not-tracked", "disabled", "tap-start", "no-online"}) {
            assertTrue(AudioFirstLogic.isQuietDecline(quiet));
        }
        assertFalse(AudioFirstLogic.isQuietDecline("online-too-old"));
        assertFalse(AudioFirstLogic.isQuietDecline("shuffled"));
    }

    @Test
    public void queueItemsAreTrackedOnlyWithTheSettingAndTheStreamCopies() {
        assertTrue(AudioFirstLogic.tracksItems(true, true));
        assertFalse(AudioFirstLogic.tracksItems(false, true));
        assertFalse(AudioFirstLogic.tracksItems(true, false));
        assertFalse(AudioFirstLogic.tracksItems(false, false));
    }

    @Test
    public void aSwitchedOffFeatureGivesTheOriginalRendererBackInAnyMode() {
        for (String mode : new String[]{"ATV_PREFERRED", "ATV_PREFERRED_USER_TRIGGERED", "OMV_PREFERRED", null}) {
            boolean enabled = AudioFirstLogic.tracksItems(false, true);
            assertFalse(AudioFirstLogic.showsSong(enabled, mode, true));
        }
    }

    @Test
    public void pillGoesToTheVideoFromAnAudioModeAndToTheAudioOtherwise() {
        assertEquals("OMV_PREFERRED_USER_TRIGGERED", AudioFirstLogic.pillTarget("ATV_PREFERRED"));
        assertEquals("OMV_PREFERRED_USER_TRIGGERED", AudioFirstLogic.pillTarget("ATV_PREFERRED_USER_TRIGGERED"));
        assertEquals("ATV_PREFERRED_USER_TRIGGERED", AudioFirstLogic.pillTarget("OMV_PREFERRED"));
        assertEquals("ATV_PREFERRED_USER_TRIGGERED", AudioFirstLogic.pillTarget("OMV_PREFERRED_USER_TRIGGERED"));
        assertEquals("ATV_PREFERRED_USER_TRIGGERED", AudioFirstLogic.pillTarget(null));
    }

    @Test public void theSongDisplayTurnsTheAppsVideoFallbackIntoTheSongMode() {
        assertEquals("ATV_PREFERRED", AudioFirstLogic.decide("OMV_PREFERRED", null, 0, 99_000, TTL, true));
        assertEquals("OMV_PREFERRED", AudioFirstLogic.decide("OMV_PREFERRED", null, 0, 99_000, TTL, false));
        assertEquals("OMV_PREFERRED_USER_TRIGGERED",
                AudioFirstLogic.decide("OMV_PREFERRED_USER_TRIGGERED", null, 0, 99_000, TTL, true));
        assertEquals("ATV_PREFERRED_USER_TRIGGERED",
                AudioFirstLogic.decide("ATV_PREFERRED_USER_TRIGGERED", null, 0, 99_000, TTL, true));
    }

    @Test public void theUsersPillPressDecidesWhetherTheSongDisplayHolds() {
        assertTrue(AudioFirstLogic.songPreferredAfterMode(false, "ATV_PREFERRED_USER_TRIGGERED"));
        assertFalse(AudioFirstLogic.songPreferredAfterMode(true, "OMV_PREFERRED_USER_TRIGGERED"));
        // The app's own resets and the data-saving override neither start nor end it.
        assertTrue(AudioFirstLogic.songPreferredAfterMode(true, "OMV_PREFERRED"));
        assertFalse(AudioFirstLogic.songPreferredAfterMode(false, "ATV_PREFERRED"));
        assertTrue(AudioFirstLogic.songPreferredAfterMode(true, "DONT_PLAY_VIDEO_OVERRIDE"));
        assertTrue(AudioFirstLogic.songPreferredAfterMode(true, null));
    }

    @Test public void aTapTiedToACopyStartsTheSongDisplayAndAFreshOtherSelectionEndsIt() {
        assertTrue(AudioFirstLogic.songPreferredAfterTap(false, true, false));
        assertTrue(AudioFirstLogic.songPreferredAfterTap(false, true, true));
        // The queue moving on to the next video copy keeps the display; with no Song display it starts none.
        assertTrue(AudioFirstLogic.songPreferredAfterTap(true, false, true));
        assertFalse(AudioFirstLogic.songPreferredAfterTap(false, false, true));
        assertFalse(AudioFirstLogic.songPreferredAfterTap(true, false, false));
    }

    @Test public void aRowWhoseMusicVideoHasACopyKeepsItsItem() {
        assertTrue(AudioFirstLogic.keepsVideoItem("omv", "omv"::equals));
        assertFalse(AudioFirstLogic.keepsVideoItem("atv", "omv"::equals));
        assertFalse(AudioFirstLogic.keepsVideoItem(null, id -> true));
    }

    @Test public void theSongOfAVideoCopyStartsAsItsMusicVideo() {
        // The ids of the device album: song lYBUbBu4W08, music video dQw4w9WgXcQ; the others have no video copy.
        java.util.Map<String, String> videos = java.util.Map.of("dQw4w9WgXcQ", "lYBUbBu4W08");

        assertEquals("dQw4w9WgXcQ", AudioFirstLogic.startItemFor("lYBUbBu4W08", videos));
        assertNull(AudioFirstLogic.startItemFor("dQw4w9WgXcQ", videos));
        assertNull(AudioFirstLogic.startItemFor("h9ba3KgHguc", videos));
        assertNull(AudioFirstLogic.startItemFor("lYBUbBu4W08", java.util.Map.of()));
        assertNull(AudioFirstLogic.startItemFor(null, videos));
    }

    @Test public void aTapRightAfterAnAndroidAutoRequestIsLeftToTheCar() {
        assertTrue(AudioFirstLogic.duringAndroidAutoStart(11_000, 10_000));
        assertTrue(AudioFirstLogic.duringAndroidAutoStart(13_000, 10_000));
        assertFalse(AudioFirstLogic.duringAndroidAutoStart(13_001, 10_000));
        assertFalse(AudioFirstLogic.duringAndroidAutoStart(11_000, 0));
    }
}
