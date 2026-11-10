package app.morphe.patches.addatimes.shared.morphe.com.addatimes.addatimes.data.model.get

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.morphe.java.lang.String
import com.android.tools.smali.dexlib2.AccessFlags

object ContentUserData {
    override fun toString() = "Lcom/addatimes/addatimes/data/model/get/ContentUserData;"

    object GetPlayButtonLabelFingerprint : Fingerprint(
        definingClass = ContentUserData.toString(),
        name = "getPlayButtonLabel",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = String.toString(),
        parameters = emptyList(),
    )
}
