package app.template.patches.crimeradar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CRIMERADAR

/**
 * Disables telemetry/analytics SDKs for privacy:
 *
 * 1. Instabug (Ad.E.b) — bug reports, screenshots, session replay, APM
 *    Collects: screenshots, device logs, user email, UID
 *
 * 2. Adjust (Ad.C2071e.f) — attribution/install tracking
 *    Collects: GAID, IMEI, OAID, device identifiers
 *
 * Note: Firebase Crashlytics is NOT disabled here because it's wired into
 * FirebaseInitializer.run() which also sets up Firebase Messaging (push).
 * Disabling the whole method would break push notifications.
 */
@Suppress("unused")
val telemetryKillPatch = bytecodePatch(
    name = "Telemetry Kill",
    description = "Disables Instabug and Adjust telemetry SDKs for privacy.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CRIMERADAR)

    execute {
        // Kill Instabug init — no-op the entire method
        InstabugInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Kill Adjust init — no-op the entire method
        AdjustInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
