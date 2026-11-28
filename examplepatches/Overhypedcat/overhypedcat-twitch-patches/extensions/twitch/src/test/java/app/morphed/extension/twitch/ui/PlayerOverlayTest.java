package app.morphed.extension.twitch.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import app.morphed.extension.twitch.musicfilter.StatusWords;

/** The screen lock's three taps, the song removal pill's words, and where both go among the player's controls. */
public class PlayerOverlayTest {
    @Test
    public void threeQuickTapsUnlock() {
        TripleTap taps = new TripleTap();
        assertEquals(1, taps.tap(1000));
        assertEquals(2, taps.tap(1300));
        assertEquals(TripleTap.NEEDED, taps.tap(1600));
        assertEquals("starts over after an unlock", 1, taps.tap(1700));
    }

    @Test
    public void aSlowTapStartsTheRowAgain() {
        TripleTap taps = new TripleTap();
        taps.tap(1000);
        taps.tap(1400);
        assertEquals("too late: a new row", 1, taps.tap(1400 + TripleTap.GAP_MS + 1));
        assertEquals(0, taps.current(1400 + 3 * TripleTap.GAP_MS));
    }

    @Test
    public void thePillShowsTheStepsFewWords() {
        SongPillText removing = SongPillText.of(StatusWords.REMOVING, 0, null, 0, 5000);
        assertEquals("Removing song", removing.text);
        assertEquals(SongPillText.Tone.REMOVING, removing.tone);
        assertEquals(-1, removing.nextTick);
        assertEquals(SongPillText.Tone.WORKING, SongPillText.of(StatusWords.LINING_UP, 0, null, 0, 0).tone);
        assertEquals("Listening", SongPillText.of(null, 0, null, 0, 0).text);
        for (String step : new String[]{StatusWords.LISTENING, StatusWords.CHECKING, StatusWords.ASKING,
                StatusWords.FINDING, StatusWords.DOWNLOADING, StatusWords.DECODING, StatusWords.LINING_UP,
                StatusWords.LOST_SYNC, StatusWords.RESTING, StatusWords.RETRYING, StatusWords.RESTARTING,
                StatusWords.WAITING}) {
            assertTrue("short enough for the row of pills: " + step, SongPillText.of(step, 0, null, 0, 0).text.length() <= 20);
        }
    }

    @Test
    public void thePillCountsDown() {
        SongPillText resting = SongPillText.of(StatusWords.RESTING, 52_000, null, 0, 0);
        assertEquals("Resting 52 s", resting.text);
        assertEquals(1005, resting.nextTick);
        assertEquals("Resting 1 s", SongPillText.of(StatusWords.RESTING, 52_000, null, 0, 51_500).text);
        assertEquals("Resting", SongPillText.of(StatusWords.RESTING, 52_000, null, 0, 52_000).text);
    }

    @Test
    public void aProblemShowsItsFewWordsNotItsSentence() {
        SongPillText problem = SongPillText.of(StatusWords.REMOVING, 0,
                StatusWords.problem("Shazam unreachable", "Shazam couldn't be asked what's playing: no internet"), 0, 0);
        assertEquals(SongPillText.Tone.PROBLEM, problem.tone);
        assertEquals("Shazam unreachable", problem.text);
        SongPillText limited = SongPillText.of(StatusWords.LISTENING, 0,
                StatusWords.problem("Shazam rate limit", "Shazam is getting too many requests"), 40_000, 0);
        assertEquals("Shazam rate limit 40 s", limited.text);
        assertTrue(SongPillText.short60(new String(new char[100]).replace('\0', 'x')).length() <= 60);
    }

    // The numbers below are Twitch 31.8.0's controls on a 1080x2400 screen.

    @Test
    public void thePillFollowsThePlayersOwnPillsWhenItFits() {
        // full screen: uptime+viewers at 147..538, the mute button at 2054
        ControlsLayout.Pill spot = ControlsLayout.pill(147, 538, 538, 74, 11, 2054, 2400, 126);
        assertTrue(spot.inRow);
        assertEquals(549, spot.left);
        assertEquals(538, spot.top);
        assertEquals("ends a gap before the next button", 2054 - 11 - 549, spot.maxWidth);
        // portrait: 11..405, mute at 850
        spot = ControlsLayout.pill(11, 644, 405, 74, 11, 850, 1080, 126);
        assertTrue(spot.inRow);
        assertEquals(416, spot.left);
        assertTrue(spot.left + 330 <= 850 - 11);
    }

    @Test
    public void aProblemStaysInThePillsRowCutShort() {
        // A long problem text: in the row all the same, as wide as the row allows (its words cut short there).
        ControlsLayout.Pill problem = ControlsLayout.pill(11, 644, 405, 74, 11, 850, 1080, 126);
        assertTrue("where the pill always is", problem.inRow);
        assertEquals(416, problem.left);
        assertEquals(644, problem.top);
        assertEquals(850 - 11 - 416, problem.maxWidth);
    }

    @Test
    public void thePillGoesAboveOnlyWhenTheRowHasNoRoomAtAll() {
        // a narrow player: the next button right after the player's pills
        ControlsLayout.Pill full = ControlsLayout.pill(11, 644, 405, 74, 11, 480, 1080, 126);
        assertFalse(full.inRow);
        assertEquals("starts where the player's pills start", 11, full.left);
        assertEquals("a gap above them", 644 - 11 - 74, full.top);
        assertEquals(1080 - 11 - 11, full.maxWidth);
        // nothing after the pills in their row: the controls' own edge bounds it
        assertTrue(ControlsLayout.pill(11, 644, 405, 74, 11, 1080, 1080, 126).inRow);
    }

    @Test
    public void onlyControlsInThePillsRowToTheirRightBoundThePill() {
        assertTrue("mute", ControlsLayout.inRowAfter(850, 628, 733, 644, 718, 405));
        assertFalse("the bottom section spans the row from its start", ControlsLayout.inRowAfter(11, 628, 733, 644, 718, 405));
        assertFalse("play/pause is above", ControlsLayout.inRowAfter(488, 387, 492, 644, 718, 405));
        assertFalse("the top row", ControlsLayout.inRowAfter(965, 147, 252, 644, 718, 405));
    }

    @Test
    public void theLockButtonTakesTheNextStepOfTheTopRow() {
        assertEquals("back at 147, fit at 263: the lock a step further", 379, ControlsLayout.lockLeft(147, 263, 105));
        assertEquals("one button only: its width and a tenth", 147 + 105 + 11, ControlsLayout.lockLeft(-1, 147, 105));
    }

    @Test
    public void bothPlayersControlsAreKnown() {
        assertTrue(PlayerOverlay.isControls("player-controls-overlay"));
        assertTrue(PlayerOverlay.isControls("skyline-controls-overlay"));
        assertFalse("the mini player has none of ours", PlayerOverlay.isControls("mini-player-controls-overlay"));
    }

    @Test
    public void theLockGoesAfterALabelInTheTopRow() {
        // buttons end at 368, row 11..116, middle 1268: an "Intended for certain audiences" label at 380..900
        assertTrue(ControlsLayout.inRowAfterButtons(380, 20, 900, 100, 368, 11, 116, 1268));
        assertFalse("the buttons themselves", ControlsLayout.inRowAfterButtons(263, 11, 368, 116, 368, 11, 116, 1268));
        assertFalse("the right-hand side", ControlsLayout.inRowAfterButtons(1879, 11, 2059, 116, 368, 11, 116, 1268));
        assertFalse("another row", ControlsLayout.inRowAfterButtons(400, 500, 900, 600, 368, 11, 116, 1268));
        assertFalse("a scrim over everything starts before the buttons",
                ControlsLayout.inRowAfterButtons(126, -10, 2411, 648, 368, 11, 116, 1268));
    }

    @Test
    public void theNativePlayersControlsAreKnownToo() {
        assertTrue("React Native", PlayerOverlay.isControls("player-controls-overlay"));
        assertTrue("its vertical view", PlayerOverlay.isControls("skyline-controls-overlay"));
        assertTrue("the native player", PlayerOverlay.isControls("player_overlay"));
        assertFalse(PlayerOverlay.isControls("player_overlay_container"));
        assertFalse(PlayerOverlay.is(null, new String[]{"back_button"}));
        assertTrue(PlayerOverlay.is("back_button", new String[]{"player-controls-back", "back_button"}));
    }

    @Test
    public void theVerticalViewsUptimeIsRecognised() {
        assertTrue(ComposeControls.isUptime("5:00:48"));
        assertTrue(ComposeControls.isUptime("12:07"));
        assertTrue(ComposeControls.isUptime(" 102:00:01 "));
        assertFalse("viewers", ComposeControls.isUptime("2K"));
        assertFalse("a chat time", ComposeControls.isUptime("22:29 he took the door off"));
        assertFalse(ComposeControls.isUptime(null));
    }

    @Test
    public void theLockHidesThePartsThatComeWithTheControls() {
        assertTrue("the channel's panel in landscape", PlayerOverlay.isControlsPart("theatre-fullbleed-metadata-band"));
        assertTrue(PlayerOverlay.isControlsPart("player-controls-scrim-backdrop"));
        assertTrue(PlayerOverlay.isControlsPart("player-controls-scrim-bleed"));
        assertTrue("the channel's name, title and buttons beside the video", PlayerOverlay.isControlsPart("channel-metadata-collapsible"));
        assertFalse("the video", PlayerOverlay.isControlsPart("video-player"));
        assertFalse("the chat beside it", PlayerOverlay.isControlsPart("theatre-chat"));
        assertFalse(PlayerOverlay.isControlsPart(null));
    }
}
