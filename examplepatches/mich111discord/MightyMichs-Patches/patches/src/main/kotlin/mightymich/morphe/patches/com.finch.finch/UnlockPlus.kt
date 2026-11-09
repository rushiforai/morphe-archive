package mightymich.morphe.patches.com.finch.finch

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * Finch (com.finch.finch) — Unlock Finch Plus.
 *
 * Self-care pet app. Plus is sold via RevenueCat entitlement id "plus"
 * (Flutter UI in libapp.so reads purchases entitlements).
 *
 * Client strategy (3.73.235):
 *  - EntitlementInfo.isActive() → true
 *  - EntitlementInfo.getWillRenew() → true
 *  - SubscriptionInfo.isActive() → true
 *  - DateActive.isActive() → true (RC date helper)
 *
 * Unlocks Plus cosmetics, expanded soundscapes / breathing / reflections
 * when the app trusts the RevenueCat customer info cache.
 * Pure server-gated content may still require a network grant.
 */
@Suppress("unused")
val unlockPlusPatch = bytecodePatch(
    name = "Unlock Plus",
    description = "Forces RevenueCat Plus entitlement checks so Finch treats the " +
        "account as Finch Plus (cosmetics, full activity libraries, shop perks).",
    default = true,
) {
    compatibleWith(FinchCompatibility.FINCH)

    execute {
        var hits = 0

        fun forceTrue(definingClass: String, name: String): Boolean {
            return try {
                val fp = Fingerprint(
                    definingClass = definingClass,
                    name = name,
                    returnType = "Z",
                    parameters = emptyList(),
                )
                fp.method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """,
                )
                true
            } catch (_: Exception) {
                false
            }
        }

        val targets = listOf(
            "Lcom/revenuecat/purchases/EntitlementInfo;" to "isActive",
            "Lcom/revenuecat/purchases/EntitlementInfo;" to "getWillRenew",
            "Lcom/revenuecat/purchases/SubscriptionInfo;" to "isActive",
            "Lcom/revenuecat/purchases/utils/DateActive;" to "isActive",
        )
        for ((cls, name) in targets) {
            if (forceTrue(cls, name)) hits++
        }

        // Fallback: any isActive()Z under revenuecat purchases (non-common noise filtered lightly)
        if (hits == 0) {
            for (marker in listOf("EntitlementInfo", "activeEntitlements", "identifier(\"plus\")")) {
                val defs = try {
                    classDefByStrings(marker)
                } catch (_: Exception) {
                    emptyList()
                }
                for (def in defs) {
                    if (!def.type.contains("revenuecat")) continue
                    val clazz = try {
                        mutableClassDefBy(def)
                    } catch (_: Exception) {
                        continue
                    }
                    for (method in clazz.methods) {
                        if (method.returnType != "Z") continue
                        if (method.parameterTypes.isNotEmpty()) continue
                        if (method.name != "isActive" && method.name != "getWillRenew") continue
                        try {
                            method.addInstructions(
                                0,
                                """
                                    const/4 v0, 0x1
                                    return v0
                                """,
                            )
                            hits++
                        } catch (_: Exception) {
                        }
                    }
                }
            }
        }

        if (hits == 0) {
            throw PatchException(
                "Finch: RevenueCat EntitlementInfo.isActive not found. " +
                    "SDK version may have changed.",
            )
        }
    }
}
