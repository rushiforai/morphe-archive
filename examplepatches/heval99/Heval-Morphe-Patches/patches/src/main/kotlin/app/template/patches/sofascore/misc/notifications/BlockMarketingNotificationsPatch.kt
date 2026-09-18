package app.template.patches.sofascore.misc.notifications

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE

@Suppress("unused")
val blockMarketingNotificationsPatch = bytecodePatch(
    name = "Block marketing notifications",
    description = "Blocks promotional and marketing prompts and modals."
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // Dismiss the sheet as soon as it is created instead of populating it, so the
        // promotional content never renders.
        val dismissEarly = """
            invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->dismiss()V
            return-void
        """.trimIndent()

        PromotionModalFingerprint.methodOrNull?.addInstructions(0, dismissEarly)
        TennisPromoSheetFingerprint.methodOrNull?.addInstructions(0, dismissEarly)
    }
}
