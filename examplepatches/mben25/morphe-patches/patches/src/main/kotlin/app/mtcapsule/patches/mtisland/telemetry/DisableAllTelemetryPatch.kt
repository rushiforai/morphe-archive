package app.mtcapsule.patches.mtisland.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.mtcapsule.patches.shared.Constants.COMPATIBILITY_MT_CAPSULE

@Suppress("unused")
val disableAllTelemetryPatch = bytecodePatch(
    name = "Disable All Telemetry",
    description = "Disables all analytics and telemetry: Firebase Analytics, Installations and " +
        "Transport auto-registration, the Google Measurement and DataTransport upload services, " +
        "and the AdServices / Advertising ID attribution surface.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MT_CAPSULE)

    dependsOn(
        removeFirebaseComponentDiscoveryPatch,
        removeAnalyticsServicesPatch,
        removeAdServicesAttributionPatch,
        removeAdvertisingIdPatch,
    )

    execute {
        // This patch only orchestrates the telemetry-removal patches above via dependsOn;
        // each one implements its own piece independently and can also be enabled on its own.
    }
}
