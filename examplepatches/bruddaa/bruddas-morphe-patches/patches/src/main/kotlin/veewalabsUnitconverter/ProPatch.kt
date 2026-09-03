package com.veewalabs.unitconverter

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import util.Constants.UNITCONVERTER_COMPATIBILITY
import util.clearBody
import veewalabsUnitconverter.Fingerprint

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlock pro features (no ads, no bookmark limit)",
    default = true
) {
    compatibleWith(UNITCONVERTER_COMPATIBILITY)

    execute {
        Fingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                iget-object v1, p0, Lcom/veewalabs/unitconverter/z2;->r:Ljava/lang/Object;
                check-cast v1, Lcom/veewalabs/unitconverter/MainActivity;
                const/4 v0, 0x1
                iput-boolean v0, v1, Lcom/veewalabs/unitconverter/MainActivity;->U:Z
                iget-object v1, v1, Lcom/veewalabs/unitconverter/MainActivity;->Q:Lcom/veewalabs/unitconverter/z2;
                const-string v0, "premium_removeads_purchased"
                const/4 v2, 0x1
                invoke-virtual {v1, v0, v2}, Lcom/veewalabs/unitconverter/z2;->k(Ljava/lang/String;Z)V
                return-void
                """.trimIndent()
            )
        }
    }
}