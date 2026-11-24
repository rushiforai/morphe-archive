package patches.angrybirds2

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import patches.shared.disableRovioAdStartup
import patches.shared.silenceRovioBeaconAds

private val adResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { disableRovioAdStartup(it) }
    }
}

internal val angryBirds2AdsGate = bytecodePatch {
    dependsOn(originalInput, adResources)
    execute {
        silenceRovioBeaconAds("Angry Birds 2")
    }
}

@Suppress("unused")
val angryBirds2HideAds = bytecodePatch(
    name = "Hide ads",
    description = "Blocks Beacon ad loading and showing using its own failure callbacks on the " +
        "original UI-thread dispatch, skips bidder-token collection, and disables ad SDK initialization and startup providers.",
    default = true,
) {
    compatibleWith(angryBirds2)
    dependsOn(angryBirds2AdsGate)
}
