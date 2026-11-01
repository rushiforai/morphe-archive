package semicoloncolonel.mobilestream.patches.starz.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.starz.shared.Constants

// Starz 6.11.0 plays a branded intro video on launch through a separate
// SplashPlayer activity. One method starts that activity (R(Activity, String)
// in 6.11.0, R8-renamed), and every caller ignores its return value and
// navigates on its own, so returning without starting the activity drops the
// intro and the app opens straight to its landing screen.
//
// The class name is kept; the method is found by its parameter shape, its
// SplashPlayer return type, and the "vide_asset_name" intent-extra key it
// reads.
internal object ShowSplashVideoFingerprint : Fingerprint(
    definingClass = "Lcom/starz/android/starzcommon/SplashPlayer;",
    parameters = listOf("Landroid/app/Activity;", "Ljava/lang/String;"),
    returnType = "Lcom/starz/android/starzcommon/SplashPlayer;",
    strings = listOf("vide_asset_name"),
)

@Suppress("unused")
val skipLaunchVideoPatch = bytecodePatch(
    name = "Skip launch video",
    description = "Opens the Starz phone app without the branded intro video that plays on " +
        "launch.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        ShowSplashVideoFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    }
}
