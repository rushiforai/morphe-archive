package dev.dyno0311.patches.apps.camscanner.piracy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import dev.dyno0311.patches.apps.camscanner.camScannerCompatibility

/**
 * com.intsig.camscanner.business.PirateAppControl
 *
 * `O8(Context, DialogDismissListener)Z` shows the "This CamScanner copy is not genuine" dialog and returns
 * true, which callers use to keep the app on its local fallback path. `Oo08(Context)V` shows the same warning
 * as a toast.
 *
 * The dialog is skipped while the method still returns true: forcing false instead flips callers into the
 * "genuine install" path, which then fails the signature check and leaves image editing dead.
 */
internal object PirateDialogFingerprint : Fingerprint(
    definingClass = "Lcom/intsig/camscanner/business/PirateAppControl;",
    name = "O8",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Lcom/intsig/callback/DialogDismissListener;")
)

internal object PirateToastFingerprint : Fingerprint(
    definingClass = "Lcom/intsig/camscanner/business/PirateAppControl;",
    name = "Oo08",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

@Suppress("unused")
val hidePiracyWarningPatch = bytecodePatch(
    default = false,
    name = "Hide piracy warning",
    description = "Removes the \"This CamScanner copy is not genuine\" dialog and toast. The app's internal " +
        "genuine/pirate state is left alone, so nothing re-routes features."
) {
    compatibleWith(camScannerCompatibility)

    execute {
        PirateDialogFingerprint.method.returnEarly(true)
        PirateToastFingerprint.method.returnEarly()
    }
}
