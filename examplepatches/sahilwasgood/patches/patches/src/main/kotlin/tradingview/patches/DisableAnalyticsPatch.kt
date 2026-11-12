package tradingview.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Disables telemetry, screen tracking, and analytics reporting to Firebase and SnowPlow.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)

    execute {
        AnalyticsSendEventFingerprint.method.addInstructions(
            0,
            "return-void"
        )
        FirebaseLogEventFingerprint.method.addInstructions(
            0,
            "return-void"
        )
    }
}
