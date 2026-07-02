package app.morphe.patches.realmelink.bypasssession

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object AccountCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;", "Lkotlin/coroutines/Continuation;"),
    custom = { method, classDef ->
        classDef.type == "Lcom/realme/iot/account/internal/AccountCheckHelper\$Companion;" && 
        method.name == "o"
    }
)

object MainPresenterFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/realme/iot/common/eventbus/BaseMessage;"),
    custom = { method, classDef ->
        classDef.type == "Lcom/realme/link/home/MainPresenter;" && 
        method.name == "handleMessage"
    }
)