package patches.angrybirdsfriends

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

internal val angryBirdsFriendsAdsGate = bytecodePatch {
    dependsOn(originalInput, adResources)
    execute {
        silenceRovioBeaconAds("Angry Birds Friends")
    }
}

@Suppress("unused")
val angryBirdsFriendsHideAds = bytecodePatch(
    name = "Hide ads",
    description = "Blocks Beacon ad loading and showing using its own failure callbacks on the " +
        "original UI-thread dispatch, skips bidder-token collection, and disables ad SDK initialization and startup providers.",
    default = true,
) {
    compatibleWith(angryBirdsFriends)
    dependsOn(angryBirdsFriendsAdsGate)
}
