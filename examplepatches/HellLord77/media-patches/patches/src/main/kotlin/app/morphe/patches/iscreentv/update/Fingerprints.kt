package app.morphe.patches.iscreentv.update

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

object GetTvForceUpdateFingerprint : Fingerprint(
    definingClass = "Lcom/rockstreamer/iscreentv/pojo/ForceUpdate;",
    name = "getTv_force_update",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.BOOLEAN,
    parameters = emptyList(),
)