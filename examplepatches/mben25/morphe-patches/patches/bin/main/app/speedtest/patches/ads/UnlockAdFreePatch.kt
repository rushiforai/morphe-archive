package app.speedtest.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.speedtest.patches.shared.Constants.COMPATIBILITY_SPEEDTEST

@Suppress("unused")
val unlockAdFreePatch = bytecodePatch(
    name = "Unlock Ad-Free",
    description = "Removes ads and unlocks ad-free status in Speedtest by Ookla.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPEEDTEST)

    execute {
        listOf(
            PurchaseManagerIsAdFreeFingerprint,
            PurchaseDataCompatIsUserAdFreeFingerprint,
            PurchaseDataCompatHasInAppTokensFingerprint,
            SharedPrefsIsAdFreeFingerprint,
        ).forEach { fingerprint ->
            val method = fingerprint.match(classDefBy(fingerprint.definingClass!!)).method
            method.removeInstructions(0, method.instructions.count())
            method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }
    }
}
