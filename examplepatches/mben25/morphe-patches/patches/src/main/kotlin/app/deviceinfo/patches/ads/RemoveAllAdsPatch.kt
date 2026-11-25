package app.deviceinfo.patches.ads

import app.deviceinfo.patches.shared.Constants.COMPATIBILITY_DEVICEINFO
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val removeAllAdsPatch = bytecodePatch(
    name = "Remove All Ads",
    description = "Turns on the app's own ad-free flag so no native or interstitial ad is ever " +
        "requested or shown on any screen (dashboard, Wi-Fi/app analyzer, sensors, battery, " +
        "memory, tools, or automatic tests), which also hides the \"Remove ads\" promo cards, " +
        "and removes the Facebook Audience Network mediation SDK's auto-initializing " +
        "ContentProvider so it never starts.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DEVICEINFO)

    dependsOn(removeFacebookAudienceNetworkInitPatch)

    execute {
        // Every ad placement checks this flag before building its request and returns early
        // when it is set (see Fingerprints.kt), so the Mobile Ads SDK - which only initializes
        // lazily on first request - is never initialized either. `.locals 2`, so v0 is free.
        AdFreeFlagFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
