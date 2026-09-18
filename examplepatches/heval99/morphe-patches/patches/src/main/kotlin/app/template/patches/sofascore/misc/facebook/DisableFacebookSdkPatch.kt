package app.template.patches.sofascore.misc.facebook

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.morphe.util.returnEarly

@Suppress("unused")
val disableFacebookSdkPatch = bytecodePatch(
    name = "Disable Facebook SDK",
    description = "Blocks Facebook SDK and Audience Network auto-initialization."
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // Returning false from the providers' onCreate() reports "initialization failed",
        // which the SDK handles by staying uninitialized.
        FacebookInitProviderFingerprint.methodOrNull?.returnEarly(false)
        AudienceNetworkContentProviderFingerprint.methodOrNull?.returnEarly(false)
    }
}
