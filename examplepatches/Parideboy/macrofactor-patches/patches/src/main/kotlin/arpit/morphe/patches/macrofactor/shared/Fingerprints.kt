package arpit.morphe.patches.macrofactor.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val CUSTOMER_INFO_KEYS = listOf("subscriber", "non_subscriptions", "subscriptions", "entitlements")

private fun Method.referencesString(value: String) =
    implementation?.instructions?.any { insn ->
        insn.opcode.let { it == Opcode.CONST_STRING || it == Opcode.CONST_STRING_JUMBO } &&
            (insn as ReferenceInstruction).reference.let { it is StringReference && it.string == value }
    } == true

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
 * Shared by both apps: MacroFactor Workouts (`com.sbs.train`) and MacroFactor
 * (`com.sbs.diet`), which ship the same RevenueCat build — re-verified unchanged in
 * 5.8.11 (method at line 376 of
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

/**
 * Matches the same RevenueCat
 * `CustomerInfoFactory.buildCustomerInfo(...)` overload by signature shape instead of by name.
 *
 * MacroFactor 5.8.13 (versionCode 893) switched R8 to whole-dex class renaming: RevenueCat's own
 * classes (`CustomerInfoFactory`, `VerificationResult`, `CustomerInfo`) and GMS utilities lost their
 * names, so the name-based [BuildCustomerInfoFingerprint] cannot run there. What survives is the
 * method shape — the two framework parameters, the trailing boolean, the arity — plus the JSON
 * keys the method reads.
 *
 * Verified against 5.8.13 `smali/sob.smali`:
 * `public static b(Lorg/json/JSONObject;Ljava/util/Date;Lw39;Lvo1;Z)Lmo1;`, `.locals 17`,
 * the only method in the app whose parameters start with `(JSONObject, Date)` and that references
 * all of `subscriber` / `non_subscriptions` / `subscriptions` / `entitlements`.
 */
object BuildCustomerInfoShapeFingerprint : Fingerprint(
    custom = { method, _ ->
        method.parameterTypes.let { params ->
            params.size == 5 &&
                params[0] == "Lorg/json/JSONObject;" &&
                params[1] == "Ljava/util/Date;" &&
                params[4] == "Z"
        } && CUSTOMER_INFO_KEYS.all { method.referencesString(it) }
    },
)

/**
 * Matches GMS's `AndroidUtilsLight.getPackageCertificateHashBytes(Context, String)` by shape.
 *
 * 5.8.13 renamed `AndroidUtilsLight` and the `Wrappers`/`PackageManagerWrapper` helpers, so the
 * spoof patch cannot fingerprint them by name. The shape is: a static `[B` method taking a
 * `Context` and a package name, which reads `PackageInfo.signatures` and digests it as `"SHA1"`.
 *
 * Verified against 5.8.13 `smali/y6b.smali`: `public static a(Landroid/content/Context;Ljava/lang/String;)[B`,
 * `.locals 4`, the only static `[B` method with that parameter list that references `"SHA1"`.
 */
object GetSignatureHashShapeFingerprint : Fingerprint(
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.returnType == "[B" &&
            method.parameterTypes == listOf("Landroid/content/Context;", "Ljava/lang/String;") &&
            method.referencesString("SHA1") &&
            method.implementation?.instructions?.any { insn ->
                (insn as? ReferenceInstruction)?.reference.let {
                    it is MethodReference &&
                        it.definingClass == "Ljava/security/MessageDigest;" && it.name == "digest"
                }
            } == true
    },
)
