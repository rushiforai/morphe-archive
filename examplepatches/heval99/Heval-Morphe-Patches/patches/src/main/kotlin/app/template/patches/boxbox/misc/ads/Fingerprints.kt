package app.template.patches.boxbox.misc.ads

import app.morphe.patcher.Fingerprint

object MaxInterstitialAdLoadFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/applovin/mediation/ads/MaxInterstitialAd;" &&
                method.name == "loadAd" &&
                method.parameters.isEmpty()
    }
)

object MaxInterstitialAdShowFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/applovin/mediation/ads/MaxInterstitialAd;" &&
                method.name == "showAd"
    }
)
