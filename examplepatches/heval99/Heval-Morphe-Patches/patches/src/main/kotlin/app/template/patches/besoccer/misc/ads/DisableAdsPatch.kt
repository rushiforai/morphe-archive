package app.template.patches.besoccer.misc.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.returnEarly
import app.template.patches.besoccer.misc.license.disableLicenseCheckPatch
import app.template.patches.shared.Constants.COMPATIBILITY_BESOCCER
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val MAX = "Lcom/applovin/mediation/"
private const val MAX_AD_VIEW = "${MAX}ads/MaxAdView;"

/** Returns early from every concrete void method on [owner] matching [names]. */
private fun BytecodePatchContext.neuter(owner: String, vararg names: String) {
    val targets = mutableClassDefBy(owner).methods.filter {
        it.implementation != null && it.returnType == "V" && it.name in names
    }
    if (targets.isEmpty()) throw PatchException("No ${names.joinToString("/")} on $owner")
    targets.forEach { it.returnEarly() }
}

/**
 * BeSoccer's ad-free tier is validated server-side and its ad engine is R8-obfuscated, so
 * ads are cut at the SDK layer. AppLovin MAX is the only renderer (banners, interstitials,
 * natives, app-open, rewarded); Unity, Meta and Vungle are mediated networks and Prebid is
 * bidding-only (its rendering API is stripped). AdMob has no initialize/load surface here.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables banner, interstitial, native, app-open and rewarded ads and hides " +
            "empty banner slots."
) {
    compatibleWith(COMPATIBILITY_BESOCCER)

    // Every patched build is re-signed and would otherwise stop at the license paywall.
    dependsOn(disableLicenseCheckPatch)

    execute {
        // MAX never initializes, loads or shows.
        neuter("Lcom/applovin/sdk/AppLovinSdk;", "initialize")
        neuter(MAX_AD_VIEW, "loadAd")
        neuter("${MAX}ads/MaxInterstitialAd;", "loadAd", "showAd")
        neuter("${MAX}ads/MaxRewardedAd;", "loadAd", "showAd")
        neuter("${MAX}ads/MaxAppOpenAd;", "loadAd", "showAd")
        neuter("${MAX}nativeAds/MaxNativeAdLoader;", "loadAd")

        // Mediated networks never initialize either.
        neuter("Lcom/unity3d/ads/UnityAds;", "initialize")
        neuter("Lcom/facebook/ads/AudienceNetworkAds;", "initialize")
        neuter("Lcom/vungle/ads/VungleAds;", "init")

        // Banner slots: keep MaxAdView GONE so no empty box is left in the layout.
        val adView = mutableClassDefBy(MAX_AD_VIEW)
        val existing = adView.methods.firstOrNull {
            it.name == "setVisibility" && it.parameterTypes.map(CharSequence::toString) == listOf("I")
        }
        if (existing != null) {
            existing.addInstructions(0, "const/16 p1, 0x8")
        } else {
            val superclass = adView.superclass ?: throw PatchException("MaxAdView has no superclass")
            adView.methods.add(
                ImmutableMethod(
                    MAX_AD_VIEW,
                    "setVisibility",
                    listOf(ImmutableMethodParameter("I", null, null)),
                    "V",
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    MutableMethodImplementation(2),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            const/16 p1, 0x8
                            invoke-super {p0, p1}, $superclass->setVisibility(I)V
                            return-void
                        """.trimIndent()
                    )
                }
            )
        }
    }
}
