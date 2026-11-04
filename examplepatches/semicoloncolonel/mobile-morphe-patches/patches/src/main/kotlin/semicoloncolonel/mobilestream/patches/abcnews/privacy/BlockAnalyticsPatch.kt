package semicoloncolonel.mobilestream.patches.abcnews.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.abcnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ABC News 8.98.2 sends its analytics to mParticle, comScore, Braze, Datadog,
// and Firebase Analytics, which the shared layer blocks at the network.
//
// Not touched: sign-in, the feeds, video, and push notifications.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops mParticle, comScore, Braze, Datadog, and Firebase Analytics. Sign-in, video, and push " +
        "notifications are left alone.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
