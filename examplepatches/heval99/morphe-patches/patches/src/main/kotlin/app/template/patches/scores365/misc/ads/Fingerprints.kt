package app.template.patches.scores365.misc.ads

import app.morphe.patcher.Fingerprint

// Google Mobile Ads (AdMob) is 365Scores' primary ad network, loaded via the
// Blaze GAM SDK wrapper. Killing MobileAds.initialize() prevents every
// GAM-mediated ad format (banner, interstitial, rewarded, native) from
// loading, including mediated networks (Unity, InMobi, AppLovin, Meta, etc.).
object MobileAdsInitializeFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/google/android/gms/ads/MobileAds;" &&
                method.name == "initialize" &&
                method.returnType == "V" &&
                method.parameters == listOf("Landroid/content/Context;")
    }
)

object MobileAdsInitializeWithListenerFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/google/android/gms/ads/MobileAds;" &&
                method.name == "initialize" &&
                method.returnType == "V" &&
                method.parameters == listOf(
                    "Landroid/content/Context;",
                    "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;",
                )
    }
)