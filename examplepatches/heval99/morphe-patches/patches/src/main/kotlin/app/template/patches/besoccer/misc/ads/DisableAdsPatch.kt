package app.template.patches.besoccer.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.besoccer.misc.license.disableLicenseCheckPatch
import app.template.patches.shared.Constants.COMPATIBILITY_BESOCCER
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Google's next-generation Mobile Ads SDK. Its public class and method names are kept by R8;
// the SDK's own internals are renamed into ads_mobile_sdk.* and the default package.
private const val SDK = "Lcom/google/android/libraries/ads/mobile/sdk/"
private val MOBILE_ADS = listOf("${SDK}MobileAds;", "${SDK}MobileAds\$Companion;")

// initialize starts the SDK; every other one throws "MobileAds.initialize must be called before
// using the Google Mobile Ads SDK." without it (AGENTS.md rule 9).
private val MOBILE_ADS_VOIDS = setOf(
    "initialize",
    "initializeAdapters",
    "setRequestConfiguration",
    "setUserMutedApp",
    "setUserControlledAppVolume",
    "registerWebView",
    "openDebugMenu",
    "openAdInspector",
    "generateSignal",
)

// MobileAds calls that work without initialize and need no hook.
private val MOBILE_ADS_SAFE = setOf("getVersion", "isInitialized", "getInitializationStatus")

private val LOAD_NAMES = setOf("load", "loadAd", "loadFromAdResponse")

// Every void load entry point of the formats the SDK ships: the static wrapper on the ad class
// and the Companion it delegates to; the banner view loads through AdView. The suspend overloads
// (Continuation argument, Object return) are not void and are left alone: only the SDK calls them.
private val LOADERS: Map<String, Set<String>> = buildMap {
    put("${SDK}banner/AdView;", setOf("loadAd", "loadFromAdResponse"))
    for (ad in listOf(
        "banner/BannerAd",
        "interstitial/InterstitialAd",
        "rewarded/RewardedAd",
        "rewardedinterstitial/RewardedInterstitialAd",
        "appopen/AppOpenAd",
        "nativead/NativeAdLoader",
    )) {
        put("$SDK$ad;", setOf("load", "loadFromAdResponse"))
        put("$SDK$ad\$Companion;", setOf("load", "loadFromAdResponse"))
    }
}

private fun key(definingClass: String, name: String, parameters: List<CharSequence>, returnType: String) =
    "$definingClass->$name(${parameters.joinToString("")})$returnType"

/**
 * Returns early from every concrete void method on [owner] named in [names] and returns their
 * keys. Mandatory: a missing class, or a name without a concrete void, fails the patch.
 */
private fun BytecodePatchContext.neuter(owner: String, names: Set<String>): List<String> {
    val methods = mutableClassDefByOrNull(owner)?.methods
        ?: throw PatchException("Disable ads: $owner not found")
    return names.flatMap { name ->
        // returnEarly() is void-only and NPEs on abstract declarations.
        val targets = methods.filter { it.name == name && it.returnType == "V" && it.implementation != null }
        if (targets.isEmpty()) throw PatchException("Disable ads: no concrete void $owner->$name")
        targets.map {
            it.returnEarly()
            key(owner, it.name, it.parameterTypes, it.returnType)
        }
    }
}

/**
 * BeSoccer's ad-free tier is validated server-side and its ad engine is R8-obfuscated, so ads
 * are cut at the SDK layer. Every banner, native, interstitial, rewarded and app-open ad goes
 * through Google's next-gen Mobile Ads SDK (Ad Manager units, with Prebid bids and the
 * AppLovin, Fyber, Moloco, Meta, Unity, Vungle and Verve adapters mediated behind it); app code
 * never calls AppLovin MAX or the other networks' ad APIs.
 *
 * The app gates every ad request on its own "MobileAds initialised" flag, which only the
 * initialize listener sets. With initialize returning early that listener never runs, so the app
 * stays on the path it already takes when it skips init itself (no WebView): app-open and
 * interstitial/rewarded requests report "MobileAds.initialize pendiente" at once and the user's
 * action goes ahead, banner and native slots wait (at most 30 s) and then fail or stay empty.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_BESOCCER)

    // Every patched build is re-signed and would otherwise stop at the license paywall.
    dependsOn(disableLicenseCheckPatch)

    execute {
        // 1. MobileAds never initializes, and every void call that throws without init returns
        //    at once. putPublisherFirstPartyIdEnabled throws too; it answers false.
        val patched = mutableSetOf<String>()
        for (owner in MOBILE_ADS) {
            patched += neuter(owner, MOBILE_ADS_VOIDS)
            val firstPartyId = mutableClassDefBy(owner).methods.filter {
                it.name == "putPublisherFirstPartyIdEnabled" && it.returnType == "Z" && it.implementation != null
            }
            if (firstPartyId.isEmpty()) throw PatchException("Disable ads: no $owner->putPublisherFirstPartyIdEnabled")
            firstPartyId.forEach {
                it.returnEarly(false)
                patched += key(owner, it.name, it.parameterTypes, it.returnType)
            }
        }

        // 2. Every void load returns without requesting an ad. The app never gets here while init
        //    is off; this keeps a request from reaching the uninitialised SDK if it ever does.
        LOADERS.forEach { (owner, names) -> patched += neuter(owner, names) }

        // 3. Every app call into MobileAds or a load must land on a patched method (or a MobileAds
        //    call that is safe without init). In 6.6.0: initialize from the home activity's init
        //    coroutine, setUserMutedApp from its listener, setRequestConfiguration from the
        //    privacy helper, registerWebView from four web views, getVersion, AdView.loadAd from
        //    three banner loaders, NativeAdLoader.load from three native loaders and the
        //    InterstitialAd, RewardedAd and AppOpenAd Companion loads. Anything else means the
        //    app moved to an entry point this patch does not cover.
        val uncovered = mutableSetOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/google/") || classDef.type.startsWith("Lads_mobile_sdk/")) {
                return@classDefForEach
            }
            classDef.methods.forEach { method ->
                method.implementation?.instructions?.forEach { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEach
                    if (!ref.definingClass.startsWith(SDK)) return@forEach
                    val isMobileAds = ref.definingClass in MOBILE_ADS
                    if (!isMobileAds && ref.name !in LOAD_NAMES) return@forEach
                    if (isMobileAds && ref.name in MOBILE_ADS_SAFE) return@forEach
                    val target = key(ref.definingClass, ref.name, ref.parameterTypes, ref.returnType)
                    if (target !in patched) uncovered += "${classDef.type}->${method.name} calls $target"
                }
            }
        }
        if (uncovered.isNotEmpty()) {
            throw PatchException("Disable ads: Mobile Ads calls left unpatched: $uncovered")
        }
    }
}
