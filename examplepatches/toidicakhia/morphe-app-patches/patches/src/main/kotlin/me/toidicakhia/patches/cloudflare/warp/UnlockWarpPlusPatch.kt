package me.toidicakhia.patches.cloudflare.warp

import me.toidicakhia.patches.shared.Constants.WARP_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockWarpPlusPatch = bytecodePatch(
    name = "Spoof WARP+ Unlimited UI",
    description = "Forces WarpPlusState to UNLIMITED on every AccountData instance by intercepting the primary constructor before the account type field is written.",
    default = true
) {
    compatibleWith(WARP_COMPATIBILITY)

    execute {
        // AccountData.b is a final val written only by the constructor, so the
        // account type parameter must be overwritten before the iput-object.
        AccountDataConstructorFingerprint.match().method.addInstructions(
            0,
            "sget-object p2, Lcom/cloudflare/app/data/warpapi/WarpPlusState;->UNLIMITED:Lcom/cloudflare/app/data/warpapi/WarpPlusState;"
        )
    }
}
