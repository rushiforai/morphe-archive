package nl.johninnl.deezer.auth;

import org.junit.Test;
import static org.junit.Assert.*;

public final class ConsentAttemptTest {
    @Test public void silentCompletionDoesNotLaunchOrAcceptAnActivityResult() {
        ConsentAttempt attempt = new ConsentAttempt();
        assertTrue(attempt.isPrepared());
        assertFalse(attempt.beginLaunch(0x4000)); // No foreground user decision yet.
        assertFalse(attempt.matchesResult(0x4000));
        assertTrue(attempt.finish());
        assertFalse(attempt.finish());
        assertFalse(attempt.offerResolution());
    }

    @Test public void onlyTheMatchingOutstandingActivityResultCanComplete() {
        ConsentAttempt attempt = new ConsentAttempt();
        assertTrue(attempt.offerResolution());
        assertTrue(attempt.needsDecision());
        assertFalse(attempt.offerResolution());
        assertFalse(attempt.matchesResult(123));
        assertTrue(attempt.beginLaunch(123));
        assertFalse(attempt.needsDecision());
        assertFalse(attempt.matchesResult(124));
        assertTrue(attempt.matchesResult(123));
        assertFalse(attempt.beginLaunch(123));
        assertTrue(attempt.finish());
        assertFalse(attempt.matchesResult(123));
    }

    @Test public void cancellingAtAnyStagePreventsLateResultsOrRelaunch() {
        for (int stage = 0; stage < 3; stage++) {
            ConsentAttempt attempt = new ConsentAttempt();
            if (stage > 0) assertTrue(attempt.offerResolution());
            if (stage > 1) assertTrue(attempt.beginLaunch(42));
            assertTrue(attempt.finish());
            assertFalse(attempt.isActive());
            assertFalse(attempt.matchesResult(42));
            assertFalse(attempt.offerResolution());
            assertFalse(attempt.beginLaunch(42));
            assertFalse(attempt.finish());
        }
    }

    @Test public void retainedRequestStateDoesNotRestartTheLaunch() {
        ConsentAttempt retained = new ConsentAttempt();
        assertTrue(retained.offerResolution());
        assertTrue(retained.beginLaunch(0x4000));
        // The retained fragment keeps this same process-local state across rotation.
        assertFalse(retained.isPrepared());
        assertFalse(retained.needsDecision());
        assertFalse(retained.beginLaunch(0x4000));
        assertTrue(retained.matchesResult(0x4000));
        // A process-restored fragment has no Request; a fresh attempt accepts no old result.
        assertFalse(new ConsentAttempt().matchesResult(0x4000));
    }

    @Test public void requestCodesNeverWrapIntoAReusableOrInvalidCode() {
        ConsentAttempt attempt = new ConsentAttempt();
        assertTrue(attempt.offerResolution());
        assertFalse(attempt.beginLaunch(-1));
        assertFalse(attempt.beginLaunch(0x10000));
        assertTrue(attempt.needsDecision());
        assertTrue(attempt.beginLaunch(0xffff));
    }
}
