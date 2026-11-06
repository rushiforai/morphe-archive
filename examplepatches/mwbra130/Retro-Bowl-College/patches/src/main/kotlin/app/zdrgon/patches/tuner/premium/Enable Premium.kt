package app.zdrgon.patches.tuner.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.tuner.shared.Constants
import java.util.logging.Logger

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Patrocine (Cifra Club Pro) and removes ads: registered users get no interstitials and banner hosts treat them as registered.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // LtT1;->h0()Z is the SubscriptionManager's is-registered getter —
        // the single read path for the patrocine state that feature gates
        // and both interstitial use cases consult. Return true at entry:
        // the server validation still runs, but its verdict is never read
        // through any other path. No purchase record is created and the
        // billing code is untouched.
        IsRegisteredFingerprint.method.addInstructions(
            0,
            "const/4 v0, 0x1\n" +
                "return v0",
        )
        logger.info("Tuner: is-registered gate pinned to true.")
    }
}
