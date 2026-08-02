package software.zarko.patches.sunrisealarm

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import software.zarko.patches.sunrisealarm.Constants.COMPATIBILITY_SUNRISE_ALARM

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Always report the 'remove_ads' and 'pro' in-app products as purchased, " +
        "regardless of the real Play Billing purchase state.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SUNRISE_ALARM)

    execute {
        val adsRemovedMove = PurchaseStateFingerprint.instructionMatches[1]
        val proPurchasedMove = PurchaseStateFingerprint.instructionMatches[2]

        val adsRemovedRegister = adsRemovedMove.getInstruction<TwoRegisterInstruction>().registerA
        val proPurchasedRegister = proPurchasedMove.getInstruction<TwoRegisterInstruction>().registerA

        // Modify from the last index to the first to keep earlier match indexes valid.
        PurchaseStateFingerprint.method.replaceInstruction(
            proPurchasedMove.index,
            "const/4 v$proPurchasedRegister, 0x1",
        )
        PurchaseStateFingerprint.method.replaceInstruction(
            adsRemovedMove.index,
            "const/4 v$adsRemovedRegister, 0x1",
        )
    }
}
