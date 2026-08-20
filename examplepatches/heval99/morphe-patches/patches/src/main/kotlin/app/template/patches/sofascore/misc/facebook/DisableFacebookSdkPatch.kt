package app.template.patches.sofascore.misc.facebook

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.morphe.util.returnEarly

@Suppress("unused")
val disableFacebookSdkPatch = bytecodePatch(
    name = "Disable Facebook SDK",
    description = "Disables Facebook SDK initialization, marketing, and ad network activity."
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        FacebookSdkInitializeFingerprint.methodOrNull?.returnEarly()
        FacebookMarketingLoggerFingerprint.methodOrNull?.returnEarly()
        FacebookAdsInitFingerprint.methodOrNull?.returnEarly()
    }
}
