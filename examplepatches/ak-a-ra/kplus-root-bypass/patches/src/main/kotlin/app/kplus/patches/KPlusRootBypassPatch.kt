package app.kplus.patches

import app.kplus.patches.shared.Constants.COMPATIBILITY_KPLUS
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val kplusRootBypassPatch = bytecodePatch(
    name = "Bypass V-Key root/security detection",
    description = "Makes K PLUS report VGSecurityStatus.SAFE so V-Key does not block access.",
    default = true
) {
    compatibleWith(COMPATIBILITY_KPLUS)

    execute {
        GetSecurityStatusFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Lcom/vkey/android/vguard/model/VGSecurityStatus;->SAFE:Lcom/vkey/android/vguard/model/VGSecurityStatus;
                return-object p0
            """
        )
    }
}
