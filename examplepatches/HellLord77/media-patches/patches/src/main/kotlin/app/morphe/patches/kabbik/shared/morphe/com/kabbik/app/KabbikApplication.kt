package app.morphe.patches.kabbik.shared.morphe.com.kabbik.app

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

object KabbikApplication {
    override fun toString() = "Lcom/kabbik/app/KabbikApplication;"

    object OnCreateFingerprint : Fingerprint(
        definingClass = KabbikApplication.toString(),
        name = "onCreate",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = Type.void,
        parameters = emptyList(),
    )
}
