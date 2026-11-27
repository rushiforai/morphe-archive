package dev.srwi.gintype.extension.thicctopbar;

import org.junit.Assert;
import org.junit.Test;

public final class ActiveColumnAnchorTest {

    @Test
    public void leftAnchoredKeepsLeftEdgeFixedWhileRightEdgeFits() {
        ActiveColumnAnchor anchor = new ActiveColumnAnchor();
        int barWidth = 1000;
        int colLeft = 800;

        // Anchor column's left edge at viewport X = 400
        anchor.anchorLeft(400f);

        // Grow pending word: 80px -> 150px -> 320px -> 600px (right edge reaches 1000 exactly)
        int[] widths = {80, 150, 320, 600};
        for (int w : widths) {
            int contentWidth = colLeft + w + 800; // trailing history columns after active word
            int scrollX = anchor.resolveScrollX(colLeft, colLeft + w, contentWidth, barWidth);
            Assert.assertEquals("Left edge should stay fixed at 400 for width " + w, 400, colLeft - scrollX);
            Assert.assertEquals(ActiveColumnAnchor.Mode.LEFT_ANCHORED, anchor.getMode());
        }

        // Shrink back down: 600px -> 200px (still left-anchored at 400)
        int scrollX = anchor.resolveScrollX(colLeft, colLeft + 200, colLeft + 200 + 800, barWidth);
        Assert.assertEquals(400, colLeft - scrollX);
        Assert.assertEquals(ActiveColumnAnchor.Mode.LEFT_ANCHORED, anchor.getMode());
    }

    @Test
    public void transitionsToRightClampedWhenRightEdgeOverflowsAndStaysLatched() {
        ActiveColumnAnchor anchor = new ActiveColumnAnchor();
        int barWidth = 1000;
        int colLeft = 1200;

        // Start left-anchored at viewport X = 850 (150px room to right edge)
        anchor.anchorLeft(850f);

        // 120px fits: viewport [850, 970]
        int scroll1 = anchor.resolveScrollX(colLeft, colLeft + 120, colLeft + 120 + 600, barWidth);
        Assert.assertEquals(850, colLeft - scroll1);
        Assert.assertEquals(ActiveColumnAnchor.Mode.LEFT_ANCHORED, anchor.getMode());

        // 180px overflows right edge (850 + 180 = 1030 > 1000) -> clamps to [820, 1000] and latches
        int scroll2 = anchor.resolveScrollX(colLeft, colLeft + 180, colLeft + 180 + 600, barWidth);
        Assert.assertEquals(barWidth, (colLeft + 180) - scroll2);
        Assert.assertEquals(820, colLeft - scroll2);
        Assert.assertEquals(ActiveColumnAnchor.Mode.RIGHT_CLAMPED, anchor.getMode());

        // Subsequent shrink to 100px MUST keep right edge fixed at barWidth ([900, 1000])
        int scroll3 = anchor.resolveScrollX(colLeft, colLeft + 100, colLeft + 100 + 600, barWidth);
        Assert.assertEquals(barWidth, (colLeft + 100) - scroll3);
        Assert.assertEquals(900, colLeft - scroll3);
        Assert.assertEquals(ActiveColumnAnchor.Mode.RIGHT_CLAMPED, anchor.getMode());

        // Subsequent grow to 320px MUST keep right edge fixed at barWidth ([680, 1000])
        int scroll4 = anchor.resolveScrollX(colLeft, colLeft + 320, colLeft + 320 + 600, barWidth);
        Assert.assertEquals(barWidth, (colLeft + 320) - scroll4);
        Assert.assertEquals(680, colLeft - scroll4);
        Assert.assertEquals(ActiveColumnAnchor.Mode.RIGHT_CLAMPED, anchor.getMode());
    }

    @Test
    public void multiWordProgressionFromMiddleToRightEdge() {
        ActiveColumnAnchor anchor = new ActiveColumnAnchor();
        int barWidth = 1000;
        int divider = 12;

        // Word 1 replaces selected word at viewport X = 400, grows to 200px -> [400, 600]
        int w1Left = 800;
        anchor.anchorLeft(400f);
        int scroll = anchor.resolveScrollX(w1Left, w1Left + 200, w1Left + 200 + 800, barWidth);
        Assert.assertEquals(400, w1Left - scroll);
        int w1ViewportRight = (w1Left + 200) - scroll;
        Assert.assertEquals(600, w1ViewportRight);

        // Word 2 starts after Word 1 + divider at viewport X = 612, grows from 1px -> 250px -> [612, 862]
        int w2Left = w1Left + 200 + divider;
        anchor.anchorLeft(w1ViewportRight + divider);
        int scrollW2Start = anchor.resolveScrollX(w2Left, w2Left + 1, w2Left + 1 + 800, barWidth);
        Assert.assertEquals("Word 1 must not move when Word 2 starts", scroll, scrollW2Start);
        int scrollW2End = anchor.resolveScrollX(w2Left, w2Left + 250, w2Left + 250 + 800, barWidth);
        Assert.assertEquals("Word 1 must not move while Word 2 fits", scroll, scrollW2End);
        int w2ViewportRight = (w2Left + 250) - scrollW2End;
        Assert.assertEquals(862, w2ViewportRight);

        // Word 3 starts at viewport X = 874, grows to 220px -> overflows 1000 -> latches right at [780, 1000]
        int w3Left = w2Left + 250 + divider;
        anchor.anchorLeft(w2ViewportRight + divider);
        int scrollW3 = anchor.resolveScrollX(w3Left, w3Left + 220, w3Left + 220 + 800, barWidth);
        Assert.assertEquals(barWidth, (w3Left + 220) - scrollW3);
        Assert.assertEquals(ActiveColumnAnchor.Mode.RIGHT_CLAMPED, anchor.getMode());

        // Word 4 starts after right-clamped Word 3 + divider (viewport X = 1012) -> immediately clamps right even at 1px
        int w4Left = w3Left + 220 + divider;
        anchor.anchorLeft(barWidth + divider);
        int scrollW4Start = anchor.resolveScrollX(w4Left, w4Left + 1, w4Left + 1 + 800, barWidth);
        Assert.assertEquals(barWidth, (w4Left + 1) - scrollW4Start);
        Assert.assertEquals(ActiveColumnAnchor.Mode.RIGHT_CLAMPED, anchor.getMode());
    }

    @Test
    public void nearStartOfSentenceDoesNotFalselyLatchRight() {
        ActiveColumnAnchor anchor = new ActiveColumnAnchor();
        int barWidth = 1000;
        anchor.anchorLeft(400f);

        // colLeft is 100 (< 400), so scrollX clamps to 0 and actual viewport is [100, 750] (<= 1000)
        int scroll = anchor.resolveScrollX(100, 750, 2000, barWidth);
        Assert.assertEquals(0, scroll);
        Assert.assertEquals(ActiveColumnAnchor.Mode.LEFT_ANCHORED, anchor.getMode());

        // Once colRight reaches 1050 (> 1000), it latches right at scrollX = 50
        int scrollOverflow = anchor.resolveScrollX(100, 1050, 2000, barWidth);
        Assert.assertEquals(50, scrollOverflow);
        Assert.assertEquals(ActiveColumnAnchor.Mode.RIGHT_CLAMPED, anchor.getMode());
    }

    @Test
    public void endOfSentenceRightAnchorDocksToMaxScroll() {
        ActiveColumnAnchor anchor = new ActiveColumnAnchor();
        anchor.anchorRight();
        int barWidth = 1000;
        int contentWidth = 1600;
        int scroll = anchor.resolveScrollX(1400, 1600, contentWidth, barWidth);
        Assert.assertEquals(600, scroll);
        Assert.assertEquals(ActiveColumnAnchor.Mode.RIGHT_CLAMPED, anchor.getMode());
    }

    @Test
    public void clearedMidSentenceActiveWordRetentionPolicy() {
        // Unrelated cursor jump mid-sentence (no active wheel, not MultiGlide, not live guess) -> do not retain
        Assert.assertFalse(GboardThiccTopBarRuntime.shouldRetainMidSentenceClearedActiveWord(
                "hello", null, false, false));
        Assert.assertFalse(GboardThiccTopBarRuntime.shouldRetainMidSentenceClearedActiveWord(
                "other", "hello", false, false));

        // Same word, typing forward, or backspacing on active wheel -> retain
        Assert.assertTrue(GboardThiccTopBarRuntime.shouldRetainMidSentenceClearedActiveWord(
                "hello", "hello", false, false));
        Assert.assertTrue(GboardThiccTopBarRuntime.shouldRetainMidSentenceClearedActiveWord(
                "Hello", "hello", false, false));
        Assert.assertTrue(GboardThiccTopBarRuntime.shouldRetainMidSentenceClearedActiveWord(
                "hell", "hello", false, false));
        Assert.assertTrue(GboardThiccTopBarRuntime.shouldRetainMidSentenceClearedActiveWord(
                "hellow", "hello", false, false));

        // Recent MultiGlide or active live guess -> retain even if active wheel text differed
        Assert.assertTrue(GboardThiccTopBarRuntime.shouldRetainMidSentenceClearedActiveWord(
                "swiped", null, true, false));
        Assert.assertTrue(GboardThiccTopBarRuntime.shouldRetainMidSentenceClearedActiveWord(
                "swiped", null, false, true));
    }
}
