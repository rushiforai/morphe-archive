package app.morphe.patches.shadhin.shared.morphe.com.gm.shadhin

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Type
import app.morphe.util.matchSingle
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

object MainContentModel {
    override fun toString() = "Lcom/gm/shadhin/data/remote/api/model/MainContentModel;"

    object IsPaidFingerprint :
        Fingerprint(
            definingClass = MainContentModel.toString(),
            name = "isPaid",
            accessFlags = listOf(AccessFlags.PUBLIC),
            returnType = Type.boolean,
            parameters = emptyList(),
        )

    val isPaidPatch =
        bytecodePatch {
            execute {
                IsPaidFingerprint.matchSingle().method.returnEarly(false)
            }
        }
}
