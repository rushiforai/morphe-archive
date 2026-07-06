package app.paresh.patches.sdmaidse.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.sdmaidse.shared.Constants.COMPATIBILITY_SDMAIDSE

@Suppress("unused")
val sdMaidSeProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks SD Maid SE Pro features — full history, scheduled operations, extra options, custom rules."
) {
    compatibleWith(COMPATIBILITY_SDMAIDSE)

    execute {
        val method = UpgradeInfoConstructorFingerprint.method
        // Filter index 0 is the iput-boolean for gracePeriod.
        // Insert const/4 v2, 0x1 before it to force gracePeriod = true.
        // This guarantees isPro = (upgrades.isNotEmpty() || true) = true.
        val gracePeriodIndex = UpgradeInfoConstructorFingerprint.instructionMatches[0].index
        method.addInstructions(gracePeriodIndex, """
            const/4 v2, 0x1
        """)
    }
}
