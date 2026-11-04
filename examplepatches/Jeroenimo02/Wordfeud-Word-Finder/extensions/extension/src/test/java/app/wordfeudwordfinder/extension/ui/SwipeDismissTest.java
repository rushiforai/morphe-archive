package app.wordfeudwordfinder.extension.ui;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class SwipeDismissTest {
    private static final int SLOP = 16;
    private static final int HEIGHT = 2000;
    private static final float FLING = 100f;

    @Test
    public void smallMovementWithinSlopNeverDismisses() {
        assertFalse(SwipeDismiss.shouldDismiss(10, 5000f, SLOP, HEIGHT, FLING));
    }

    @Test
    public void upwardSwipeNeverDismisses() {
        assertFalse(SwipeDismiss.shouldDismiss(-600, -5000f, SLOP, HEIGHT, FLING));
    }

    @Test
    public void fastDownwardFlingDismisses() {
        assertTrue(SwipeDismiss.shouldDismiss(60, 800f, SLOP, HEIGHT, FLING));
    }

    @Test
    public void slowShortDragSnapsBack() {
        assertFalse(SwipeDismiss.shouldDismiss(60, 20f, SLOP, HEIGHT, FLING));
    }

    @Test
    public void longSlowDragDismisses() {
        // A quarter of the panel height or more.
        assertTrue(SwipeDismiss.shouldDismiss(500, 0f, SLOP, HEIGHT, FLING));
        assertFalse(SwipeDismiss.shouldDismiss(499, 0f, SLOP, HEIGHT, FLING));
    }

    @Test
    public void fastFlingThatEndsMovingUpDoesNotDismiss() {
        assertFalse(SwipeDismiss.shouldDismiss(60, -800f, SLOP, HEIGHT, FLING));
    }

    @Test
    public void dragOffsetIsClampedToDownward() {
        org.junit.Assert.assertEquals(0f, SwipeDismiss.dragOffset(-40f), 0f);
        org.junit.Assert.assertEquals(40f, SwipeDismiss.dragOffset(40f), 0f);
    }
}
