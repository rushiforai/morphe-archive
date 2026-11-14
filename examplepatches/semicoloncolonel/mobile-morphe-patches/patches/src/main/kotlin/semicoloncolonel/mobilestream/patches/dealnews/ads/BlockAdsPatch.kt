package semicoloncolonel.mobilestream.patches.dealnews.ads

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.dealnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// ─────────────────────────────────────────────────────────────────────────────
// Block ads.
//
// DealNews 10.7.2 is a React Native app whose screens are Hermes bytecode
// (version 98) in assets/index.android.bundle. Its one ad is a Google banner
// on the deal page, drawn with its container by the AdBanner component. That
// component now renders nothing, so no ad is requested and no space is left.
// The app's Expo updates are already turned off, so the patched bundle stays
// in use.
// ─────────────────────────────────────────────────────────────────────────────

private val blockAdsInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("AdBanner", HermesBundle.Value.NULL)
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val blockAdsPatch = resourcePatch(
    name = "Block ads",
    description = "Removes the ad banner from deal pages.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(blockAdsInBundlePatch)
}
