package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Replays the September 29 failed startup block without contacting a provider. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class RebuildN14StartupStateTest {
  @Test public void unresolvedBlockDoesNotChangePhaseJustBecauseItRetries() {
    // Frozen diagnostic: pending at 1790668012459, retry at 1790668020806,
    // semantic failure at 1790668026295, then block 2 caption at 1790668029975.
    int[] states = {RebuildController.RUNNING, RebuildController.WAITING,
        RebuildController.RUNNING, RebuildController.FAILED, RebuildController.READY};
    String rejection = "semantic_anchor_leak";
    String previous = null;
    int changes = 0;
    for (int state : states) {
      String phase = RebuildController.unresolvedPhase(state, rejection);
      if (previous != null && !previous.equals(phase)) changes++;
      if (state == RebuildController.WAITING) assertEquals("pending_translation", phase);
      if (state == RebuildController.FAILED) assertEquals("failed:" + rejection, phase);
      previous = phase;
    }
    assertTrue("pending -> failed -> caption; no separate retry phase", changes <= 2);
    assertEquals("final caption remains ready", RebuildController.READY, states[states.length - 1]);
    assertEquals("", previous);
  }
}
