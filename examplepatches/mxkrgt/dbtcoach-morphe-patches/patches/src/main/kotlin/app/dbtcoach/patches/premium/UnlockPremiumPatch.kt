package app.dbtcoach.patches.premium

import app.dbtcoach.patches.shared.Constants.PACKAGE_DBTCOACH
import app.dbtcoach.patches.shared.Constants.VERSIONS_DBTCOACH
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Patch : Unlock Premium — DBT Coach 6.5.0
 *
 * Flux vérifié dans le bundle 6.5.0 :
 *
 *   initializePremiumContent()
 *     -> fetchPremiumStatus()            // GraphQL getSubscriptionStatus (network-only)
 *     -> si hasAccess !== true :
 *          getPurchases()                // repli local (decompiled650.js:1148213)
 *            -> RNIap.getAvailablePurchases()
 *               -> Nitro "RnIap" -> HybridRnIap.getAvailablePurchases(options)
 *          si purchases.length > 0 -> state.iap.isSubscribed = true (+ HAS_PREMIUM)
 *
 * En 6.5.0, `NitroPurchase` utilise des types `Variant_NullType_*` (55 paramètres) :
 * le construire à la main serait fragile. On construit donc un
 * `dev.hyo.openiap.PurchaseAndroid` (23 paramètres) puis on appelle le
 * convertisseur interne de la bibliothèque :
 *
 *   HybridRnIap.access$convertToNitroPurchase(HybridRnIap, Purchase)
 *
 * Il produit un `NitroPurchase` authentique (wrappers Variant gérés par la
 * bibliothèque), que l'on emballe dans `Promise.Companion.resolved(list)`.
 *
 * Aucun impact sur les achats réels, la restauration ou RevenueCat.
 */

private const val HELPER_NAME = "morphe_unlockPremium_getAvailablePurchases"
private const val HELPER_DESCRIPTOR =
    "$NITRO_IAP_CLASS->$HELPER_NAME($NITRO_IAP_CLASS$OPTIONS_TYPE)$PROMISE_TYPE"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Déverrouille les fonctionnalités premium de DBT Coach en simulant " +
        "un abonnement Google Play actif lors de la lecture des achats natifs.",
) {
    compatibleWith(PACKAGE_DBTCOACH to VERSIONS_DBTCOACH)

    execute {
        val target = GetAvailablePurchasesFingerprint.method
        val classDef = GetAvailablePurchasesFingerprint.classDef

        // 48 registres : 25 mots pour `new PurchaseAndroid(...)` (1 double = 2 mots),
        // plus les registres de travail. p0 = HybridRnIap, p1 = options.
        val helper = ImmutableMethod(
            NITRO_IAP_CLASS,
            HELPER_NAME,
            listOf(
                ImmutableMethodParameter(NITRO_IAP_CLASS, null, null),
                ImmutableMethodParameter(OPTIONS_TYPE, null, null),
            ),
            PROMISE_TYPE,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(48),
        ).toMutable().apply {
            addInstructions(0, FAKE_PURCHASE_SMALI)
        }

        classDef.methods.add(helper)

        // La méthode d'origine délègue à l'aide puis retourne.
        // Le corps d'origine reste après le `return-object` (jamais exécuté).
        target.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, $HELPER_DESCRIPTOR
                move-result-object p0
                return-object p0
            """,
        )
    }
}

/**
 * Construit `Promise.Companion.resolved(listOf(convertToNitroPurchase(fake)))`.
 *
 * Disposition du constructeur `PurchaseAndroid` (23 paramètres / 24 mots),
 * copiée de smali3/dev/hyo/openiap/PurchaseAndroid.smali:214 :
 *
 *   v0        receiver
 *   v1        autoRenewingAndroid            (Boolean, nullable)
 *   v2        currentPlanId                  (String, nullable)
 *   v3        dataAndroid                    (String, nullable)
 *   v4        developerPayloadAndroid        (String, nullable)
 *   v5        id                             (String, NON NUL)
 *   v6        ids                            (List, nullable)
 *   v7        isAcknowledgedAndroid          (Boolean, nullable)
 *   v8        isAutoRenewing                 (Z)
 *   v9        isSuspendedAndroid             (Boolean, nullable)
 *   v10       obfuscatedAccountIdAndroid     (String, nullable)
 *   v11       obfuscatedProfileIdAndroid     (String, nullable)
 *   v12       packageNameAndroid             (String, nullable)
 *   v13       pendingPurchaseUpdateAndroid   (nullable)
 *   v14       productId                      (String, NON NUL)
 *   v15       purchaseState                  (PurchaseState, NON NUL)
 *   v16       purchaseToken                  (String, nullable)
 *   v17       quantity                       (I)
 *   v18       signatureAndroid               (String, nullable)
 *   v19       store                          (IapStore, NON NUL)
 *   v20:v21   transactionDate                (D)
 *   v22       transactionId                  (String, nullable)
 *   v23       userIdAmazon                   (String, nullable)
 *   v24       userMarketplaceAmazon          (String, nullable)
 *
 * Enums OpenIAP (classes5) : `IapStore.Google`, `PurchaseState.Purchased`.
 */
private const val FAKE_PURCHASE_SMALI = """
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v1
    long-to-double v1, v1
    move-wide/from16 v20, v1

    const/4 v1, 0x0
    const/4 v2, 0x0
    const/4 v3, 0x0
    const/4 v4, 0x0
    const-string v5, "dbtcoach.monthly"
    const/4 v6, 0x0
    const/4 v7, 0x0
    const/4 v8, 0x1
    const/4 v9, 0x0
    const/4 v10, 0x0
    const/4 v11, 0x0
    const-string v12, "co.swasth.dbtcoach"
    const/4 v13, 0x0
    const-string v14, "dbtcoach.monthly"
    sget-object v15, Ldev/hyo/openiap/PurchaseState;->Purchased:Ldev/hyo/openiap/PurchaseState;
    const-string v16, "morphe-fake-purchase-token"
    const/16 v17, 0x1
    const/16 v18, 0x0
    sget-object v19, Ldev/hyo/openiap/IapStore;->Google:Ldev/hyo/openiap/IapStore;

    const-string v22, "morphe-fake-transaction-id"
    const/16 v23, 0x0
    const/16 v24, 0x0

    new-instance v0, Ldev/hyo/openiap/PurchaseAndroid;
    invoke-direct/range {v0 .. v24}, Ldev/hyo/openiap/PurchaseAndroid;-><init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;ZLjava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldev/hyo/openiap/PendingPurchaseUpdateAndroid;Ljava/lang/String;Ldev/hyo/openiap/PurchaseState;Ljava/lang/String;ILjava/lang/String;Ldev/hyo/openiap/IapStore;DLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v1, v0
    move-object/from16 v0, p0
    invoke-static { v0, v1 }, Lcom/margelo/nitro/iap/HybridRnIap;->access${'$'}convertToNitroPurchase(Lcom/margelo/nitro/iap/HybridRnIap;Ldev/hyo/openiap/Purchase;)Lcom/margelo/nitro/iap/NitroPurchase;
    move-result-object v1

    const/4 v2, 0x1
    new-array v2, v2, [Lcom/margelo/nitro/iap/NitroPurchase;
    const/4 v3, 0x0
    aput-object v1, v2, v3

    sget-object v4, Lcom/margelo/nitro/core/Promise;->Companion:Lcom/margelo/nitro/core/Promise${'$'}Companion;
    invoke-virtual { v4, v2 }, Lcom/margelo/nitro/core/Promise${'$'}Companion;->resolved(Ljava/lang/Object;)Lcom/margelo/nitro/core/Promise;
    move-result-object v0

    return-object v0
"""
