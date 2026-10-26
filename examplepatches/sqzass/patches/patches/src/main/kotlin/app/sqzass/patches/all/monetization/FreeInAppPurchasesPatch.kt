package app.sqzass.patches.all.monetization

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.shared.constStringLoad
import app.sqzass.patches.shared.findConstArgInvokes
import app.sqzass.patches.shared.forceInvokeResult
import app.sqzass.patches.shared.methodReferenceOf
import app.sqzass.patches.shared.patchMatchingMethods
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import java.util.logging.Logger

private val logger = Logger.getLogger("FreeInAppPurchasesPatch")

// Purchase.PurchaseState.PURCHASED == 1 (0 is UNSPECIFIED_STATE).
private const val PURCHASED = 1

private val OWNED_KEY_MARKERS = setOf("owned", "purchased", "entitlement", "inventory")

private fun isPurchaseStateRead(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass.contains("Purchase") &&
        reference.name == "getPurchaseState" &&
        reference.returnType == "I"
}

private fun isAcknowledgedRead(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass.contains("Purchase") &&
        reference.name == "isAcknowledged" &&
        reference.returnType == "Z"
}

private fun isPreferencesGetBoolean(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass.contains("SharedPreferences") &&
        reference.name == "getBoolean" &&
        reference.returnType == "Z"
}

private fun isOwnedKeyLoad(instruction: Instruction): Boolean {
    val key = constStringLoad(instruction)?.lowercase() ?: return false
    return OWNED_KEY_MARKERS.any { it in key }
}

@Suppress("unused")
val freeInAppPurchasesPatch = bytecodePatch(
    name = "Free in-app purchases",
    description = "Grants device-local purchases: forces purchase state to purchased, acknowledgements to true, and owned-item preference reads to true. Network-verified purchases stay gated.",
    default = false,
) {
    category("Monetization")

    val forcePurchasedOption = booleanOption(
        key = "forcePurchasedState",
        default = true,
        title = "Force Purchased State",
        description = "Force Purchase.getPurchaseState to report purchased.",
    )
    val forceAcknowledgedOption = booleanOption(
        key = "forceAcknowledged",
        default = true,
        title = "Force Acknowledged",
        description = "Force Purchase.isAcknowledged to report true.",
    )
    val forceOwnedKeysOption = booleanOption(
        key = "forceOwnedKeys",
        default = true,
        title = "Force Owned Keys",
        description = "Force SharedPreferences reads of owned-item keys to report true.",
    )

    execute {
        val forcePurchased = forcePurchasedOption.value == true
        val forceAcknowledged = forceAcknowledgedOption.value == true
        val forceOwned = forceOwnedKeysOption.value == true
        if (!forcePurchased && !forceAcknowledged && !forceOwned) {
            logger.info("All options disabled.")
            return@execute
        }

        val patched = patchMatchingMethods(
            isCandidate = { method ->
                method.implementation?.instructions?.let { raw ->
                    val instructions = raw.toList()
                    (forcePurchased && instructions.any(::isPurchaseStateRead)) ||
                        (forceAcknowledged && instructions.any(::isAcknowledgedRead)) ||
                        (forceOwned && findConstArgInvokes(
                            instructions,
                            ::isOwnedKeyLoad,
                            ::isPreferencesGetBoolean,
                        ).isNotEmpty())
                } == true
            },
        ) { instructions ->
            var count = 0
            for (index in instructions.indices.reversed()) {
                val instruction = instructions.getOrNull(index) ?: continue
                if (forcePurchased && isPurchaseStateRead(instruction) &&
                    forceInvokeResult(instructions, index) { register -> "const/4 v$register, 0x$PURCHASED" }
                ) {
                    count++
                } else if (forceAcknowledged && isAcknowledgedRead(instruction) &&
                    forceInvokeResult(instructions, index) { register -> "const/4 v$register, 0x1" }
                ) {
                    count++
                }
            }
            if (forceOwned) {
                for (index in findConstArgInvokes(instructions, ::isOwnedKeyLoad, ::isPreferencesGetBoolean).sortedDescending()) {
                    if (forceInvokeResult(instructions, index) { register -> "const/4 v$register, 0x1" }) {
                        count++
                    }
                }
            }
            count
        }

        logger.info("Applied $patched free purchase replacements.")
    }
}
