package app.zdrgon.patches.echo.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.echo.shared.Constants
import java.util.logging.Logger

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Unlocks Echo Pro (the lifetime tier: Auto EQ, limiter, compressor and all other Pro features). Use with Change installer source.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // Lx15;->catch(Lpp5;)Z is the gate every Pro feature check calls.
        // Return true at entry: the caller never reaches the subscription
        // state check (Lkp5;), the RevenueCat verification check, or the
        // of2 signing-certificate kill switch (Ljp5;->implements:Z) that
        // disables Pro on any re-signed build. No purchase record is
        // created and the billing library is untouched.
        IsProFingerprint.method.addInstructions(
            0,
            "const/4 v0, 0x1\n" +
                "return v0",
        )
        logger.info("Echo: is-Pro gate pinned to true.")
    }
}
