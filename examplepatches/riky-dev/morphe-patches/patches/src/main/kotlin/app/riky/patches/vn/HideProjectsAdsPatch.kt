package app.riky.patches.vn

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_VN

@Suppress("unused")
val hideProjectsAdsPatch = bytecodePatch(
    name = "Hide projects ads",
    description = "Hides AdsLayout banners (Projects list and other in-app ad slots).",
) {
    compatibleWith(COMPATIBILITY_VN)

    execute {
        // Activity-type promos bypass isPro filtering; hide at the shared layout entry.
        SetupAdsBeanListFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                return-void
            """
        )
    }
}
