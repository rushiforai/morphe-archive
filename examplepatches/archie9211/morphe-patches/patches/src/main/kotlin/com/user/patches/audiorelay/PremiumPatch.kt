package com.user.patches.audiorelay

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

val audioRelayCompatibility = Compatibility(
    name = "AudioRelay",
    packageName = "com.azefsw.audioconnect",
    targets = listOf(
        AppTarget(version = "0.26.1")
    )
)

val premiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks premium features by overriding the PremiumResponse.",
    default = true
) {
    compatibleWith(audioRelayCompatibility)

    execute {
        // 1. Find the PremiumResponse class via the toString fingerprint
        val premiumResponseClass = premiumResponseFingerprint.classDef

        // 2. Find the method that returns the boolean value of the response.
        // It's the only method that takes no arguments and returns a boolean.
        val isPremiumMethod = premiumResponseClass.methods.first { 
            it.returnType == "Z" && it.parameters.isEmpty() 
        }

        // 3. Replace the method instructions to always return true (0x1)
        isPremiumMethod.removeInstructions(0)
        isPremiumMethod.addInstructions(0, 
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
