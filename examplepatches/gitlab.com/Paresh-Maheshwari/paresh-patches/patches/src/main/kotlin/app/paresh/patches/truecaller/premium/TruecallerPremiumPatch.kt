package app.paresh.patches.truecaller.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.truecaller.shared.Constants.COMPATIBILITY_TRUECALLER

@Suppress("unused")
val truecallerPremiumPatch = bytecodePatch(
    name = "Truecaller Premium",
    description = "Unlocks premium features."
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // Always return true for isPremium check
        IsPremiumFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Return GOLD tier instead of FREE
        GetPremiumTierFingerprint.method.addInstructions(0, """
            sget-object v0, Lcom/truecaller/premium/data/tier/PremiumTierType;->GOLD:Lcom/truecaller/premium/data/tier/PremiumTierType;
            return-object v0
        """)

        // All features available — unlocks Max blocking, 140 series, telemarketers etc.
        IsFeatureAvailableFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Block server from overwriting local premium state (prevents Max blocking reset)
        SavePremiumStateFingerprint.method.addInstructions(0, """
            sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;
            return-object p1
        """)

        // Block subscription expired notification worker
        SubscriptionNotificationWorkerFingerprint.method.addInstructions(0, """
            new-instance p1, Landroidx/work/qux${'$'}bar${'$'}qux;
            invoke-direct {p1}, Landroidx/work/qux${'$'}bar${'$'}qux;-><init>()V
            return-object p1
        """)
    }
}
