package app.template.patches.bplace

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object SplashScreenActivityFingerprint : Fingerprint(
    definingClass = "Lcom/bplace/SplashScreenActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("Mobile"),
        methodCall(
            definingClass = "Landroid/app/Activity;",
            name = "setRequestedOrientation",
            parameters = listOf("I"),
            returnType = "V"
        )
    )
)

object SplashScreenFingerprint : Fingerprint(
    definingClass = "Lcom/bplace/SplashScreen;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("Mobile"),
        methodCall(
            definingClass = "Landroid/app/Activity;",
            name = "setRequestedOrientation",
            parameters = listOf("I"),
            returnType = "V"
        )
    )
)

object MainActivityFingerprint : Fingerprint(
    definingClass = "Lcom/bplace/MainActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("Mobile"),
        methodCall(
            definingClass = "Landroid/app/Activity;",
            name = "setRequestedOrientation",
            parameters = listOf("I"),
            returnType = "V"
        )
    )
)
