package arpit.morphe.patches.bestronger.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches the `CustomerInfo -> java.util.Map` converter behind the React Native
 * bridge.
 *
 * **This anchor is version-pinned to BeStronger 7.6.9 and must be re-derived on
 * every app update.** RevenueCat's core is R8-renamed in this build, so the
 * class and method names are meaningless (`LC6/e;` is a companion object of the
 * obfuscated mapper bundle, `K` is the converter and `Ldc/v;` is the renamed
 * `CustomerInfo`). They are accepted here only because the fingerprint is
 * declared for exactly one version and is validated by the filters below.
 *
 * The method is the single `CustomerInfo -> Map` converter invoked through
 * `Pc/c` -> `C6/e.L(dc/v, nf/c)`; the result is handed to
 * `Tf/j.t(Map)` -> `WritableNativeMap` and resolved on the RN bridge. Injecting
 * into the returned `java.util.Map` therefore reuses RevenueCat's own,
 * correctly-threaded bridge conversion instead of building native maps on the
 * native modules thread (which never returned on device).
 *
 * Verified against `smali/classes/C6/e.smali:439`:
 *
 * ```
 * .method public static final K(Ldc/v;)Ljava/util/Map;
 *     .registers 64
 *     …
 *     invoke-static {v0}, Laf/B;->a0([LZe/j;)Ljava/util/Map;
 *     move-result-object v0
 *     return-object v0
 * .end method
 * ```
 *
 * Exactly one method in the 7.6.9 smali tree matches the defining class, name,
 * parameters, return type and exact access flags. The ordered string filters
 * (`entitlements` at line 615, `originalAppUserId` at line 743) pin the body to
 * the `CustomerInfo` map builder.
 */
object CustomerInfoMapFingerprint : Fingerprint(
    definingClass = "LC6/e;",
    name = "K",
    returnType = "Ljava/util/Map;",
    parameters = listOf("Ldc/v;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    filters = listOf(
        string("entitlements"),
        string("originalAppUserId"),
    ),
)

/**
 * Matches the RN bridge method behind `Purchases.syncPurchases()`.
 *
 * The JavaScript `fetchPremiumProductId` calls this once per install between two
 * `getCustomerInfo()` reads (gated on the `rc_legacy_purchases_synced` MMKV
 * flag). On a re-signed build Play Billing may be unavailable, and a rejection
 * here rejects the whole premium check before the second `getCustomerInfo()`.
 * Verified against
 * `smali/classes/com/revenuecat/purchases/react/RNPurchasesModule.smali:18994`:
 *
 * ```
 * .method public syncPurchases()V
 *     .registers 3
 *     .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
 *     …
 * ```
 *
 * The method is public with no parameters, so its access flags are exactly
 * `PUBLIC` — `FINAL` is not present in the smali and must not be listed.
 */
object RNPurchasesSyncPurchasesFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/react/RNPurchasesModule;",
    name = "syncPurchases",
    returnType = "V",
    parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC),
)
