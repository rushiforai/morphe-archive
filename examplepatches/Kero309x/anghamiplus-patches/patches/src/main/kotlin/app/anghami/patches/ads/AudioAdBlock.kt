package app.anghami.patches.ads

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceTrue
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Reports every playback item as advertisement-free.
 *
 * Three audio-side guards are neutralised so that the client never requests or
 * schedules an interstitial audio spot:
 *
 * - the play queue's ad toggle always answers `true`,
 * - both the static and the instance query on the ad settings model answer `true`.
 *
 * Only the client-side flags are touched here; the banner and popup surfaces
 * belong to the other advertisement patches in this bundle.
 */
@Suppress("unused")
val audioAdBlockPatch = bytecodePatch(
    name = "Block Audio Ads",
    description = "Prevents audio advertisements between songs and treats playback tracks as ad-free.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        GetDisableAdsSignature.method.forceTrue()
        NoAdStaticSignature.method.forceTrue()
        GetNoAdSignature.method.forceTrue()
    }
}

/** `PlayQueue.getDisableAds()` — queue-level switch that gates audio spots. */
object GetDisableAdsSignature : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "getDisableAds",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            type = "Z",
        ),
    )
)

/** `AdSettings.noAd(Song)` — static lookup deciding whether a track carries ads. */
object NoAdStaticSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/objectbox/models/ads/AdSettings;",
    name = "noAd",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Lcom/anghami/ghost/pojo/Song;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/objectbox/models/ads/AdSettings;",
            name = "fetch",
        ),
        methodCall(
            definingClass = "Lcom/anghami/ghost/objectbox/models/ads/AdSettings;",
            name = "getNoAd",
        ),
    )
)

/** `AdSettings.getNoAd(Song)` — instance variant of the same per-track lookup. */
object GetNoAdSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/objectbox/models/ads/AdSettings;",
    name = "getNoAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf("Lcom/anghami/ghost/pojo/Song;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            type = "Z",
        ),
    )
)
