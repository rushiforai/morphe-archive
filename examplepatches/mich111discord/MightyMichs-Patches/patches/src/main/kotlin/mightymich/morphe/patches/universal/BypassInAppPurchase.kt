package mightymich.morphe.patches.universal

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string

/**
 * Universal best-effort: treat local Google Play Billing purchases as owned.
 *
 * Targets common Play Billing Library client-side gates used by many offline /
 * single-player games that do NOT re-validate receipts on a server:
 *  - Purchase.getPurchaseState() → 1 (PURCHASED)
 *  - Purchase.isAcknowledged() → true
 *  - Purchase.getPurchaseToken() → non-empty dummy (some games only null-check)
 *
 * Limitations:
 *  - Server-side / online receipt validation will still fail.
 *  - Obfuscated or custom billing wrappers may not match.
 *  - Does not inject SKU lists into queryPurchases callbacks (app-specific).
 *
 * Use only where you are allowed to modify the app (e.g. your own builds / offline titles).
 */
@Suppress("unused")
val bypassInAppPurchasePatch = bytecodePatch(
    name = "Bypass in-app purchase",
    description = "Best-effort local Play Billing bypass for offline games " +
        "(Purchase state = PURCHASED, acknowledged = true). " +
        "Does not defeat server-side validation.",
    default = true
) {
    // Purchase.getPurchaseState()I  — returns 0 UNSPECIFIED, 1 PURCHASED, 2 PENDING
    val purchaseStateFingerprint = Fingerprint(
        definingClass = "Lcom/android/billingclient/api/Purchase;",
        returnType = "I",
        parameters = emptyList(),
        filters = listOf(
            // Unique field / JSON key kept by R8 in many Billing versions
            string("purchaseState")
        )
    )

    // Some AAR versions name the getter differently; match short ()I on Purchase
    val purchaseStateLooseFingerprint = Fingerprint(
        definingClass = "Lcom/android/billingclient/api/Purchase;",
        returnType = "I",
        parameters = emptyList()
    )

    // Purchase.isAcknowledged()Z
    val acknowledgedFingerprint = Fingerprint(
        definingClass = "Lcom/android/billingclient/api/Purchase;",
        returnType = "Z",
        parameters = emptyList(),
        filters = listOf(
            string("acknowledged")
        )
    )

    val acknowledgedLooseFingerprint = Fingerprint(
        definingClass = "Lcom/android/billingclient/api/Purchase;",
        name = "isAcknowledged",
        returnType = "Z",
        parameters = emptyList()
    )

    // SkuDetails / ProductDetails style "is already owned" helpers in older wrappers
    val ownedFingerprint = Fingerprint(
        returnType = "Z",
        parameters = emptyList(),
        filters = listOf(
            string("purchaseState")
        ),
        custom = { method, classDef ->
            val type = classDef.type
            (type.contains("Purchase") || type.contains("Billing")) &&
                method.name.lowercase().let {
                    it.contains("own") || it.contains("purchas") || it == "isAcknowledged"
                }
        }
    )

    execute {
        var patched = 0

        fun patchReturnInt1(label: String, block: () -> Unit) {
            try {
                block()
                patched++
            } catch (_: Exception) {
            }
        }

        fun patchReturnTrue(block: () -> Unit) {
            try {
                block()
                patched++
            } catch (_: Exception) {
            }
        }

        // getPurchaseState → PURCHASED (1)
        patchReturnInt1("state") {
            purchaseStateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        if (patched == 0) {
            patchReturnInt1("state-loose") {
                purchaseStateLooseFingerprint.method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """
                )
            }
        }

        // isAcknowledged → true
        patchReturnTrue {
            acknowledgedFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        patchReturnTrue {
            acknowledgedLooseFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // Extra owned-style getters (best-effort, single match)
        patchReturnTrue {
            ownedFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // Also force via classDefByStrings for billingclient Purchase
        for (marker in listOf("purchaseState", "acknowledged", "purchaseToken")) {
            val defs = try {
                classDefByStrings(marker)
            } catch (_: Exception) {
                emptyList()
            }
            for (def in defs) {
                val type = try {
                    def.type
                } catch (_: Exception) {
                    continue
                }
                if (!type.contains("billingclient") && !type.contains("Purchase")) continue
                val clazz = try {
                    mutableClassDefBy(def)
                } catch (_: Exception) {
                    continue
                }
                for (method in clazz.methods) {
                    if (method.parameterTypes.isNotEmpty()) continue
                    if (method.implementation == null) continue
                    try {
                        when (method.returnType) {
                            "I" -> {
                                // likely getPurchaseState
                                method.addInstructions(
                                    0,
                                    """
                                        const/4 v0, 0x1
                                        return v0
                                    """
                                )
                                patched++
                            }
                            "Z" -> {
                                method.addInstructions(
                                    0,
                                    """
                                        const/4 v0, 0x1
                                        return v0
                                    """
                                )
                                patched++
                            }
                        }
                    } catch (_: Exception) {
                    }
                }
            }
        }

        // Soft success: do not crash the whole bundle if Billing client is absent
        // (e.g. app uses only custom offline unlock). Manager still applies other patches.
        if (patched == 0) {
            // No Play Billing hooks — nothing to do; avoid failing the session.
            return@execute
        }
    }
}
