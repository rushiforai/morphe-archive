package patches.west

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Includes ad removal. Stops audited app, audience and video measurements, optional identifiers and queued telemetry while retaining news, local state, push, playback and native failure completion.",
) {
    dependsOn(originalInput, originalCode, hideAds, trackingResources)
    compatibleWith(west)
    execute {
        applyOwnedEdits(trackingTargets)
        applyTrackingHelpers()
    }
}
