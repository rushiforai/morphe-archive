package io.github.emotionbug.patcher;

import io.github.emotionbug.patches.runtime.StartupPermissionPolicy;
import io.github.emotionbug.patches.runtime.StartupPermissionPolicy.CallState;
import org.junit.Test;
import static org.junit.Assert.*;

/** Executes the runtime policy, without Android permissions, audio or a phone call. */
public class StartupPermissionPolicyTest {
    private static StartupPermissionPolicy resumed() {
        StartupPermissionPolicy policy = new StartupPermissionPolicy();
        policy.resumed(true);
        return policy;
    }

    @Test public void initialAndPausedStatesNeverPrompt() {
        StartupPermissionPolicy policy = new StartupPermissionPolicy();
        assertEquals(-1, policy.observationToken());
        assertFalse(policy.claimRequest(-1, true, false, CallState.IDLE));
        policy.resumed(true);
        long old = policy.observationToken();
        policy.paused();
        assertFalse(policy.claimRequest(old, true, false, CallState.IDLE));
        assertFalse(policy.finished());
        policy.resumed(true);
        assertTrue(policy.claimRequest(policy.observationToken(), true, false, CallState.IDLE));
    }

    @Test public void launcherOnlyExcludesSetupAndIncomingCallScreens() {
        StartupPermissionPolicy policy = resumed();
        long launcher = policy.observationToken();
        policy.resumed(false);
        assertEquals(-1, policy.observationToken());
        assertFalse(policy.claimRequest(launcher, true, false, CallState.IDLE));
        assertFalse(policy.claimRequest(-1, true, false, CallState.IDLE));
        policy.resumed(true);
        assertTrue(policy.claimRequest(policy.observationToken(), true, false, CallState.IDLE));
    }

    @Test public void grantedPermissionNeedsNoRequestAndFinishesAutomaticSetup() {
        StartupPermissionPolicy policy = resumed();
        assertFalse(policy.claimRequest(policy.observationToken(), true, true, CallState.IDLE));
        assertTrue(policy.finished());
        policy.paused();
        policy.resumed(true);
        // A later revocation is handled by the explicit setup action, not another popup.
        assertFalse(policy.claimRequest(policy.observationToken(), true, false, CallState.IDLE));
    }

    @Test public void denialAndRequestFailureDoNotLoopAcrossCallbacksOrResumes() {
        StartupPermissionPolicy policy = resumed();
        long token = policy.observationToken();
        assertTrue(policy.claimRequest(token, true, false, CallState.IDLE));
        for (int i = 0; i < 20; i++) {
            assertFalse(policy.claimRequest(token, true, false, CallState.IDLE));
            policy.paused();
            policy.resumed(true);
            assertFalse(policy.claimRequest(policy.observationToken(), true, false, CallState.IDLE));
        }
    }

    @Test public void absentBinderDefersAndLateArrivalCanRequestOnce() {
        StartupPermissionPolicy policy = resumed();
        long token = policy.observationToken();
        for (int i = 0; i < 20; i++) assertFalse(policy.claimRequest(token, false, false, CallState.IDLE));
        assertFalse(policy.finished());
        assertTrue(policy.claimRequest(token, true, false, CallState.IDLE));
        assertFalse(policy.claimRequest(token, false, false, CallState.IDLE));
        assertFalse(policy.claimRequest(token, true, false, CallState.IDLE));
    }

    @Test public void binderArrivalWhilePausedCannotUseStaleIdleObservation() {
        StartupPermissionPolicy policy = resumed();
        long token = policy.observationToken();
        assertFalse(policy.claimRequest(token, false, false, CallState.IDLE));
        policy.paused();
        assertFalse(policy.claimRequest(token, true, false, CallState.IDLE));
        policy.resumed(true);
        assertFalse(policy.claimRequest(token, true, false, CallState.IDLE));
        assertTrue(policy.claimRequest(policy.observationToken(), true, false, CallState.IDLE));
    }

    @Test public void ringingOffhookAndUnknownDeferUntilFreshIdle() {
        for (CallState state : new CallState[] {CallState.RINGING, CallState.OFFHOOK, CallState.UNKNOWN}) {
            StartupPermissionPolicy policy = resumed();
            long token = policy.observationToken();
            for (int i = 0; i < 20; i++) assertFalse(state.name(), policy.claimRequest(token, true, false, state));
            assertFalse(policy.finished());
            assertTrue(policy.claimRequest(token, true, false, CallState.IDLE));
            assertFalse(policy.claimRequest(token, true, false, CallState.IDLE));
        }
    }

    @Test public void eligibilityRequiresEveryIndependentCondition() {
        for (boolean launcher : new boolean[] {false, true})
            for (boolean binder : new boolean[] {false, true})
                for (boolean granted : new boolean[] {false, true})
                    for (CallState state : CallState.values()) {
                        StartupPermissionPolicy policy = new StartupPermissionPolicy();
                        policy.resumed(launcher);
                        assertEquals(launcher && binder && !granted && state == CallState.IDLE,
                                policy.claimRequest(policy.observationToken(), binder, granted, state));
                    }
    }

    @Test public void optionalBootstrapFailureIsTerminalWithoutConsumingACall() {
        StartupPermissionPolicy policy = resumed();
        long token = policy.observationToken();
        policy.finish();
        policy.resumed(true);
        assertTrue(policy.finished());
        assertEquals(-1, policy.observationToken());
        assertFalse(policy.claimRequest(token, true, false, CallState.IDLE));
    }
}
