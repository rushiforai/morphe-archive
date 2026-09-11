package app.epxec.patches.haloreelspro.Fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.fieldAccess

object HaloreelsproVipFingerprint : Fingerprint(
   
    accessFlags = listOf(
        AccessFlags.PUBLIC,
        AccessFlags.FINAL,
    ),
    returnType = "Z",
    name = "isVip"
)

