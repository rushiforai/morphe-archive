package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT

@Suppress("unused")
val securityNoticePatch = bytecodePatch(
    name = "Remove Security Notice",
    description = "Suppresses the modified-build security notice by disabling the risk SDK dialog entry point and the isCracking flag writer.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        CrackingWriteFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        RiskControlExecuteFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
