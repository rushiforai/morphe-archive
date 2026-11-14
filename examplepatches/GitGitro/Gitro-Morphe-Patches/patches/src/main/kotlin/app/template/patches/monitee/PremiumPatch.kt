package app.template.patches.monitee

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MONITEE

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock pro",
    description = "Unlocks pro features",
    default = true
) {
    compatibleWith(COMPATIBILITY_MONITEE)

    execute {
        IsProFromBillingFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v0
                return-object v0
            """
        )

        ProStatusFromBillingFingerprint.method.addInstructions(
            0,
            $$"""
                sget-object v0, Lcom/krillsson/monitee/billing/ProContentManager$ProStatus;->t:Lcom/krillsson/monitee/billing/ProContentManager$ProStatus;
                return-object v0
            """
        )
    }
}