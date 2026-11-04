package app.template.patches.alza

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ALZA

@Suppress("unused")
val alzaBenefitPricesPatch = bytecodePatch(
    name = "Alza Benefit Prices (CZ / SK)",
    description = "Displays benefit prices and tiers (Gold, Silver, ISIC, Bronze, B2B, Basic) with active promotions and coupons in product detail screen for Czech Republic and Slovakia.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ALZA)

    extendWith("extensions/extension.mpe")

    execute {
        with(AlzaHookManager) {
            // 1. Enable patch at app startup and fragment create
            injectApplicationInit(
                """
                    const/4 v0, 1
                    invoke-static {v0}, ${AlzaHookManager.EXTENSION_CLASS}->setBenefitPricesPatchEnabled(Z)V
                """
            )
            injectGodFragmentInit(
                """
                    const/4 v0, 1
                    invoke-static {v0}, ${AlzaHookManager.EXTENSION_CLASS}->setBenefitPricesPatchEnabled(Z)V
                """
            )

            // 2. Ensure shared hooks
            ensureProductParamsHooked()
            ensurePriceSectionHooked()
            ensureSettingsHooked()
        }
    }
}
