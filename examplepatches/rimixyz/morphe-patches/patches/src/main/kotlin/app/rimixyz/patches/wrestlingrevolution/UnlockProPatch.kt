package app.rimixyz.patches.wrestlingrevolution

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_WRESTLINGREVOLUTION
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS =
    "Lapp/rimixyz/extension/WrestlingPurchases;"
private const val EXT_CONTEXT =
    "Lcom/distriqt/core/utils/IExtensionContext;"
private const val GET_PURCHASES_HANDLER =
    "Lcom/distriqt/extension/inappbilling/controller/playbilling/PlayBillingController\$5;"
private const val RESTORE_PURCHASES_HANDLER =
    "Lcom/distriqt/extension/inappbilling/controller/playbilling/PlayBillingController\$4;"

/**
 * Replaces the JSON payload that the Distriqt ANE is about to dispatch to
 * ActionScript with a synthetic purchase.
 *
 * The extension's verifyPurchases() only filters the List<Purchase> before
 * this point. The formatted JSON returned by PurchaseEvent.formatPurchasesForEvent()
 * is not validated again in Java, so overwriting the register that holds it is
 * enough to make the ActionScript side see a purchased SKU.
 */
private fun Fingerprint.replacePayload(payloadMethod: String) {
    val instructionList = method.instructions.toList()
    val stringIndex = instructionMatches.last().index

    // The instruction right before the event name is move-result-object with
    // the formatted JSON payload.
    val payloadRegister = (instructionList[stringIndex - 1] as OneRegisterInstruction).registerA

    method.addInstructions(
        stringIndex,
        """
            invoke-static { }, $EXTENSION_CLASS->$payloadMethod()Ljava/lang/String;
            move-result-object v$payloadRegister
        """.trimIndent(),
    )
}

/**
 * Routes a failed query/restore into the success handler with an empty list.
 * The success handler was patched above, so the empty list is immediately
 * replaced by the synthetic payload.
 *
 * Using the handler's own onSuccess() avoids duplicating the IExtensionContext
 * field access and keeps the injected code tiny.
 */
private fun Fingerprint.redirectFailureToSuccess(handler: String) {
    method.addInstructions(
        0,
        """
            const/4 v0, 0x0
            new-instance v1, Ljava/util/ArrayList;
            invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
            invoke-virtual { p0, v0, v1 }, $handler->onSuccess(ILjava/util/List;)V
            return-void
        """.trimIndent(),
    )
}

/**
 * Unlocks the Pro license by faking the purchase events consumed by
 * Purchases_Distriqt.as.
 *
 * Both paths that can grant an entitlement are covered:
 *  - get:purchases:complete  (boot / explicit getPurchases)
 *  - purchases:updated       (restorePurchases / onPurchasesUpdated)
 *
 * If Google Play answers with an error, the failure handler is redirected to
 * the success handler, so a missing account or offline device still unlocks.
 * This patch does not depend on a developer server: the APK only validates
 * the purchase signature locally, and that validation happens before the
 * event payload we replace.
 */
@Suppress("unused")
val unlockProPatch = patch(
    name = "Unlock Pro",
    description = "Grants the Pro license locally by injecting a synthetic purchase into the Distriqt billing events. Unlocks the editor and the full career content.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WRESTLINGREVOLUTION)
    extendWith("extensions/extension.mpe")

    execute {
        runCatching {
            GetPurchasesCompleteFingerprint.replacePayload("getPurchasesComplete")
        }.onFailure {
            println("Unlock Pro: get:purchases:complete not patched (${it.message})")
        }

        runCatching {
            PurchasesUpdatedFingerprint.replacePayload("getPurchasesUpdated")
        }.onFailure {
            println("Unlock Pro: purchases:updated not patched (${it.message})")
        }

        // LegitPurchase() only grants the license when optPurchases >= 2, and
        // products_loadedHandler is what sets it to 2. Dispatch a synthetic
        // products:loaded right after setup:success, then the purchase events.
        // The ActionScript processes them in order, so LegitPurchase sees
        // optPurchases == 2. This does not depend on the real product query.
        runCatching {
            val method = OnSetupCompleteFingerprint.method
            method.addInstructions(
                method.instructions.size - 1,
                """
                    const-string v2, ""
                    const-string v1, "inappbilling:products:loaded"
                    invoke-interface { v0, v1, v2 }, $EXT_CONTEXT->dispatchEvent(Ljava/lang/String;Ljava/lang/String;)V
                    invoke-static { }, $EXTENSION_CLASS->getPurchasesComplete()Ljava/lang/String;
                    move-result-object v2
                    const-string v1, "get:purchases:complete"
                    invoke-interface { v0, v1, v2 }, $EXT_CONTEXT->dispatchEvent(Ljava/lang/String;Ljava/lang/String;)V
                    invoke-static { }, $EXTENSION_CLASS->getPurchasesUpdated()Ljava/lang/String;
                    move-result-object v2
                    const-string v1, "purchases:updated"
                    invoke-interface { v0, v1, v2 }, $EXT_CONTEXT->dispatchEvent(Ljava/lang/String;Ljava/lang/String;)V
                """.trimIndent(),
            )
        }.onFailure {
            println("Unlock Pro: setup trigger not patched (${it.message})")
        }

        runCatching {
            GetPurchasesFailedFingerprint.redirectFailureToSuccess(GET_PURCHASES_HANDLER)
        }.onFailure {
            println("Unlock Pro: get:purchases:failed not patched (${it.message})")
        }

        runCatching {
            RestorePurchasesFailedFingerprint.redirectFailureToSuccess(RESTORE_PURCHASES_HANDLER)
        }.onFailure {
            println("Unlock Pro: restore failure not patched (${it.message})")
        }
    }
}
