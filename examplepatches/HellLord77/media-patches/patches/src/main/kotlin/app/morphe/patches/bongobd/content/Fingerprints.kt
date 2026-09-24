package app.morphe.patches.bongobd.content

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object GetContentDetailsFingerprint : Fingerprint(
    definingClass = "Lcom/bongo/bongobd/view/network/ApiServiceSaas;",
    name = "getContentDetails",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.ABSTRACT),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/coroutines/Continuation;"),
)