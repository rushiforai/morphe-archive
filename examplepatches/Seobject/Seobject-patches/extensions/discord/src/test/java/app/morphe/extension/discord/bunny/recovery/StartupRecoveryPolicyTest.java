package app.morphe.extension.discord.bunny.recovery;

import org.junit.Test;

import static org.junit.Assert.*;

public final class StartupRecoveryPolicyTest {
    @Test public void healthyLaunchDoesNotEnterSafeModeAndResetsFailures() {
        RecoveryState state = new RecoveryState();
        state.consecutiveFailures = 2;
        assertFalse(StartupRecoveryPolicy.begin(state));
        StartupRecoveryPolicy.pluginStageStarted(state);
        StartupRecoveryPolicy.healthy(state, false);
        assertTrue(state.startupHealthy);
        assertFalse(state.startupInProgress);
        assertEquals(0, state.consecutiveFailures);
    }

    @Test public void manualSafeModeIsTemporaryAndPreservesPluginConfigurationByPolicy() {
        RecoveryState state = new RecoveryState();
        state.temporarySafeModeNextLaunch = true;
        assertTrue(StartupRecoveryPolicy.begin(state));
        assertFalse(state.temporarySafeModeNextLaunch);
        StartupRecoveryPolicy.healthy(state, true);
        assertFalse("manual safe mode must not become persistent", state.recoveryLatch);
    }

    @Test public void consumedTemporaryRequestCannotLeakIntoFollowingLaunch() {
        RecoveryState state = new RecoveryState();
        state.temporarySafeModeNextLaunch = true;
        assertTrue(StartupRecoveryPolicy.begin(state));
        assertFalse(state.temporarySafeModeNextLaunch);
        state.startupInProgress = false;
        state.startupHealthy = true;
        assertFalse(StartupRecoveryPolicy.begin(state));
    }

    @Test public void currentSessionDecisionSurvivesConsumedPersistentRequest() {
        RecoveryState state = new RecoveryState();
        state.temporarySafeModeNextLaunch = true;
        boolean temporarySafeModeCurrentSession = StartupRecoveryPolicy.begin(state);
        assertFalse(state.temporarySafeModeNextLaunch);
        assertTrue(temporarySafeModeCurrentSession);
    }

    @Test public void effectiveBypassKeepsPersistentAndTemporaryModesIndependent() {
        assertFalse(PluginBypassPolicy.effective(false, false, false));
        assertTrue(PluginBypassPolicy.effective(true, false, false));
        assertTrue(PluginBypassPolicy.effective(false, true, false));
        assertTrue(PluginBypassPolicy.effective(false, false, true));
    }

    @Test public void failedStartupLatchesRecoveryAndRetainsSuspectedPlugin() {
        RecoveryState state = new RecoveryState();
        state.startupInProgress = true;
        state.startupHealthy = false;
        state.currentPlugin = "example.plugin";
        assertTrue(StartupRecoveryPolicy.begin(state));
        assertEquals(1, state.consecutiveFailures);
        assertEquals("example.plugin", state.currentPlugin);
        assertTrue(state.recoveryLatch);
    }

    @Test public void unknownFailureStillLatchesRecovery() {
        RecoveryState state = new RecoveryState();
        state.startupInProgress = true;
        state.startupHealthy = false;
        assertTrue(StartupRecoveryPolicy.begin(state));
        assertNull(state.currentPlugin);
    }

    @Test public void normalProcessDeathAfterHealthyCheckpointIsNotFailure() {
        RecoveryState state = new RecoveryState();
        state.startupHealthy = true;
        state.startupInProgress = false;
        assertFalse(StartupRecoveryPolicy.begin(state));
        assertEquals(0, state.consecutiveFailures);
    }

    @Test public void repeatedFailuresRemainLatchedUntilExplicitRetry() {
        RecoveryState state = new RecoveryState();
        state.startupInProgress = true;
        state.startupHealthy = false;
        assertTrue(StartupRecoveryPolicy.begin(state));
        state.startupInProgress = true;
        state.startupHealthy = false;
        assertTrue(StartupRecoveryPolicy.begin(state));
        assertEquals(2, state.consecutiveFailures);
        state.tryNormalOnce = true;
        assertFalse(StartupRecoveryPolicy.begin(state));
    }

    @Test public void safeModeHealthyCheckpointDoesNotOverwriteFailureHistory() {
        RecoveryState state = new RecoveryState();
        state.consecutiveFailures = 1;
        state.recoveryLatch = true;
        StartupRecoveryPolicy.healthy(state, true);
        assertEquals(1, state.consecutiveFailures);
        assertTrue(state.recoveryLatch);
    }
}
