package app.morphe.patches.addatimes.shared.morphe.com.addatimes.addatimes

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

object AddaTimesApp {
    override fun toString() = "Lcom/addatimes/addatimes/AddaTimesApp;"

    object OnCreateFingerprint : Fingerprint(
        definingClass = AddaTimesApp.toString(),
        name = "onCreate",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = Type.void,
        parameters = emptyList(),
    )
}
