package app.adish.patches.jainpanchang

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.adish.patches.shared.Constants.COMPATIBILITY_JAINPANCHANG
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PRODUCT_ID = "jain_panchang_premium_lifetime"

private const val FAKE_PURCHASE_SMALI = """
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "id"

    const-string v2, "morphe_fake_purchase"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "productId"

    const-string v2, "$PRODUCT_ID"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "purchaseState"

    const-string v2, "purchased"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "store"

    const-string v2, "google"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "isAutoRenewing"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "quantity"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "purchaseToken"

    const-string v2, "morphe_fake_purchase"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Ldev/hyo/openiap/PurchaseAndroid;->Companion:Ldev/hyo/openiap/PurchaseAndroid${'$'}Companion;

    invoke-virtual {v1, v0}, Ldev/hyo/openiap/PurchaseAndroid${'$'}Companion;->fromJson(Ljava/util/Map;)Ldev/hyo/openiap/PurchaseAndroid;

    move-result-object v1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
"""

@Suppress("unused")
val premiumUnlockPatch = bytecodePatch(
    name = "Premium unlock",
    description = "Unlocks premium features by faking active subscriptions and purchases.",
    default = true
) {
    compatibleWith(COMPATIBILITY_JAINPANCHANG)

    execute {
        HasActiveSubscriptionsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1

                invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

                move-result-object v0

                return-object v0
            """
        )

        GetAvailablePurchasesFingerprint.method.addInstructions(0, FAKE_PURCHASE_SMALI)

        RestorePurchasesFingerprint.method.addInstructions(0, FAKE_PURCHASE_SMALI)

        SharedStorageSetFingerprint.method.apply {
            val optBooleanIndex = instructions.indexOfFirst { insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ref?.name == "optBoolean"
            }
            check(optBooleanIndex >= 0) { "optBoolean call not found in SharedStorage.set" }
            val moveResultIndex = (optBooleanIndex + 1 until instructions.size).first { i ->
                instructions[i].opcode == Opcode.MOVE_RESULT
            }
            val register = getInstruction<OneRegisterInstruction>(moveResultIndex).registerA
            addInstruction(moveResultIndex + 1, "const/4 v$register, 0x1")
        }
    }
}
