package app.template.patches.filetreesize.unlockpro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FILETREESIZE

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock pro",
    description = "Unlocks all pro features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FILETREESIZE)

    execute {
        val method = PremiumUpgradeFingerprint.method
        val clearPremiumFlagIndex = PremiumUpgradeFingerprint.instructionMatches.last().index

        method.replaceInstruction(
            clearPremiumFlagIndex,
            "sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"
        )

        method.addInstructions(
            0,
            """
                iget-object v0, p0, Lz5;->b:Ljava/lang/Object;
                check-cast v0, Li50;
                iget-object v0, v0, Li50;->b:Llr6;
                const/4 v1, 0x0
                sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-virtual {v0, v1, v2}, Llr6;->k(Ljava/lang/Object;Ljava/lang/Object;)Z
                iget-object v0, p0, Lz5;->b:Ljava/lang/Object;
                check-cast v0, Li50;
                iget-object v0, v0, Li50;->d:Llr6;
                sget-object v2, Le50;->d:Le50;
                invoke-virtual {v0, v1, v2}, Llr6;->k(Ljava/lang/Object;Ljava/lang/Object;)Z
                return-void
            """
        )
    }
}