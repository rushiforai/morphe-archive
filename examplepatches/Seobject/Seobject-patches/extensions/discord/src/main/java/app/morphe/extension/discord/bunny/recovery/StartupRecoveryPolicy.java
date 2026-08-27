package app.morphe.extension.discord.bunny.recovery;

/** Pure state machine for crash-loop detection and temporary Safe Mode. */
final class StartupRecoveryPolicy {
    private StartupRecoveryPolicy() {}

    static boolean begin(RecoveryState state) {
        if (state.startupInProgress && !state.startupHealthy) {
            state.consecutiveFailures++;
        }

        /*
         * BUNNY_SAFE_MODE_SELECTION_V2
         *
         * Failed-start history is diagnostic only. It must not enable Safe
         * Mode. Native Safe Mode here is exclusively the launcher one-shot;
         * Bunny's persistent Safe Mode setting is evaluated separately.
         */
        boolean safeMode = state.temporarySafeModeNextLaunch;

        state.temporarySafeModeNextLaunch = false;

        // Migrate/neutralize any recovery latch left by older builds.
        state.recoveryLatch = false;
        state.tryNormalOnce = false;

        state.startupInProgress = false;
        state.startupHealthy = false;
        state.session++;
        return safeMode;
    }

    static void pluginStageStarted(RecoveryState state) {
        state.startupInProgress = true;
        state.startupHealthy = false;
    }

    static void healthy(RecoveryState state, boolean safeMode) {
        state.startupInProgress = false;
        state.startupHealthy = true;
        state.currentPlugin = null;
        state.initializingPlugins.clear();
        state.lastHealthyAt = System.currentTimeMillis();
        if (!safeMode) {
            state.consecutiveFailures = 0;
            state.recoveryLatch = false;
        }
    }
}
