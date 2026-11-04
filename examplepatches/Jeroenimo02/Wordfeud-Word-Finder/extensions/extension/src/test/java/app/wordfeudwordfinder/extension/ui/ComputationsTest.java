package app.wordfeudwordfinder.extension.ui;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertTrue;

import java.util.concurrent.atomic.AtomicBoolean;
import org.junit.Test;

public class ComputationsTest {

    @Test
    public void beginCancelsThePreviousComputation() {
        Computations c = new Computations();
        AtomicBoolean first = c.begin();
        assertFalse(first.get());
        assertTrue(c.isCurrent(first));
        AtomicBoolean second = c.begin();
        assertNotSame(first, second);
        assertTrue("previous token is cancelled", first.get());
        assertFalse(second.get());
        assertFalse(c.isCurrent(first));
        assertTrue(c.isCurrent(second));
    }

    @Test
    public void cancelStopsTheCurrentComputation() {
        Computations c = new Computations();
        AtomicBoolean t = c.begin();
        c.cancel();
        assertTrue(t.get());
        assertFalse(c.isCurrent(t));
    }

    @Test
    public void cancelledTokenIsNeverCurrentEvenWithoutANewBegin() {
        Computations c = new Computations();
        AtomicBoolean t = c.begin();
        t.set(true);
        assertFalse(c.isCurrent(t));
    }

    @Test
    public void nullIsNeverCurrent() {
        Computations c = new Computations();
        assertFalse(c.isCurrent(null));
        c.begin();
        assertFalse(c.isCurrent(null));
    }

    @Test
    public void cancelWithoutBeginIsHarmless() {
        new Computations().cancel();
    }
}
