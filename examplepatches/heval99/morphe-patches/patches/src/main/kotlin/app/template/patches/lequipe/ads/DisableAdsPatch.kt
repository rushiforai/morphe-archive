package app.template.patches.lequipe.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_LEQUIPE
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// L'Équipe requests every native ad through Google Mobile Ads / Ad Manager. Its banner slots
// call AdManagerAdView.loadAd and its bidding interstitial calls AdManagerInterstitialAd.load
// (both from R8-renamed coroutines, so the patch works on the GMA library side). Teads and
// Equativ fill through GMA mediation adapters (TeadsAdapter, SASGMAMediation*Adapter) and Prebid
// / Amazon bid into the Ad Manager request, so none of them renders without a GMA load.
// Taboola Classic widgets and ads inside the app's web pages do not go through GMA and are not
// touched.
private const val GMA = "Lcom/google/android/gms/ads/"

// The public GMA classes that declare a void load entry point in this SDK.
private val LOAD_CLASSES = listOf(
    "BaseAdView",
    "AdLoader",
    "admanager/AdManagerAdView",
    "admanager/AdManagerInterstitialAd",
    "interstitial/InterstitialAd",
    "rewarded/RewardedAd",
    "rewardedinterstitial/RewardedInterstitialAd",
    "appopen/AppOpenAd",
).map { "$GMA$it;" }

private val LOAD_NAMES = setOf("load", "loadAd", "loadAds")

private const val AD_MANAGER_AD_VIEW_LOAD =
    "${GMA}admanager/AdManagerAdView;->loadAd(${GMA}admanager/AdManagerAdRequest;)V"
private const val AD_MANAGER_INTERSTITIAL_LOAD =
    "${GMA}admanager/AdManagerInterstitialAd;->load(Landroid/content/Context;Ljava/lang/String;" +
        "${GMA}admanager/AdManagerAdRequest;${GMA}admanager/AdManagerInterstitialAdLoadCallback;)V"

// Loads that must exist, be concrete and be patched: the two the app itself calls, plus the
// banner and interstitial loads the GMA mediation adapter (AbstractAdViewAdapter) calls.
private val REQUIRED_LOADS = setOf(
    AD_MANAGER_AD_VIEW_LOAD,
    AD_MANAGER_INTERSTITIAL_LOAD,
    "${GMA}BaseAdView;->loadAd(${GMA}AdRequest;)V",
    "${GMA}interstitial/InterstitialAd;->load(Landroid/content/Context;Ljava/lang/String;" +
        "${GMA}AdRequest;${GMA}interstitial/InterstitialAdLoadCallback;)V",
)

// The loads the app's own code (anything outside com.google) must call.
private val REQUIRED_APP_CALLS = setOf(AD_MANAGER_AD_VIEW_LOAD, AD_MANAGER_INTERSTITIAL_LOAD)

private fun key(definingClass: String, name: String, parameters: List<CharSequence>, returnType: String) =
    "$definingClass->$name(${parameters.joinToString("")})$returnType"

// Resolves a method reference the way the runtime does: the referenced class first, then its
// superclasses. Returns the key of the declaring method, or null if it is not in the APK.
private fun BytecodePatchContext.resolve(ref: MethodReference): String? {
    var type: String? = ref.definingClass
    while (type != null) {
        val classDef = classDefByOrNull(type) ?: return null
        val declared = classDef.methods.firstOrNull {
            it.name == ref.name && it.returnType == ref.returnType &&
                it.parameterTypes.map(CharSequence::toString) == ref.parameterTypes.map(CharSequence::toString)
        }
        if (declared != null) return key(classDef.type, declared.name, declared.parameterTypes, declared.returnType)
        type = classDef.superclass
    }
    return null
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes Google ads. Taboola and ads inside web pages stay.",
) {
    compatibleWith(COMPATIBILITY_LEQUIPE)

    execute {
        // 1. Rule-9 backstop: initialize and every other static void on MobileAds return at once,
        //    putPublisherFirstPartyIdEnabled answers false. registerWebView is the one static the
        //    app itself calls (fr.lequipe.ads.a), so it is mandatory.
        neutraliseMobileAdsStatics("initialize", "registerWebView")

        // 2. Every concrete void load / loadAd / loadAds on the GMA ad classes returns at once, so
        //    no ad request is made. A missing optional class is fine; the required loads must be
        //    found, concrete and patched.
        val patched = mutableSetOf<String>()
        for (type in LOAD_CLASSES) {
            val classDef = mutableClassDefByOrNull(type) ?: continue
            classDef.methods
                .filter { it.name in LOAD_NAMES && it.returnType == "V" }
                .forEach { method ->
                    val methodKey = key(type, method.name, method.parameterTypes, method.returnType)
                    if (method.implementation == null) return@forEach
                    method.returnEarly()
                    if (method.implementation?.instructions?.firstOrNull()?.opcode != Opcode.RETURN_VOID) {
                        throw PatchException("Disable ads: $methodKey was not patched")
                    }
                    patched += methodKey
                }
        }
        val missing = REQUIRED_LOADS - patched
        if (missing.isNotEmpty()) {
            throw PatchException("Disable ads: no concrete load to patch for $missing")
        }

        // 3. Every GMA load call in the APK must land on a patched method, and the app's own
        //    banner and interstitial calls (v21/mh3 banner coroutines, the w21 bidding
        //    interstitial in 10.70.0) must still be there. Otherwise the app has moved to an
        //    entry point this patch does not cover.
        val appCalls = mutableSetOf<String>()
        val uncovered = mutableSetOf<String>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                method.implementation?.instructions?.forEach { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    if (ref != null && ref.definingClass.startsWith(GMA) &&
                        ref.name in LOAD_NAMES && ref.returnType == "V"
                    ) {
                        val target = resolve(ref)
                        if (target == null || target !in patched) {
                            uncovered += "${classDef.type} -> $ref"
                        } else if (!classDef.type.startsWith("Lcom/google/")) {
                            appCalls += target
                        }
                    }
                }
            }
        }
        if (uncovered.isNotEmpty()) {
            throw PatchException("Disable ads: GMA loads left unpatched: $uncovered")
        }
        val notCalled = REQUIRED_APP_CALLS - appCalls
        if (notCalled.isNotEmpty()) {
            throw PatchException("Disable ads: the app no longer calls $notCalled")
        }
    }
}
