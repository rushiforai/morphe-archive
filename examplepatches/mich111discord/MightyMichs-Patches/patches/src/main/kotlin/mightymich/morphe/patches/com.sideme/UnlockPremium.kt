package mightymich.morphe.patches.com.sideme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * Unlocks SideMe Premium (Super subscription).
 *
 * SideMe stores subscription in Firestore as UserSubscription:
 *   { id, isActive, tier }
 * "Super" premium = subscription id matches SUPER + isActive == true.
 *
 * Strategy:
 * 1. Force UserSubscription.isActive() → Boolean.TRUE
 * 2. Force boolean helpers that call UserSubscriptionsRepo.b() (current Super sub)
 *    so premium is true even when Firestore returns null/empty.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks SideMe Super / Premium subscription features.",
    default = true
) {
    compatibleWith(SideMeCompatibility.SIDEME)

    // UserSubscription.isActive(): Boolean
    val isActiveFingerprint = Fingerprint(
        name = "isActive",
        returnType = "Ljava/lang/Boolean;",
        parameters = emptyList(),
        custom = { method, classDef ->
            // Firestore model has setActive + toString with "UserSubscription"
            classDef.methods.any { it.name == "setActive" } ||
                classDef.methods.any { it.name == "getTier" }
        }
    )

    // Premium gates: ()Z methods that call Lld5;->b() then isActive
    val premiumGateFingerprint = Fingerprint(
        returnType = "Z",
        parameters = emptyList(),
        custom = { method, _ ->
            val text = method.implementation?.instructions
                ?.joinToString("\n") { it.toString() }
                ?: return@Fingerprint false
            text.contains("Lld5;->b()") &&
                (text.contains("isActive") || text.contains("Boolean;->TRUE"))
        }
    )

    execute {
        // 1. isActive() → Boolean.TRUE
        val isActiveMethod = isActiveFingerprint.method
            ?: throw PatchException(
                "Could not find UserSubscription.isActive():Boolean"
            )
        isActiveMethod.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """
        )

        // 2. All premium-gate helpers → true
        val gates = try {
            premiumGateFingerprint.matchAllOrNull()
        } catch (_: Exception) {
            null
        }

        if (gates != null && gates.isNotEmpty()) {
            gates.forEach { match ->
                match.method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """
                )
            }
        } else {
            // Fallback: at least one gate
            try {
                premiumGateFingerprint.method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """
                )
            } catch (_: Exception) {
                // isActive alone may suffice if a sub doc exists
            }
        }
    }
}
