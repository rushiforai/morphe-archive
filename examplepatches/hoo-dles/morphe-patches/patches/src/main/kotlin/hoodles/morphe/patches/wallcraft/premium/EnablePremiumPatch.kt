/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.wallcraft.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import hoodles.morphe.compatibility.Compat

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.WALLCRAFT)

    execute {
        GetSubscriptionStateFingerprint.method.addInstructions(0,"""
            new-instance v0, Lcom/wallpaperscraft/billing/core/InfiniteSubscription;
            invoke-direct {v0}, Lcom/wallpaperscraft/billing/core/InfiniteSubscription;-><init>()V
            return-object v0
        """.trimIndent())
    }
}