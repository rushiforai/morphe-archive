package app.template.patches.ircodefinder.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

// The app is R8-renamed, but Yandex Mobile Ads keeps its public class and method names, so every
// anchor below is a Yandex SDK call, a stable string or method shape.

// The banner helper's constructor (14.17.0: m6.<init>): the only place a BannerAdView is built.
// PagerFragment, SmartScanActivity, ScanActivity and NotFoundIrServiceActivity each create one
// with their unit (R-M-10827245-1/2/3) and their LinearLayout container. It stores the container,
// sizes the banner (BannerAdSize inline or sticky), builds and loads the BannerAdView, adds it to
// the container and, for the inline size, launches the refresh coroutine.
internal object BannerHelperConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/widget/LinearLayout;", "Z", "I"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/yandex/mobile/ads/banner/BannerAdSize\$a;",
            name = "sticky",
            parameters = listOf("Landroid/content/Context;", "I"),
            returnType = "Lcom/yandex/mobile/ads/banner/BannerAdSize;",
        ),
        methodCall(
            definingClass = "Lcom/yandex/mobile/ads/banner/BannerAdView;",
            name = "<init>",
        ),
    ),
)

// The interstitial loader (14.17.0: xd2.a(Activity, String, long, Continuation)): a suspend fun and
// the only place an InterstitialAdLoader is built. MainActivity calls it with R-M-10827245-5; on a
// load failure it logs under "InterstitialAdLoadResult" and returns kotlin.Unit.
internal object InterstitialLoadFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf(string("InterstitialAdLoadResult", StringComparisonType.CONTAINS)),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/yandex/mobile/ads/interstitial/InterstitialAdLoader;",
            name = "<init>",
        ),
    ),
    custom = { method, _ ->
        method.parameterTypes.size == 4 &&
            method.parameterTypes[1].toString() == "Ljava/lang/String;" &&
            method.parameterTypes[2].toString() == "J"
    },
)

// kotlin.Unit (14.17.0: lp5), R8-renamed: the class whose toString() returns "kotlin.Unit".
internal object KotlinUnitToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf(string("kotlin.Unit", StringComparisonType.CONTAINS)),
)
