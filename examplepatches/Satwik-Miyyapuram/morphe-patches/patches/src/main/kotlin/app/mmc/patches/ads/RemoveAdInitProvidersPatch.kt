package app.mmc.patches.ads

import app.mmc.patches.shared.Constants.COMPATIBILITY_MMC
import app.mmc.patches.util.mmcLogger
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * ContentProviders that the Google Mobile Ads and AppLovin SDKs declare in the manifest so they
 * boot automatically at process start, before any game code runs.
 */
private val AD_INIT_PROVIDERS = setOf(
    "com.google.android.gms.ads.MobileAdsInitProvider",
    "com.applovin.sdk.AppLovinInitProvider",
)

@Suppress("unused")
val removeAdInitProvidersPatch = resourcePatch(
    name = "Remove ad SDK auto-start",
    description = "Removes the AdMob and AppLovin init providers from the manifest so the ad SDKs " +
        "never start in the background.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MMC)

    execute {
        document("AndroidManifest.xml").use { document ->
            val providers = document.getElementsByTagName("provider")
            val toRemove = (0 until providers.length)
                .map { providers.item(it) }
                .filterIsInstance<Element>()
                .filter { it.getAttribute("android:name") in AD_INIT_PROVIDERS }

            toRemove.forEach { provider ->
                mmcLogger.info("Removing provider ${provider.getAttribute("android:name")}")
                provider.parentNode.removeChild(provider)
            }

            if (toRemove.isEmpty()) {
                mmcLogger.warning("No ad init providers found in AndroidManifest.xml")
            }
        }
    }
}
