package app.zdrgon.patches.hermit.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.hermit.shared.Constants
import java.util.logging.Logger

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Premium (the one-time all-features purchase) and every individually sold feature.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // Lhv3;->a()Z is the entitlement predicate for every premium
        // feature: it answers "is this feature's purchase state PURCHASED
        // or ELIGIBLE". Return true at entry and all features — including
        // the all-features Premium bundle — read as owned. The purchase
        // sources still run, but their verdicts are only ever consumed
        // through this predicate. No purchase record is created and the
        // billing code is untouched.
        EntitlementFingerprint.method.addInstructions(
            0,
            "const/4 v0, 0x1\n" +
                "return v0",
        )
        logger.info("Hermit: entitlement predicate pinned to true.")
    }
}
