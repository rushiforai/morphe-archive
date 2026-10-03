package app.morphe.patches.kabbik.user

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

internal object KabbikApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/kabbik/app/KabbikApplication;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.void,
    parameters = emptyList(),
)