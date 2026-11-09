package mightymich.morphe.patches.com.dashdramas

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * My Drama (com.dashdramas) Unlock Premium — verified on 1.81.0.
 *
 * Billing is Adapty. Client entitlement flows through:
 *  - AdaptyProfile.AccessLevel.isActive() / isLifetime()
 *  - AdaptyProfile.Subscription.isActive() / isLifetime() / getWillRenew()
 *
 * Forcing those to true unlocks local VIP UI and most client-side gates.
 * Hermes JS still mentions isSubscribed; pure server episode locks may remain.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Forces Adapty access levels and subscriptions to active/lifetime " +
        "so My Drama treats the account as premium.",
    default = true,
) {
    compatibleWith(MyDramaCompatibility.MY_DRAMA)

    execute {
        var hits = 0

        fun forceBool(definingClass: String, name: String, value: Boolean): Boolean {
            return try {
                val fp = Fingerprint(
                    definingClass = definingClass,
                    name = name,
                    returnType = "Z",
                    parameters = emptyList(),
                )
                val imm = if (value) "0x1" else "0x0"
                fp.method.addInstructions(
                    0,
                    """
                        const/4 v0, $imm
                        return v0
                    """,
                )
                true
            } catch (_: Exception) {
                false
            }
        }

        val accessLevel = "Lcom/adapty/models/AdaptyProfile\$AccessLevel;"
        val subscription = "Lcom/adapty/models/AdaptyProfile\$Subscription;"

        for (cls in listOf(accessLevel, subscription)) {
            if (forceBool(cls, "isActive", true)) hits++
            if (forceBool(cls, "isLifetime", true)) hits++
            if (forceBool(cls, "isInGracePeriod", true)) hits++
            if (forceBool(cls, "getWillRenew", true)) hits++
            if (forceBool(cls, "isRefund", false)) hits++
        }

        // Fallback: any short isActive()Z on classes mentioning AdaptyProfile / AccessLevel
        if (hits == 0) {
            for (marker in listOf(
                "isActive in AccessLevel should not be null",
                "AdaptyProfile",
                "accessLevelId",
            )) {
                val defs = try {
                    classDefByStrings(marker)
                } catch (_: Exception) {
                    emptyList()
                }
                for (def in defs) {
                    if (!def.type.contains("adapty", ignoreCase = true) &&
                        !def.type.contains("AccessLevel") &&
                        !def.type.contains("Subscription")
                    ) {
                        continue
                    }
                    val clazz = try {
                        mutableClassDefBy(def)
                    } catch (_: Exception) {
                        continue
                    }
                    for (method in clazz.methods) {
                        if (method.returnType != "Z") continue
                        if (method.parameterTypes.isNotEmpty()) continue
                        val n = method.name
                        if (n != "isActive" && n != "isLifetime" && n != "getWillRenew") continue
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

        // Bonus: common app-level VIP / premium booleans if present outside Adapty
        for (marker in listOf("isSubscribed", "isPremium", "isVip")) {
            val defs = try {
                classDefByStrings(marker)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                val t = def.type
                if (t.startsWith("Landroid") || t.startsWith("Landroidx") ||
                    t.startsWith("Lcom/facebook") || t.startsWith("Lcom/google") ||
                    t.startsWith("Lkotlin") || t.startsWith("Ljava")
                ) {
                    continue
                }
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (method.returnType != "Z") continue
                    if (method.parameterTypes.isNotEmpty()) continue
                    if (method.name !in setOf("isSubscribed", "isPremium", "isVip", "getIsVip")) {
                        continue
                    }
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

        if (hits == 0) {
            throw PatchException(
                "My Drama: Adapty AccessLevel/Subscription isActive not found. " +
                    "SDK layout may have changed.",
            )
        }
    }
}
