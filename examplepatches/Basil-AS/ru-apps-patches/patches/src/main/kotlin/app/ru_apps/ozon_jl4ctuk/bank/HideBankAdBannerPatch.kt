// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/ozon/bank/HideBankAdBannerPatch.kt.
package app.ru_apps.ozon_jl4ctuk.bank

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ru_apps.ozon_jl4ctuk.shared.Constants.COMPATIBILITY_OZON_CURRENT

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
