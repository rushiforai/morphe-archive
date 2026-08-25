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
    definingClass = "Lcom/android/inputmethod/latin/settings/Settings;",
    name = "isPremium",
    returnType = "Z",
    parameters = emptyList(),
)