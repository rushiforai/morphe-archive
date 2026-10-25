package mightymich.morphe.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Universal (basic): no-op common ad SDK load/show methods.
 * Covers AdMob / GMS Ads, Facebook Audience Network, AppLovin, Unity Ads, ironSource, Vungle, etc.
 */
@Suppress("unused")
val disableAdsBasicPatch = bytecodePatch(
    name = "Disable ads (basic)",
    description = "No-ops common ad SDK load/show/init methods (AdMob, FAN, AppLovin, Unity Ads, …).",
    default = false
) {
    execute {
        val classPrefixes = listOf(
            "Lcom/google/android/gms/ads/",
            "Lcom/google/android/gms/internal/ads/",
            "Lcom/facebook/ads/",
            "Lcom/applovin/",
            "Lcom/unity3d/services/ads/",
            "Lcom/unity3d/ads/",
            "Lcom/ironsource/",
            "Lcom/vungle/",
            "Lcom/chartboost/",
            "Lcom/mbridge/",
            "Lcom/bytedance/sdk/openadsdk/",
            "Lcom/anythink/",
            "Lcom/mintegral/"
        )

        val methodNames = setOf(
            "loadAd", "loadAds", "show", "showAd", "showInterstitial",
            "showRewardedVideo", "showBanner", "load", "loadAndShow",
            "displayAd", "startAd", "requestAd", "fetchAd"
        )

        for (classDef in classes) {
            if (classPrefixes.none { classDef.type.startsWith(it) }) continue

            for (method in classDef.methods) {
                if (method.implementation == null) continue
                if (method.name !in methodNames &&
                    methodNames.none { method.name.startsWith(it) }
                ) continue

                try {
                    when (method.returnType) {
                        "V" -> method.addInstructions(0, "return-void")
                        "Z" -> method.addInstructions(
                            0,
                            """
                                const/4 v0, 0x0
                                return v0
                            """
                        )
                        else -> method.addInstructions(
                            0,
                            """
                                const/4 v0, 0x0
                                return-object v0
                            """
                        )
                    }
                } catch (_: Exception) {
                }
            }
        }
    }
}
