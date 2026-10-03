package app.morphe.patches.all.misc.network

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.isNotExtension
import com.android.tools.smali.dexlib2.Opcode

object HasTransportMethodCallFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Landroid/net/NetworkCapabilities;",
            name = "hasTransport",
            parameters = listOf(Type.int),
            returnType = Type.boolean,
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
    custom = ::isNotExtension
)