package app.paresh.patches.fing.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.fing.shared.Constants.COMPATIBILITY_FING

@Suppress("unused")
val fingPremiumPatch = bytecodePatch(
    name = "Fing Premium",
    description = "Unlocks premium network tools and features."
) {
    compatibleWith(COMPATIBILITY_FING)

    execute {
        // Use the method's declared return type as the enum type (handles re-obfuscation)
        val enumType = GetSubscriptionTierFingerprint.method.returnType

        // Return PREMIUM tier enum constant (field c = ordinal 2)
        GetSubscriptionTierFingerprint.method.addInstructions(0, """
            sget-object v0, ${enumType}->c:${enumType}
            return-object v0
        """)

        // Bypass scan limit check — always return true for premium status
        IsPremiumCheckFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // All features entitled — always return true
        IsFeatureEntitledFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
