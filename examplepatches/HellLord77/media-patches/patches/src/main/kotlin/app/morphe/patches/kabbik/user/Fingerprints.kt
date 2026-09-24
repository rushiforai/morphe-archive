package app.morphe.patches.kabbik.user

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object KabbikApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/kabbik/app/KabbikApplication;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf()
)