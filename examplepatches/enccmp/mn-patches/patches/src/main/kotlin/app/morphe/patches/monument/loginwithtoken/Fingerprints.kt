package app.morphe.patches.monument.loginwithtoken

import app.morphe.patcher.Fingerprint

/**
 * `CloudConnectOptionsDialog.onViewCreated(View, Bundle)` — wires up the setup bottom sheet
 * (Factory Reset / Use with Monument 1).
 *
 * In the 4.3.5 build the class name is kept but method names are obfuscated by R8
 * (onViewCreated -> `q8`), so it is matched WITHOUT a name: the defining class plus the
 * `(View, Bundle): void` signature uniquely identifies it within the class
 * (onCreateView returns a View and takes different parameters).
 */
internal object CloudConnectOptionsOnViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/getmonument/app/ui/setup/v2/connect/CloudConnectOptionsDialog;",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)
