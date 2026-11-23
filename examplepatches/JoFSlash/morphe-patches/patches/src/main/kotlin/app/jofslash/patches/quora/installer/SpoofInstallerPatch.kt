package app.jofslash.patches.quora.installer

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

internal object GetInstallerPackageFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/model/QCookies;",
    name = "getInstallerPackage",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

@Suppress("unused")
val spoofInstallerPatch = bytecodePatch(
    name = "Spoof installer",
    description = "Reports Google Play as the app installer, so Quora does not treat the patched app " +
            "as installed from an unknown source.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_QUORA)

    execute {
        // Quora sends the installer package to its servers in the "android_app_source" cookie.
        GetInstallerPackageFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "com.android.vending"
                return-object v0
            """
        )
    }
}
