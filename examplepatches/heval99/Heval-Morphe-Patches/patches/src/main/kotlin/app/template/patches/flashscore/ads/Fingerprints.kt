package app.template.patches.flashscore.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

internal const val ADVERT_ZONE = "Leu/livesport/core/ui/adverts/AdvertZone;"

// AdvertZone is the app's ad slot view (kept: it is inflated from layouts). Its single load entry
// point picks the provider for the slot (Google, the "revive" bookmaker WebView banners, ...) and
// is the only method that throws "Unsupported ad provider: ". That is the head of a concatenated
// message, so it is matched by prefix: patcher 2.0 compares raw `strings` with the whole constant.
internal object AdvertZoneLoadFingerprint : Fingerprint(
    definingClass = ADVERT_ZONE,
    returnType = "V",
    parameters = listOf(),
    filters = listOf(string("Unsupported ad provider: ", StringComparisonType.STARTS_WITH)),
)

// The video player's media item (R8-renamed, com.zentity.ottplayer.b in 26.10.2): stream URLs,
// DRM data and the VMAP ad response. Found through its data-class toString(). The field label is
// a concatenation piece, so it is matched with CONTAINS, as patcher 1.8.0 matched raw `strings`
// (patcher 2.0 compares raw `strings` with the whole constant).
internal object VideoMediaToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string(", vmapResponse=", StringComparisonType.CONTAINS)),
)

// Its constructor (streams, drm, vmapResponse). The player only creates the IMA ads loader when
// vmapResponse is non-null, so a null VMAP means no pre-roll or mid-roll is ever requested.
internal object VideoMediaConstructorFingerprint : Fingerprint(
    classFingerprint = VideoMediaToStringFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Ljava/util/ArrayList;",
        "Lcom/zentity/ottplayer/MediaProvider\$DrmData;",
        "Ljava/lang/String;",
    ),
)
