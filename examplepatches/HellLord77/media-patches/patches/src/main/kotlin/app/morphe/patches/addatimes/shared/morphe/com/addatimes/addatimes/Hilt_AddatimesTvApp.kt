package app.morphe.patches.addatimes.shared.morphe.com.addatimes.addatimes

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("ktlint:standard:class-naming")
object Hilt_AddatimesTvApp {
    override fun toString() = "Lcom/addatimes/addatimes/Hilt_AddatimesTvApp;"

    object OnCreateFingerprint : Fingerprint(
        definingClass = Hilt_AddatimesTvApp.toString(),
        name = "onCreate",
        accessFlags = listOf(AccessFlags.PUBLIC),
        returnType = Type.void,
        parameters = emptyList(),
    )
}
