package app.template.patches.shared.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// Added 2026-11-08 for the Danish news apps (Nordjyske/Fyens/Stiften/JydskeVestkysten, YouSee,
// Jyllands-Posten; Herning, Information and Weekendavisen were dropped 2026-11-12), whose "Disable
// telemetry" used to set these
// switches with a private AndroidManifest.xml patch. A manifest edit re-encodes the whole resource
// table and renamed case-clashing or duplicated resources to type_0x... names in seven of those
// apps (AGENTS.md rule 12), so the same values are now forced where the SDKs read them.

// Firebase's documented manifest switches (ANALYTICS_DEACTIVATED_KEY lives in
// FirebaseAnalyticsDeactivated.kt) and the library log line that marks the Crashlytics arbiter.
private const val ANALYTICS_COLLECTION_ENABLED_KEY = "firebase_analytics_collection_enabled"
private const val ANALYTICS_ADID_KEY = "google_analytics_adid_collection_enabled"
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"
private const val CRASHLYTICS_ARBITER_LOG = "Crashlytics automatic data collection "
private const val PERFORMANCE_DEACTIVATED_KEY = "firebase_performance_collection_deactivated"
private const val PERFORMANCE_ENABLED_KEY = "firebase_performance_collection_enabled"
private const val SESSIONS_ENABLED_KEY = "firebase_sessions_enabled"

private const val BOOLEAN = "Ljava/lang/Boolean;"

// Every method that holds the key. The measurement SDK reads its flags through one config
// helper, Boolean get(String); R8 may inline the caller (Herning reads the deactivated flag in
// three methods, the unshrunk Google classes in one), so the patch forces every read it finds.
private object SwitchAnalyticsDeactivatedFingerprint : Fingerprint(
    filters = listOf(string(ANALYTICS_DEACTIVATED_KEY)),
)

private object SwitchAnalyticsAdidFingerprint : Fingerprint(
    filters = listOf(string(ANALYTICS_ADID_KEY)),
)

private object SwitchAnalyticsEnabledFingerprint : Fingerprint(
    filters = listOf(string(ANALYTICS_COLLECTION_ENABLED_KEY)),
)

// Crashlytics' DataCollectionArbiter: the class reading the key, or the class holding the log
// line. R8 can split them (Herning keeps the key in FirebaseCrashlytics and the registrar, the log
// in the merged arbiter), and some builds strip the log (YouSee), so both sets are collected.
private object SwitchCrashlyticsKeyFingerprint : Fingerprint(
    filters = listOf(string(CRASHLYTICS_COLLECTION_KEY)),
)

private object SwitchCrashlyticsLogFingerprint : Fingerprint(
    filters = listOf(string(CRASHLYTICS_ARBITER_LOG, StringComparisonType.STARTS_WITH)),
)

// Firebase Sessions' LocalOverrideSettings.sessionEnabled: the manifest value, or null when unset.
private object SwitchSessionsOverrideFingerprint : Fingerprint(
    returnType = BOOLEAN,
    parameters = listOf(),
    filters = listOf(string(SESSIONS_ENABLED_KEY)),
)

private object SwitchSessionsAnyFingerprint : Fingerprint(
    filters = listOf(string(SESSIONS_ENABLED_KEY)),
)

// Firebase Performance's ConfigurationConstants flags: getMetadataFlag() returns the key.
private object SwitchPerformanceDeactivatedFlagFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string(PERFORMANCE_DEACTIVATED_KEY)),
)

private object SwitchPerformanceEnabledFlagFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string(PERFORMANCE_ENABLED_KEY)),
)

private object SwitchPerformanceAnyFingerprint : Fingerprint(
    filters = listOf(string(PERFORMANCE_DEACTIVATED_KEY)),
)

private fun Instruction.string(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.call(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

/** The argument registers of an invoke, in order, or null for other instructions. */
private fun Instruction.arguments(): List<Int>? = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> null
}

private fun MethodReference.key() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun Method.label() = "$definingClass->$name"

/**
 * Applies Firebase's manifest telemetry switches in the bytecode, as the value each SDK reader
 * gets, so no AndroidManifest.xml edit re-encodes the resource table (rule 12). The approach is
 * Truecaller's (Disable telemetry steps 5-7), with library strings and method shape as anchors.
 *
 * Each flag says whether [app] bundles that SDK; there is no silent skip. A present SDK whose
 * reader is missing or ambiguous fails the patch, and an SDK passed as absent that turns up in
 * the dex fails it too, so a stale configuration cannot no-op.
 *
 * - [analytics]: "firebase_analytics_collection_deactivated" reads as TRUE and
 *   "google_analytics_adid_collection_enabled" as FALSE at every Boolean get(String) read.
 *   "firebase_analytics_collection_enabled" = false needs no hook of its own: in every app here the
 *   one method that reads it (the measurement state, zzic.zzC in the unshrunk builds, f59.j in
 *   Herning) checks the deactivated flag first and returns "disabled" (1) before it reaches that
 *   read; the helper checks that order and fails if it changes. The deactivated flag also stops
 *   measurement from starting at all.
 * - [crashlytics]: the arbiter's synchronized isAutomaticDataCollectionEnabled()Z returns false,
 *   which is what "firebase_crashlytics_collection_enabled" = false gives, so no report is sent.
 * - [sessions]: the local override reads Boolean.FALSE, which wins over the remote settings.
 * - [performance]: the ConfigResolver reader that references both the deactivated and the enabled
 *   flag (getIsPerformanceCollectionEnabled with the deactivated check inlined) returns
 *   Boolean.FALSE, the value it returns when "firebase_performance_collection_deactivated" is true.
 */
internal fun BytecodePatchContext.forceFirebaseManifestSwitches(
    app: String,
    analytics: Boolean,
    crashlytics: Boolean,
    sessions: Boolean,
    performance: Boolean,
) {
    fun requireAbsent(sdk: String, fingerprint: Fingerprint) {
        val holder = fingerprint.matchAllOrNull().orEmpty().firstOrNull() ?: return
        throw PatchException("Disable telemetry ($app): $sdk is bundled (${holder.method.label()}) but was configured as absent")
    }

    if (analytics) {
        forceAnalyticsSwitches(app)
    } else {
        requireAbsent("Firebase Analytics", SwitchAnalyticsDeactivatedFingerprint)
        requireAbsent("Firebase Analytics", SwitchAnalyticsAdidFingerprint)
    }
    if (crashlytics) forceCrashlyticsOff(app) else requireAbsent("Crashlytics", SwitchCrashlyticsKeyFingerprint)
    if (sessions) forceSessionsOff(app) else requireAbsent("Firebase Sessions", SwitchSessionsAnyFingerprint)
    if (performance) forcePerformanceOff(app) else requireAbsent("Firebase Performance", SwitchPerformanceAnyFingerprint)
}

private fun BytecodePatchContext.forceAnalyticsSwitches(app: String) {
    val deactivatedReaders = SwitchAnalyticsDeactivatedFingerprint.matchAllOrNull().orEmpty()
    // A dexlib2 Method is a MethodReference, so its key matches the key of a call to it.
    val readerKeys = deactivatedReaders.map { it.method.key() }.toSet()

    // Every collection_enabled read must come after a deactivated check (inlined, or a call to a
    // method that reads the deactivated flag), so forcing deactivated covers it.
    val enabledReaders = SwitchAnalyticsEnabledFingerprint.matchAllOrNull().orEmpty()
    if (enabledReaders.isEmpty()) {
        throw PatchException("Disable telemetry ($app): no \"$ANALYTICS_COLLECTION_ENABLED_KEY\" reader found")
    }
    for (match in enabledReaders) {
        val insns = match.method.implementation!!.instructions.toList()
        val enabledAt = insns.indexOfFirst { it.string() == ANALYTICS_COLLECTION_ENABLED_KEY }
        val checkedFirst = (0 until enabledAt).any { index ->
            insns[index].string() == ANALYTICS_DEACTIVATED_KEY || insns[index].call()?.let { it.key() in readerKeys } == true
        }
        if (!checkedFirst) {
            throw PatchException(
                "Disable telemetry ($app): ${match.method.label()} reads \"$ANALYTICS_COLLECTION_ENABLED_KEY\" " +
                    "without checking \"$ANALYTICS_DEACTIVATED_KEY\" first",
            )
        }
    }

    forceConfigReads(app, deactivatedReaders.map { it.method }, ANALYTICS_DEACTIVATED_KEY, "TRUE")
    forceConfigReads(app, SwitchAnalyticsAdidFingerprint.matchAllOrNull().orEmpty().map { it.method }, ANALYTICS_ADID_KEY, "FALSE")
}

/**
 * In each of [methods], every const-string [key] must be the argument of a Boolean get(String)
 * call whose move-result-object is then overwritten with Boolean.[value]. Any other use of the
 * key, a branch target inside the read, or no read at all fails the patch.
 */
private fun forceConfigReads(app: String, methods: List<MutableMethod>, key: String, value: String) {
    var forced = 0
    for (method in methods) {
        val where = method.label()
        val insns = method.implementation!!.instructions.toList()
        val results = insns.indices.filter { insns[it].string() == key }.map { at ->
            val register = (insns[at] as OneRegisterInstruction).registerA
            // The first instruction after the const-string that uses or replaces the register.
            val use = (at + 1 until insns.size).firstOrNull { index ->
                insns[index].arguments()?.contains(register) == true ||
                    (insns[index].opcode.setsRegister() && (insns[index] as? OneRegisterInstruction)?.registerA == register)
            } ?: throw PatchException("Disable telemetry ($app): $where never uses \"$key\"")
            val call = insns[use].call()
            val arguments = insns[use].arguments().orEmpty()
            val isStatic = insns[use].opcode == Opcode.INVOKE_STATIC || insns[use].opcode == Opcode.INVOKE_STATIC_RANGE
            if (call == null || call.returnType != BOOLEAN ||
                call.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/String;") ||
                arguments.size != (if (isStatic) 1 else 2) || arguments.last() != register
            ) {
                throw PatchException("Disable telemetry ($app): $where uses \"$key\" outside a Boolean get(String) read")
            }
            if ((at + 1..use).any { insns[it].location.labels.isNotEmpty() }) {
                throw PatchException("Disable telemetry ($app): $where has a branch target between \"$key\" and its read")
            }
            if (insns.getOrNull(use + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("Disable telemetry ($app): $where does not keep the \"$key\" value")
            }
            use + 1
        }
        // From the last read backwards, so the earlier indices stay valid.
        for (result in results.sortedDescending()) {
            method.requireNoBranchTargetAt(result + 1, "the \"$key\" overwrite")
            method.addInstructionChecked(
                result + 1,
                "sget-object v${(insns[result] as OneRegisterInstruction).registerA}, " +
                    "Ljava/lang/Boolean;->$value:Ljava/lang/Boolean;",
            )
            forced++
        }
    }
    if (forced == 0) throw PatchException("Disable telemetry ($app): no \"$key\" read found")
}

private fun BytecodePatchContext.forceCrashlyticsOff(app: String) {
    val keyHolders = SwitchCrashlyticsKeyFingerprint.matchAllOrNull().orEmpty()
    if (keyHolders.isEmpty()) {
        throw PatchException("Disable telemetry ($app): no \"$CRASHLYTICS_COLLECTION_KEY\" reader found")
    }
    val classes = (keyHolders + SwitchCrashlyticsLogFingerprint.matchAllOrNull().orEmpty())
        .map { it.classDef.type }
        .distinct()
    // isAutomaticDataCollectionEnabled is the arbiter's only synchronized no-arg boolean method.
    val getters = classes.flatMap { type ->
        mutableClassDefBy(type).methods.filter { method ->
            AccessFlags.DECLARED_SYNCHRONIZED.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "Z" && method.parameterTypes.isEmpty() && method.implementation != null
        }
    }
    if (getters.size != 1) {
        throw PatchException(
            "Disable telemetry ($app): expected one Crashlytics data collection getter in $classes, found " +
                getters.map { it.label() },
        )
    }
    getters.single().returnEarly(false)
}

private fun BytecodePatchContext.forceSessionsOff(app: String) {
    val overrides = SwitchSessionsOverrideFingerprint.matchAllOrNull().orEmpty()
    if (overrides.size != 1) {
        throw PatchException(
            "Disable telemetry ($app): expected one \"$SESSIONS_ENABLED_KEY\" override, found ${overrides.map { it.method.label() }}",
        )
    }
    overrides.single().method.addInstructionsChecked(
        0,
        """
            sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            return-object v0
        """,
    )
}

/** The type of the single ConfigurationConstants flag whose getMetadataFlag() returns [key]. */
private fun BytecodePatchContext.performanceFlag(app: String, fingerprint: Fingerprint, key: String): String {
    val flags = fingerprint.matchAllOrNull().orEmpty().filter { match ->
        val insns = match.method.implementation!!.instructions.toList()
        insns.size == 2 && insns[0].string() == key && insns[1].opcode == Opcode.RETURN_OBJECT
    }
    if (flags.size != 1) {
        throw PatchException("Disable telemetry ($app): expected one \"$key\" flag class, found ${flags.map { it.classDef.type }}")
    }
    return flags.single().classDef.type
}

private fun Method.references(type: String) = implementation?.instructions?.any { insn ->
    when (val reference = (insn as? ReferenceInstruction)?.reference) {
        is TypeReference -> reference.type == type
        is FieldReference -> reference.definingClass == type
        is MethodReference -> reference.definingClass == type
        else -> false
    }
} == true

private fun BytecodePatchContext.forcePerformanceOff(app: String) {
    val deactivated = performanceFlag(app, SwitchPerformanceDeactivatedFlagFingerprint, PERFORMANCE_DEACTIVATED_KEY)
    val enabled = performanceFlag(app, SwitchPerformanceEnabledFlagFingerprint, PERFORMANCE_ENABLED_KEY)
    val readers = Fingerprint(
        returnType = BOOLEAN,
        parameters = listOf(),
        custom = { method, _ -> method.references(deactivated) && method.references(enabled) },
    ).matchAllOrNull().orEmpty()
    if (readers.size != 1) {
        throw PatchException(
            "Disable telemetry ($app): expected one Performance collection reader using $deactivated and $enabled, " +
                "found ${readers.map { it.method.label() }}",
        )
    }
    readers.single().method.addInstructionsChecked(
        0,
        """
            sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            return-object v0
        """,
    )
}
