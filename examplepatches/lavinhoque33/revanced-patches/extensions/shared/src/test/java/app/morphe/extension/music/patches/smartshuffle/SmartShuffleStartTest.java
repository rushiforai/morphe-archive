/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import org.junit.Test;

import static org.junit.Assert.*;

public class SmartShuffleStartTest {
    @Test public void pageOpenOrRestoredQueueIsNotAUserPlaybackStart() {
        SmartShuffleStart start = new SmartShuffleStart("PL-source", 5);
        assertFalse(start.matches(5, "PL-source", "restored-video"));
    }

    @Test public void explicitStartNeedsTheCommittedSourcePlaylistAndVideo() {
        SmartShuffleStart start = new SmartShuffleStart("PL-source", 5);
        start.playbackStarted("selected-video");
        assertFalse(start.matches(5, "PL-previous", "selected-video"));
        assertFalse(start.matches(5, "PL-source", "previous-video"));
        assertTrue(start.matches(5, "PL-source", "selected-video"));
    }

    @Test public void playlistSwitchOrOfflineEpochRejectsAnOldStart() {
        SmartShuffleStart start = new SmartShuffleStart("PL-source", 5);
        start.playbackStarted("video");
        assertFalse(start.matches(6, "PL-source", "video"));
    }

    @Test public void radioOrMixCannotClaimThePlaylistSession() {
        SmartShuffleStart start = new SmartShuffleStart("PL-source", 5);
        start.playbackStarted("video");
        assertFalse(start.matches(5, "RDAMPLPL-source", "video"));
        SmartShuffleStart radio = new SmartShuffleStart("RDAMPLPL-source", 5);
        radio.playbackStarted("video");
        assertFalse(radio.matches(5, "RDAMPLPL-source", "video"));
    }

    @Test public void browsePrefixNormalizationDoesNotInventRadioParams() {
        SmartShuffleStart start = new SmartShuffleStart("VLPL-source", 5);
        start.playbackStarted("video");
        assertTrue(start.matches(5, "PL-source", "video"));
        assertEquals("RDAMPLPL-source", SmartShuffleStart.normalize("RDAMPLPL-source"));
        assertEquals("", SmartShuffleStart.normalize(null));
    }

    @Test public void likedMusicStillRequiresTheSameExplicitStartHandshake() {
        SmartShuffleStart start = new SmartShuffleStart("LM", 5);
        start.playbackStarted("video");
        assertTrue(start.matches(5, "LM", "video"));
        assertFalse(start.matches(5, "PL-other", "video"));
    }
}
