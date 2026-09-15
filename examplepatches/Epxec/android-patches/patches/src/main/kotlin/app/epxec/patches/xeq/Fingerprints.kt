package app.epxec.patches.xeq.Fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.fieldAccess

object XEQProFingerprint : Fingerprint(
    definingClass = "Lcom/frack/xeq/MainActivity;",
    name = "onCreate",
    returnType = "V",
    filters = listOf(
        string("first_run_onboarding")
    ),
)