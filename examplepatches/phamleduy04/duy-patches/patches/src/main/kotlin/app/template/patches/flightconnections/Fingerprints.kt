package app.template.patches.flightconnections

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/flightconnections/MainActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PROTECTED),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
