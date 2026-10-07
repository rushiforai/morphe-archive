package mightymich.morphe.patches.me.pou.app

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlimitedCoinsPatch = bytecodePatch(
    name = "Unlimited Coins",
    description = "Gives unlimited coins in POU by forcing the coin value to a large number.",
    default = false
) {
    compatibleWith(PouCompatibility.POU)

    // 1. Fingerprint: locate the method 'l' in class 'gq1'.
    //    This method is responsible for writing the coin value to JSON.
    val coinWriterFingerprint = Fingerprint(
        definingClass = "Lgq1;",
        name = "l",
        returnType = "V"
    )

    execute {
        coinWriterFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find method 'l' in class 'gq1'.")

            // 2. Insert instructions at the very beginning of the method.
            //    We set the coin value to 999,999,999 and then write it.
            //    Note: This is a simplified approach and may need adjustment.
            method.addInstructions(
                0,
                """
                    const-string v1, "coins"
                    const v0, 0x3B9ACA00  # 1,000,000,000
                    invoke-virtual {p0, v1, v0}, Lgq1;->l(Lorg/json/JSONObject;Ljava/lang/String;)V
                    return-void
                """
            )
        }
    }
}
