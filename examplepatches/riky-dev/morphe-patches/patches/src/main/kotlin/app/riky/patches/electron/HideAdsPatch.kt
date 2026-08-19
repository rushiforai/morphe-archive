package app.riky.patches.electron

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_ELECTRON

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Spoofs premium/unlocked state to disable ad-gated behavior.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ELECTRON)

    execute {
        // Force premium state TRUE whenever RevenueCat customer info is processed.
        CustomerInfoPremiumStateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object p1
                iget-object v0, p0, Lcl5;->c:Lwx4;
                const/4 v1, 0x0
                invoke-virtual {v0, v1, p1}, Lwx4;->l(Ljava/lang/Object;Ljava/lang/Object;)Z
                iget-object p0, p0, Lcl5;->a:Lwx4;
                invoke-virtual {p0, v1, p1}, Lwx4;->l(Ljava/lang/Object;Ljava/lang/Object;)Z
                return-void
            """
        )
    }
}
