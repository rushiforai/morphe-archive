package app.morphe.patches.shadhin.shared.morphe.com.gm.shadhin

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
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
}
