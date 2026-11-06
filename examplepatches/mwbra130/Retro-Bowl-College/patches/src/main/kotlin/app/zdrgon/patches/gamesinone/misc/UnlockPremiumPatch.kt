package app.zdrgon.patches.gamesinone.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.zdrgon.patches.gamesinone.shared.Constants.COMPATIBILITY_GAMES_IN_ONE
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val BILLING_CLIENT_IMPL = "Lcom/android/billingclient/api/BillingClientImpl;"
private const val METHOD_NAME = "queryPurchasesAsync"
private const val METHOD_SUFFIX = "\$original"
private const val INJECTOR = "Lapp/template/extension/gamesinone/VipPurchaseInjector;"

/**
 * Games In One — Unlock premium (VIP).
 *
 * The game is a Unity IAP title. Its one paid product is the one-time VIP
 * unlock, Play product id "pro_version" (recovered 2026-11-01 from the
 * IL2CPP metadata: the InGamePurchaseProcesser constructor assigns
 * vipItemProductId = "pro_version", string literal 8662; the decode was
 * verified against the neighbouring Purchase_Success / Purchase_Fail
 * literals, which resolve to "Purchase Success" / "Purchase Error").
 *
 * Mechanism — the same owned-purchase spoof as the Retro Bowl College
 * patch, moved one layer down. Retro Bowl's game engine consumed the
 * queryPurchases JSON string, so the spoof edited that string. Unity IAP
 * instead consumes the Java List<Purchase> delivered to its
 * PurchasesResponseListener, so here the spoof wraps the listener:
 *
 *   BillingClientImpl.queryPurchasesAsync(params, listener)
 *
 * is renamed to queryPurchasesAsync$original and replaced with a
 * same-signature method that first swaps the listener for the extension's
 * VipPurchaseInjector (a delegating PurchasesResponseListener) and then
 * calls the original. When Play's answer comes back, the injector appends
 * a forged Purchase for "pro_version" (unless a real one is already in
 * the list) and forwards an OK result, so Unity IAP marks the product
 * owned with a receipt and the game runs its own ProcessPurchase grant
 * path — the same path a real purchase or restore would take.
 *
 * Register budget (0.4.5 dex, verified 2026-11-01): the original method
 * has .registers 9, so p0=v6, p1=v7, p2=v8 — all encodable in format-35c
 * invokes, no /from16 marshaling needed. The wrapper body uses no scratch
 * registers at all: wrap()'s result is moved straight back into p2 before
 * the $original call. The method has no try/catch entries, and the
 * replacement body returns immediately after delegating, so the copied
 * original instructions below it are dead code.
 *
 * Known limit: if the game ever validates the receipt with Unity's
 * CrossPlatformValidator (Play public key), the forged receipt is
 * rejected — the purchase JSON carries an empty signature by design.
 * Unity IAP does not validate unless the app explicitly calls the
 * validator; whether this game does is an on-device question.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks all games (VIP). The store sees the one-time VIP purchase as owned — no real purchase is made.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GAMES_IN_ONE)

    // Merge the extension DEX into the patched app. Without this the
    // injected call below references a class that does not exist at
    // runtime and the billing call crashes with NoClassDefFoundError.
    extendWith("extensions/gamesinone.mpe")

    execute {
        // Resolving the fingerprint first proves the target method exists
        // with the exact expected shape before any class surgery happens.
        val classDef = QueryPurchasesAsyncFingerprint.classDef
        val mutableClass = mutableClassDefBy(classDef)

        val original = mutableClass.methods.first { method ->
            method.name == METHOD_NAME &&
                method.returnType == "V" &&
                method.parameterTypes == listOf(
                    "Lcom/android/billingclient/api/QueryPurchasesParams;",
                    "Lcom/android/billingclient/api/PurchasesResponseListener;"
                )
        }

        if (!mutableClass.virtualMethods.remove(original)) {
            throw PatchException("$BILLING_CLIENT_IMPL->$METHOD_NAME is not a virtual method")
        }

        val originalReference = "$BILLING_CLIENT_IMPL->$METHOD_NAME$METHOD_SUFFIX" +
            "(Lcom/android/billingclient/api/QueryPurchasesParams;" +
            "Lcom/android/billingclient/api/PurchasesResponseListener;)V"

        val replacement = ImmutableMethod.of(original).toMutable()
        mutableClass.virtualMethods += replacement

        replacement.addInstructions(
            0,
            """
                invoke-static {p2}, $INJECTOR->wrap(Lcom/android/billingclient/api/PurchasesResponseListener;)Lcom/android/billingclient/api/PurchasesResponseListener;
                move-result-object p2
                invoke-virtual {p0, p1, p2}, $originalReference
                return-void
            """.trimIndent()
        )

        original.name += METHOD_SUFFIX
        mutableClass.virtualMethods += original
    }
}
