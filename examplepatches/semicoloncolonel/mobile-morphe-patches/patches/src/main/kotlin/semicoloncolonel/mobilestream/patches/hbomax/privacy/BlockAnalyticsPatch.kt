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
    description = "Stops analytics and tracking in the HBO Max phone app: Branch, Braze, " +
        "comScore, Firebase/Google Analytics, AppsFlyer and MediaMelon. Blocking happens on " +
        "the device, inside the app. Sign-in and playback are left alone. Opt-in / " +
        "experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
