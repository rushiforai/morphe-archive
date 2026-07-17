package app.template.patches.basestrength

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.BASE_STRENGTH_COMPATIBILITY
import app.template.patches.shared.replaceImplementation
import app.template.patches.shared.replaceTextOnce

/**
 * BASE Strength AI (Expo/RN + Iaphub + Firebase).
 *
 * Client unlock:
 * 1) JS [useSubscription]: force `hasValidSubscription` so main nav unlocks
 * 2) Native RNIaphub.getActiveProducts → spoofed active yearly sub so Redux
 *    `purchasedSubscriptions` is non-empty (manage-subscription UI, etc.)
 */
private const val BUNDLE_PATH = "assets/index.android.bundle"

private const val PRIMARY_SKU = "base_strength_yearly"
private const val PRIMARY_PRODUCT_ID = "base_strength_pro"
private const val PURCHASE_DATE = "2026-07-09T00:00:00.000Z"
private const val EXPIRATION_DATE = "2035-07-09T00:00:00.000Z"

private val baseStrengthUnlockResourcePatch = rawResourcePatch {
    execute {
        val bundle = get(BUNDLE_PATH)
        if (!bundle.exists()) {
            throw PatchException("$BUNDLE_PATH not found in the APK.")
        }

        val patched = bundle.readBytes()
            .replaceTextOnce(
                path = BUNDLE_PATH,
                search = "hasValidSubscription:p()||(null==s?void 0:s.length)>0",
                replacement = "hasValidSubscription:!0"
            )
            .replaceTextOnce(
                path = BUNDLE_PATH,
                search = "e.FREE_USER_ROLES=['admin']",
                replacement = "e.FREE_USER_ROLES=['admin','user']"
            )

        bundle.writeBytes(patched)
    }
}

@Suppress("unused")
val baseStrengthUnlockPremiumPatch = bytecodePatch(
    name = "Unlock BASE Strength Premium",
    description = "Unlock all Paid features",
    default = true
) {
    compatibleWith(BASE_STRENGTH_COMPATIBILITY)
    dependsOn(baseStrengthUnlockResourcePatch)

    execute {
        BaseStrengthGetActiveProductsFingerprint
            .match(classDefBy(BaseStrengthGetActiveProductsFingerprint.definingClass!!))
            .let { match ->
                // p0=this, p1=options, p2=promise → need v0–v2 free (registerCount 6)
                match.classDef.replaceImplementation(
                    match.method,
                    registerCount = 6,
                    smali = buildGetActiveProductsSmali()
                )
            }
    }
}

/**
 * Resolve Promise with a one-element WritableArray of a spoofed active product.
 * Fields mirror Iaphub [ActiveProduct.getData] / ProductDetails for RN consumers.
 */
private fun buildGetActiveProductsSmali(): String = """
    new-instance v0, Lcom/facebook/react/bridge/WritableNativeMap;
    invoke-direct {v0}, Lcom/facebook/react/bridge/WritableNativeMap;-><init>()V

    const-string v1, "id"
    const-string v2, "$PRIMARY_PRODUCT_ID"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "type"
    const-string v2, "renewable_subscription"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "sku"
    const-string v2, "$PRIMARY_SKU"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "group"
    const-string v2, "subscription"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "groupName"
    const-string v2, "BASE Strength"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "localizedTitle"
    const-string v2, "BASE Strength Yearly"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "localizedDescription"
    const-string v2, "Full access"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "subscriptionDuration"
    const-string v2, "P1Y"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "subscriptionState"
    const-string v2, "active"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "subscriptionPeriodType"
    const-string v2, "normal"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "platform"
    const-string v2, "android"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "purchaseDate"
    const-string v2, "$PURCHASE_DATE"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "expirationDate"
    const-string v2, "$EXPIRATION_DATE"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "purchase"
    const-string v2, "xhehab-base-strength"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "isSubscriptionRenewable"
    const/4 v2, 0x1
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "isSandbox"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "isPromo"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "isFamilyShare"
    invoke-virtual {v0, v1, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putBoolean(Ljava/lang/String;Z)V

    new-instance v1, Lcom/facebook/react/bridge/WritableNativeArray;
    invoke-direct {v1}, Lcom/facebook/react/bridge/WritableNativeArray;-><init>()V
    invoke-virtual {v1, v0}, Lcom/facebook/react/bridge/WritableNativeArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    invoke-interface {p2, v1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
    return-void
""".trimIndent()
