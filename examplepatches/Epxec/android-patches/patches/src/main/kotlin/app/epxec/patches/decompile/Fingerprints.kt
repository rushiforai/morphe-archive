package app.epxec.patches.decompile.Fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.fieldAccess

object DecompilePremiumFingerprint : Fingerprint(
   
    accessFlags = listOf(
        AccessFlags.PUBLIC,
        AccessFlags.FINAL,
    ),
    returnType = "V",
    parameters = listOf("Z"),

    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "this",
            type = "Ljava/lang/String;",
        ),

        methodCall(
            smali = "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"
        ),

        opcode(
            Opcode.MOVE_RESULT_OBJECT,
            MatchAfterImmediately(),
        ),

        methodCall(
            returnType = "V",
            parameters = listOf(
                "Ljava/lang/String;",
                "Ljava/lang/Object;",
            ),
        ),
    ),
)

