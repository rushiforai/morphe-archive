package patches.buienradar.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * Builds the list of ad slots (AdvertisementItemDisplay) shown between the weather cards.
 *
 * Signature in 7.4.8 (obfuscated: cg.b):
 *   suspend fun buildAdItems(isAdFree: Boolean, config, String, consent, Location,
 *                            ..., analyticsEvent, String): List<AdvertisementItemDisplay>
 *
 * The first parameter is the app's own "ad free" flag (true for premium users).
 * When it is true the method immediately returns an empty list.
 */
internal object AdItemsFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Z",
        "L",
        "Ljava/lang/String;",
        "L",
        "Lnl/rtl/radargraph/domain/location/Location;",
        "L",
        "L",
        "Ljava/lang/String;",
        "L",
    ),
    strings = listOf("rect", "ski", "top", "bottom")
)

/**
 * Shared coroutine class whose MobileAds initialization branch holds the AdMob application ID.
 */
internal object AdsInitializerFingerprint : Fingerprint(
    strings = listOf("ca-app-pub-7228185019169219~6424194274")
)

internal object AppOnCreateFingerprint : Fingerprint(
    definingClass = "Lnl/rtl/buienradar/app/App;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf()
)

/**
 * Video ad state: `object AdFree : VideoAdState`.
 */
internal object VideoAdFreeToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("AdFree")
    )
)

/**
 * Video ad state: `data class ShowAds(val allowPersonalizedAds: Boolean) : VideoAdState`.
 */
internal object VideoShowAdsToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("ShowAds(allowPersonalizedAds=")
    )
)
