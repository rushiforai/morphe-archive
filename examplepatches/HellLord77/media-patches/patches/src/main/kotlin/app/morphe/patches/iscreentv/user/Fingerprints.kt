package app.morphe.patches.iscreentv.user

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.isNotExtension
import com.android.tools.smali.dexlib2.Opcode

object GetRefreshTokenMethodCallFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lcom/rockstreamer/iscreentv/utils/PreferenceUtil;",
            name = "getRefreshToken",
            parameters = emptyList(),
            returnType = Type.STRING,
            opcode = Opcode.INVOKE_VIRTUAL,
        )
    ),
    custom = ::isNotExtension
)