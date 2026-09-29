package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Audio-ad flag targets (Anghami 8.0.28, verified in base.apk smali).
 *
 * Used by the "Disable audio ads" patch. Song-level ad flags only; popup
 * and banner UI live in their own patches.
 */

object GetDisableAdsFingerprint : Fingerprint(
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

object NoAdStaticFingerprint : Fingerprint(
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

object GetNoAdFingerprint : Fingerprint(
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
