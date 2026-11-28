package app.morphed.extension.twitch.adblock;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** Each problem says what kind it is: only a change on Twitch's side calls for an update. */
public class ProblemTest {
    @Test
    public void onlyTwitchsChangesAreCalledUpdates() {
        assertEquals("Ad blocker needs an update", Problem.UNRECOGNIZED_AD_MARKERS.heading);
        assertEquals("Ad blocker needs an update", Problem.UNRECOGNIZED_PLAYLIST.heading);
        assertEquals("Ad blocker needs an update", Problem.CLIENT_ADS_NOT_BLOCKED.heading);
        assertFalse("the network or Twitch refusing", Problem.BACKUPS_UNAVAILABLE.heading.contains("update"));
        assertFalse(Problem.PROCESSING_FAILED.heading.contains("update"));
        assertFalse(Problem.LABEL_FAILED.heading.contains("update"));
        for (Problem p : Problem.values()) assertTrue(p.code.startsWith("E") && !p.description.isEmpty());
    }
}
