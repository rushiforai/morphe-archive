// patches/src/main/kotlin/app/w3s/patches/w3schools/misc/pairip/PairipLicenseBypassPatch.kt
package app.w3s.patches.w3schools.misc.pairip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

/**
 * Internal patch that disables Pairip's runtime Play license check so re-signed builds launch.
 */
val pairipLicenseBypassPatch = patch {
    execute {
        PairipCheckLicenseFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void",
        )
    }
}
