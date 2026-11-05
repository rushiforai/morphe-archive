package app.template.patches.gpsmapcamera.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

// The app keeps its own class and member names (a keep rule: only R8's synthetic lambdas get
// letters), so the ad managers' gates are stable anchors. Each gate is
// `!isSubscribed() && ConsentManager.canRequestAds()`, and every load, show and banner of the
// manager returns at once when it answers false - the path the app itself takes for subscribers and
// for users who refused ad consent.
private const val ADS_PACKAGE = "Lcom/gkfriend/gpsmapcameraeditor/ads/"
private const val CONSENT_MANAGER = "${ADS_PACKAGE}ConsentManager;"

/** AdManager: banners, interstitials, rewarded, native ads and MobileAds.initialize. */
internal object AdManagerCanShowAdsFingerprint : Fingerprint(
    definingClass = "${ADS_PACKAGE}AdManager;",
    name = "canShowAds",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(methodCall(definingClass = CONSENT_MANAGER, name = "canRequestAds")),
)

/** AppOpenAdManager: the app-open ad loaded at startup and shown on every foreground. */
internal object AppOpenAdManagerCanShowAdsFingerprint : Fingerprint(
    definingClass = "${ADS_PACKAGE}AppOpenAdManager;",
    name = "canShowAds",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(methodCall(definingClass = CONSENT_MANAGER, name = "canRequestAds")),
)
