package id.ikuradachi.patches.bstation.tracking

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable tracking",
    description = "Disables internal Bilibili telemetry, APM profiling, TradPlus ad mediation, Firebase analytics, Crashlytics, and Facebook AppEvents.",
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_BSTATION)

    execute {
        NeuronDispatchFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        ApmHasakiInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        FirebaseAnalyticsLogFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        CrashlyticsInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        TradPlusInitFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        FacebookAppEventsLogFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
