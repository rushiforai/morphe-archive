package semicoloncolonel.mobilestream.patches.peacock.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.peacock.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// Third-party SDKs in the 7.10.20 phone build: Braze, Conviva, Nielsen,
// comScore, Adobe Analytics, New Relic, Firebase/Google Analytics, mParticle
// and Branch. Peacock keeps OkHttp's public names, so both shared layers
// apply (see BlockTrackers.kt).
@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
