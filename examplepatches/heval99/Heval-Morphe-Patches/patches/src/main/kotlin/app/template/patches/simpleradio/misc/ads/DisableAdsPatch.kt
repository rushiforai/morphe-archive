package app.template.patches.simpleradio.misc.ads

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SIMPLERADIO
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

// Simple Radio mediates ads through AppLovin MAX (the AppLovin SDK key is inline
// in the ads manager's initialize()) plus Google Mobile Ads / Ad Manager (banners,
// native, interstitials; the bundled mediation adapters also reach the rewarded and
// app-open loaders). Both SDKs keep their public class and method names, so the patch
// no-ops every public load/show entry point on that stable library surface.
//
// Every listed method is mandatory: a missing class or a name with no concrete void
// implementation fails the patch instead of silently skipping it (the old "AdView"
// entry matched nothing, because loadAd lives on BaseAdView and AdManagerAdView).
//
// Prebid (org.prebid.mobile, new in 6.2.4) is deliberately left alone: it only adds
// header-bidding keywords to the Ad Manager interstitial request, and the app blocks on
// that future with an untimed get(), so a no-op fetchDemand would park two threads per
// interstitial attempt. AdManagerInterstitialAd.load below is what actually shows ads.
private const val GMA = "Lcom/google/android/gms/ads/"
private const val MAX = "Lcom/applovin/mediation/"

private val HOOKS = mapOf(
    // Banners: AdView has no loadAd of its own; AdManagerAdView (what the app's banner
    // slots use) has a separate loadAd(AdManagerAdRequest) that does not call super.
    GMA + "BaseAdView;" to setOf("loadAd"),
    GMA + "admanager/AdManagerAdView;" to setOf("loadAd"),
    // Native ads.
    GMA + "AdLoader;" to setOf("loadAd", "loadAds"),
    // Full-screen formats: static load(...) on abstract classes (the abstract show()
    // members are filtered out by the implementation check below).
    GMA + "interstitial/InterstitialAd;" to setOf("load"),
    GMA + "admanager/AdManagerInterstitialAd;" to setOf("load"),
    GMA + "rewarded/RewardedAd;" to setOf("load"),
    GMA + "rewardedinterstitial/RewardedInterstitialAd;" to setOf("load"),
    GMA + "appopen/AppOpenAd;" to setOf("load"),
    // AppLovin MAX. The terminal interstitial overload is showAd(String, String,
    // Activity), so every concrete showAd is patched, not just the first.
    MAX + "ads/MaxInterstitialAd;" to setOf("loadAd", "showAd"),
    MAX + "ads/MaxAdView;" to setOf("loadAd"),
    MAX + "ads/MaxRewardedAd;" to setOf("loadAd"),
    // The app also calls MaxAppOpenAd.showAd() directly, so show is patched too rather
    // than relying on it doing nothing without a loaded ad.
    MAX + "ads/MaxAppOpenAd;" to setOf("loadAd", "showAd"),
    MAX + "nativeAds/MaxNativeAdLoader;" to setOf("loadAd"),
)

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_SIMPLERADIO)

    execute {
        // 1. Never initialize Google Mobile Ads, and neuter the MobileAds statics that need it.
        // Without initialize() setAppVolume, setAppMuted, openDebugMenu, the private setPlugin
        // and putPublisherFirstPartyIdEnabled throw "MobileAds.initialize() must be called
        // prior to ...". The app's ads manager calls setAppVolume(0f) right after initialize(),
        // which crashed every cold start while Remote Config "android_ump_enabled" was not yet
        // active (fresh install); only the UMP consent callbacks swallowed it. So every concrete
        // static void on MobileAds returns at once and putPublisherFirstPartyIdEnabled answers
        // false. getInitializationStatus also throws, but nothing in the app or its adapters
        // calls it. An uninitialized SDK keeps the ads manager's isInitialized() false, the
        // app's own gate for ad preloads, native loads and the favorites medium-rectangle row.
        // initialize and setAppVolume (the crash site) are mandatory.
        neutraliseMobileAdsStatics("initialize", "setAppVolume")

        // 2. Every GMA/MAX load/show entry point.
        for ((owner, names) in HOOKS) {
            val methods = mutableClassDefByOrNull(owner)?.methods
                ?: throw PatchException("Disable ads: $owner not found")

            for (name in names) {
                // returnEarly() is void-only and NPEs on abstract declarations.
                val targets = methods.filter {
                    it.name == name && it.returnType == "V" && it.implementation != null
                }
                if (targets.isEmpty()) {
                    throw PatchException("Disable ads: no concrete void $owner->$name")
                }
                targets.forEach { it.returnEarly() }
            }
        }

        // 3. The station lists reserve a native-ad row ("Ad" badge) whenever the
        // "android_search_nativeads_show" experiment is on and the user is not premium, and
        // inflate an empty card when no ad loaded. Enable Premium hides it through the premium
        // half of that check; here the experiment half answers false, so the row is never
        // reserved and no native load is attempted.
        val loader = NativeAdsShowLoaderFingerprint
        val nativeAdsShow = loader.method.instructions
            .drop(loader.instructionMatches.first().index)
            .firstOrNull { it.opcode == Opcode.SPUT_OBJECT }
            ?.let { (it as ReferenceInstruction).reference as FieldReference }
            ?.takeIf { it.type == "Ljava/lang/Boolean;" && it.definingClass == loader.classDef.type }
            ?: throw PatchException("Disable ads: no Boolean stored after \"android_search_nativeads_show\"")

        val getters = loader.classDef.methods.filter { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.implementation != null &&
                method.instructions.any { instruction ->
                    if (instruction.opcode != Opcode.SGET_OBJECT) return@any false
                    val field = (instruction as ReferenceInstruction).reference as FieldReference
                    field.definingClass == nativeAdsShow.definingClass &&
                        field.name == nativeAdsShow.name && field.type == nativeAdsShow.type
                }
        }
        if (getters.isEmpty()) {
            throw PatchException("Disable ads: no boolean getter reads ${nativeAdsShow.name}")
        }
        getters.forEach { it.returnEarly(false) }
    }
}
