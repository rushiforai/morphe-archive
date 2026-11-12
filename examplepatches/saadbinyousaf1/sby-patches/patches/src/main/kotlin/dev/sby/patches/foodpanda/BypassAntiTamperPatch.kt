// © https://saadbinyousaf.dev/ © //
package dev.sby.patches.foodpanda

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.sby.patches.shared.Constants.COMPATIBILITY_FOODPANDA

// © https://saadbinyousaf.dev/ © //
val bypassAntiTamperPatch = bytecodePatch(
    name = "Bypass anti-tamper (foodpanda)",
    description = "Bypasses foodpanda's DeliveryHero MAS integrity block so re-signed / sideloaded " +
        "builds no longer hit the \"This device or application is not supported\" screen. Required.",
) {
    compatibleWith(COMPATIBILITY_FOODPANDA)

    // © https://saadbinyousaf.dev/ © //
    execute {
        var applied = false

        masGateFingerprint.matchOrNull()?.method?.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """,
        )?.also { applied = true }

        // © https://saadbinyousaf.dev/ © //
        blockScreenGuardFingerprint.matchOrNull()?.method?.addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                return-object v0
            """,
        )?.also { applied = true }

        if (!applied) {
            throw Exception(
                "foodpanda anti-tamper anchors not found — DeliveryHero app-security shape changed.",
            )
        }
    }
}
// © https://saadbinyousaf.dev/ © //
