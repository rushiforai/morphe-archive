package app.morphe.patches.teamsnap.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.teamsnap.TEAMSNAP_COMPATIBILITY

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes ads by forcing TeamSnap+ Tier 1 subscription status.",
    default = true,
) {
    compatibleWith(TEAMSNAP_COMPATIBILITY)

    execute {
        // Patch live subscription state check — blocks ads at runtime
        HasTeamSnapPlusTier1Fingerprint.method.apply {
            removeInstructions(0, instructions.size)
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        // Patch central ad gate — blocks all ad display regardless of server flags
        CanDisplayAdsFingerprint.method.apply {
            removeInstructions(0, instructions.size)
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }
    }
}
