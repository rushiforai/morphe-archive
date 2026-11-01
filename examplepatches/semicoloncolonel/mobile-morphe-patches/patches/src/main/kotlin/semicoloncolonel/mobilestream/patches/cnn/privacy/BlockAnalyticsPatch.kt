package semicoloncolonel.mobilestream.patches.cnn.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// CNN 26.21.0 starts each SDK from FeatureSDKInitializer. Its method names are
// R8-renamed, so each start method is found by a literal it uses. Adobe,
// AppsFlyer, Chartbeat, CNN's Zion/Snowplow collector and "dalton" never
// start. CNN keeps OkHttp's public names, so both shared blocking layers
// apply as well.
//
// Not touched: Airship push and in-app messages, Arkose sign-in, purchases,
// the article meter, TV-provider sign-in, Optimizely flags, OneTrust consent,
// content or video.
// ─────────────────────────────────────────────────────────────────────────────

private class SdkStartFingerprint(anchor: String) : Fingerprint(
    definingClass = "Lcom/cnn/mobile/android/phone/data/environment/FeatureSDKInitializer;",
    parameters = listOf(),
    returnType = "V",
    strings = listOf(anchor),
)

private val trackerStarts = listOf(
    "Failed to Initialize Adobe Analytics!", "apps_flyer", "chartbeat", "zionApiEndpoint", "dalton",
).map(::SdkStartFingerprint)

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops analytics and tracking in the CNN app: Adobe, AppsFlyer, Chartbeat, " +
        "comScore, Firebase and CNN's own data collection. Blocking happens on the device, " +
        "inside the app. Sign-in, subscriptions, push and video are left alone. Opt-in / " +
        "experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        trackerStarts.forEach { it.methodOrNull?.addInstructions(0, "return-void") }

        blockTrackers()
    }
}
