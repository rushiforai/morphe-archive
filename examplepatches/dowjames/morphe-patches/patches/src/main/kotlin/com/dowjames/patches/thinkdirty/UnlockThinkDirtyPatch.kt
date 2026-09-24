package com.dowjames.patches.thinkdirty

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.dowjames.patches.thinkdirty.ThinkDirtyConstants.COMPATIBILITY_THINK_DIRTY

private const val PREMIUM_LEVEL = 3

@Suppress("unused")
val unlockThinkDirtyPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks Think Dirty premium features and Superwall entitlements.",
    default = true
) {
    compatibleWith(COMPATIBILITY_THINK_DIRTY)

    execute {
        PremiumStateGetterFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Lo6h;
                const-string v1, "premium"
                const-string v2, "premium"
                const-string v3, "Premium"
                const-string v4, "android"
                const/4 v5, $PREMIUM_LEVEL
                const-string v6, "#000000"
                const-string v7, "#FFFFFF"
                const/4 v8, 0x1
                const/4 v9, 0x1
                const/4 v10, 0x1
                const/4 v11, 0x1
                const/4 v12, 0x1
                const/4 v13, 0x1
                const/4 v14, 0x1
                const/4 v15, 0x1
                invoke-direct/range {v0 .. v15}, Lo6h;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZZZZZZZZ)V
                return-object v0
            """
        )

        PremiumLevelCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
