package com.user.patches.medium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

val mediumPremiumPatch = bytecodePatch(
    name = "Hide Premium Banners",
    description = "Hides 'Get Premium' banners by mocking the MembershipTier to MEMBER.",
    default = true
) {
    compatibleWith(mediumCompatibility)

    execute {
        val safeValueOfFingerprint = Fingerprint(
            name = "safeValueOf",
            returnType = "Lcom/medium/android/graphql/type/MembershipTier;",
            parameters = listOf("Ljava/lang/String;")
        )

        safeValueOfFingerprint.matchAllOrNull()?.forEach { match ->
            match.method.removeInstructions(0)
            match.method.addInstructions(0, """
                sget-object v0, Lcom/medium/android/graphql/type/MembershipTier;->MEMBER:Lcom/medium/android/graphql/type/MembershipTier;
                return-object v0
            """)
        }
    }
}
