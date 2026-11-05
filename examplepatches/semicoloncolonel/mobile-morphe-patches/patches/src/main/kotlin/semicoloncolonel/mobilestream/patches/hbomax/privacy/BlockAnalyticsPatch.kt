package semicoloncolonel.mobilestream.patches.hbomax.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// Third-party SDKs in the 7.14.0.530 phone build: Branch, Braze, comScore,
// Firebase/Google Analytics, AppsFlyer and MediaMelon (video analytics).
// The shared layers apply (see BlockTrackers.kt; the OkHttp layer is used
// only if this build keeps OkHttp's public names).
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
