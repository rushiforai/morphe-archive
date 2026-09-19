package app.template.patches.bluecoins.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BLUECOINS

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the premium version (removes ads and lifts premium limits)."
) {
    compatibleWith(COMPATIBILITY_BLUECOINS)

    execute {
        // The domain flow is the single source every screen collects, and the only
        // implementation is this manager. Returning a constant flow avoids having to
        // touch the encrypted preference storage or the billing client.
        PremiumVersionFlowFingerprint.methodOrNull?.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-static {v0}, Lkotlinx/coroutines/flow/FlowKt;->flowOf(Ljava/lang/Object;)Lkotlinx/coroutines/flow/Flow;
                move-result-object v0
                return-object v0
            """.trimIndent()
        )
    }
}
