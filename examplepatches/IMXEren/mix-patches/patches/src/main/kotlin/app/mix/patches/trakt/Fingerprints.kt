package app.mix.patches.trakt

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val USER_MODEL_CLASS_TYPE = "Ltv/trakt/trakt/common/model/User;"

internal object UserModelFingerprint : Fingerprint(
    definingClass = USER_MODEL_CLASS_TYPE,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    filters = listOf(
        opcode(Opcode.IPUT_BOOLEAN),
        opcode(Opcode.IPUT_BOOLEAN),
        opcode(Opcode.IPUT_BOOLEAN),
        opcode(Opcode.IPUT_BOOLEAN),
    )
)

internal object UserModelSerializableFingerprint : Fingerprint(
    definingClass = USER_MODEL_CLASS_TYPE,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.SYNTHETIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    filters = listOf(
        opcode(Opcode.IPUT_BOOLEAN),
        opcode(Opcode.IPUT_BOOLEAN),
        opcode(Opcode.IPUT_BOOLEAN),
        opcode(Opcode.IPUT_BOOLEAN),
    )
)
