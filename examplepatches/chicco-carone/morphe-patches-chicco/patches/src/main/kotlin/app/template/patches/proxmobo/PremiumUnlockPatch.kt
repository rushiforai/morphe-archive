package app.template.patches.proxmobo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_PROXMOBO
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Fingerprint for `Ld1/a;->o(List<Purchase>)`.
 *
 * This static method converts a raw `List<com.android.billingclient.api.Purchase>`
 * into the pigeon payload list sent back to the Dart layer of the
 * `in_app_purchase_android` plugin. Every purchase report (queryPurchasesAsync
 * result, queryPurchaseHistoryAsync result and the onPurchasesUpdated callback)
 * flows through here, so it is the single choke point we need to hook.
 */
object PigeonPurchasesMapperFingerprint : Fingerprint(
    definingClass = "Ld1/a;",
    name = "o",
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/util/List;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
)

/**
 * ProxMobo Premium Unlock
 *
 * ProxMobo's "premium" state is decided in its Flutter/Dart layer from the
 * purchases returned through the `in_app_purchase_android` pigeon channel.
 * This patch injects a fake purchased `com.android.billingclient.api.Purchase`
 * for the lifetime product (`proxmobo.premium.lifetime`) at the start of the
 * mapper that serializes purchases back to Dart, so Dart always sees a
 * PURCHASED premium product in its purchase stream and unlocks Premium.
 *
 * The JSON literal uses `"purchaseState":4`, which is the value this build's
 * native mapper maps to the pigeon `PurchaseState.PURCHASED` (see the
 * `optInt("purchaseState", 1)` switch in `Ld1/a;->o`).
 */
@Suppress("unused")
val premiumUnlockPatch = bytecodePatch(
    name = "ProxMobo Premium Unlock",
    description = "Unlocks Premium by reporting the lifetime product (proxmobo.premium.lifetime) as purchased. On first launch, open Settings and press \u201CRestore Purchases\u201D to activate Premium.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PROXMOBO)

    dependsOn(licenseCheckPatch)

    execute {
        PigeonPurchasesMapperFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                new-instance v5, Ljava/util/ArrayList;
                invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V
                const-string v2, "{\"orderId\":\"GPA.0000-0000-00000000\",\"packageName\":\"com.halliharp.proxmobo\",\"productIds\":[\"proxmobo.premium.lifetime\"],\"purchaseTime\":1785800000000,\"purchaseState\":4,\"purchaseToken\":\"morphe-premium-unlock-token\",\"quantity\":1,\"acknowledged\":true,\"autoRenewing\":true}"
                const-string v3, "fake-signature"
                new-instance v4, Lcom/android/billingclient/api/Purchase;
                invoke-direct {v4, v2, v3}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
                invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                if-eqz v0, :skip_merge
                invoke-virtual {v5, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
                :skip_merge
                move-object/from16 p0, v5
            """
        )
    }
}