package mightymich.morphe.patches.reelshort

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features (Experimental)",
    description = "Unlocks ReelShort premium by forcing getVip_status and isVipFreeAdvUnlock to return true. WARNING: May cause crashes.",
    default = true
) {
    compatibleWith(ReelShortCompatibility.REELSHORT)

    // 1. Fingerprint for getVip_status()I – returns int.
    val getVipStatusFingerprint = Fingerprint(
        name = "getVip_status",
        returnType = "I"
    )

    // 2. Fingerprint for isVipFreeAdvUnlock()I – returns int.
    val isVipFreeAdvUnlockFingerprint = Fingerprint(
        name = "isVipFreeAdvUnlock",
        returnType = "I"
    )

    execute {
        // Patch getVip_status -> return 0x2.
        getVipStatusFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find getVip_status method.")
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x2
                    return v0
                """
            )
        }

        // Patch isVipFreeAdvUnlock -> return 0x1 (true).
        isVipFreeAdvUnlockFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find isVipFreeAdvUnlock method.")
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
