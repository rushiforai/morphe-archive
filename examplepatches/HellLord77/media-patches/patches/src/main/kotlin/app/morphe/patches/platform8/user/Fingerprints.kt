package app.morphe.patches.platform8.user

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patches.platform8.shared.morphe.com.digivive.nexgtv.activities.SplashActivity
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.morphe.java.lang.String
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object IsProfileCompleteFieldAccessFingerprint :
    Fingerprint(
        filters =
            listOf(
                fieldAccess(
                    definingClass = SplashActivity.toString(),
                    name = "isProfileComplete",
                    type = String.toString(),
                    opcode = Opcode.IGET_OBJECT,
                ),
            ),
    )

object IsAdditionalProfileFieldSkippedFieldAccessFingerprint :
    Fingerprint(
        filters =
            listOf(
                fieldAccess(
                    definingClass = SplashActivity.toString(),
                    name = "isAdditionalProfileFieldSkipped",
                    type = String.toString(),
                    opcode = Opcode.IGET_OBJECT,
                ),
            ),
    )

object CallNextActivityMethodCallFingerprint :
    Fingerprint(
        definingClass = SplashActivity.toString(),
        name = "onResponse",
        accessFlags = listOf(AccessFlags.PUBLIC),
        returnType = Type.void,
        parameters = listOf(String.toString(), Type.int),
        filters =
            listOf(
                methodCall(
                    definingClass = SplashActivity.toString(),
                    name = "callNextActivity",
                    parameters = listOf(Type.int),
                    returnType = Type.void,
                    opcode = Opcode.INVOKE_DIRECT,
                ),
            ),
    )
