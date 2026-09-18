package app.ryley.patches.cbc.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.ryley.patches.cbc.shared.Constants.COMPATIBILITY_CBC_NEWS

/**
 * Stops the app from requesting display ads.
 *
 * `AdProvider` is CBC's own abstraction over the ad SDKs, and every implementation funnels into
 * `loadAd(...)`. Returning immediately from that method means no ad request is ever made, while
 * `createAd(...)` is left untouched so the layouts that host the ad views still inflate with the
 * empty view they expect.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Prevents the app from requesting banner, in-read and mediated ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CBC_NEWS)

    execute {
        val patched = AD_PROVIDER_CLASSES.mapNotNull { providerClass ->
            loadAdFingerprint(providerClass).methodOrNull?.also { method ->
                // No ad request is made if the method returns before doing any work.
                method.addInstructions(0, "return-void")
            }?.let { providerClass }
        }

        if (patched.isEmpty()) {
            throw PatchException(
                "No AdProvider.loadAd implementations were found. " +
                    "The app was most likely updated and its ad architecture changed."
            )
        }
    }
}
