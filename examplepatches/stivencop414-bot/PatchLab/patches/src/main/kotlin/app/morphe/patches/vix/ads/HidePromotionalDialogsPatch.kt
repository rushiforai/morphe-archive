package app.morphe.patches.vix.ads

import app.morphe.patcher.patch.patch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructions

@Suppress("unused")
val hidePromotionalDialogsPatch = patch(
    name = "Hide promotional popups",
    description = "Suppresses Braze in-app promotional dialogs and upgrade banners.",
    default = true,
) {
    category("Ads")
    compatibleWith(*AppCompatibilities.vix())

    execute {
        BrazeDisplayInAppMessageFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                return-object v0
            """.trimIndent(),
        )
    }
}
