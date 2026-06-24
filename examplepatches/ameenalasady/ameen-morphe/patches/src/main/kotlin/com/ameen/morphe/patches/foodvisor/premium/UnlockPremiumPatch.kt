package com.ameen.morphe.patches.foodvisor.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.ameen.morphe.patches.foodvisor.shared.COMPATIBILITY_FOODVISOR

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks premium features and diets.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FOODVISOR)

    execute {
        val premiumClass = PremiumManagerFingerprint.classDef.type
        val booleanField = PremiumManagerFingerprint.classDef.fields.first { it.type == "Z" }.name
        val flowField = PremiumManagerFingerprint.classDef.fields.first { it.type == "Lkotlinx/coroutines/flow/x0;" }.name

        PremiumManagerFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                sput-boolean v0, $premiumClass->$booleanField:Z
                
                sget-object v0, $premiumClass->$flowField:Lkotlinx/coroutines/flow/x0;
                const/4 v1, 0x1
                invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v1
                const/4 v2, 0x0
                invoke-virtual {v0, v2, v1}, Lkotlinx/coroutines/flow/x0;->k(Ljava/lang/Object;Ljava/lang/Object;)Z
                
                return-void
            """
        )
    }
}
