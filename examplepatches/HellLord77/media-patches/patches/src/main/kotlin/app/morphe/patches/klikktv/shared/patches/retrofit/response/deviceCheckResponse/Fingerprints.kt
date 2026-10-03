package app.morphe.patches.klikktv.shared.patches.retrofit.response.deviceCheckResponse

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

internal object GetResultFingerprint : Fingerprint(
    definingClass = "Lcom/angel/klikk/tv/retrofit/response/DeviceCheckResponse;",
    name = "getResult",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.BOOLEAN,
    parameters = emptyList(),
)