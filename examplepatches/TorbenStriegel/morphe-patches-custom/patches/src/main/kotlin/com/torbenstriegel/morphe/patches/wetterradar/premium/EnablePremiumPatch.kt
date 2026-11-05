package com.torbenstriegel.morphe.patches.wetterradar.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.torbenstriegel.morphe.patches.shared.Constants.COMPATIBILITY_WETTERRADAR

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables premium features: ad-free experience, HD radar and all gated content. Works without an account."
) {
    compatibleWith(COMPATIBILITY_WETTERRADAR)

    execute {
        // Select the matching pair together: R8 reuses old names for unrelated methods.
        val newAccessLevel = AccessLevel202621Fingerprint.methodOrNull
        val fusedAccess = if (newAccessLevel != null) {
            FusedAccessCombine202621Fingerprint.method
        } else {
            FusedAccessCombineFingerprint.method
        }
        val accessLevel = newAccessLevel ?: AccessLevelFingerprint.method
        val subscriptionField = if (newAccessLevel != null) "Lt6;->b:Lt6;" else "Lo6;->b:Lo6;"

        // The isPro flow is consumed by every feature and ad gate — force it to true.
        fusedAccess.addInstructions(
            0,
            """
                const/4 v0, 0x1
                invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v0
                return-object v0
            """.trimIndent()
        )

        // Report SUBSCRIPTION as the AccessLevel so no paywall/upgrade UI is shown.
        accessLevel.addInstructions(
            0,
            """
                sget-object v0, $subscriptionField
                return-object v0
            """.trimIndent()
        )
    }
}