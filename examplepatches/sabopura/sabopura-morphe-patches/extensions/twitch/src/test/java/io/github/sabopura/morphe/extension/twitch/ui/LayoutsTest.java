package io.github.sabopura.morphe.extension.twitch.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** Narrow phones, the Fold7's cover and inner displays, and both rotations of each. */
public class LayoutsTest {
    private static final int[][] PORTRAIT = {
            {320, 640}, {344, 882}, {360, 800}, {412, 919}, {600, 960}, {673, 842}, {800, 1280}};

    @Test
    public void portraitUsesTheSheetAndRotationUsesTheSidePanel() {
        for (int[] size : PORTRAIT) {
            assertFalse(size[0] + "x" + size[1], Layouts.sidePanel(size[0], size[1]));
            assertTrue(size[1] + "x" + size[0], Layouts.sidePanel(size[1], size[0]));
        }
    }

    @Test
    public void sheetLeavesTheVideoVisibleInEveryPortraitSize() {
        int topInset = 24;
        for (int[] size : PORTRAIT) {
            int video = size[0] * 9 / 16;
            int sheet = Layouts.sheetMaxHeight(size[0], size[1], topInset);
            int left = size[1] - topInset - sheet;
            assertTrue(size[0] + "x" + size[1] + " leaves " + left, left >= video || sheet == 300);
            assertTrue("the sheet never exceeds the window", sheet <= size[1] - topInset);
        }
    }

    @Test
    public void panelFitsTheWindow() {
        for (int[] size : PORTRAIT) {
            assertTrue(Layouts.panelWidth(size[0], size[1]) <= size[0]);
            assertTrue(Layouts.panelWidth(size[1], size[0]) <= size[1]);
        }
        assertEquals(360, Layouts.panelWidth(360, 800));
        assertEquals(640, Layouts.panelWidth(800, 1280));
        assertEquals(400, Layouts.panelWidth(842, 673));
    }

    @Test
    public void twoPaneOnlyWhenTheRailLeavesTheOptionsRoom() {
        assertFalse(Layouts.twoPane(360));
        assertFalse(Layouts.twoPane(599));
        assertTrue(Layouts.twoPane(600));
        assertTrue(Layouts.twoPane(842));
        for (int width = 600; width <= 1280; width += 40) {
            int rail = Layouts.railWidth(width);
            assertTrue(width + " rail " + rail, rail >= 240 && rail <= 300);
            assertTrue("options keep their width", width - rail >= 300);
        }
    }

    @Test
    public void samplePinsOnlyInATallWindow() {
        assertTrue(Layouts.pinSample(800));
        assertTrue(Layouts.pinSample(600));
        assertFalse("a phone in landscape", Layouts.pinSample(411));
        assertFalse(Layouts.pinSample(599));
    }

    @Test
    public void menuColumnsFollowTheContentWidth() {
        assertEquals(3, Layouts.menuColumns(320, 3));
        assertEquals(3, Layouts.menuColumns(320, 6));
        assertEquals(3, Layouts.menuColumns(320, 5));
        assertEquals("four tiles make two full rows on a phone", 2, Layouts.menuColumns(320, 4));
        assertEquals(2, Layouts.menuColumns(320, 2));
        assertEquals(1, Layouts.menuColumns(320, 1));
        assertEquals(1, Layouts.menuColumns(320, 0));
        assertEquals(4, Layouts.menuColumns(600, 8));
        assertEquals(3, Layouts.menuColumns(600, 6));
        assertEquals(4, Layouts.menuColumns(600, 4));
    }

    @Test
    public void tapeOnlyWhereThereIsRoom() {
        assertFalse(Layouts.tapeFits(360, 800));
        assertTrue(Layouts.tapeFits(800, 360));
        assertTrue(Layouts.tapeFits(600, 960));
    }

    @Test
    public void aSheetWithTheKeyboardUpStopsAtTheTopOfTheWindow() {
        // No keyboard: the content's own limit plus the navigation bar.
        assertEquals(1500 + 48, Layouts.sheetPanelMax(1500, 48, 2316, 94));
        // Keyboard up (bottom inset 950): content limit + inset would be 2450, taller than the window.
        assertEquals(2316 - 94, Layouts.sheetPanelMax(1500, 950, 2316, 94));
        assertEquals(0, Layouts.sheetPanelMax(1500, 0, 50, 94));
    }
}
