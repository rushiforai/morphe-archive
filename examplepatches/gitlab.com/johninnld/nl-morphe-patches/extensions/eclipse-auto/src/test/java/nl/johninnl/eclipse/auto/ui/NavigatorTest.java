package nl.johninnl.eclipse.auto.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;
import org.junit.Test;

public class NavigatorTest {
    @Test public void aSixthScreenFirstPopsToTheRoot() {
        assertEquals(5, Navigator.STACK_LIMIT);
        for (int size = 0; size < 5; size++) assertFalse("size " + size, Navigator.mustResetBeforePush(size));
        assertTrue(Navigator.mustResetBeforePush(5));
        assertTrue(Navigator.mustResetBeforePush(6));
    }

    /**
     * A host opens a playing app on its Now Playing page (SHOW_MEDIA_PLAYBACK at session start).
     * Back pops the app's own stack and does nothing on its last screen, so the root page must
     * lie beneath the player: otherwise the player can never be left.
     */
    @Test public void aSessionOpenedOnThePlayerKeepsTheRootBeneathIt() {
        assertEquals(Arrays.asList("root", "player"), Navigator.startStack(true, () -> "root", () -> "player"));
    }

    @Test public void aNormalSessionStartsOnTheRootAlone() {
        assertEquals(Collections.singletonList("root"), Navigator.startStack(false, () -> "root", () -> "player"));
    }
}
