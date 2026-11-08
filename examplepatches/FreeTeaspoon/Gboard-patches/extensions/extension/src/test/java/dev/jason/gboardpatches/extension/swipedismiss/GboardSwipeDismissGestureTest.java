package dev.jason.gboardpatches.extension.swipedismiss;

import org.junit.Assert;
import org.junit.Test;

public final class GboardSwipeDismissGestureTest {
    @Test
    public void onlyVisibleHeaderStartCanDismiss() {
        Assert.assertTrue(GboardSwipeDismissGesture.isHeaderStart(
                450f, 1685f, 0, 1621, 1220, 1753));
        Assert.assertFalse(GboardSwipeDismissGesture.isHeaderStart(
                965f, 2530f, 0, 1621, 1220, 1753));
        Assert.assertFalse(GboardSwipeDismissGesture.isHeaderStart(
                450f, 1620f, 0, 1621, 1220, 1753));
    }

    @Test
    public void deleteKeyStartCannotDismiss() {
        GboardSwipeDismissGesture gesture = new GboardSwipeDismissGesture();
        gesture.begin(false, 0, 300f, 300f);

        Assert.assertFalse(gesture.move(0, 300f, 500f, 1f, 8f));
        Assert.assertFalse(gesture.isTracking());
        Assert.assertFalse(gesture.isConsumed());
    }

    @Test
    public void headerSwipeDismissesOncePastDistance() {
        GboardSwipeDismissGesture gesture = new GboardSwipeDismissGesture();
        gesture.begin(true, 0, 120f, 20f);

        Assert.assertFalse(gesture.move(0, 125f, 62f, 1f, 8f));
        Assert.assertTrue(gesture.move(0, 126f, 69f, 1f, 8f));
        Assert.assertTrue(gesture.isConsumed());
        Assert.assertFalse(gesture.move(0, 126f, 90f, 1f, 8f));
    }

    @Test
    public void horizontalCandidateScrollCannotLaterDismiss() {
        GboardSwipeDismissGesture gesture = new GboardSwipeDismissGesture();
        gesture.begin(true, 0, 100f, 20f);

        Assert.assertFalse(gesture.move(0, 140f, 24f, 1f, 8f));
        Assert.assertFalse(gesture.move(0, 140f, 100f, 1f, 8f));
        Assert.assertFalse(gesture.isConsumed());
    }

    @Test
    public void onlyOriginalPointerCanDismissAndResetEndsSession() {
        GboardSwipeDismissGesture gesture = new GboardSwipeDismissGesture();
        gesture.begin(true, 3, 100f, 20f);

        Assert.assertFalse(gesture.move(4, 100f, 100f, 1f, 8f));
        gesture.reset();
        Assert.assertFalse(gesture.move(3, 100f, 100f, 1f, 8f));
        Assert.assertFalse(gesture.isTracking());
    }

    @Test
    public void diagonalGestureNeedsPredominantlyDownwardMotion() {
        GboardSwipeDismissGesture gesture = new GboardSwipeDismissGesture();
        gesture.begin(true, 0, 100f, 20f);

        Assert.assertFalse(gesture.move(0, 150f, 72f, 1f, 8f));
        Assert.assertFalse(gesture.isConsumed());
    }

    @Test
    public void longPressStationaryBeforeDownDragCannotDismiss() {
        GboardSwipeDismissGesture gesture = new GboardSwipeDismissGesture();
        gesture.begin(true, 0, 100f, 20f, 1000L);

        // Stationary during long press (duration = 320ms >= 300ms default timeout)
        Assert.assertFalse(gesture.move(0, 101f, 21f, 1f, 8f, 1320L, 300L));
        Assert.assertFalse(gesture.isTracking());

        // Subsequent downward drag to reorder cannot dismiss
        Assert.assertFalse(gesture.move(0, 101f, 150f, 1f, 8f, 1500L, 300L));
        Assert.assertFalse(gesture.isConsumed());
    }

    @Test
    public void candidateDragDeleteUpwardMotionResetsGesture() {
        GboardSwipeDismissGesture gesture = new GboardSwipeDismissGesture();
        gesture.begin(true, 0, 100f, 100f, 1000L);

        // Moving upwards towards delete icon past touch slop
        Assert.assertFalse(gesture.move(0, 100f, 80f, 1f, 8f, 1050L, 300L));
        Assert.assertFalse(gesture.isTracking());

        // Even if finger wavers downwards later, it cannot dismiss
        Assert.assertFalse(gesture.move(0, 100f, 200f, 1f, 8f, 1200L, 300L));
        Assert.assertFalse(gesture.isConsumed());
    }

    @Test
    public void candidateDragDeleteStationaryThenWobbleDownCannotDismiss() {
        GboardSwipeDismissGesture gesture = new GboardSwipeDismissGesture();
        gesture.begin(true, 0, 100f, 20f, 1000L);

        // User long presses candidate for 350ms before dragging
        Assert.assertFalse(gesture.move(0, 102f, 22f, 1f, 8f, 1350L, 300L));
        Assert.assertFalse(gesture.isTracking());

        // User accidentally moves down first before dragging up to delete icon
        Assert.assertFalse(gesture.move(0, 102f, 90f, 1f, 8f, 1400L, 300L));
        Assert.assertFalse(gesture.isConsumed());
    }

    @Test
    public void fastSwipeWithTimestampsDismisses() {
        GboardSwipeDismissGesture gesture = new GboardSwipeDismissGesture();
        gesture.begin(true, 0, 100f, 20f, 1000L);

        // Quick downward swipe within 120ms past 48dp
        Assert.assertTrue(gesture.move(0, 104f, 75f, 1f, 8f, 1120L, 300L));
        Assert.assertTrue(gesture.isConsumed());
    }

    @Test
    public void slowLingeringDragExceedingMaxDurationCannotDismiss() {
        GboardSwipeDismissGesture gesture = new GboardSwipeDismissGesture();
        gesture.begin(true, 0, 100f, 20f, 1000L);

        // Moving down but taking longer than max swipe duration (501ms > 500ms)
        Assert.assertFalse(gesture.move(0, 102f, 80f, 1f, 8f, 1501L, 300L));
        Assert.assertFalse(gesture.isTracking());
        Assert.assertFalse(gesture.isConsumed());
    }
}
