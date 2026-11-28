package arpit.morphe.patches.bestronger.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import arpit.morphe.patches.bestronger.shared.Constants.COMPATIBILITY_BESTRONGER
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Entitlement identifier configured in the app's RevenueCat dashboard. */
private const val PREMIUM_ENTITLEMENT = "BeStronger Pro"

/**
 * Product identifier of a real annual Pro purchase. It is metadata only: the
 * patch reports the entitlement as active, it does not grant the product.
 * Note the `shavgerfm` spelling — it is the identifier shipped in the app's
 * legacy product array, not a typo.
 */
private const val PREMIUM_PRODUCT = "com.shavgerfm.bestronger.yearpremium"

/** Name of the synthetic helper injected into the obfuscated map converter. */
private const val INJECT_HELPER = "morpheInjectPro"

/**
 * Builds `private static synthetic morpheInjectPro(java.util.Map)` on the
 * obfuscated `CustomerInfo -> Map` converter.
 *
 * The helper only touches `java.util.Map` / `java.util.HashMap`; it does not
 * construct `WritableNativeMap`/`WritableNativeArray`. The map injected here is
 * converted by RevenueCat's own `Tf/j.t(Map)` on its normal bridge path — the
 * v1 failure was building React Native native maps inside
 * `getCustomerInfo(Promise)` on the native modules thread, which never returned.
 *
 * Shape written into `entitlements.active` and `entitlements.all`:
 * `identifier`, `isActive`, `willRenew`, `isSandbox`, `productIdentifier`,
 * `store`, `periodType`, `ownershipType`, `verification`. Date fields are
 * deliberately omitted so a type mismatch cannot break the existing converter.
 *
 * Registers (`.registers 8`, one parameter in `p0`/`v7`):
 * - `v0` = `entitlements` object, then `entitlements` map
 * - `v1` = `active` object, then `active` map when it is a `Map`
 * - `v2` = `all` object, then `all` map when it is a `Map`
 * - `v3` = synthetic entitlement info map
 * - `v4` = `instance-of` result
 * - `v5`/`v6` = key/value scratch
 */
private fun buildInjectProHelper(classType: String): MutableMethod {
    val method = MutableMethod(
        ImmutableMethod(
            classType,
            INJECT_HELPER,
            listOf(ImmutableMethodParameter("Ljava/util/Map;", null, "customerInfo")),
            "V",
            AccessFlags.PRIVATE.value or
                AccessFlags.STATIC.value or
                AccessFlags.SYNTHETIC.value,
            null,
            null,
            MutableMethodImplementation(8),
        )
    )

    method.addInstructions(
        0,
        """
            const-string v0, "entitlements"
            invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0

            instance-of v1, v0, Ljava/util/Map;
            if-eqz v1, :missing

            check-cast v0, Ljava/util/Map;

            const-string v1, "active"
            invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v1

            const-string v2, "all"
            invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v2

            new-instance v3, Ljava/util/HashMap;
            invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

            const-string v5, "identifier"
            const-string v6, "$PREMIUM_ENTITLEMENT"
            invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

            const-string v5, "isActive"
            sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

            const-string v5, "willRenew"
            invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

            const-string v5, "isSandbox"
            sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

            const-string v5, "productIdentifier"
            const-string v6, "$PREMIUM_PRODUCT"
            invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

            const-string v5, "store"
            const-string v6, "PLAY_STORE"
            invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

            const-string v5, "periodType"
            const-string v6, "NORMAL"
            invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

            const-string v5, "ownershipType"
            const-string v6, "PURCHASED"
            invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

            const-string v5, "verification"
            const-string v6, "VERIFIED"
            invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

            instance-of v4, v1, Ljava/util/Map;
            if-eqz v4, :no_active

            check-cast v1, Ljava/util/Map;
            const-string v5, "$PREMIUM_ENTITLEMENT"
            invoke-interface {v1, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

            :no_active
            instance-of v4, v2, Ljava/util/Map;
            if-eqz v4, :no_all

            check-cast v2, Ljava/util/Map;
            const-string v5, "$PREMIUM_ENTITLEMENT"
            invoke-interface {v2, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

            :no_all
            return-void

            :missing
            return-void
        """,
    )

    return method
}

/**
 * Unlocks BeStronger Pro.
 *
 * BeStronger is a React Native app and, on Android, its premium gate is computed
 * exclusively from RevenueCat's `CustomerInfo` (`checkSubscriptionNew` takes the
 * RevenueCat branch when `Platform.OS === "android"` and stores the result in
 * the persisted `iap.buyedItem` Redux flag).
 *
 * The working seam injects into the obfuscated `CustomerInfo -> Map` converter:
 *
 * 1. `morpheInjectPro(Map)` is added to the converter (`C6/e.K`) and called
 *    immediately before its final `return-object`. The converter already builds
 *    the full RN payload; the helper only adds an active `BeStronger Pro` entry
 *    to the `entitlements.active` and `entitlements.all` maps. RevenueCat's own
 *    `Tf/j.t(Map)` then produces the `WritableNativeMap` and the bridge resolves
 *    the Promise exactly as it does for a real entitlement.
 * 2. `syncPurchases()` is no-opped. The JavaScript calls it once per install
 *    between the first and second `getCustomerInfo()`; on a re-signed build Play
 *    Billing can reject the sync, which would otherwise fail the whole premium
 *    check before the second read.
 *
 * `getCustomerInfo(Promise)` is deliberately not patched. An earlier
 * implementation resolved the Promise there with a `WritableNativeMap` built on
 * the native modules thread; on device the map helper never returned and the
 * JavaScript fell through to its Play Billing fallback, so the injection moved to
 * the Java map converter above.
 *
 * Deliberately left alone:
 * - RevenueCat still talks to its API with the real account and the real
 *   server-side entitlement; this patch only changes what the app's JavaScript
 *   trusts.
 * - RevenueCat's native paywall/customer-center screens read the real
 *   `CustomerInfo` directly and are not affected; the app's own screens are.
 * - Play Billing, `getOfferings`, purchase and restore flows are untouched, so
 *   buying under a re-signed key still cannot complete.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock BeStronger Pro",
    description = "Unlocks BeStronger Pro by injecting an active `BeStronger Pro` " +
        "RevenueCat entitlement into the `CustomerInfo` map the React Native bridge " +
        "already builds, and by no-opping the legacy purchase sync that can fail on a " +
        "re-signed build. RevenueCat's native paywall UI and the account's real " +
        "server-side entitlement are left untouched.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BESTRONGER)

    execute {
        val converterClass = CustomerInfoMapFingerprint.classDef
        val mapBuilder = CustomerInfoMapFingerprint.method
        val builderInstructions = mapBuilder.instructions

        // `K` must end with `return-object v0`, where `v0` is the finished
        // `java.util.Map` from `Laf/B;->a0([LZe/j;)Ljava/util/Map;`. Require the
        // exact shape instead of trusting an index that shifts between builds.
        val returnIndices = builderInstructions
            .withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        check(returnIndices.size == 1) {
            "CustomerInfo map converter has ${returnIndices.size} return-object " +
                "instructions; expected exactly one (version-pinned 7.6.9 patch)."
        }
        val returnIndex = returnIndices.single().index
        check(returnIndex == builderInstructions.lastIndex) {
            "CustomerInfo map converter's return-object is at instruction $returnIndex, " +
                "not at the end of the method (version-pinned 7.6.9 patch)."
        }
        val returnRegister =
            mapBuilder.getInstruction<OneRegisterInstruction>(returnIndex).registerA
        check(returnRegister == 0) {
            "CustomerInfo map converter returns v$returnRegister; expected v0 " +
                "(version-pinned 7.6.9 patch)."
        }

        converterClass.methods.add(buildInjectProHelper(converterClass.type))

        mapBuilder.addInstructions(
            returnIndex,
            "invoke-static {v0}, ${converterClass.type}->$INJECT_HELPER(Ljava/util/Map;)V",
        )

        // `syncPurchases()` is `public` with no parameters; a bare `return-void`
        // keeps the JS `await Purchases.syncPurchases()` resolving immediately.
        RNPurchasesSyncPurchasesFingerprint.method.addInstructions(0, "return-void")
    }
}
