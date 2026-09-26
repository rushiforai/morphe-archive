package dev.supperelias2.sbstv.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

private const val ADS = "Lcom/sbs/ondemand/player/viewmodels/AdsController;"
private const val PLAYBACK = "Lcom/sbs/ondemand/player/viewmodels/PlaybackController;"
private const val ITEM = "Lcom/sbs/ondemand/model/playback/PlaybackResponse\$PlaybackItem;"

internal object VodRequestFingerprint : Fingerprint(
    definingClass = ADS,
    name = "requestAdStream\$player_googleStoreTvRelease",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/Map;"
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/ads/interactivemedia/v3/api/ImaSdkFactory;",
            name = "createVodStreamRequest"
        )
    )
)

internal object PrerollFingerprint : Fingerprint(
    definingClass = ADS,
    name = "hasPreRollAd",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/ads/interactivemedia/v3/api/StreamManager;",
            name = "getCuePoints"
        )
    )
)

internal object ProviderSelectionFingerprint : Fingerprint(
    definingClass = PLAYBACK,
    name = "processStreamProvider",
    returnType = "V",
    parameters = listOf(ITEM, "Landroid/content/Context;"),
    filters = listOf(string("Using primary Google DAI provider"))
)

internal object FallbackProviderFingerprint : Fingerprint(
    definingClass = PLAYBACK,
    name = "fallbackToAkamaiProvider",
    returnType = "V",
    parameters = listOf(ITEM, "Z"),
    filters = listOf(string("Using fallback Akamai provider"))
)

internal object PairipLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
            name = "checkLicense"
        )
    )
)
