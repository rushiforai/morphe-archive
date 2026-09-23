package app.epxec.patches.mazii.Fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.fieldAccess

object MaziiIsPremiumFingerprint : Fingerprint(
    definingClass = "Ld4a;",
    name = "a2",
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        string("isPremium"),
    ) 
)

object MaziiIsPremiumAIFingerprint: Fingerprint(
    definingClass = "Ld4a;",
    name = "K1",
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        string("isMaii"),
    )
)