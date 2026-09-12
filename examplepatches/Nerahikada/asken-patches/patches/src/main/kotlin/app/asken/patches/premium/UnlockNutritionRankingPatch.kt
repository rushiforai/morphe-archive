package app.asken.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.asken.patches.shared.Constants.ASKEN_COMPATIBILITY

@Suppress("unused")
val unlockNutritionRankingPatch = bytecodePatch(
    name = "Unlock nutrient ranking",
    description = "Unlocks the full food nutrient ranking (食べたもの栄養素ランキング). The server already sends every ranked item with its real values to free accounts; the app merely masks the numbers based on the client-trusted enable_full_nut_ranking flag. Forcing that flag to 1 reveals the already-downloaded values and enables switching the ranked nutrient."
) {
    compatibleWith(ASKEN_COMPATIBILITY)

    execute {
        NutritionRankingFullFlagFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
