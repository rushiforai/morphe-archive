package patches.brabant

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableTracking = bytecodePatch(name = "Disable tracking", description = "Suppresses audited app/SDK analytics, optional IDs, video statistics and restored measurement uploads while retaining news, local history, push, media and native failure completion.") {
    dependsOn(originalInput, hideAds, trackingResources)
    compatibleWith(brabant)
    execute {
        applyOwnedEdits(trackingTargets)
        applyTrackingHelpers()
    }
}
