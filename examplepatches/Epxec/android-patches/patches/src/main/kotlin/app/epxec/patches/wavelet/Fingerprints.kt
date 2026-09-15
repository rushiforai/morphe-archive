package app.epxec.patches.wavelet.Fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.fieldAccess

object WaveletProFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("allowPurchases"),
        string("isPurchased"),
        opcode(Opcode.RETURN_OBJECT),
        methodCall(
            smali="Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;",
        ),
    ), 
)