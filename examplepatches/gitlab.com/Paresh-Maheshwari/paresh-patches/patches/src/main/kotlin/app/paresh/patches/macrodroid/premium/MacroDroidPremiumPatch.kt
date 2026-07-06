package app.paresh.patches.macrodroid.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.macrodroid.shared.Constants.COMPATIBILITY_MACRODROID

private const val SIG_BYPASS = """
    const/4 v0, 0x0
    return v0
"""

@Suppress("unused")
val macroDroidPremiumPatch = bytecodePatch(
    name = "MacroDroid Premium",
    description = "Unlocks premium features and removes macro limits."
) {
    compatibleWith(COMPATIBILITY_MACRODROID)

    execute {
        // Bypass main signature check (public static)
        SignatureCheckFingerprint.method.addInstructions(0, SIG_BYPASS)

        // Bypass template store signature check — return true (valid) so auth token is correct
        TemplateStoreSignatureCheckFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Spoof signature hash for template store API auth
        SignatureHashFingerprint.method.addInstructions(0, """
            const-string v0, "uPaen47jLjpXT6+t5lu0OBd3ECg="
            return-object v0
        """)

        // Return PRO status
        PremiumStatusFingerprint.method.addInstructions(0, """
            sget-object v0, Lcom/arlosoft/macrodroid/confirmation/a${'$'}c;->a:Lcom/arlosoft/macrodroid/confirmation/a${'$'}c;
            return-object v0
        """)

        // Skip purchase validation
        ValidatePurchaseFingerprint.method.addInstructions(0, "return-void")

        // Block upgrade screen
        ShowUpgradeScreenFingerprint.method.addInstructions(0, "return-void")
    }
}
