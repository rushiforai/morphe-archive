package dev.jason.gboardpatches.extension.swipedismiss;

import org.junit.Assert;
import org.junit.Test;

public final class GboardSwipeDownDismissGestureStateTest {
    @Test
    public void keyboardBodyAndHeaderEdgesAreExcluded() {
        Assert.assertTrue(GboardSwipeDownDismissGestureState.isHeaderStart(
                450f, 1685f, 0, 1621, 1220, 132));
        Assert.assertFalse(GboardSwipeDownDismissGestureState.isHeaderStart(
                965f, 2530f, 0, 1621, 1220, 132));
        Assert.assertFalse(GboardSwipeDownDismissGestureState.isHeaderStart(
                450f, 1753f, 0, 1621, 1220, 132));
        Assert.assertFalse(GboardSwipeDownDismissGestureState.isHeaderStart(
                1220f, 1685f, 0, 1621, 1220, 132));
        Assert.assertFalse(GboardSwipeDownDismissGestureState.isHeaderStart(
                0f, 0f, 0, 0, 0, 132));
    }

    @Test
    public void settingDefaultsOff() {
        Assert.assertFalse(GboardSwipeDownDismissSettings.DEFAULT_ENABLED);
    }

    @Test
    public void clearDownwardSwipeFromHeaderIsConsumed() {
        GboardSwipeDownDismissGestureState state = new GboardSwipeDownDismissGestureState();
        state.begin(true, 100f, 20f, 0, 8f, 500);

        Assert.assertFalse(state.move(106f, 60f, 1f, 100));
        Assert.assertTrue(state.move(108f, 70f, 1f, 200));
        Assert.assertTrue(state.isConsumed());
    }

    @Test
    public void gestureOutsideHeaderIsIgnored() {
        GboardSwipeDownDismissGestureState state = new GboardSwipeDownDismissGestureState();
        state.begin(false, 100f, 20f, 0, 8f, 500);

        Assert.assertFalse(state.move(100f, 100f, 1f, 100));
        Assert.assertFalse(state.isConsumed());
    }

    @Test
    public void horizontalSuggestionScrollIsRejected() {
        GboardSwipeDownDismissGestureState state = new GboardSwipeDownDismissGestureState();
        state.begin(true, 100f, 20f, 0, 8f, 500);

        Assert.assertFalse(state.move(130f, 24f, 1f, 100));
        Assert.assertFalse(state.move(132f, 100f, 1f, 200));
        Assert.assertFalse(state.isConsumed());
    }

    @Test
    public void diagonalMovementMustBePredominantlyDownward() {
        GboardSwipeDownDismissGestureState state = new GboardSwipeDownDismissGestureState();
        state.begin(true, 100f, 20f, 0, 8f, 500);

        Assert.assertFalse(state.move(150f, 70f, 1f, 100));
        Assert.assertFalse(state.isConsumed());
    }

    @Test
    public void longPressThenDragToDeleteIsIgnoredUntilNextTouch() {
        GboardSwipeDownDismissGestureState state = new GboardSwipeDownDismissGestureState();
        state.begin(true, 100f, 20f, 1000, 8f, 500);

        Assert.assertFalse(state.move(103f, 23f, 1f, 1400));
        Assert.assertFalse(state.move(100f, 100f, 1f, 1500));
        Assert.assertFalse(state.move(100f, 180f, 1f, 1700));
        Assert.assertFalse(state.isConsumed());

        state.begin(true, 100f, 20f, 2000, 8f, 500);
        Assert.assertTrue(state.move(100f, 100f, 1f, 2100));
    }

    @Test
    public void slowSwipeThatStartedMovingBeforeLongPressStillDismisses() {
        GboardSwipeDownDismissGestureState state = new GboardSwipeDownDismissGestureState();
        state.begin(true, 100f, 20f, 0, 8f, 500);

        Assert.assertFalse(state.move(100f, 35f, 1f, 200));
        Assert.assertTrue(state.move(100f, 80f, 1f, 700));
    }

    @Test
    public void horizontalScrollCannotBecomeDismissSwipe() {
        GboardSwipeDownDismissGestureState state = new GboardSwipeDownDismissGestureState();
        state.begin(true, 100f, 20f, 0, 8f, 500);

        Assert.assertFalse(state.move(110f, 20f, 1f, 100));
        Assert.assertFalse(state.move(110f, 100f, 1f, 200));
        Assert.assertFalse(state.isConsumed());
    }

    @Test
    public void upwardGestureCannotBecomeDismissSwipe() {
        GboardSwipeDownDismissGestureState state = new GboardSwipeDownDismissGestureState();
        state.begin(true, 100f, 20f, 0, 8f, 500);

        Assert.assertFalse(state.move(100f, 10f, 1f, 100));
        Assert.assertFalse(state.move(100f, 100f, 1f, 200));
        Assert.assertFalse(state.isConsumed());
    }
}
