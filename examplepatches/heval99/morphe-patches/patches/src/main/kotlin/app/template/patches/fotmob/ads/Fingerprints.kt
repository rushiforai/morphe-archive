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
