package app.template.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PURCHASE_DATE = "2026-07-09T00:00:00.000Z"
private const val EXPIRATION_DATE = "2035-07-09T00:00:00.000Z"

// 2026-07-09T00:00:00.000Z and 2035-07-09T00:00:00.000Z as epoch millis
private const val PURCHASE_DATE_MILLIS = "0x19f442c9400L"
private const val EXPIRATION_DATE_MILLIS = "0x1e163b3d800L"

internal fun revenueCatHybridCustomerInfoMapFingerprint() = Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/CustomerInfoMapperKt;",
    name = "map",
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    returnType = "Ljava/util/Map;"
)

/**
 * Rewrite the hybridcommon CustomerInfo map just before it is returned to JS.
 *
 * Spoofs entitlements.active/all, activeSubscriptions, allPurchasedProductIdentifiers,
 * and latestExpirationDate. Uses only v0–v9 in a controlled sequence (same pattern
 * as the working Boostcamp inject).
 */
internal fun MutableMethod.injectRevenueCatHybridCustomerInfo(
    appName: String,
    primaryEntitlement: String,
    primaryProduct: String,
    entitlementIds: List<String>,
    productIds: List<String>,
    productPlanIdentifier: String? = null
) {
    if (implementation == null) return

    val returnIndex = instructions.indexOfLast { it.opcode.name.startsWith("return-object") }
    if (returnIndex < 0) error("$appName: CustomerInfo mapper return-object not found.")

    val returnRegister = (instructions[returnIndex] as OneRegisterInstruction).registerA
    val entitlements = (listOf(primaryEntitlement) + entitlementIds)
        .distinct()
        .joinToString("\n") { id ->
            """
            const-string v2, "${id.smaliEscaped()}"
            invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            invoke-interface {v7, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            """.trimIndent()
        }
    val products = (listOf(primaryProduct, primaryEntitlement) + productIds + entitlementIds)
        .distinct()
        .joinToString("\n") { productId ->
            """
            const-string v1, "${productId.smaliEscaped()}"
            invoke-interface {v8, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
            """.trimIndent()
        }

    val planValueSmali = if (productPlanIdentifier != null) {
        """
        const-string v2, "productPlanIdentifier"
        const-string v4, "${productPlanIdentifier.smaliEscaped()}"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        """.trimIndent()
    } else {
        """
        const-string v2, "productPlanIdentifier"
        const/4 v4, 0x0
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        """.trimIndent()
    }

    addInstructions(
        returnIndex,
        """
        move-object v8, v$returnRegister

        new-instance v0, Ljava/util/HashMap;
        invoke-direct {v0, v8}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

        new-instance v1, Ljava/util/HashMap;
        invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

        const-string v2, "identifier"
        const-string v3, "${primaryEntitlement.smaliEscaped()}"
        invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "isActive"
        const/4 v4, 0x1
        invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
        move-result-object v4
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "willRenew"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "periodType"
        const-string v4, "NORMAL"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "latestPurchaseDate"
        const-string v4, "$PURCHASE_DATE"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "latestPurchaseDateMillis"
        const-wide v8, $PURCHASE_DATE_MILLIS
        invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v8
        invoke-interface {v1, v2, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "originalPurchaseDate"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "originalPurchaseDateMillis"
        invoke-interface {v1, v2, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "expirationDate"
        const-string v4, "$EXPIRATION_DATE"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "expirationDateMillis"
        const-wide v8, $EXPIRATION_DATE_MILLIS
        invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v8
        invoke-interface {v1, v2, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "store"
        const-string v4, "PLAY_STORE"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "productIdentifier"
        const-string v4, "${primaryProduct.smaliEscaped()}"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        $planValueSmali

        const-string v2, "isSandbox"
        const/4 v4, 0x0
        invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
        move-result-object v4
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "unsubscribeDetectedAt"
        const/4 v4, 0x0
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "unsubscribeDetectedAtMillis"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "billingIssueDetectedAt"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "billingIssueDetectedAtMillis"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "ownershipType"
        const-string v4, "PURCHASED"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "verification"
        const-string v4, "VERIFIED"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        new-instance v5, Ljava/util/HashMap;
        invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

        new-instance v6, Ljava/util/HashMap;
        invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

        new-instance v7, Ljava/util/HashMap;
        invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

        $entitlements

        const-string v1, "active"
        invoke-interface {v5, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v1, "all"
        invoke-interface {v5, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v1, "verification"
        const-string v2, "VERIFIED"
        invoke-interface {v5, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v1, "entitlements"
        invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v1, "latestExpirationDate"
        const-string v2, "$EXPIRATION_DATE"
        invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v1, "latestExpirationDateMillis"
        const-wide v8, $EXPIRATION_DATE_MILLIS
        invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v8
        invoke-interface {v0, v1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        new-instance v8, Ljava/util/ArrayList;
        invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V
        $products

        const-string v1, "activeSubscriptions"
        invoke-interface {v0, v1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v1, "allPurchasedProductIdentifiers"
        invoke-interface {v0, v1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        move-object v$returnRegister, v0
        """.trimIndent()
    )
}

private fun String.smaliEscaped() = replace("\\", "\\\\").replace("\"", "\\\"")
