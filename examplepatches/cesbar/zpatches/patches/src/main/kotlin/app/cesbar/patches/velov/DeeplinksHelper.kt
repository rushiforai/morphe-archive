package app.cesbar.patches.velov

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

object activityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/jcdecaux/vls/app/signin/SignInActivity;",
    name = "onCreate"
)

val deeplinksWelcomePatch = bytecodePatch(
    name = "Easy deeplinks configuration",
    description = "Allows easy configuration of deeplinks (velov.cyclocity.fr, velov.grandlyon.com) required by the app to sign-in"
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/velov.mpe")

    execute {
        activityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, Lapp/cesbar/extensions/velov/DeeplinksHelper;->checkAndOpenSettingsIfNotSetup(Landroid/content/Context;)V
            """
        )
    }
}
