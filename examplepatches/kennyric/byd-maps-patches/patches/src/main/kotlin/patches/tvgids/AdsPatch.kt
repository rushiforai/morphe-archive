package patches.tvgids

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Removes ad placements, their reserved space and explicitly branded promotions. Stops ad-only configuration requests and native ad startup/loading while preserving guide and editorial content.",
) {
    dependsOn(originalInput, adViews, adNative, adsResources)
    compatibleWith(tvgids)
}
