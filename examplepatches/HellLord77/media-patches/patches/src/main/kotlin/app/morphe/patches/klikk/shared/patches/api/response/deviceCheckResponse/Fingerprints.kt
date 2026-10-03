package app.morphe.patches.klikk.shared.patches.api.response.deviceCheckResponse

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

internal object GetResultFingerprint : Fingerprint(
    definingClass = "Lcom/angel/klikk/api/response/DeviceCheckResponse;",
    name = "getResult",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.BOOLEAN,
    parameters = emptyList(),
)