package semicoloncolonel.mobilestream.patches.washingtonpost.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants

// WaPo 7.19.0. The native paywall bottom sheet is the fragment s2f
// (extends BottomSheetDialogFragment). Its Q1 method is the one that
// configures the wall and calls show (d0). Returning early from Q1
// prevents the sheet from ever being displayed.
//
// This only hides the UI overlay. Article content remains server-gated
// by the meter response from TetroApiService.evaluate.

private const val PAYWALL_SHEET = "Ls2f;"

internal object PaywallSheetShowFingerprint : Fingerprint(
    definingClass = PAYWALL_SHEET,
    name = "Q1",
    returnType = "V",
    parameters = listOf(
        "Landroidx/fragment/app/l;",
        "Ljava/lang/String;",
        "La1f;",
        "Lj0f\$f;",
        "I",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Boolean;",
        "Z",
        "Z",
        "Lh81;",
        "Ljava/lang/String;",
    ),
)

@Suppress("unused")
val hidePaywallSheetPatch = bytecodePatch(
    name = "Hide paywall sheet",
    description = "Prevents the Washington Post paywall bottom sheet from being shown.",
) {
    compatibleWith(Constants.PAYWALL_SHEET_COMPATIBILITY)

    execute {
        val showMethod = PaywallSheetShowFingerprint.method
            ?: throw PatchException("Paywall sheet show method (s2f.Q1) not found")

        showMethod.returnEarly("return-void")
    }
}