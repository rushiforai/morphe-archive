package app.template.patches.futbin.ads

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FUTBIN
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Futbin runs Google Ad Manager (GMA) banners and interstitials, falls back to Nimbus (with
// Moloco, Mintegral and Vungle demand) when GAM has nothing, and shows an Anzu video panel in the
// squad builder. The patch turns off the app's own ad switch, then neuters each SDK entry point
// as well. Futbin+ premium is account-linked (server-side), so only ads.
private const val GMA = "Lcom/google/android/gms/ads/"

// Every class must exist and declare the entry point. AdView is not listed: it inherits
// loadAd from BaseAdView.
private val AD_LOAD_CLASSES = listOf(
    "BaseAdView",
    "AdLoader",
    "interstitial/InterstitialAd",
    "rewarded/RewardedAd",
    "rewardedinterstitial/RewardedInterstitialAd",
    "appopen/AppOpenAd",
    "admanager/AdManagerAdView",
    "admanager/AdManagerInterstitialAd",
)

private fun BytecodePatchContext.gmaMethods(
    relative: String,
    predicate: (MutableMethod) -> Boolean,
): List<MutableMethod> =
    mutableClassDefBy("$GMA$relative;").methods
        .filter { it.implementation != null && predicate(it) }
        .ifEmpty { throw PatchException("$GMA$relative; has no matching ad entry point") }

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_FUTBIN)

    execute {
        // 1. The app's ad switch: the isAdAllowed preference reads false. FbApplication then never
        // starts the ad SDKs, and every placement's `premium || !isAdAllowed` check hides its
        // slot (GONE), so no empty ad spaces are left behind.
        AdAllowedPreferenceFingerprint.method.returnEarly(false)

        // 2. App ad init (GAM and Nimbus) is a no-op even if it is reached another way.
        InitAdSdksFingerprint.method.returnEarly()

        // 3. GAM controller: showing an interstitial does nothing, so it cannot fall back to a
        // Nimbus interstitial. Its only caller ignores the callback result.
        ShowInterstitialFingerprint.method.returnEarly()

        // 4. Nimbus: no SDK init and no interstitial, bottom or in-feed request. The interstitial
        // request has no log line; it is the controller's (Activity, callback) method that builds
        // the "interstitial" request.
        NimbusInitFingerprint.method.returnEarly()
        NimbusBottomBannerFingerprint.method.returnEarly()
        NimbusInFeedBannerFingerprint.method.returnEarly()

        val nimbusInterstitial = NimbusInitFingerprint.classDef.methods.filter { method ->
            method.returnType == "V" &&
                method.parameterTypes.firstOrNull()?.toString() == "Landroid/app/Activity;" &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.CONST_STRING &&
                        ((it as ReferenceInstruction).reference as StringReference).string == "interstitial"
                } == true
        }
        if (nimbusInterstitial.size != 1) {
            throw PatchException(
                "Expected one Nimbus interstitial request in ${NimbusInitFingerprint.classDef.type}, " +
                    "found ${nimbusInterstitial.size}"
            )
        }
        nimbusInterstitial.single().returnEarly()

        // 5. Squad builder: the Anzu init takes its premium branch (ad panel GONE, no AnzuAdView).
        // The premium check's result is overwritten with true right after its move-result.
        val anzuInit = AnzuInitFingerprint.method
        val premiumResult = AnzuInitFingerprint.instructionMatches[1].index
        val register = anzuInit.instructions[premiumResult].let { it as OneRegisterInstruction }.registerA
        anzuInit.addInstructionChecked(premiumResult + 1, "${if (register < 16) "const/4" else "const/16"} v$register, 0x1")

        // 6. Google Mobile Ads, belt and braces: the SDK never initializes, every load is a
        // no-op and the app-open preloader reports failure. The app calls no other MobileAds
        // static today, but they all throw without init, so every static void is neutered too
        // (AGENTS.md rule 9).
        neutraliseMobileAdsStatics("initialize")
        for (relative in AD_LOAD_CLASSES) {
            gmaMethods(relative) { (it.name == "load" || it.name == "loadAd") && it.returnType == "V" }
                .forEach { it.returnEarly() }
        }
        gmaMethods("appopen/AppOpenAdPreloader") { it.name == "start" && it.returnType == "Z" }
            .forEach { it.returnEarly(false) }
    }
}
