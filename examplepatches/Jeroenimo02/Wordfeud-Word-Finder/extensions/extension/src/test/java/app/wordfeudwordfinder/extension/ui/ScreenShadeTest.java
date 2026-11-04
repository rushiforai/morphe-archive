package app.wordfeudwordfinder.extension.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import org.junit.Test;

public class ScreenShadeTest {
    private static int[] col(int n, int c) {
        int[] a = new int[n];
        Arrays.fill(a, c);
        return a;
    }

    @Test public void plainBackgroundLeavesTheButtonUntouched() {
        assertTrue(ScreenShade.analyse(col(40, 0xD0D5DB), ScreenShade.PAGE_LIGHT, 1.0).untouched(40));
        assertTrue(ScreenShade.analyse(col(40, 0xCED3D9), ScreenShade.PAGE_LIGHT, 1.0).untouched(40));
        assertTrue(ScreenShade.analyse(col(40, 0x343B45), ScreenShade.PAGE_DARK, 1.0).untouched(40));
    }

    @Test public void scrimMeasuredOnTheAppBar() {
        ScreenShade sh = new ScreenShade();
        assertEquals(1.0, sh.scrim(0xDEE3E7), 1e-9);
        assertEquals(0.46, sh.scrim(0x67686A), 0.03); // measured light app bar under the scrim
        sh.resetScrim();
        assertEquals(1.0, sh.scrim(0x67686A), 1e-9);
        ScreenShade black = new ScreenShade();
        assertEquals(1.0, black.scrim(0x050505), 1e-9);
    }

    @Test public void scrimDimsWithoutCutting() {
        ScreenShade.Cover c = ScreenShade.analyse(col(40, 0x5E6265), ScreenShade.PAGE_LIGHT, 0.46);
        assertEquals(40, c.visibleRows);
        assertEquals(0.46, c.factor, 0.01);
        c = ScreenShade.analyse(col(40, 0x181B20), ScreenShade.PAGE_DARK, 0.46); // measured dark page under scrim
        assertEquals(40, c.visibleRows);
    }

    @Test public void sheetCutsFromItsTopEdge() {
        int[] a = col(40, 0x5E6265);
        for (int i = 25; i < 40; i++) a[i] = 0xE6EBEF; // measured light sheet
        assertEquals(25, ScreenShade.analyse(a, ScreenShade.PAGE_LIGHT, 0.46).visibleRows);
        // Measured dark sheet: close to the dark page at 82%, but not at the app bar's scrim.
        int[] d = col(40, 0x181B20);
        for (int i = 3; i < 40; i++) d[i] = 0x2C3137;
        assertEquals(3, ScreenShade.analyse(d, ScreenShade.PAGE_DARK, 0.46).visibleRows);
        assertEquals(0, ScreenShade.analyse(col(40, 0x2C3137), ScreenShade.PAGE_DARK, 0.46).visibleRows);
    }

    @Test public void otherColoursCover() {
        assertEquals(0, ScreenShade.analyse(col(10, 0x2F7DE1), ScreenShade.PAGE_LIGHT, 1.0).visibleRows);
        assertEquals(0, ScreenShade.analyse(col(10, 0x404751), ScreenShade.PAGE_DARK, 1.0).visibleRows);
        assertNull(ScreenShade.analyse(new int[0], ScreenShade.PAGE_LIGHT, 1.0));
        assertNull(ScreenShade.analyse(null, ScreenShade.PAGE_LIGHT, 1.0));
    }

    @Test public void boardShadeFromSampledRow() {
        int[] light = col(30, 0xC6D1D7);
        light[3] = 0xF2EFEA; // tile
        light[4] = 0xB51823; // TW
        assertEquals(Boolean.FALSE, ScreenShade.boardDark(light));
        int[] dark = col(30, 0x2A2D32);
        for (int i = 0; i < 10; i++) dark[i] = 0x181A1E; // gaps
        assertEquals(Boolean.TRUE, ScreenShade.boardDark(dark));
        assertNull(ScreenShade.boardDark(col(30, 0x5A5F62)));
        assertNull(ScreenShade.boardDark(null));
    }

    @Test public void areaFollowsARoundedMenuEdge() {
        int w = 10;
        int h = 20;
        int[] px = new int[w * h];
        for (int x = 0; x < w; x++) {
            int edge = x < 6 ? 8 : 8 + (x - 5) * 2; // flat top, then a rounded corner going down
            for (int y = 0; y < h; y++) px[y * w + x] = y < edge ? 0x181B20 : 0x2C3137;
        }
        ScreenShade.Cover c = ScreenShade.analyseArea(px, w, h, ScreenShade.PAGE_DARK, 0.46, 1);
        assertEquals(8, c.visibleRows);
        assertEquals(8, c.rowsAt(0));
        assertEquals(16, c.rowsAt(9));
        assertFalse(c.untouched(h));
    }

    @Test public void areaIsNeverCutWithoutScrim() {
        assertTrue(ScreenShade.analyseArea(col(200, 0xD0D5DB), 10, 20, ScreenShade.PAGE_LIGHT, 1.0, 2).untouched(20));
        ScreenShade.Cover open = ScreenShade.analyseArea(col(200, 0x5E6265), 10, 20, ScreenShade.PAGE_LIGHT, 0.46, 2);
        assertEquals(Integer.MAX_VALUE, open.visibleRows);
        assertEquals(0.46, open.factor, 0.01);
    }

    /** A rack row as measured: tiles across the width with bar colour at the ends and small gaps. */
    private static int[] rackRow(int tile, int bar) {
        int[] r = col(40, tile);
        r[0] = bar;
        r[39] = bar;
        r[12] = 0x2F3237;
        return r;
    }

    @Test public void rackTilesMeanTheGameScreen() {
        int[] page = col(200, 0x343B45);
        // Measured rack rows: dark theme, light theme (new tiles) and light theme.
        assertFalse(ScreenShade.analyseArea(page, 10, 20, ScreenShade.PAGE_DARK, 1.0, 2,
                rackRow(0xF1EEE9, 0x232429)).elsewhere);
        assertFalse(ScreenShade.analyseArea(page, 10, 20, ScreenShade.PAGE_LIGHT, 1.0, 2,
                rackRow(0xFFF8F0, 0xDEE3E7)).elsewhere);
        // Zoomed in: the board lies under the button, the rack is still there.
        int[] board = col(200, 0x2A2D32);
        ScreenShade.Cover zoomed = ScreenShade.analyseArea(board, 10, 20, ScreenShade.PAGE_DARK, 1.0, 2,
                rackRow(0xF1EEE9, 0x232429));
        assertFalse(zoomed.elsewhere);
        assertTrue(zoomed.untouched(20));
        // One tile left (1 of 7).
        int[] one = col(40, 0x232429);
        for (int i = 0; i < 5; i++) one[i + 2] = 0xF1EEE9;
        assertTrue(ScreenShade.rackVisible(one));
    }

    @Test public void otherPagesHaveNoRack() {
        int[] page = col(200, 0x343B45);
        // Measured: chat (all background), history at move 0 (page), history list (highlighted row with text).
        assertTrue(ScreenShade.analyseArea(page, 10, 20, ScreenShade.PAGE_DARK, 1.0, 2, col(40, 0x232429)).elsewhere);
        assertTrue(ScreenShade.analyseArea(page, 10, 20, ScreenShade.PAGE_DARK, 1.0, 2, col(40, 0x343B45)).elsewhere);
        int[] list = col(40, 0x455467);
        list[6] = 0xAA9F83;
        list[7] = 0xC3C3C3;
        list[14] = 0xEDF2F6;
        list[20] = 0xEDF2F8;
        list[24] = 0xEEF2F5;
        assertTrue(ScreenShade.analyseArea(page, 10, 20, ScreenShade.PAGE_DARK, 1.0, 2, list).elsewhere);
        // The light rack bar alone is not a tile.
        assertTrue(ScreenShade.analyseArea(page, 10, 20, ScreenShade.PAGE_LIGHT, 1.0, 2, col(40, 0xDEE3E7)).elsewhere);
        // No rack row known: no check.
        assertFalse(ScreenShade.analyseArea(page, 10, 20, ScreenShade.PAGE_DARK, 1.0, 2, null).elsewhere);
    }
}
