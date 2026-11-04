package app.wordfeudwordfinder.extension.ui;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class FabPlacementTest {

    @Test
    public void constantsMatchSpec() {
        assertEquals(40, FabPlacement.FAB_SIZE_DP);
        assertEquals(10, FabPlacement.FAB_MARGIN_RIGHT_DP);
        assertEquals(165, FabPlacement.RACK_TOP_FROM_BOTTOM_DP);
        assertEquals(117, FabPlacement.RACK_TOP_MIN_DP);
        assertEquals(10, FabPlacement.FAB_GAP_ABOVE_RACK_DP);
    }

    @Test
    public void bottomMarginWithoutBanner() {
        // Density 2, inset 96 px (48 dp): rack top = max(330 - 96, 234) = 234 px, plus inset 96, plus gap 20 = 350.
        assertEquals(350, FabPlacement.bottomMarginPx(2f, 96, false));
        // Small inset: rack top = 330 - 48 = 282, + 48 + 20 = 350 as well (165 dp physical).
        assertEquals(350, FabPlacement.bottomMarginPx(2f, 48, false));
        // No inset: the full 165 dp + gap.
        assertEquals(175, FabPlacement.bottomMarginPx(1f, 0, false));
        // Huge inset: the 117 dp minimum applies: 117 + 200 + 10.
        assertEquals(327, FabPlacement.bottomMarginPx(1f, 200, false));
    }

    @Test
    public void bannerShiftsTheButtonUp() {
        int without = FabPlacement.bottomMarginPx(2f, 96, false);
        int with = FabPlacement.bottomMarginPx(2f, 96, true);
        assertEquals(FabPlacement.BANNER_SHIFT_DP * 2, with - without);
    }

    @Test
    public void negativeInsetCountsAsZero() {
        assertEquals(175, FabPlacement.bottomMarginPx(1f, -5, false));
    }

    @Test
    public void dpRoundsToPixels() {
        assertEquals(105, FabPlacement.dp(2.625f, 40));
        assertEquals(26, FabPlacement.dp(2.625f, 10));
        assertEquals(0, FabPlacement.dp(2f, 0));
    }

    @Test
    public void effectiveBottomInsetOnlyCountsOverlapWithTheContent() {
        // Edge-to-edge: content reaches the window bottom, so the whole inset overlaps.
        assertEquals(48, FabPlacement.effectiveBottomInset(48, 2000, 2000));
        // Content already ends above the navigation bar: nothing overlaps.
        assertEquals(0, FabPlacement.effectiveBottomInset(48, 2000, 1952));
        // Partial overlap.
        assertEquals(18, FabPlacement.effectiveBottomInset(48, 2000, 1970));
        assertEquals(0, FabPlacement.effectiveBottomInset(0, 2000, 2000));
    }

    @Test
    public void effectiveTopInsetOnlyCountsOverlapWithTheContent() {
        assertEquals(60, FabPlacement.effectiveTopInset(60, 0));
        assertEquals(0, FabPlacement.effectiveTopInset(60, 60));
        assertEquals(20, FabPlacement.effectiveTopInset(60, 40));
        assertEquals(0, FabPlacement.effectiveTopInset(60, 100));
    }
}
