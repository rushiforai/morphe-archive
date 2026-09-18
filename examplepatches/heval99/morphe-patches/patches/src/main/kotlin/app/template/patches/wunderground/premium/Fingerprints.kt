package app.template.patches.wunderground.premium

import app.morphe.patcher.Fingerprint

// Weather Underground ships the Adobe Airlock SDK, which evaluates the "ads.Ad Free"
// entitlement locally from the cached purchase info. These getters are the gates the UI and
// ad code consult; all three classes are unobfuscated.
object AdFreePurchasedFingerprint : Fingerprint(
    definingClass = "Lcom/wunderground/android/weather/utils/AirlockValueUtil;",
    name = "isAdFreePurchased",
)

object IsAdsFreePurchasedFingerprint : Fingerprint(
    definingClass = "Lcom/wunderground/android/weather/app/inapp/PremiumHelper;",
    name = "isAdsFreePurchased",
)

object IsAdsFreeV2UserFingerprint : Fingerprint(
    definingClass = "Lcom/wunderground/android/weather/app/WUApplication;",
    name = "isAdsFreeV2User",
)
