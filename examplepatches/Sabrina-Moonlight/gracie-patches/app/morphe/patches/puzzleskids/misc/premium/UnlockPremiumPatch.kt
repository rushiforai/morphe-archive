package app.morphe.patches.puzzleskids.misc.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode

/**
 * Puzzles Kids — Animal Jigsaw Premium Unlock
 *
 * Package : com.gamesforkids.animals.puzzles.jigsaw
 * Engine  : Unity IL2CPP (libil2cpp.so) + Google Play Billing Library + Unity IAP
 * Version : code ~500023 (base.apk + split_config.arm64_v8a)
 *
 * Root cause of "premium locked":
 *   Game logic lives in IL2CPP (C# → native). Flags:
 *     - isFullVersion
 *     - RemoveAds / remove_ads
 *   driven by Unity IAP product IDs:
 *     kProductIDNonConsumableRemoveAds
 *     kProductIDNonConsumableFullVersion
 *     kProductIDNonConsumableUpgradeVersion
 *     kProductIDNonConsumablePlaypass
 *   Purchase flow goes through com.android.billingclient.api.Purchase.
 *   getPurchaseState() must return PURCHASED (1) and isAcknowledged() true
 *   for the Unity layer to call IAPRemoveAdsComplete / IAPFullVersionComplete
 *   and set PlayerPrefs.
 *
 * DEX-side layers (this patch):
 *   A) Purchase.getPurchaseState() → always 1 (PURCHASED)
 *   B) Purchase.isAcknowledged() → always true
 *   C) Purchase.getProducts() / getSkus() paths left intact (Unity matches product IDs)
 *   D) Optional: force BillingClient queryPurchasesAsync success path if fingerprint hits
 *
 * Native follow-up (optional, stronger):
 *   Il2CppDumper on libil2cpp.so + global-metadata.dat
 *   Patch isFullVersion getter / RemoveAdsBar checks to return true.
 *   See docs/NATIVE_IL2CPP.md in this package.
 */
@Suppress("unused")
val puzzlesKidsUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Full Version + Remove Ads for Puzzles Kids (Unity IAP). Forces Google Play Purchase state to PURCHASED.",
    default = true,
) {
    compatibleWith("com.gamesforkids.animals.puzzles.jigsaw")

    execute {
        // Layer A: Purchase.getPurchaseState()I → const/4 v0, 0x1 ; return v0
        // PURCHASED = 1 in com.android.billingclient.api.Purchase$PurchaseState
        PurchaseGetPurchaseStateFingerprint.result?.let { result ->
            result.mutableMethod.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )
        }

        // Layer B: Purchase.isAcknowledged()Z → true
        PurchaseIsAcknowledgedFingerprint.result?.let { result ->
            result.mutableMethod.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )
        }

        // Layer C: some builds expose a helper isPurchased()Z on wrapper classes
        IsPurchasedHelperFingerprint.result?.let { result ->
            result.mutableMethod.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )
        }
    }
}

// ---------------------------------------------------------------------------
// Fingerprints
// ---------------------------------------------------------------------------

/**
 * Lcom/android/billingclient/api/Purchase;->getPurchaseState()I
 * Reliable across Billing Library 4.x / 5.x / 6.x
 */
object PurchaseGetPurchaseStateFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf(),
    customFingerprint = { method, classDef ->
        classDef.type == "Lcom/android/billingclient/api/Purchase;" &&
            method.name == "getPurchaseState"
    },
)

/**
 * Lcom/android/billingclient/api/Purchase;->isAcknowledged()Z
 */
object PurchaseIsAcknowledgedFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    customFingerprint = { method, classDef ->
        classDef.type == "Lcom/android/billingclient/api/Purchase;" &&
            method.name == "isAcknowledged"
    },
)

/**
 * Optional helper some Unity IAP bridges expose
 */
object IsPurchasedHelperFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("PURCHASED"),
    customFingerprint = { method, _ ->
        method.name.contains("isPurchased", ignoreCase = true) ||
            method.name.contains("hasPurchase", ignoreCase = true)
    },
)
