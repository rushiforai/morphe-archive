package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import app.ayham.extension.music.automix.Overview;

/** The editor's controls stay under the finger (S21 FE, 2026-11-19: a second tap hit Blend, not Rise). */
public class SteadyLayoutTest {
    @Test
    public void theSheetOnlyGrowsWhileOpen() {
        int min = 0;
        min = SteadyLayout.hold(min, 1937); // "Drag a song under the mix…" on two lines
        min = SteadyLayout.hold(min, 1894); // "Kept for these two songs." on one: 43 px shorter
        assertEquals(1937, min);
        assertEquals(2100, SteadyLayout.hold(min, 2100)); // Customize opened: it grows
    }

    @Test
    public void theFirstChipIsAsWideAsItsWidestName() {
        // by characters here; the editor measures with the chip's own paint
        assertEquals("Auto · Hand-over", SteadyLayout.widest(Overview.AUTO_NAMES, String::length));
        assertEquals(11, Overview.AUTO_NAMES.length);
    }
}
