package io.github.sabopura.morphe.extension.twitch.danmaku;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.Assert.*;

public class VodReplayTest {
    private static final String VOD = "2001234567";

    /** One delivery from Twitch's chat list: the comments of one second, at a content and wall time. */
    private static List<String> deliver(VodReplay replay, double now, long wallMs, int second, String... ids) {
        replay.moveTo(VOD, now, wallMs);
        List<String> flowed = new ArrayList<>();
        for (String id : ids) if (replay.admit(id, second, now)) flowed.add(id);
        return flowed;
    }

    @Test
    public void normalPlaybackFlowsEachSecondAsPlaybackReachesIt() {
        VodReplay replay = new VodReplay();
        assertTrue("a new VOD starts over", replay.moveTo(VOD, 100.4, 0));
        for (int second = 100; second <= 105; second++) {
            double now = second + 0.4;
            long wall = (second - 100) * 1000L;
            assertFalse(replay.moveTo(VOD, now, wall));
            assertTrue(replay.admit("a" + second, second, now));
            assertTrue(replay.admit("b" + second, second, now));
        }
    }

    @Test
    public void aCommentDeliveredTwiceFlowsOnce() {
        VodReplay replay = new VodReplay();
        assertEquals(Arrays.asList("x", "y"), deliver(replay, 100.4, 0, 100, "x", "y"));
        // 31.9.0 refills its list with the current second's comments; pages also overlap.
        assertEquals(Collections.emptyList(), deliver(replay, 100.9, 500, 100, "x", "y"));
        assertEquals(Arrays.asList("z"), deliver(replay, 101.3, 900, 101, "y", "z"));
    }

    @Test
    public void aLongPauseIsNotASeek() {
        VodReplay replay = new VodReplay();
        deliver(replay, 100.4, 0, 100, "x");
        assertFalse(replay.moveTo(VOD, 101.2, 600_000));
        assertTrue(replay.admit("y", 101, 101.2));
    }

    @Test
    public void seekingForwardDropsWhatWasStillOnItsWay() {
        VodReplay replay = new VodReplay();
        deliver(replay, 100.4, 0, 100, "x");
        assertTrue(replay.moveTo(VOD, 700.3, 800));
        assertFalse("a page asked for before the seek", replay.admit("late", 101, 700.3));
        assertTrue(replay.admit("new", 700, 700.3));
    }

    @Test
    public void seekingBackFlowsTheRewatchedPartAgainButNothingBeforeIt() {
        VodReplay replay = new VodReplay();
        for (int second = 100; second <= 110; second++) deliver(replay, second + 0.4, (second - 100) * 1000L, second, "c" + second);
        assertTrue(replay.moveTo(VOD, 103.2, 11_000));
        assertTrue(replay.admit("c103", 103, 103.2));
        assertFalse("before the new position", replay.admit("c102", 102, 103.2));
        assertFalse(replay.moveTo(VOD, 104.3, 12_100));
        assertTrue(replay.admit("c104", 104, 104.3));
        assertFalse("still once per pass", replay.admit("c104", 104, 104.8));
    }

    @Test
    public void fasterPlaybackIsNotASeekAndSpreadsFaster() {
        VodReplay replay = new VodReplay();
        deliver(replay, 100.2, 0, 100, "x");
        for (int step = 1; step <= 6; step++) {
            assertFalse(replay.moveTo(VOD, 100.2 + step, step * 500L));
            assertTrue(replay.admit("c" + step, 100 + step, 100.2 + step));
        }
        assertEquals(500, VodReplay.delayMillis(100, 1, 2, 100.2, 1f));
        assertEquals(333, VodReplay.delayMillis(100, 1, 2, 100.2, 1.5f));
        assertEquals(250, VodReplay.delayMillis(100, 1, 2, 100.2, 2f));
    }

    @Test
    public void aPageThatArrivesLateStillFlowsButNotOnceItIsStale() {
        VodReplay replay = new VodReplay();
        replay.moveTo(VOD, 102.5, 0);
        assertTrue(replay.admit("late", 100, 102.5));
        assertFalse(replay.admit("stale", 100, 103.5));
        assertFalse("not ahead of the video", replay.admit("ahead", 104, 102.5));
    }

    @Test
    public void theChatOffsetShiftsWhichSecondIsDue() {
        assertEquals(100.4, VodReplay.contentSeconds(95_400, 5), 1e-9);
        assertEquals(90.4, VodReplay.contentSeconds(95_400, -5), 1e-9);
        VodReplay replay = new VodReplay();
        double now = VodReplay.contentSeconds(95_400, 5);
        replay.moveTo(VOD, now, 0);
        assertTrue(replay.admit("x", 100, now));
        assertFalse("the second the video shows, without the offset", replay.admit("y", 95, now));
    }

    @Test
    public void aNegativeOffsetHoldsTheStartWhichTwitchKeepsDelivering() {
        VodReplay replay = new VodReplay();
        for (long position = 0; position <= 9_000; position += 1_000) {
            double now = VodReplay.contentSeconds(position, -10);
            assertEquals(0, now, 0);
            assertEquals(position == 0 ? Arrays.asList("first") : Collections.emptyList(), deliver(replay, now, position, 0, "first"));
        }
    }

    @Test
    public void commentsFromElsewhereInTheVodDoNotFlow() {
        // A clip plays its VOD's replay from the clip's place in the VOD, not from the clip's position.
        VodReplay replay = new VodReplay();
        replay.moveTo(VOD, 12.4, 0);
        assertFalse(replay.admit("clip", 3612, 12.4));
    }

    @Test
    public void anotherVodStartsOver() {
        VodReplay replay = new VodReplay();
        deliver(replay, 100.4, 0, 100, "x");
        assertTrue(replay.moveTo("2009999999", 100.4, 1_000));
        assertTrue(replay.admit("x", 100, 100.4));
    }

    @Test
    public void aSecondsCommentsAreSpreadOverThatSecond() {
        assertEquals(0, VodReplay.delayMillis(100, 0, 4, 100.3, 1f));
        assertEquals(250, VodReplay.delayMillis(100, 1, 4, 100.3, 1f));
        assertEquals(750, VodReplay.delayMillis(100, 3, 4, 100.3, 1f));
        assertEquals("one that came early waits for its second", 400, VodReplay.delayMillis(101, 0, 1, 100.6, 1f));
    }
}
