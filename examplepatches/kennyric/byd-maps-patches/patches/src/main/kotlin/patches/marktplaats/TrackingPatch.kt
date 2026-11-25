package patches.marktplaats

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Disables optional measurement while preserving normal marketplace services.",
) {
    dependsOn(originalInput, hideAds, trackingResources)
    compatibleWith(marktplaats)
    execute {
        suppressCoreMeasurement()
        suppressMarketingMeasurement()
        suppressFirebaseMeasurement()
        suppressPersistedMeasurement()
        suppressRemainingSdkEntries()
    }
}
