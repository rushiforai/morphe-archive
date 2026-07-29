package app.sofatime.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.sofatime.shared.Constants.SOFATIME_COMPATIBILITY

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables Firebase Crashlytics, Sessions, and Analytics."
) {
    compatibleWith(SOFATIME_COMPATIBILITY)

    execute {
        crashlyticsRegistrarGetComponents.method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """
        )

        sessionsRegistrarGetComponents.method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """
        )
    }
}
