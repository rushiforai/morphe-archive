package app.template.patches.carscanner


import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val carScannerStripAdManifestPatch = resourcePatch(
    description = "Removes the AdMob auto-init provider from the manifest.",
) {
    compatibleWith(CAR_SCANNER_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val nodes = doc.getElementsByTagName("provider")
            for (i in nodes.length - 1 downTo 0) {
                val node = nodes.item(i) as? Element ?: continue
                if (node.getAttribute("android:name") == "com.google.android.gms.ads.MobileAdsInitProvider") {
                    node.parentNode?.removeChild(node)
                }
            }
        }
    }
}

@Suppress("unused")
val carScannerRemoveAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Disables ads (banner, interstitial, open, rewarded) and the consent pop-up.",
) {
    compatibleWith(CAR_SCANNER_COMPATIBILITY)
    dependsOn(carScannerStripAdManifestPatch)

    execute {
        val retVoid = "return-void"
        val retFalse = "const/4 v0, 0x0\nreturn v0"
        val retNull = "const/4 v0, 0x0\nreturn-object v0"

        fun hook(className: String, names: Set<String>, returnType: String, smali: String) {
            val classDef = runCatching { mutableClassDefBy(className) }.getOrNull() ?: return
            classDef.methods
                .filter { it.name in names && it.returnType == returnType && it.implementation != null }
                .forEach { it.addInstructions(0, smali) }
        }

        val ads = "Lcom/google/android/gms/ads"

        hook("$ads/MobileAds;", setOf("initialize"), "V", retVoid)

        hook("$ads/BaseAdView;", setOf("loadAd"), "V", retVoid)
        hook("$ads/AdLoader;", setOf("loadAd", "loadAds"), "V", retVoid)

        for (cls in listOf(
            "$ads/interstitial/InterstitialAd;",
            "$ads/appopen/AppOpenAd;",
            "$ads/rewarded/RewardedAd;",
            "$ads/rewardedinterstitial/RewardedInterstitialAd;",
        )) {
            hook(cls, setOf("load", "show"), "V", retVoid)
            hook(cls, setOf("isAdAvailable"), "Z", retFalse)
        }
        hook("$ads/interstitial/InterstitialAd;", setOf("pollAd"), "Lcom/google/android/gms/ads/interstitial/InterstitialAd;", retNull)
        hook("$ads/appopen/AppOpenAd;", setOf("pollAd"), "Lcom/google/android/gms/ads/appopen/AppOpenAd;", retNull)
        hook("$ads/rewarded/RewardedAd;", setOf("pollAd"), "Lcom/google/android/gms/ads/rewarded/RewardedAd;", retNull)

        hook(
            "Lcom/google/android/ump/UserMessagingPlatform;",
            setOf("loadAndShowConsentFormIfRequired", "loadConsentForm", "showPrivacyOptionsForm"),
            "V",
            retVoid,
        )
    }
}
