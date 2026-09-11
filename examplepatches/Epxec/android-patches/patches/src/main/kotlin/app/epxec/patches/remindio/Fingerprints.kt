package app.epxec.patches.remindio.Fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object RemindioPremiumFingerprint : Fingerprint(
   
    accessFlags = listOf(
        AccessFlags.PUBLIC,
        AccessFlags.FINAL
    ),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        string("LAST_PREMIUM_STATUS"),
        methodCall(smali = "Ljava/lang/Enum;->ordinal()I")
    )

)