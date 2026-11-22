package app.morphe.patches.kim

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.util.ReferenceUtil

/**
 * The subscription fetch (byd/le.i0 in 1.0.2789, see docs/entitlement-check.md):
 * `i0(VehicleIdentity, String token, boolean force): EntitlementRecord`. It GETs
 * `.../vehicles/<id>/entitlement.json`, stores the parsed record in a static field, saves it and
 * tells Dart. Both strings below sit only in this method.
 */
private object EntitlementFetchFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "L",
    parameters = listOf("L", "Ljava/lang/String;", "Z"),
    strings = listOf("/entitlement.json", "VehicleLocationSync entitlement plan="),
)

/**
 * The answer every check stores instead of asking the server. It has the same shape as the
 * server's `vehicles/<id>/entitlement.json` record, and is read by the app's own parser
 * (byd/t8.t in 1.0.2789). **Keep it a free plan**: this patch only exists to stop the server
 * check, not to grant a plan.
 *
 * ## Fields (the parser reads these four; any other key is ignored)
 *
 * | Field | Type | Missing means | This patch |
 * |---|---|---|---|
 * | `plan` | string | `"free"` | `"free"` |
 * | `status` | string | `"disabled"` | `"disabled"` |
 * | `expiresAt` | number, milliseconds since 1970-01-01 UTC | `0` | `0` |
 * | `paidUntil` | number, milliseconds since 1970-01-01 UTC | `0` | `0` |
 *
 * ### `plan` (text is lower-cased first, so `"Paid"` equals `"paid"`)
 * - `"trial"`: the app treats the car as being on a trial. Also sets the Dart flag `entitlementTrial`.
 * - `"paid"`: the app treats the car as a paid subscriber. Also sets `entitlementPaid`.
 * - `"free"`: no subscription. This is the default when the field is missing.
 * - Any other text (`"basic"`, `""`, ...): accepted and stored as-is, but treated exactly like
 *   `"free"`. Only `trial` and `paid` ever count as subscribed.
 * - The full list of plan names the server really uses is unknown: the app only tests for the two above.
 *
 * ### `status` (also lower-cased)
 * - `"active"`: the only value that counts. Needed for any subscribed result.
 * - `"disabled"`: default when missing. Not subscribed.
 * - Any other text (`"expired"`, `"suspended"`, `"cancelled"`, ...): accepted and stored, but
 *   treated like `"disabled"`: the app gives these no special meaning. The names the server
 *   really uses are unknown.
 *
 * ### `expiresAt` and `paidUntil` (milliseconds since 1970, e.g. 1800000000000 = Jan 2027)
 * - The app uses the larger of the two: `expiresAtMs = max(expiresAt, paidUntil)`.
 * - Subscribed only while that time is still in the future. `0`, a negative number or a past
 *   time counts as already ended ("Entitlement expired"). Dart receives `0` as `null` (no date).
 * - Why two fields: the server can give a Trial end (`expiresAt`) and a paid end (`paidUntil`)
 *   separately; the later one wins.
 * - A number given as text (`"1800000000000"`) is also read as a number; unreadable text counts as `0`.
 *
 * ## What the app does with the result
 * Subscribed = `plan` is `trial` or `paid`, AND `status` is `active`, AND `expiresAt`/`paidUntil`
 * is in the future, AND the record was fetched less than 7 days ago. For this patch the first
 * condition fails, so the result is always "not subscribed" (reason shown: "Plan is not active").
 *
 * The parser also adds two values that are not in the JSON: `fetchedAt` = the time of the call
 * and `lastError` = none. Dart is then sent these keys: `entitlementPlan`, `entitlementStatus`,
 * `entitlementExpiresAt`, `entitlementFetchedAt`, `entitlementActive`, `entitlementTrial`,
 * `entitlementPaid`, `entitlementGrace` (active but last checked over 15 minutes ago) and
 * `entitlementError`. Dart also has `entitlementEligible` and `remoteTrial`/`remotePaid`/
 * `remoteExpired`/`remoteActive`: how those are derived is unknown (that code is in the Dart snapshot).
 */
// FREE_PLAN_JSON is generated at build time from KIM_PLAN_JSON (env or .env), see patches/build.gradle.kts.

@Suppress("unused")
val alwaysFreePlanPatch = bytecodePatch(
    name = "Always free plan (skip subscription check)",
    description = "Stops Kim Launcher asking its server about the subscription: every check " +
        "immediately stores and returns the free plan. Paid (Trial/PRO) features stay locked, " +
        "even if the car has a subscription.",
    default = true,
) {
    compatibleWith(compatibility)

    execute {
        val fetch = EntitlementFetchFingerprint.method
        val owner = fetch.definingClass
        val record = fetch.returnType
        val vehicleType = fetch.parameterTypes[0].toString()
        val code = fetch.implementation!!.instructions.toList()

        fun fail(what: String): Nothing =
            throw PatchException("Unrecognized subscription fetch layout: $what; method=$fetch")

        // Every name below is read from the fetch method's own instructions, so renamed (obfuscated) classes
        // in a later app version don't matter.
        fun methods(opcode: Opcode, keep: (MethodReference) -> Boolean) = code
            .filter { it.opcode == opcode }
            .mapNotNull { it.getReference<MethodReference>() }
            .filter(keep)
            .map { ReferenceUtil.getMethodDescriptor(it) }
            .distinct()

        fun fields(opcode: Opcode, keep: (FieldReference) -> Boolean) = code
            .filter { it.opcode == opcode }
            .mapNotNull { it.getReference<FieldReference>() }
            .filter(keep)
            .map { ReferenceUtil.getFieldDescriptor(it) }
            .distinct()

        // parse(vehicleId, json, nowMs): the server JSON -> record (plan, status, expiresAt/paidUntil).
        val parse = methods(Opcode.INVOKE_STATIC) {
            it.returnType == record &&
                it.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/String;", "Lorg/json/JSONObject;", "J")
        }.singleOrNull() ?: fail("missing unique record parser")

        // The in-memory current record, saved-to-preferences call and Dart notification.
        val currentRecord = fields(Opcode.SPUT_OBJECT) {
            it.definingClass == owner && it.type == record
        }.singleOrNull() ?: fail("missing unique current-record field")
        val save = methods(Opcode.INVOKE_STATIC) {
            it.definingClass == owner && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf(record)
        }.singleOrNull() ?: fail("missing unique save call")
        val notify = methods(Opcode.INVOKE_STATIC) {
            it.definingClass == owner && it.returnType == "V" && it.parameterTypes.isEmpty()
        }.singleOrNull() ?: fail("missing unique notify call")

        // The vehicle id: the one String field the fetch reads from its first parameter.
        val vehicleId = fields(Opcode.IGET_OBJECT) {
            it.definingClass == vehicleType && it.type == "Ljava/lang/String;"
        }.singleOrNull() ?: fail("missing unique vehicle id field")

        // Same ending as the original success path (store, save, notify, return), minus the
        // request: v0/v1 = now, v2 = vehicle id, v3 = the fixed free-plan JSON object (v4 holds
        // its text). it has 11+ locals, so v0..v4 are free. p0 is copied with move-object/from16
        // first: in 1.0.2789 i0 has 17 locals, so p0 is v17 and iget-object can't address it.
        val freePlanJson = FREE_PLAN_JSON.replace("\"", "\\\"")
        fetch.addInstructions(
            0,
            """
                invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
                move-result-wide v0
                move-object/from16 v2, p0
                iget-object v2, v2, $vehicleId
                new-instance v3, Lorg/json/JSONObject;
                const-string v4, "$freePlanJson"
                invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
                invoke-static {v2, v3, v0, v1}, $parse
                move-result-object v0
                sput-object v0, $currentRecord
                invoke-static {v0}, $save
                invoke-static {}, $notify
                return-object v0
            """,
        )
    }
}
