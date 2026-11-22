package app.voidhack.extension.applemusic;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class GlassPlayerGestureTest {
    private final GlassPlayerGesture gesture = new GlassPlayerGesture(8f, 1f);

    @Before public void down() {
        gesture.start(1000, 100, 500, 200);
    }

    @Test public void tapAndLongPressStayWithTheControl() {
        move(12, 3, 4);
        move(600, 4, 5);
        assertFalse(gesture.wantsDrag());
        assertFalse(gesture.shouldCollapse());
    }

    @Test public void horizontalAndUpwardMotionDoNotStartTheDismissGesture() {
        move(30, 55, 10);
        assertFalse(gesture.wantsDrag());
        move(60, 1, -50);
        assertFalse(gesture.wantsDrag());
        assertEquals(0, gesture.dragDistance());
    }

    @Test public void horizontalDriftCanTurnIntoADownwardThumbSwipe() {
        move(12, 12, 2);
        assertFalse(gesture.wantsDrag());
        move(75, 22, 20);
        assertTrue(gesture.wantsDrag());
        move(160, 40, 47);
        assertTrue(gesture.shouldCollapse());
    }

    @Test public void diagonalDragTracksTotalDownwardTravelFromTheOriginalTouch() {
        move(16, -3, 5);
        assertFalse(gesture.wantsDrag());
        move(46, -15, 14);
        assertTrue(gesture.wantsDrag());
        assertEquals(14, gesture.dragDistance());
        move(77, -23, 27);
        assertEquals(27, gesture.dragDistance());
    }

    @Test public void theFirstPostSlopSampleCanBeTheRelease() {
        move(10, -5, 6);
        assertFalse(gesture.wantsDrag());
        move(25, -12, 15);
        assertTrue(gesture.wantsDrag());
        assertTrue(gesture.shouldCollapse());
    }

    @Test public void aFlingLateInAHeldTouchUsesRecentSamples() {
        move(800, 0, 1);
        move(825, 5, 8);
        move(850, 13, 21);
        assertTrue(gesture.wantsDrag());
        assertTrue(gesture.shouldCollapse());
    }

    @Test public void aShortFlickSurvivesASmallLiftOffBounce() {
        move(10, 0, 3);
        move(26, -8, 23);
        move(37, -10, 21);
        assertTrue(gesture.shouldCollapse());
    }

    @Test public void pausedShortDragsAndSlowSmallMovesReturnToExpanded() {
        move(25, 0, 20);
        assertTrue(gesture.shouldCollapse());
        move(300, 0, 20);
        assertFalse(gesture.shouldCollapse());
        move(410, 0, 29);
        assertFalse(gesture.shouldCollapse());
    }

    @Test public void fortyDpOfNetTravelCanCollapseWithoutFlinging() {
        move(225, 0, 16);
        move(400, 0, 40);
        move(600, 0, 40);
        assertTrue(gesture.shouldCollapse());
    }

    @Test public void aShortDeliberateDragNearTheBottomCanCollapseWithoutFlinging() {
        gesture.start(1000, 100, 500, 28);
        move(140, 2, 10);
        assertTrue(gesture.wantsDrag());
        assertFalse(gesture.shouldCollapse());
        move(280, 4, 20);
        assertTrue(gesture.shouldCollapse());
    }

    @Test public void theBottomEdgeStillRequiresClearDownwardTravel() {
        gesture.start(1000, 100, 500, 10);
        move(160, 0, 12);
        assertTrue(gesture.wantsDrag());
        assertFalse(gesture.shouldCollapse());
    }

    @Test public void upwardReversalKeepsThePlayerOpenEvenWithLargeNetTravel() {
        move(30, 0, 30);
        move(60, 0, 95);
        move(75, 0, 80);
        assertFalse(gesture.shouldCollapse());
        move(100, 0, 4);
        assertEquals(4, gesture.dragDistance());
        assertFalse(gesture.shouldCollapse());
    }

    @Test public void draggingDownAgainAfterReversalCanCommit() {
        move(60, 0, 60);
        move(85, 0, 19);
        assertFalse(gesture.shouldCollapse());
        move(200, 0, 63);
        assertTrue(gesture.shouldCollapse());
    }

    @Test public void releaseThresholdsScaleWithDensity() {
        GlassPlayerGesture dense = new GlassPlayerGesture(16, 2);
        dense.start(1000, 0, 0, 200);
        dense.sample(1200, 0, 45);
        assertTrue(dense.wantsDrag());
        assertFalse(dense.shouldCollapse());
        dense.sample(1400, 0, 81);
        assertTrue(dense.shouldCollapse());
    }

    @Test public void duplicateTimesAndReusedTrackerKeepOnlyTheCurrentGesture() {
        move(50, 0, 35);
        move(50, 0, 38);
        assertTrue(gesture.shouldCollapse());
        gesture.start(1200, 50, 750, 200);
        gesture.sample(1199, 50, 950);
        gesture.sample(1210, 54, 755);
        assertEquals(5, gesture.dragDistance());
        assertFalse(gesture.wantsDrag());
        assertFalse(gesture.shouldCollapse());
    }

    @Test public void manyBatchedSamplesKeepTheLatestVelocityWindow() {
        for (int i = 1; i <= 60; i++) move(i * 4, 0, i * 2);
        assertEquals(120, gesture.dragDistance());
        assertTrue(gesture.shouldCollapse());
        move(255, 0, 112);
        assertFalse(gesture.shouldCollapse());
    }

    private void move(long elapsed, float dx, float dy) {
        gesture.sample(1000 + elapsed, 100 + dx, 500 + dy);
    }
}
