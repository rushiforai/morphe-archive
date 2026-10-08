package app.template.patches.moonreader.ads

import app.morphe.patcher.Fingerprint

// The single ad gate every ad path consults: the MrAd constructor returns before
// initializing the ad SDK (AdMob + Facebook Audience Network) when it is true,
// and the interstitial, exit and rewarded show paths check it first.
// com.flyersoft.components.MrAd is the only app class that touches the ad SDK,
// so forcing this one consumer to true disables banner, interstitial, exit and
// native ads without touching the SDK classes or billing.
object DisableAdsFingerprint : Fingerprint(
    definingClass = "Lcom/flyersoft/components/MrAd;",
    name = "disableAds",
    returnType = "Z",
)
