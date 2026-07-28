package app.template.patches.ozon.reviews

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ozon.shared.Constants.COMPATIBILITY_OZON_CURRENT

@Suppress("unused")
val hideSellerRatingPromptPatch = bytecodePatch(
    name = "Hide seller rating prompt",
    description = "Removes the post-purchase seller rating prompt.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OZON_CURRENT)

    execute {
        RateItemsMapperFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )
    }
}
