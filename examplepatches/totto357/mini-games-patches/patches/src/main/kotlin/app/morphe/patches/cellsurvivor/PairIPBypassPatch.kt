package app.morphe.patches.cellsurvivor

import app.morphe.patches.cellsurvivor.Constants.COMPATIBILITY_CELL_SURVIVOR
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val PAIRIP_LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

internal object LicenseClientCheckLicenseFingerprint : Fingerprint(
    definingClass = PAIRIP_LICENSE_CLIENT,
    name = "checkLicense",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val pairIPBypassPatch =
    bytecodePatch(
        name = "Bypass PairIP License Check",
        description = "Bypasses Google Play Integrity / PairIP license check.",
    ) {
        compatibleWith(COMPATIBILITY_CELL_SURVIVOR)

        execute {
            LicenseClientCheckLicenseFingerprint.methodOrNull?.addInstructions(
                0,
                """
                return-void
                """,
            )
        }
    }
