package app.morphe.patches.bongobd.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.isNotExtension
import com.android.tools.smali.dexlib2.Opcode

object GetContentDetailsMethodCallFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lcom/bongo/bongobd/view/network/ApiServiceSaas;",
            name = "getContentDetails",
            parameters = listOf(Type.STRING, Type.CONTINUATION),
            returnType = Type.OBJECT,
            opcode = Opcode.INVOKE_INTERFACE,
        )
    ),
    custom = ::isNotExtension
)