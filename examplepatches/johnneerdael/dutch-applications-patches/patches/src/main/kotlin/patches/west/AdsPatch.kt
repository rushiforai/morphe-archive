package patches.west

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideAds = bytecodePatch(name = "Hide ads", description = "Removes native and nested ad placements, Outbrain/Start.io promotions, Blue Billywig video-ad inputs and vertical-video ad rows while retaining content, indices and native failure completion.") {
    dependsOn(originalInput, originalCode, adsResources)
    compatibleWith(west)
    execute { applyAdEdits() }
}
