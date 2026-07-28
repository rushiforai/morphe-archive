package app.template.patches.ozon.bank

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ozon.shared.Constants.COMPATIBILITY_OZON_CURRENT

@Suppress("unused")
val hideBankAdBannerPatch = bytecodePatch(
    name = "Hide Ozon Bank ad banner",
    description = "Removes the advertising banner carousel from the Ozon Bank screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OZON_CURRENT)

    execute {
        BankAdBannerMapperFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )
    }
}
