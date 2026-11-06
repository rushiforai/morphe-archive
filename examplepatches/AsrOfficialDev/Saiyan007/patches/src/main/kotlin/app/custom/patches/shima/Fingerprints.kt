package app.custom.patches.shima

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

// Match the purchase-state store structurally: R8 uses Unicode class/method names.
internal object ProStateConstructorFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
    strings = listOf("purchase", "signature"),
    filters = listOf(
        literal(4096L),
        opcode(Opcode.IPUT, MatchAfterImmediately()),
    ),
)

internal object ProStateUpdateFingerprint : Fingerprint(
    classFingerprint = ProStateConstructorFingerprint,
    isStatic = false,
    parameters = listOf("I"),
    returnType = "V",
    filters = listOf(
        fieldAccess(opcode = Opcode.IPUT, definingClass = "this", type = "I"),
    ),
)

// Independent, inlined checks protect alerts, gesture rules, the overlay's
// initial/refreshed feature mask, backup export, and backup restore.
internal object FeatureGuardFingerprint : Fingerprint(
    strings = listOf("island_integrity", "island_pro", "pro_unlock", "purchaseState"),
    filters = listOf(
        opcode(Opcode.NEG_INT),
        opcode(Opcode.OR_INT_2ADDR, MatchAfterImmediately()),
        opcode(Opcode.USHR_INT_LIT8, MatchAfterImmediately()),
    ),
)
