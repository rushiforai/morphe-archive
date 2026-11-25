package app.deviceinfo.patches.ads

import app.deviceinfo.patches.shared.Constants.COMPATIBILITY_DEVICEINFO
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val removeAllAdsPatch = bytecodePatch(
    name = "Remove All Ads",
    description = "Stubs the app's single native-ad load trigger so no banner, native, or " +
        "interstitial ad is ever requested or shown on any screen (dashboard, Wi-Fi/app " +
        "analyzer, sensors, battery, memory, tools, or automatic tests), and removes the " +
        "Facebook Audience Network mediation SDK's auto-initializing ContentProvider so it " +
        "never starts.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DEVICEINFO)

    dependsOn(removeFacebookAudienceNetworkInitPatch)

    execute {
        // Every ad placement in the app funnels through this one method before it ever touches
        // the ad SDK (see Fingerprints.kt) - returning immediately means the ad is never
        // requested, so the Mobile Ads SDK (which only initializes lazily on first request) is
        // also never actually initialized in practice.
        NativeAdLoadTriggerFingerprint.method.addInstructions(0, "return-void")
    }
}
