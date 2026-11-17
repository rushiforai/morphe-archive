package app.template.patches.livescore.misc.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_LIVESCORE
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.neuterAdHooks

// Blaze (the stories SDK) keeps its public names. The overloads are the concrete methods; the
// $default bridges call them, so they are not patched. MobileAds.initialize is left alone.
private val BLAZE_AD_HOOKS = mapOf(
    "Lcom/blaze/ima/BlazeIMA;" to "enableAds",
    "Lcom/blaze/gam/BlazeGAM;" to "enableCustomNativeAds",
)

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_LIVESCORE)

    execute {
        // 1. The app's ad-removal gate reads as active, so every banner, interstitial, MPU and
        // hero placement early-outs.
        AdsRemovalSettingsAreAdsDisabledFingerprint.method.returnEarly(value = true)

        // 2. Backstop: every Google Mobile Ads load entry point returns at once.
        neuterAdHooks(GMA_LOAD_HOOKS)

        // 3. Stories ads: every concrete overload of the Blaze ad switches returns at once.
        for ((owner, name) in BLAZE_AD_HOOKS) {
            val methods = mutableClassDefByOrNull(owner)?.methods
                ?: throw PatchException("Disable ads: $owner not found")
            val targets = methods.filter { it.name == name && it.returnType == "V" && it.implementation != null }
            if (targets.isEmpty()) throw PatchException("Disable ads: no concrete void $owner->$name")
            targets.forEach { it.returnEarly() }
        }
    }
}
