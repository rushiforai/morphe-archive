package patches.brabant

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideAds = bytecodePatch(name = "Hide ads", description = "Removes native placements, Outbrain/Start.io promotions and audited Blue Billywig video-ad paths while preserving news, playback and native completion.") {
    dependsOn(originalInput, adsResources)
    compatibleWith(brabant)
    execute { applyAdEdits() }
}
