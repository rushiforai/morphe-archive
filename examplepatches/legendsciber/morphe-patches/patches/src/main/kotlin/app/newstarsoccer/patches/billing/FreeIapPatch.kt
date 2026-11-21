package app.newstarsoccer.patches.billing

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.newstarsoccer.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCCER

private const val PURCHASE_SMALI = """
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
    const-string v1, "productId"
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    const-string v1, "purchaseState"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    const-string v1, "quantity"
    const/4 v2, 0x1
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    const-string v1, "acknowledged"
    const/4 v2, 0x1
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    move-result-object v0
    new-instance v1, Lcom/android/billingclient/api/Purchase;
    const-string v2, ""
    invoke-direct {v1, v0, v2}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    iget-object v0, p0, Lcom/newstargames/newstarsoccer/GooglePlayBB;->inventory:Lcom/newstargames/newstarsoccer/GooglePlayInvent;
    invoke-virtual {v0, v1}, Lcom/newstargames/newstarsoccer/GooglePlayInvent;->RecievePending(Lcom/android/billingclient/api/Purchase;)V
    return-void
"""

private const val CONSUME_SMALI = """
    iget-object v0, p0, Lcom/newstargames/newstarsoccer/GooglePlayBB;->inventory:Lcom/newstargames/newstarsoccer/GooglePlayInvent;
    invoke-virtual {v0, p1}, Lcom/newstargames/newstarsoccer/GooglePlayInvent;->GetPending(Ljava/lang/String;)Lcom/android/billingclient/api/Purchase;
    move-result-object v1
    if-eqz v1, :done
    invoke-virtual {v0, v1}, Lcom/newstargames/newstarsoccer/GooglePlayInvent;->DiscardPurchase(Lcom/android/billingclient/api/Purchase;)V
    :done
    return-void
"""

@Suppress("unused")
val newStarSoccerFreeIapPatch = bytecodePatch(
    name = "New Star Soccer Free IAP",
    description = "Every shop item is granted instantly and free when bought, without launching Google Play billing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCCER)

    execute {
        PurchaseFingerprint.method.let { purchase ->
            purchase.removeInstructions(purchase.implementation!!.instructions.size)
            purchase.addInstructions(0, PURCHASE_SMALI.trimIndent())
        }

        ConsumeFingerprint.method.let { consume ->
            consume.removeInstructions(consume.implementation!!.instructions.size)
            consume.addInstructions(0, CONSUME_SMALI.trimIndent())
        }
    }
}
