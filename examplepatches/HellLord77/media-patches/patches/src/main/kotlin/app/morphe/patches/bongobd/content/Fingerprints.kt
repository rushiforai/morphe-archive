package app.morphe.patches.bongobd.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

object GetContentDetailsInvokerFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lcom/bongo/bongobd/view/network/ApiServiceSaas;",
            name = "getContentDetails",
            parameters = listOf("Ljava/lang/String;", "Lkotlin/coroutines/Continuation;"),
            returnType = "Ljava/lang/Object;",
            opcode = Opcode.INVOKE_INTERFACE,
        )
    )
)