package app.morphe.patches.monument.loginwithtoken

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.monument.shared.Constants.COMPATIBILITY_MONUMENT

// Note: no trailing ';' here — it is added at the smali call site below.
private const val EXTENSION_CLASS = "Lapp/morphe/extension/monument/LoginWithTokenPatch"

@Suppress("unused")
val loginWithTokenPatch = bytecodePatch(
    name = "Login with token",
    description = "Adds a \"Login with token\" option to the setup bottom sheet that signs in with a " +
        "device serial, client id and access token, writing setup as completed and bypassing the cloud API.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MONUMENT)

    // Precompiled DEX with the dialog UI and the preference-writing / restart logic.
    extendWith("extensions/monument-login.mpe")

    execute {
        // At the top of onViewCreated(view, bundle): p0=this, p1=view (the bottom sheet's
        // root LinearLayout), p2=bundle. Hand the root view to the extension, which appends
        // the new option row and wires its click listener.
        CloudConnectOptionsOnViewCreatedFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS;->install(Landroid/view/View;)V",
        )
    }
}
