package mightymich.morphe.patches.me.pou.app

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockEverythingPatch = bytecodePatch(
    name = "Unlock Everything (Experimental)",
    description = "Unlocks unlimited coins, all items, and adds an item-adding menu to POU. WARNING: May cause crashes or reset progress.",
    default = false
) {
    compatibleWith(PouCompatibility.POU)

    // 1. Fingerprint: locate the method that calculates the integrity hash.
    //    According to the analysis, this is App.A0(String)Z.
    val hashCheckFingerprint = Fingerprint(
        definingClass = "Lme/pou/app/App;",
        name = "A0",
        returnType = "Z"
    )

    // 2. Fingerprint: locate the method that checks if an item is purchased.
    //    This is a generic method used across the app.
    val isPurchasedFingerprint = Fingerprint(
        name = "isPurchased",
        returnType = "Z"
    )

    execute {
        // Patch the hash check to always return true (bypass integrity check).
        hashCheckFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find App.A0 method.")
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // Patch isPurchased to always return true (unlock all items).
        isPurchasedFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find isPurchased method.")
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
