package app.template.patches.reverso

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object PremiumFingerprint : Fingerprint(
    definingClass = "Lcom/softissimo/reverso/context/CTXPreferences;",
    name = "P",
    returnType = "Z",
    parameters = emptyList(),
)