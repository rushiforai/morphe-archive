package io.github.kirby1997.patches.hidratespark

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// Target LicenseContentProvider.onCreate() — the entry point that triggers the whole check.
// ContentProviders run at app startup before any Activity.
object LicenseContentProviderOnCreateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
)

// Target initializeLicenseCheck() as a safety net.
object InitializeLicenseCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
)

// Target the exit action (LicenseClient$1.run()) which calls System.exit(0).
object ExitActionRunFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient\$1;",
    name = "run",
)

@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable license check",
    description = "Bypasses the Google Play license verification that blocks sideloaded installs.",
) {
    compatibleWith(Constants.HIDRATESPARK)

    execute {
        // 1. Gut LicenseContentProvider.onCreate() — just return true without
        //    creating LicenseClient or calling initializeLicenseCheck().
        val method = LicenseContentProviderOnCreateFingerprint.method
        val onCreateSize = method.implementation!!.instructions.size
        method.removeInstructions(0, onCreateSize)
        method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // 2. Also NOP initializeLicenseCheck() in case anything else calls it.
        InitializeLicenseCheckFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        // 3. Disable the System.exit(0) call as a last resort safety net.
        ExitActionRunFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
