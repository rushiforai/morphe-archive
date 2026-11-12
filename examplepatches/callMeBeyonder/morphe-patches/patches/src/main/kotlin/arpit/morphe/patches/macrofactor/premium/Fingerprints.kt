package arpit.morphe.patches.macrofactor.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches RevenueCat's
 * `CustomerInfoFactory.buildCustomerInfo(JSONObject, Date, VerificationResult, CustomerInfoOriginalSource, Z)`.
 *
 * This 5-arg overload is the single JDK-side constructor of every `CustomerInfo`:
 * the 1-arg HTTP overload and the `$default` bridge both funnel into it, so one
 * injection here intercepts the online, offline-entitlement and cached
 * (SharedPreferences) parse paths.
 *
 * Verified against `smali/classes8/com/revenuecat/purchases/common/CustomerInfoFactory.smali`
 * (method at line 370, `.registers 20`, `public final` instance method). Instruction
 * order of the filters (smali lines): `subscriber` 395, `JSONObject.getJSONObject` 397,
 * `non_subscriptions` 402, `subscriptions` 463, `entitlements` 490.
 *
 * RevenueCat SDK class/method names and JSON keys are never obfuscated, so this
 * survives app updates.
 *
 * Shared with MacroFactor (`com.sbs.diet`), which ships the same RevenueCat build:
 * re-verified unchanged in 5.8.11 (method at line 376 of
 * `smali/classes6/com/revenuecat/purchases/common/CustomerInfoFactory.smali`,
 * same `.registers 20` and same filter order).
 */
object BuildCustomerInfoFingerprint : Fingerprint(
    // Class match by suffix; ENDS_WITH semantics.
    definingClass = "/CustomerInfoFactory;",
    name = "buildCustomerInfo",
    // Exact smali bitmask: `public final`, instance method (no static).
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/revenuecat/purchases/CustomerInfo;",
    parameters = listOf(
        "Lorg/json/JSONObject;",
        "Ljava/util/Date;",
        "Lcom/revenuecat/purchases/VerificationResult;",
        "Lcom/revenuecat/purchases/CustomerInfoOriginalSource;",
        "Z",
    ),
    // Filter order matches the smali instruction order exactly.
    filters = listOf(
        string("subscriber"),
        methodCall(definingClass = "Lorg/json/JSONObject;", name = "getJSONObject"),
        string("non_subscriptions"),
        string("subscriptions"),
        string("entitlements"),
    ),
)
