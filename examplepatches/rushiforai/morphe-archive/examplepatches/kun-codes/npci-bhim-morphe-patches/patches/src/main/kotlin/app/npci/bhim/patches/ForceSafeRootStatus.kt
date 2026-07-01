package app.npci.bhim.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BHIM
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val forceSafeRootStatus = bytecodePatch(
    name = "Force Safe Root Status",
    description = "Forces the root status to 'safe' in device details and skips root status comparison logic to bypass root detection on the client side.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BHIM)

    execute {
        // Patch DeviceDetailsBuilderFingerprint to ensure rootStatus is always "safe"
        // The fingerprint already finds the method that sets "safe", but we need to
        // ensure the root status comparison in JsDum.sfPE is also bypassed.

        // In Q4.JsDum.sfPE, the method compares root status from device vs server.
        // We patch it to skip the root status comparison entirely.
        RootStatusComparisonFingerprint.method.apply {
            // Remove the root status comparison logic
            // The method calls getRootStatus() and compares - we make it skip that block
            addInstructions(
                0,
                """
                    return-void
                """,
            )
        }
    }
}
