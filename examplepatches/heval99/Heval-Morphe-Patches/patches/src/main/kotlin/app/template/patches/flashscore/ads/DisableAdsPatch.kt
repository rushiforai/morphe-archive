package app.template.patches.flashscore.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Flashscore uses Google's next-generation Mobile Ads SDK
// (com.google.android.libraries.ads.mobile.sdk). Its class and method names are stable
// library API, so the patch works on the SDK surface instead of the obfuscated app code:
//   - initialize/initializeAdapters stop the SDK from ever starting, and the setters that throw
//     without init (setRequestConfiguration, setUserMutedApp, setUserControlledAppVolume) do nothing;
//   - every *AdPreloader.start(...) reports failure, so nothing gets preloaded;
//   - the ad classes' load()/loadAd() entry points become no-ops;
//   - pollAd() yields nothing for anything that still tries to fetch a preloaded ad.
// Two app-side hooks cover what does not go through the SDK:
//   - AdvertZone (every ad slot, including its bookmaker WebView provider) collapses itself
//     instead of loading, so no empty placeholder is left behind. The sponsored bookmaker
//     strip, bonus strip and odds are not ad slots; Hide betting content covers them;
//   - the video player never receives a VMAP response, so IMA video ads are never requested.
private const val SDK = "Lcom/google/android/libraries/ads/mobile/sdk/"

private val MOBILE_ADS_VOIDS = setOf(
    "initialize",
    "initializeAdapters",
    "setRequestConfiguration",
    "setUserMutedApp",
    "setUserControlledAppVolume",
)

private val PRELOADERS = listOf(
    "banner/BannerAdPreloader",
    "appopen/AppOpenAdPreloader",
    "interstitial/InterstitialAdPreloader",
    "nativead/NativeAdPreloader",
    "rewarded/RewardedAdPreloader",
    "rewardedinterstitial/RewardedInterstitialAdPreloader",
    "swipeableinterstitial/SwipeableInterstitialAdPreloader",
    "common/AdPreloader",
)

private val AD_CLASSES = listOf(
    "banner/AdView",
    "banner/BannerAd",
    "appopen/AppOpenAd",
    "interstitial/InterstitialAd",
    "nativead/NativeAdLoader",
    "rewarded/RewardedAd",
    "rewardedinterstitial/RewardedInterstitialAd",
    "swipeableinterstitial/SwipeableInterstitialAd",
    "iconad/IconAd",
)

private fun BytecodePatchContext.methods(relative: String): Set<MutableMethod> =
    mutableClassDefByOrNull(SDK + relative + ";")?.methods.orEmpty()

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    execute {
        // Never initialize the ads SDK. The next-gen SDK throws from almost every MobileAds call
        // without init (AGENTS.md rule 9), so the void setters an app calls around init return
        // at once too.
        for (type in listOf("MobileAds", "MobileAds\$Companion")) {
            methods(type)
                .filter { it.implementation != null }
                .filter { it.name in MOBILE_ADS_VOIDS && it.returnType == "V" }
                .forEach { it.returnEarly() }
        }

        // Preloading never starts and never hands out an ad.
        for (relative in PRELOADERS) {
            for (type in listOf(relative, "$relative\$Companion")) {
                methods(type)
                    .filter { it.implementation != null }
                    .filter { it.name == "start" && it.returnType == "Z" }
                    .forEach { it.returnEarly(false) }
                // returnEarly() only supports void methods; return null explicitly.
                methods(type)
                    .filter { it.implementation != null }
                    .filter { it.name == "pollAd" }
                    .forEach {
                        it.addInstructionsChecked(
                            0,
                            """
                                const/4 v0, 0x0
                                return-object v0
                            """.trimIndent()
                        )
                    }
            }
        }

        // Direct loads (and the banner view's loadAd) become no-ops.
        for (relative in AD_CLASSES) {
            for (type in listOf(relative, "$relative\$Companion")) {
                methods(type)
                    .filter { it.implementation != null }
                    .filter { (it.name == "load" || it.name == "loadAd") && it.returnType == "V" }
                    .forEach { it.returnEarly() }
            }
        }

        // AdvertZone: do what the app itself does when ads are disabled (GONE, then the
        // (I)V helper that resets the min height and reports the visibility) and return
        // before any provider is picked. The helper is found by its setMinHeight call.
        val collapse = mutableClassDefBy(ADVERT_ZONE).methods.singleOrNull { method ->
            method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                method.implementation?.instructions?.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Landroidx/constraintlayout/widget/ConstraintLayout;" &&
                        ref.name == "setMinHeight"
                } == true
        } ?: throw PatchException("AdvertZone has no single (I)V setMinHeight helper")
        // The load method has 34 locals, so p0 is beyond the 4-bit range of invoke-virtual.
        AdvertZoneLoadFingerprint.method.addInstructionsChecked(
            0,
            """
                move-object/from16 v0, p0
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                invoke-virtual {v0, v1}, $ADVERT_ZONE->${collapse.name}(I)V
                return-void
            """.trimIndent()
        )

        // Video ads: drop the VMAP response before it is stored on the media item.
        VideoMediaConstructorFingerprint.method.addInstructionsChecked(0, "const/4 p3, 0x0")
    }
}
