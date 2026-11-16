package app.template.patches.manglishkeyboard

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/deshkeyboard/billing/d;",
    name = "a",
    returnType = "Z",
    parameters = emptyList(),
)

object PremiumCallbackFingerprint : Fingerprint(
    definingClass = "Lci/a;",
    name = "b",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
)
