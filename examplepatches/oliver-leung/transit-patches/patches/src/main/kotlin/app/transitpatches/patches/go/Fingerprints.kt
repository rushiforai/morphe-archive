package app.transitpatches.patches.go

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal object GoNotificationFingerprint : Fingerprint(
    definingClass = GO_SERVICE_CLASS,
    isStatic = false,
    returnType = NOTIFICATION_CLASS,
    parameters = listOf(GO_PLATFORM_DATA_CLASS),
    filters = listOf(
        string(GO_CHANNEL_ID),
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            parameters = listOf(SMART_STRING_CLASS, "Z", "Z", "Landroid/content/Context;"),
            returnType = "Ljava/lang/String;",
        ),
        string("Transit GO"),
        methodCall(
            definingClass = GO_PLATFORM_DATA_CLASS,
            name = "getAndroidWidget",
        ),
    ),
)
