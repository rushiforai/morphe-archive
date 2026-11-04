package semicoloncolonel.mobilestream.patches.nbcnews.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nbcnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// NBC News 15.0.1 sends its analytics through URL.openConnection, which the
// shared layer covers: Adobe, mParticle, Nielsen, comScore, Conviva, Moat,
// Iterate, Airship analytics, and Firebase Analytics. Its OkHttp build lacks
// the API the shared OkHttp layer needs, so that layer skips itself.
//
// Not touched: content, images, sign-in (including TV-provider sign-in),
// DRM, the StreamSentry player's own hosts, feature flags, and push.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Adobe, mParticle, Nielsen, comScore, Conviva, Moat, Iterate, and Firebase Analytics. " +
        "Sign-in, video, and push notifications are left alone.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
