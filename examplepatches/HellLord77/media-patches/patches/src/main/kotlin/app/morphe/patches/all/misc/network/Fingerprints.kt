package app.morphe.patches.all.misc.network

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

object HasTransportInvokerFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Landroid/net/NetworkCapabilities;",
            name = "hasTransport",
            parameters = listOf("I"),
            returnType = "Z",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    )
)