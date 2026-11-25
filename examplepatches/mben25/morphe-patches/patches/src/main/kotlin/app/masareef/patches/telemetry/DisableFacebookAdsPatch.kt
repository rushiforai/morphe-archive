package app.masareef.patches.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF

@Suppress("unused")
val disableFacebookAdsPatch = bytecodePatch(
    name = "Disable Facebook Ads Tracking",
    description = "Disables Facebook Audience Network ad tracking and telemetry.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    execute {
        // Disable Facebook Ads tracking methods
        val adClasses = setOf(
            "Lcom/facebook/ads/AdView;",
            "Lcom/facebook/ads/NativeAdBase;",
            "Lcom/facebook/ads/InterstitialAd;",
            "Lcom/facebook/ads/RewardedInterstitialAd;",
            "Lcom/facebook/ads/RewardedVideoAd;",
        )

        adClasses.forEach { className ->
            runCatching {
                val clazz = mutableClassDefBy(className)
                
                // Disable ad loading methods to prevent tracking
                clazz.methods
                    .filter { it.name in setOf("loadAd", "isAdLoaded", "show") }
                    .forEach { method ->
                        method.addInstructions(
                            0,
                            """
                                return-void
                            """
                        )
                    }
            }
        }
        
        // Disable AudienceNetwork initialization
        runCatching {
            val audienceNetworkClass = mutableClassDefBy("Lcom/facebook/ads/AudienceNetworkAds;")
            audienceNetworkClass.methods
                .filter { it.name == "initialize" }
                .forEach { method ->
                    method.addInstructions(
                        0,
                        """
                            return-void
                        """
                    )
                }
        }
    }
}
