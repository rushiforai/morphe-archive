package app.masareef.patches.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF

@Suppress("unused")
val disableGoogleAdsTrackingPatch = bytecodePatch(
    name = "Disable Google Ads Tracking",
    description = "Disables Google AdMob tracking and impression reporting.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    execute {
        // Disable ad impression tracking
        runCatching {
            val adListenerClass = mutableClassDefBy("Lcom/google/android/gms/ads/AdListener;")
            adListenerClass.methods
                .filter { 
                    it.name in setOf(
                        "onAdClicked",
                        "onAdImpression", 
                        "onAdOpened",
                        "onAdClosed"
                    )
                }
                .forEach { method ->
                    method.addInstructions(
                        0,
                        """
                            return-void
                        """
                    )
                }
        }
        
        // Disable paid event listener (revenue tracking)
        runCatching {
            val paidEventClass = mutableClassDefBy("Lcom/google/android/gms/ads/OnPaidEventListener;")
            paidEventClass.methods
                .filter { it.name == "onPaidEvent" }
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
