package app.loupric.patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal object UpdateAppListFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            name = "savePackageScopesToSharedPref"
        )
    ),
    custom = { methodDef, classDef ->
        methodDef.name == "updateAppList" &&
        classDef.type == "Lcom/waze/sdk/SdkConfiguration;"
    }
)
