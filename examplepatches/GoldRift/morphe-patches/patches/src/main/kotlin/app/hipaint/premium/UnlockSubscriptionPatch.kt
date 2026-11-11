package app.hipaint.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patches.all.misc.fix.spoofsignature.spoofSignaturePatch
import app.shared.Constants

@Suppress("unused")
val unlockSubscriptionPatch = patch(
    name = "Unlock Subscription",
    description = "Unlocks subscription features. Spoofs the original app signature so the unlock is accepted.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_HIPAINT)

    // Bundled from morphe-patches-library, so no separate signature patch has to be selected.
    dependsOn(spoofSignaturePatch)

    execute {
        MonthSubscribeFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
