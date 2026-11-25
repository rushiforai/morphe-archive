package app.deviceinfo.patches.telemetry

import app.deviceinfo.patches.shared.Constants.COMPATIBILITY_DEVICEINFO
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableAllTelemetryPatch = bytecodePatch(
    name = "Disable All Telemetry",
    description = "Disables all analytics and telemetry: Firebase Analytics, Crashlytics, " +
        "Sessions, Installations and Transport auto-registration, and the AdServices / " +
        "Advertising ID attribution surface.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DEVICEINFO)

    dependsOn(
        removeFirebaseComponentDiscoveryPatch,
        removeAdServicesAttributionPatch,
        removeAdvertisingIdPatch,
    )

    execute {
        // This patch only orchestrates the telemetry-removal patches above via dependsOn;
        // each one implements its own piece independently and can also be enabled on its own.
    }
}
