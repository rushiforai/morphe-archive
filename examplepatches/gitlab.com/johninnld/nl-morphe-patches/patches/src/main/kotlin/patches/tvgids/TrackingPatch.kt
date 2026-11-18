package patches.tvgids

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Disables OSB, Comscore, Sentry and optional Facebook/Firebase measurement, tracking identifiers and queued telemetry. Includes Hide ads. Keeps manual privacy choices and functional account, guide and messaging paths.",
) {
    dependsOn(originalInput, hideAds, trackingNative, osbTracking, comscoreTracking,
        sentryTracking, facebookTracking, firebaseTracking, persistedMeasurement)
    compatibleWith(tvgids)
}
