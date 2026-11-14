package semicoloncolonel.mobilestream.patches.checkout51.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private const val MANAGER = "Lcom/c51/core/app/DialogDisplayManager;"

// Checkout 51 9.22.10 keeps the home screen's one dialog in
// DialogDisplayManager. When the offer list is rebuilt, as it is after
// sign-in, the old list calls clearDialog, which forgets the dialog without
// closing it. The dialog then stays on screen and its buttons do nothing.
// clearDialog now closes the dialog before forgetting it.

internal object ClearDialogFingerprint : Fingerprint(
    definingClass = MANAGER,
    name = "clearDialog",
    returnType = "V",
    parameters = listOf(),
)

internal val fixStuckDialogPatch = bytecodePatch {
    execute {
        ClearDialogFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    sget-object v0, $MANAGER->modalDialog:Lcom/c51/core/view/dialog/CustomDialog;
                    if-eqz v0, :original
                    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}
