package com.dowjames.patches.yuka

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.dowjames.patches.yuka.YukaConstants.COMPATIBILITY_YUKA

@Suppress("unused")
val unlockYukaPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks Yuka premium features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YUKA)

    execute {
        YukaPremiumStateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        YukaWasPremiumStateFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """
        )

        YukaPremiumAvailableFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        YukaBillingReadyFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        YukaLocalPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        YukaLocalWasPremiumFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """
        )
    }
}
