package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import org.junit.Test;

/** Plain JUnit: no Android runner, clock, threads or timers. */
public class CaptionGlyphTransitionTest {
    @Test public void risingStepHasAnExactEndpointAndNoFurtherFrame() {
        CaptionGlyphTransition state = new CaptionGlyphTransition();
        assertFalse(state.noteTarget(40f));
        assertTrue(state.noteTarget(80f));
        assertTrue(state.advance(0)); assertEquals(40f, state.displayedPx(), 0f);
        assertTrue(state.advance(90_000_000)); assertEquals(60f, state.displayedPx(), 0f);
        assertFalse(state.advance(180_000_000)); assertEquals(80f, state.displayedPx(), 0f);
        assertFalse(state.advance(400_000_000));
    }

    @Test public void theTwoPercentComparisonsHaveDifferentReferences() {
        CaptionGlyphTransition state = new CaptionGlyphTransition();
        assertFalse(state.noteTarget(50f));
        assertFalse(state.noteTarget(51f)); assertEquals(51f, state.displayedPx(), 0f);
        assertTrue(state.noteTarget(100f)); assertTrue(state.advance(0));
        assertTrue(state.noteTarget(102f)); // close to destination: retain the destination 100
        assertFalse(state.advance(180_000_000)); assertEquals(100f, state.displayedPx(), 0f);
        assertTrue(state.noteTarget(50f)); assertTrue(state.advance(200_000_000));
        assertTrue(state.advance(290_000_000)); assertEquals(75f, state.displayedPx(), 0f);
        assertFalse(state.noteTarget(76f)); // close to displayed value: cancel the destination 50
        assertFalse(state.advance(380_000_000)); assertEquals(76f, state.displayedPx(), 0f);
    }

    @Test public void invalidTargetsAndResetSettleRetainTheirOriginalRules() {
        CaptionGlyphTransition state = new CaptionGlyphTransition();
        assertFalse(state.noteTarget(Float.NaN)); assertFalse(state.noteTarget(-1f));
        assertFalse(state.advance(0)); assertEquals(0f, state.displayedPx(), 0f);
        state.noteTarget(40f); state.noteTarget(80f); state.settle();
        assertEquals(80f, state.displayedPx(), 0f); assertFalse(state.advance(0));
        state.noteTarget(40f); state.advance(0); state.reset();
        assertEquals(0f, state.displayedPx(), 0f); assertFalse(state.advance(180_000_000));
    }
}
