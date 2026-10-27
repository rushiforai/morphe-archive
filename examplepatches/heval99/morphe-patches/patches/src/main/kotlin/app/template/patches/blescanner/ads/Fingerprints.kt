package app.template.patches.blescanner.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// BLE Scanner keeps its class names and uses the next-gen GMA SDK. Its two ad helpers are found by
// their live ad units, which only their private getLiveUnitId() returns; the loaders are then
// matched by shape inside those classes.

// AdmobBanner.getLiveUnitId(): the live banner unit.
internal object AdmobBannerLiveUnitFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf(string("ca-app-pub-9113721270828121/8819258755", StringComparisonType.CONTAINS)),
)

// AdmobBanner.loadBanner(Context, RelativeLayout): every banner screen (home, device information,
// filter, settings, feedback, licenses) hands it the banner container, and it launches the
// coroutine that builds and loads the BannerAd into that container.
internal object AdmobBannerLoadFingerprint : Fingerprint(
    classFingerprint = AdmobBannerLiveUnitFingerprint,
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/widget/RelativeLayout;"),
)

// AdmobInterstitial.getLiveUnitId(): the live interstitial unit.
internal object AdmobInterstitialLiveUnitFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf(string("ca-app-pub-9113721270828121/2787645901", StringComparisonType.CONTAINS)),
)

// AdmobInterstitial.loadInterstitialAds(Context): launches the coroutine that loads the
// InterstitialAd. HomeActivity calls it on start and the show callback calls it again to reload.
internal object AdmobInterstitialLoadFingerprint : Fingerprint(
    classFingerprint = AdmobInterstitialLiveUnitFingerprint,
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)
