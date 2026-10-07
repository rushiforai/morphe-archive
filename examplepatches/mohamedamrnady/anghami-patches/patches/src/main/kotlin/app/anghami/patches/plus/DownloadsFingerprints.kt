package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Download-gate targets (Anghami 8.0.28, verified in Anghami 8.0.28).
 *
 * Used by the "Unlock downloads" patch. `isOnLimitedPlan` body is
 * `maxOfflineSongs <= 100 && > 0`, NOT an isPlusUser call.
 */

object IsOnLimitedPlanFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/downloads/DownloadManager;",
    name = "isOnLimitedPlan",
    returnType = "Z",
    parameters = listOf("Lcom/anghami/ghost/local/Account;"),
    filters = listOf(
        literal(100),
        opcode(Opcode.RETURN),
    )
)

object AssertDownloadLimitReachedFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/downloads/DownloadManager;",
    name = "assertDownloadLimitReached",
    returnType = "V",
    parameters = listOf("Lcom/anghami/ghost/local/Account;", "I"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "Lcom/anghami/ghost/local/Account;",
            type = "I",
        ),
        opcode(Opcode.THROW),
    )
)

object AssertDownloadRestrictionsFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/downloads/DownloadManager;",
    name = "assertDownloadRestrictions",
    returnType = "V",
    parameters = listOf(
        "Lcom/anghami/ghost/local/Account;",
        "I",
        "Lcom/anghami/ghost/objectbox/models/downloads/SongDownloadReason;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/local/Account;",
            name = "isPlusUser",
        ),
        opcode(Opcode.THROW),
    )
)

object MaxOfflineSongsFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/model/proto/ProtoAccount\$Account;",
    name = "getMaxOfflineSongs",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "I",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "this",
            type = "I",
        ),
    )
)

object MaxOfflineTimeFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/model/proto/ProtoAccount\$Account;",
    name = "getMaxOfflineTime",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "I",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "this",
            type = "I",
        ),
    )
)

object GetCanGoLiveFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/model/proto/ProtoAccount\$Account;",
    name = "getCanGoLive",
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
