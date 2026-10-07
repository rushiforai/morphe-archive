package app.error404rt.patches.anixart

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

private const val EPISODES_FRAGMENT =
    "Lcom/swiftsoft/anixartd/ui/fragment/main/episodes/EpisodesFragment;"
private const val INTERSTITIAL_AD = "Lcom/yandex/mobile/ads/interstitial/InterstitialAd;"
private const val INTERSTITIAL_LOADER = "Lcom/yandex/mobile/ads/interstitial/InterstitialAdLoader;"
private const val DISPLAY_COMPAT = "Lcom/swiftsoft/anixartd/utils/ui/DisplayCompat;"

internal const val KODIK_AD_ACTIVITY =
    "Lcom/swiftsoft/anixartd/ui/activity/kodik/KodikAdActivity;"

/**
 * DisplayCompat.ll1ll1lI1l(ContextWrapper): Z  (name is obfuscated, class name is not).
 *
 * This is the app's own "ads are suppressed for this user" predicate. It is the ONLY
 * method in DisplayCompat that returns boolean. When it returns true the app itself:
 *  - skips banner setup / loadAd in MainActivity.onCreate and hides the ad strip
 *    (the strip is the RelativeLayout that holds the "Реклама" label),
 *  - makes MainActivity.llIll1lll always take the "hide strip" branch,
 *  - makes DisplayCompat.l1I1I1llI and ViewportSizeCalculator.l1l11l11II return early,
 *    so they no longer re-create the strip programmatically.
 */
object AdsSuppressedFingerprint : Fingerprint(
    definingClass = DISPLAY_COMPAT,
    returnType = "Z",
)

/**
 * KodikAdActivity.onCreate(Bundle). Anchored by the "KodikInterface" string,
 * which is passed to WebView.addJavascriptInterface in this method.
 */
object KodikAdOnCreateFingerprint : Fingerprint(
    definingClass = KODIK_AD_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    strings = listOf(
        "KodikInterface",
    )
)

/**
 * EpisodesFragment.onShowKodikAd(Episode, int, int) - not obfuscated (MVP view callback).
 * Shows a one-time "ad info" disclaimer dialog, then launches KodikAdActivity.
 */
object KodikAdShowFingerprint : Fingerprint(
    definingClass = EPISODES_FRAGMENT,
    name = "onShowKodikAd",
    returnType = "V",
)

object InterstitialLoadFingerprint : Fingerprint(
    definingClass = EPISODES_FRAGMENT,
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = INTERSTITIAL_LOADER,
            name = "loadAd",
        )
    )
)

object InterstitialShowFingerprint : Fingerprint(
    definingClass = EPISODES_FRAGMENT,
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = INTERSTITIAL_AD,
            name = "show",
        )
    )
)
