package app.riky.patches.vn

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_VN

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks premium features, removes watermark, hides Pro tab, " +
        "and hides the home upgrade-to-Pro banner.",
) {
    compatibleWith(COMPATIBILITY_VN)

    execute {
        // PremiumServiceImpl.e() — used across export ads / feature gates
        PremiumServiceIsProFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // PremiumManage.c() — CreateViewState.showUpgrade + draft AdsLayout filter
        PremiumManageIsProFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Hide Pro/Crown tab — force parameter to false so original code sets GONE
        SetShowProItemFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x0
            """
        )
    }
}
