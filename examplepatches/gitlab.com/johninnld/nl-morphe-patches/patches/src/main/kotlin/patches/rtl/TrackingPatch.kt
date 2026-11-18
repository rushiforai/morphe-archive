package patches.rtl

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableTracking = bytecodePatch(name = "Disable tracking", description = "Includes ad removal; disables audited analytics, optional tracking identifiers and diagnostics while preserving account, push and playback services.") {
    dependsOn(originalInput, hideAds, trackingResources)
    compatibleWith(rtl)
    execute {
        applyBasicTrackingGates()
        disableIdentifierAndVideoTracking()
        suppressPersistedMeasurement()
        suppressMeasurementRequests()
        suppressQueuedEngagement()
    }
}
