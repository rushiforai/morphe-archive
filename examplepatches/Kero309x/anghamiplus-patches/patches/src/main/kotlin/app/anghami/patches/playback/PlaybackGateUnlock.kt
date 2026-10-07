package app.anghami.patches.playback

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceFalse
import app.anghami.patches.core.forceTrue
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Lifts the client-side limits that cap track skipping and queue navigation.
 *
 * The playback queue guards that decide whether a skip is still allowed and
 * whether queue restrictions apply are pinned to `false`, while the three
 * accessors that report those restrictions as disabled are pinned to `true`.
 * A fourth switch on the account model that re-enables player restrictions is
 * pinned to `false` as well.
 *
 * Only local gates are touched; stream authorization and entitlement checks
 * remain entirely server-side.
 */
@Suppress("unused")
val playbackGateUnlockPatch = bytecodePatch(
    name = "Unlimited Track Skips",
    description = "Removes song skip limitations and queue navigation restrictions.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        SkipLimitReachedSignature.method.forceFalse()
        QueueRestrictionsEnabledSignature.method.forceFalse()
        GetDisableSkipLimitSignature.method.forceTrue()
        GetDisableQueueRestrictionsSignature.method.forceTrue()
        GetDisablePlayerRestrictionsSignature.method.forceTrue()
        ProtoEnablePlayerRestrictionsSignature.method.forceFalse()
    }
}

/** Matches the queue guard that reports whether the skip limit was reached. */
object SkipLimitReachedSignature : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "skipLimitReached",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf("Lcom/anghami/ghost/local/Account;"),
    filters = listOf(
        methodCall(
            definingClass = "Ljava/lang/System;",
            name = "currentTimeMillis",
        ),
    )
)

/** Matches the queue guard that reports whether queue restrictions are active. */
object QueueRestrictionsEnabledSignature : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "queueRestrictionsEnabled",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/local/Account;",
            name = "isPlusUser",
        ),
        methodCall(
            definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
            name = "getDisableQueueRestrictions",
        ),
    )
)

/** Matches the accessor exposing the skip-limit disable flag. */
object GetDisableSkipLimitSignature : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "getDisableSkipLimit",
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

/** Matches the accessor exposing the queue-restrictions disable flag. */
object GetDisableQueueRestrictionsSignature : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "getDisableQueueRestrictions",
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

/** Matches the accessor exposing the player-restrictions disable flag. */
object GetDisablePlayerRestrictionsSignature : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "getDisablePlayerRestrictions",
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

/** Matches the account switch that re-enables player restrictions. */
object ProtoEnablePlayerRestrictionsSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/model/proto/ProtoAccount\$Account;",
    name = "getEnablePlayerRestrictions",
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
