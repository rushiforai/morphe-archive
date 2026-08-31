package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT

@Suppress("unused")
val suppressTelemetryPatch = bytecodePatch(
    name = "Suppress Telemetry",
    description = "Disables background monitoring and analytics frameworks including ByteDance Helios, AppLog, and AppsFlyer.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        AppLogInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEvent1Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEvent2Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEvent3Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEvent4Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEventV31Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEventV32Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEventV33Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        HeliosEnvImplInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppsFlyerAnalyticsStartFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
