package mightymich.morphe.patches.com.chenupt.money

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Unlocks permanent VIP in the accounting app.",
    default = true
) {
    compatibleWith(MoneyAppCompatibility.MONEY_APP)

    val isVipFingerprint = Fingerprint(name = "isvip", returnType = "Z")
    val isForeverVipFingerprint = Fingerprint(name = "isForeverVIP", returnType = "Z")

    execute {
        // isvip -> true
        isVipFingerprint.let { fingerprint ->
            val method = fingerprint.method
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }


        isForeverVipFingerprint.let { fingerprint ->
            val method = fingerprint.method
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
