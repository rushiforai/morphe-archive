package app.template.patches.zensms

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.ZEN_SMS_COMPATIBILITY

@Suppress("unused")
val disableZenSmsPremiumStatePatch = bytecodePatch(
    name = "enable premium state",
    description = "Makes synchronous and reactive premium checks report true.",
    default = true,
) {
    compatibleWith(ZEN_SMS_COMPATIBILITY)

    execute {
        // Equivalent to: fun hasPremium(): Boolean = true
        HasPremiumFingerprint.method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )
        }

        // Equivalent to: fun isPremium(): StateFlow<Boolean> = MutableStateFlow(false)
        // These descriptors are the R8-obfuscated types in ZenSMS 1.2.04.
        IsPremiumFingerprint.method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(
                0,
                """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-static {v0}, Lz/Md;->b(Ljava/lang/Object;)Lkotlinx/coroutines/flow/m;
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
        }
    }
}
