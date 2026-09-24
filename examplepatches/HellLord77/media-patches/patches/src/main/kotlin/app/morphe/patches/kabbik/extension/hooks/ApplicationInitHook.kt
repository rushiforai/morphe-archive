package app.morphe.patches.kabbik.extension.hooks

import app.morphe.patcher.Fingerprint
import app.morphe.patches.all.misc.extension.ExtensionHook
import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import com.android.tools.smali.dexlib2.AccessFlags


internal object KabbikActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/kabbik/app/MainActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

internal val kabbikActivityOnCreateHook = ExtensionHook(KabbikActivityOnCreateFingerprint)

internal val kabbikApplicationOnCreateHook = activityOnCreateExtensionHook(
    activityClassType = "Lcom/kabbik/app/KabbikApplication;"
)
