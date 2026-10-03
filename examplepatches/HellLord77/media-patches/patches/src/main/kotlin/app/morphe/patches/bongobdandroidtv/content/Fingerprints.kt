package app.morphe.patches.bongobdandroidtv.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.isNotExtension
import com.android.tools.smali.dexlib2.Opcode

object GetVideoDetailsDataMethodCallFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lsaas/ott/smarttv/ui/details/data/DetailsEndPoint;",
            name = "getVideoDetailsData",
            parameters = listOf(Type.STRING),
            returnType = "Lretrofit2/Call;",
            opcode = Opcode.INVOKE_INTERFACE
        )
    ),
    custom = ::isNotExtension
)