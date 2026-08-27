package app.morphe.extension.discord.bunny.recovery;

/** Documents the independent inputs to Bunny's effective third-party-plugin gate. */
final class PluginBypassPolicy {
    private PluginBypassPolicy() {}

    static boolean effective(
            boolean persistentSafeMode,
            boolean temporarySafeModeCurrentSession,
            boolean recoveryImposedBypass
    ) {
        return persistentSafeMode || temporarySafeModeCurrentSession || recoveryImposedBypass;
    }
}
