package semicoloncolonel.mobilestream.patches.cbsnews.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cbsnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// CBS News 5.20 checks its own signing certificate on every launch
// (StartActivity.checkAppSignature) and, when it is not CBS's, clears all
// of the app's data and closes. Every patched app is signed with a
// different key, so the check returns at once. The app also refuses to run
// on a rooted phone with a "Device is rooted" dialog that closes it; that
// dialog is skipped too.

private const val START_ACTIVITY = "Lcom/treemolabs/apps/cbsnews/ui/activities/StartActivity;"

internal object CheckAppSignatureFingerprint : Fingerprint(
    definingClass = START_ACTIVITY,
    name = "checkAppSignature",
    returnType = "V",
    parameters = listOf(),
)

internal object RootErrorDialogFingerprint : Fingerprint(
    definingClass = START_ACTIVITY,
    name = "showRootErrorAlertDialog",
    returnType = "V",
    parameters = listOf(),
)

val disableSignatureCheckPatch = bytecodePatch(
    name = "Disable signature check",
    description = "Lets the patched app start, since CBS News closes when it is not signed by CBS.",
) {
    category("Setup")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        CheckAppSignatureFingerprint.method.returnEarly("return-void")
        RootErrorDialogFingerprint.method.returnEarly("return-void")
    }
}
