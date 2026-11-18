package app.template.patches.me

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_ME
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/*
 * Me shows ads through three paths, so ads are removed in layers:
 *
 * 1. App gates. Two obfuscated static ()Z methods (x9.b / qt9.a in 7.20.6) decide whether the
 *    in-list ad hosts may show an ad: not premium, logged in, and 90 s since launch
 *    (PropertiesStorage$Properties.Is90SecondsPassed). They only gate ads, so forcing false
 *    turns ads off without touching premium features. Found by that field reference.
 * 2. Ad SDK entry points. AppLovin MAX (which mediates Pangle, Mintegral, Moloco, Vungle,
 *    InMobi, DT, Meta) and Google AdMob keep their public API names, so every load/show is
 *    neutered by class + method name. isReady() returns false so the app takes its own
 *    "no ad, continue" path instead of waiting.
 * 3. Ad host view. ViewAdRecyclerPopUp (call log, contacts, favourites, menu ...) collapses.
 */

private const val PROPERTIES = "Lcom/nfo/me/android/data/repositories/shared_preferences/PropertiesStorage\$Properties;"

private val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

private fun MutableMethod.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

private fun MutableMethod.readsField(owner: String, name: String) =
    implementation?.instructions?.any { insn ->
        val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
        ref != null && ref.definingClass == owner && ref.name == name
    } == true

/** class -> method names to neuter (void => return-void, boolean => false, object => null). */
private val SDK_METHODS = mapOf(
    "Lcom/applovin/mediation/ads/MaxAdView;" to setOf("loadAd", "startAutoRefresh"),
    "Lcom/applovin/mediation/ads/MaxInterstitialAd;" to setOf("loadAd", "showAd", "isReady"),
    "Lcom/applovin/mediation/ads/MaxRewardedAd;" to setOf("loadAd", "showAd", "isReady"),
    "Lcom/applovin/mediation/ads/MaxRewardedInterstitialAd;" to setOf("loadAd", "showAd", "isReady"),
    "Lcom/applovin/mediation/ads/MaxAppOpenAd;" to setOf("loadAd", "showAd", "isReady"),
    "Lcom/applovin/mediation/nativeAds/MaxNativeAdLoader;" to setOf("loadAd"),
    "Lcom/google/android/gms/ads/BaseAdView;" to setOf("loadAd"),
    "Lcom/google/android/gms/ads/AdLoader;" to setOf("loadAd", "loadAds"),
    "Lcom/google/android/gms/ads/interstitial/InterstitialAd;" to setOf("load"),
    "Lcom/google/android/gms/ads/appopen/AppOpenAd;" to setOf("load"),
    "Lcom/google/android/gms/ads/rewarded/RewardedAd;" to setOf("load"),
    "Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAd;" to setOf("load"),
)

private fun MutableMethod.neuter() {
    when (returnType.first()) {
        'V' -> addInstructions(0, "return-void")
        'Z' -> addInstructions(0, RETURN_FALSE)
        'L', '[' -> addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    }
}

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes all ads: banners, native ads, interstitials, app-open and rewarded ads, " +
        "in every screen and the caller pop-up. Does not unlock Me Pro features.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ME)

    execute {
        // Layer 1: app ad gates.
        val gateClasses = mutableListOf<String>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith("L") || classDef.type.startsWith("Lcom/applovin")) return@classDefForEach
            val candidate = classDef.methods.any { m ->
                m.returnType == "Z" && m.parameterTypes.isEmpty() && AccessFlags.STATIC.isSet(m.accessFlags) &&
                    m.implementation?.instructions?.any { insn ->
                        val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
                        ref != null && ref.definingClass == PROPERTIES && ref.name == "Is90SecondsPassed"
                    } == true
            }
            if (candidate) gateClasses += classDef.type
        }
        gateClasses.forEach { type ->
            mutableClassDefBy(type).methods
                .filter { it.returnType == "Z" && it.parameterTypes.isEmpty() && it.isStatic() && it.readsField(PROPERTIES, "Is90SecondsPassed") }
                .forEach { it.addInstructions(0, RETURN_FALSE) }
        }
        if (gateClasses.isEmpty()) throw IllegalStateException("Me ad gate methods not found")

        // Layer 2: ad SDK entry points.
        SDK_METHODS.forEach { (type, names) ->
            mutableClassDefByOrNull(type)?.methods
                ?.filter { it.name in names && it.implementation != null }
                ?.forEach { it.neuter() }
        }

        // Layer 3: collapse the shared ad host view.
        mutableClassDefByOrNull("Lcom/nfo/me/android/presentation/views/ads/ViewAdRecyclerPopUp;")?.methods
            // Only setup(LovinAdTags, int): it has local registers. setTag(LovinAdTags) has none, so
            // writing v0 there clobbers `this` and the class fails verification.
            ?.filter { it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } == listOf("Lcom/nfo/me/core_utils/ads/main/LovinAdTags;", "I") }
            ?.forEach {
                it.addInstructions(
                    0,
                    """
                        const/16 v0, 0x8
                        invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                        return-void
                    """,
                )
            }
    }
}
