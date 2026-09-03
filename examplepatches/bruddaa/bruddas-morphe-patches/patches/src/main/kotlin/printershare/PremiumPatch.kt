package printershare

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import util.Constants.PRINTERSHARE_COMPATIBILITY
import util.clearBody

@Suppress("unused")
val premiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Bypasses license validation and forces all premium flags to true.",
    default = true
) {
    compatibleWith(PRINTERSHARE_COMPATIBILITY)

    execute {
        PremiumValidationMethodFingerprint.method.apply {
            clearBody()
            // 2. Inject Smali to force the premium array to true
            addInstructions(
                0,
                """
                sget-object v0, Lcom/dynamixsoftware/printershare/p4;->a:[Z
                const/4 v1, 0x1
                const/4 v2, 0x0
                aput-boolean v1, v0, v2
                const/4 v2, 0x1
                aput-boolean v1, v0, v2
                const/4 v2, 0x2
                aput-boolean v1, v0, v2
                const/4 v2, 0x3
                aput-boolean v1, v0, v2
                return-void
                """.trimIndent()
            )
        }
    }
}