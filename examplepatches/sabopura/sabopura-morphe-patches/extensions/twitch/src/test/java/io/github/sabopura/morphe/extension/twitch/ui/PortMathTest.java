package io.github.sabopura.morphe.extension.twitch.ui;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class PortMathTest {
    @Test
    public void rubberIsFreeThenFlattensBelowTheMaximum() {
        float max = 14;
        assertEquals(0, PortMath.rubber(0, max), 0);
        float small = PortMath.rubber(2, max);
        assertTrue("free at first", small > 0 && small < 2);
        assertTrue("never past the maximum", PortMath.rubber(1000, max) <= max);
        assertTrue("monotonic", PortMath.rubber(30, max) > PortMath.rubber(10, max));
        assertEquals("symmetric", PortMath.rubber(10, max), PortMath.rubber(-10, max), 1e-3f);
    }

    @Test
    public void pullThinsThePillAndSquashFattensIt() {
        assertTrue(PortMath.rubberThin(14, 14) < 1);
        assertTrue(PortMath.rubberThin(-14, 14) > 1);
        assertEquals(1, PortMath.rubberThin(0, 14), 0);
    }

    @Test
    public void dialReadsTheMinuteUnderTheFinger() {
        assertEquals(30, PortMath.minuteAt(100, 0, 60, 120));
        assertEquals(60, PortMath.minuteAt(0, 100, 60, 120));
        assertEquals(90, PortMath.minuteAt(-100, 0, 60, 120));
    }

    @Test
    public void dialCannotWrapAcrossTheSeam() {
        assertEquals("from high it stops at the end", 120, PortMath.minuteAt(1, -100, 118, 120));
        assertEquals("from low it holds at one", 1, PortMath.minuteAt(-1, -100, 3, 120));
        assertEquals("a jump over half the dial holds", 120, PortMath.minuteAt(100, 0, 119, 120));
    }

    @Test
    public void sheetFollowsDownMoreThanUp() {
        assertEquals(70, PortMath.sheetFollow(100), 1e-3f);
        assertEquals(-4, PortMath.sheetFollow(-100), 1e-3f);
    }

    @Test
    public void sheetClosesPastThresholdOrOnFling() {
        assertTrue(PortMath.sheetCloses(81, 0));
        assertTrue(PortMath.sheetCloses(10, 600));
        assertFalse(PortMath.sheetCloses(79, 499));
    }

    @Test
    public void noticeStaysAtLeastTheDesignedTimeAndIsCapped() {
        assertEquals(1200, PortMath.noticeMillis(2));
        assertTrue(PortMath.noticeMillis(30) > 1200);
        assertEquals(4000, PortMath.noticeMillis(500));
    }

    @Test
    public void hapticOnlyOnArrivingAtTheMark() {
        assertTrue(PortMath.landedOn(29, 30, 30));
        assertFalse(PortMath.landedOn(30, 30, 30));
        assertFalse(PortMath.landedOn(30, 31, 30));
    }

    @Test
    public void jellySpringIsUnderDampedByItsBounce() {
        float c = PortMath.damping(580, .9f, .25f);
        assertEquals(2 * Math.sqrt(580 * .9f) * .75f, c, 1e-3f);
    }

    @Test
    public void titleJoinsASentenceButAnAcronymKeepsItsCapitals() {
        assertEquals("text size", PortMath.lowerFirst("Text size"));
        assertEquals("VOD speed", PortMath.lowerFirst("VOD speed"));
        assertEquals("x", PortMath.lowerFirst("X"));
        assertEquals("", PortMath.lowerFirst(""));
    }

    @Test
    public void undoWaitsForAScreenReaderAndForTheUsersTimeout() {
        assertEquals(1000 + 5000, PortMath.undoDeadline(1000, 5000, 5000, false));
        assertEquals("a longer accessibility timeout wins", 1000 + 30000, PortMath.undoDeadline(1000, 5000, 30000, false));
        assertEquals("never shorter than the grace", 1000 + 5000, PortMath.undoDeadline(1000, 5000, 100, false));
        assertEquals("no deadline while exploring by touch", Long.MAX_VALUE, PortMath.undoDeadline(1000, 5000, 5000, true));
    }

    @Test
    public void slidersTakeLeftRightAndPlusMinusButLeaveUpDownToFocus() {
        assertEquals(-1, PortMath.keyStep(android.view.KeyEvent.KEYCODE_DPAD_LEFT));
        assertEquals(1, PortMath.keyStep(android.view.KeyEvent.KEYCODE_DPAD_RIGHT));
        assertEquals(1, PortMath.keyStep(android.view.KeyEvent.KEYCODE_PLUS));
        assertEquals(-1, PortMath.keyStep(android.view.KeyEvent.KEYCODE_MINUS));
        assertEquals(0, PortMath.keyStep(android.view.KeyEvent.KEYCODE_DPAD_UP));
        assertEquals(0, PortMath.keyStep(android.view.KeyEvent.KEYCODE_DPAD_DOWN));
        assertEquals(0, PortMath.keyStep(android.view.KeyEvent.KEYCODE_DPAD_CENTER));
    }

    @Test
    public void talkBackScrollActionsStepASlider() {
        assertEquals(1, PortMath.actionStep(android.view.accessibility.AccessibilityNodeInfo.ACTION_SCROLL_FORWARD));
        assertEquals(-1, PortMath.actionStep(android.view.accessibility.AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD));
        assertEquals(0, PortMath.actionStep(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK));
    }

    @Test
    public void rateReadsWithoutTrailingZeros() {
        assertEquals("1", PortMath.rateText(1f));
        assertEquals("1.5", PortMath.rateText(1.5f));
        assertEquals("1.25", PortMath.rateText(1.25f));
        assertEquals("0.3", PortMath.rateText(.3f));
        assertEquals("2", PortMath.rateText(2f));
    }

    @Test
    public void heldRowLandsInTheNearestSlotInsideTheList() {
        assertEquals(0, PortMath.slotAt(-80, 50, 5));
        assertEquals(1, PortMath.slotAt(60, 50, 5));
        assertEquals(2, PortMath.slotAt(76, 50, 5));
        assertEquals(4, PortMath.slotAt(900, 50, 5));
    }

    @Test
    public void reorderPutsTheRowAtItsSlotAndKeepsTheOthersInOrder() {
        int[] order = {0, 1, 2, 3};
        assertArrayEquals(new int[]{1, 2, 0, 3}, PortMath.reorder(order, 0, 2));
        assertArrayEquals(new int[]{3, 0, 1, 2}, PortMath.reorder(order, 3, 0));
        assertArrayEquals(new int[]{0, 2, 3, 1}, PortMath.reorder(order, 1, 3));
        assertArrayEquals(order, PortMath.reorder(order, 2, 2));
    }

    @Test
    public void heldRowScrollsTheListOnlyNearAnEdgeAndFasterDeeperIn() {
        assertEquals(0, PortMath.edgeScroll(300, 100, 500, 50, 900), 0);
        assertTrue("up near the top", PortMath.edgeScroll(120, 100, 500, 50, 900) < 0);
        assertTrue("down near the bottom", PortMath.edgeScroll(480, 100, 500, 50, 900) > 0);
        assertTrue("deeper is faster", PortMath.edgeScroll(495, 100, 500, 50, 900) > PortMath.edgeScroll(460, 100, 500, 50, 900));
        assertEquals("capped past the edge", 900, PortMath.edgeScroll(700, 100, 500, 50, 900), 0);
        assertEquals("a list too short for two bands never scrolls", 0, PortMath.edgeScroll(105, 100, 180, 50, 900), 0);
    }

    @Test
    public void dialWidensForALargeClockButNotPastTheRow() {
        assertEquals("the usual size when the clock fits", 176, PortMath.dialSide(80, .67f, 176, 300));
        assertEquals("wider for a large font", 238, PortMath.dialSide(159, .67f, 176, 300));
        assertEquals("never past the row", 204, PortMath.dialSide(159, .67f, 176, 204));
        assertEquals("never under the least", 176, PortMath.dialSide(159, .67f, 176, 100));
    }
}
