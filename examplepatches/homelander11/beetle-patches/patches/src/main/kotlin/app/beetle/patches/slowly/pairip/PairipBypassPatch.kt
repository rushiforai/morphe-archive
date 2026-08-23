package app.beetle.patches.slowly.pairip

import app.beetle.patches.slowly.shared.Constants.COMPATIBILITY_SLOWLY_PAIRIP
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val slowlyPairipLicenseCheckBypassPatch = bytecodePatch(
    name = "Slowly Pairip license check bypass",
    description = "Disables Pairip's client-side installer and license enforcement."
) {
    compatibleWith(COMPATIBILITY_SLOWLY_PAIRIP)

    execute {
        PairipLicenseCheckFingerprint.method.addInstruction(0, "return-void")
    }
}
