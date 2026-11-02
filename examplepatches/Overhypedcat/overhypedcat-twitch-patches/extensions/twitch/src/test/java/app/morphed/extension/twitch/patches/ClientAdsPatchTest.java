package app.morphed.extension.twitch.patches;

import org.junit.Test;

import java.util.LinkedHashSet;
import java.util.Set;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class ClientAdsPatchTest {
    /** Shaped like the app's obfuscated reasons enum. */
    enum Reason { VAST_AD_API_ERROR, VAST_AD_INELIGIBLE_TURBO, VAST_AD_INELIGIBLE_PIP }

    /** The same enum after a future version renamed the Turbo reason. */
    enum RenamedReason { API_ERROR, SOMETHING_ELSE }

    enum Empty {}

    @Test
    public void addsTheTurboReason() {
        Set<Object> reasons = new LinkedHashSet<>();
        reasons.add(Reason.VAST_AD_INELIGIBLE_PIP);

        ClientAdsPatch.markIneligible(reasons, Reason.class);

        assertTrue(reasons.contains(Reason.VAST_AD_INELIGIBLE_TURBO));
        assertEquals(2, reasons.size());
    }

    @Test
    public void anyReasonWhenTurboIsGoneStillMakesTheViewerIneligible() {
        Set<Object> reasons = new LinkedHashSet<>();

        ClientAdsPatch.markIneligible(reasons, RenamedReason.class);

        assertEquals(1, reasons.size());
    }

    @Test
    public void readsTheFullCheckResult() {
        Set<Object> onlyOurs = new LinkedHashSet<>();
        onlyOurs.add(Reason.VAST_AD_INELIGIBLE_TURBO);
        Set<Object> notOurs = new LinkedHashSet<>();
        notOurs.add(Reason.VAST_AD_INELIGIBLE_PIP);

        assertTrue(ClientAdsPatch.containsTurboReason(onlyOurs));
        assertFalse(ClientAdsPatch.containsTurboReason(notOurs));
        // Other cases of the app's shared return pass anything; none of it may throw.
        ClientAdsPatch.onEligibilityDecided("not a set");
        ClientAdsPatch.onEligibilityDecided(null);
        ClientAdsPatch.onEligibilityDecided(onlyOurs);
    }

    @Test
    public void notAnEnumChangesNothingAndDoesNotThrow() {
        Set<Object> reasons = new LinkedHashSet<>();

        ClientAdsPatch.markIneligible(reasons, String.class);
        ClientAdsPatch.markIneligible(reasons, Empty.class);
        ClientAdsPatch.markIneligible(reasons, null);

        assertTrue(reasons.isEmpty());
    }
}
