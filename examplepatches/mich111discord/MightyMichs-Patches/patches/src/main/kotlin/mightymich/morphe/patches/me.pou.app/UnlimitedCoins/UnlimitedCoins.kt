package mightymich.morphe.patches.me.pou.app.UnlimitedCoins

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlimitedCoinsPatch = bytecodePatch(
    name = "Unlimited Coins (Experimental)",
    description = "Gives unlimited coins in POU. WARNING: May cause crashes or reset progress.",
    default = false
) {
    compatibleWith(PouUnlimitedCoinsCompatibility.POU_UNLIMITED_COINS)

    val coinWriterFingerprint = Fingerprint(
        definingClass = "Lgq1;",
        name = "l",
        returnType = "V"
    )

    execute {
        coinWriterFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find method 'l' in class 'gq1'.")
            method.addInstructions(
                0,
                """
                    const-string v1, "coins"
                    const v0, 0x3B9ACA00
                    invoke-virtual {p0, v1, v0}, Lgq1;->l(Lorg/json/JSONObject;Ljava/lang/String;)V
                    return-void
                """
            )
        }
    }
}
