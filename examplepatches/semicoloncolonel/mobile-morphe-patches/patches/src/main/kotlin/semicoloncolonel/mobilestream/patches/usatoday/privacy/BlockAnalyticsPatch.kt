package semicoloncolonel.mobilestream.patches.usatoday.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.usatoday.shared.Constants

// USA TODAY 8.15.0. The trackers send over HttpURLConnection and OkHttp,
// which the shared layer checks against the host blocklist, plus the SDKs'
// manifest kill switches. Covered: mParticle, Adjust, comScore, Parse.ly,
// LiveRamp, and Firebase/Google Analytics.
//
// Not touched: Airship, which also delivers the breaking-news alerts, crash
// reporting, sign-in, and the e-edition.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, attribution, and audience-measurement services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
