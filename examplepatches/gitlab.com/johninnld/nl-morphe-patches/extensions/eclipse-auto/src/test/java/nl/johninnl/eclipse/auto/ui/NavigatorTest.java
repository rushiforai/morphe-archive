package nl.johninnl.eclipse.auto.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class NavigatorTest {
    @Test public void aSixthScreenFirstPopsToTheRoot() {
        assertEquals(5, Navigator.STACK_LIMIT);
        for (int size = 0; size < 5; size++) assertFalse("size " + size, Navigator.mustResetBeforePush(size));
        assertTrue(Navigator.mustResetBeforePush(5));
        assertTrue(Navigator.mustResetBeforePush(6));
    }
}
