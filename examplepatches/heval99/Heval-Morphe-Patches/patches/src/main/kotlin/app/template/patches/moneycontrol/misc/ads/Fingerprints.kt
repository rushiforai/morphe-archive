package app.template.patches.moneycontrol.misc.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// The menu API's ad-config parser (AdDataParser.c on 14.6.2, members R8-renamed). It turns the
// "data" JSON into one HashMap of ad slots keyed by these slot names and hands it to the ad
// repository with a single (HashMap)V call; the repository's class is taken from that call.
internal object AdConfigParserFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/content/Context;"),
    strings = listOf(
        string("native_ad", StringComparisonType.CONTAINS),
        string("splash_top", StringComparisonType.CONTAINS),
        string("splash_bottom", StringComparisonType.CONTAINS),
        string("dfp_custom", StringComparisonType.CONTAINS),
    ),
)

// Utility's sticky bottom-ad container toggles (members R8-renamed: r / p on 14.6.2). Both take
// the FragmentActivity whose admobi_root_visibilityControlLayout they show or hide, and log a
// fixed "Utility hideAndShowAds Visibility ..." line first.
internal object ShowStickyAdFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroidx/fragment/app/FragmentActivity;"),
    filters = listOf(string("Utility hideAndShowAds Visibility VISIBLE", StringComparisonType.STARTS_WITH)),
)

internal object HideStickyAdFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroidx/fragment/app/FragmentActivity;"),
    filters = listOf(string("Utility hideAndShowAds Visibility GONE", StringComparisonType.STARTS_WITH)),
)
