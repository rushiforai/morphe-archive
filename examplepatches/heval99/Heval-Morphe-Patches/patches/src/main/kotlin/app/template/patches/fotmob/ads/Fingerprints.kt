package app.template.patches.fotmob.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

/**
 * FotMob's shouldShowAds() (`lc.f()Z` in 239): false for FotMob+ subscribers and, after logging
 * "Ads disabled: user is in sanctioned country", for sanctioned countries; true otherwise. The
 * log line is the only string in the APK starting with "Ads disabled" (239), so its prefix plus
 * the no-arg boolean shape finds the gate without the R8-renamed class.
 */
internal object ShouldShowAdsFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("Ads disabled: user is in sanctioned country", StringComparisonType.STARTS_WITH),
    ),
)

/**
 * The ad SDKs' startup providers, declared in the merged manifest (so R8 keeps the names) and run
 * on every cold start before Application.onCreate, whether or not ads are ever shown: Meta
 * Audience Network's AudienceNetworkContentProvider (initialises its dynamic loader) and Liftoff
 * Vungle's VungleProvider (starts its SDK). 2026-11-03, 240.
 */
internal object AudienceNetworkProviderFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/AudienceNetworkContentProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = listOf(),
)

internal object VungleProviderFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/VungleProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = listOf(),
)
