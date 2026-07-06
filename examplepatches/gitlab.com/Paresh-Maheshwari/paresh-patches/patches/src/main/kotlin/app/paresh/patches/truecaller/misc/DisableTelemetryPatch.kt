package app.paresh.patches.truecaller.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.truecaller.shared.Constants.COMPATIBILITY_TRUECALLER

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables AppStartTracker and other telemetry points."
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // Make enableTracking() a no-op — isEnabled stays false,
        // so onActivityCreate/onServiceCreate/onBroadcastReceive all short-circuit
        AppStartTrackerFingerprint.method.addInstructions(0, "return-void")
    }
}
