package app.jofslash.patches.kaloricketabulky.ads

import app.jofslash.patches.kaloricketabulky.shared.Constants.APP
import app.jofslash.patches.kaloricketabulky.shared.Constants.COMPATIBILITY_KALORICKE_TABULKY
import app.jofslash.patches.kaloricketabulky.shared.methodOf
import app.jofslash.patches.kaloricketabulky.shared.methodsWhere
import app.jofslash.patches.kaloricketabulky.shared.returnBoolean
import app.jofslash.patches.kaloricketabulky.shared.returnEarly
import app.morphe.patcher.patch.bytecodePatch

private const val FUNDING_CHOICES_ACTIVITY = "$APP/activity/FundingChoicesActivity;"
private const val AD_VIEW_MANAGER = "$APP/util/AdMobViewManager;"
private const val INTERSTITIAL = "$APP/screenFragment/home/InterstitialKt;"
private const val INTERSTITIAL_CONDITION = "$APP/screenFragment/home/Conditions\$Interstitial;"
private const val APPLOVIN_SDK = "Lcom/applovin/sdk/AppLovinSdk;"

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides the ad banners and the full-screen ads, and never starts the ad networks (Google AdMob " +
            "and AppLovin) or asks for ad consent. Premium and your subscription aren't touched.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_KALORICKE_TABULKY)

    execute {
        // Every screen with ads extends FundingChoicesActivity. It asks for ad consent (Google's
        // consent form) and then starts the Google Mobile Ads SDK; without either, no ad loads.
        methodOf(FUNDING_CHOICES_ACTIVITY, "askForConsentIfRequired").returnEarly()
        methodOf(FUNDING_CHOICES_ACTIVITY, "shouldInitializeMobileAds").returnBoolean(false)

        // The banner under the screen: its container is hidden and no banner is requested.
        methodOf(AD_VIEW_MANAGER, "getShouldShowAds").returnBoolean(false)

        // The full-screen ad on the home screen, by its own condition and where it loads.
        methodOf(INTERSTITIAL_CONDITION, "evaluate").returnBoolean(false)
        methodOf(INTERSTITIAL, "showInterstitialAd").returnEarly()

        // AppLovin is started by the app itself at start, only to fill AdMob's ad slots.
        methodsWhere(APPLOVIN_SDK, "initialize(configuration, listener)") {
            it.name == "initialize" && it.parameterTypes.size == 2 && it.returnType == "V"
        }.forEach { it.returnEarly() }
    }
}
