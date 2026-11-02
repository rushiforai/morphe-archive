package app.morphe.patches.iscreentv.shared.morphe.com.rockstreamer.iscreentv.pojo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Type
import app.morphe.util.matchSingle
import app.morphe.util.returnBoxedBooleanEarly
import com.android.tools.smali.dexlib2.AccessFlags

object ForceUpdate {
    override fun toString() = "Lcom/rockstreamer/iscreentv/pojo/ForceUpdate;"

    object GetTvForceUpdateFingerprint :
        Fingerprint(
            definingClass = ForceUpdate.toString(),
            name = "getTv_force_update",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = Type.BOOLEAN,
            parameters = emptyList(),
        )

    val getTVForceUpdatePatch =
        bytecodePatch {
            execute {
                GetTvForceUpdateFingerprint.matchSingle().method.returnBoxedBooleanEarly(false)
            }
        }
}
