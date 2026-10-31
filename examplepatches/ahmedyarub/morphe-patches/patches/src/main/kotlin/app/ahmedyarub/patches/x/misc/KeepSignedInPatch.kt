package app.ahmedyarub.patches.x.misc

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.shared.allFilesAccessPatch
import app.ahmedyarub.patches.x.shared.EXTENSION_PACKAGE
import app.ahmedyarub.patches.x.shared.xExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

private object ApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/x/android/XApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val keepSignedInPatch = bytecodePatch(
    name = "Keep signed in across reinstalls",
    description = "Backs up the signed-in accounts to Download/morphe-tokens and restores them the first " +
        "time a reinstalled app starts. Needs \"All files access\" for the app, which a reinstall resets.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch, allFilesAccessPatch)

    execute {
        // First thing, before the app reads its accounts.
        ApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_PACKAGE/TokenBackup;->onAppCreate(Landroid/content/Context;)V",
        )
    }
}
