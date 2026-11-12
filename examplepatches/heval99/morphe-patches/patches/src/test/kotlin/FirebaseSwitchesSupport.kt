import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * Assertions for the shared forceFirebaseManifestSwitches helper (Firebase manifest switches applied
 * in the bytecode). Every target is found the way the patch finds it: by the library's key strings
 * and the reader's method shape, never by an R8 name.
 */

private const val ANALYTICS_DEACTIVATED = "firebase_analytics_collection_deactivated"
private const val ANALYTICS_ADID = "google_analytics_adid_collection_enabled"
private const val CRASHLYTICS_KEY = "firebase_crashlytics_collection_enabled"
private const val CRASHLYTICS_LOG = "Crashlytics automatic data collection "
private const val SESSIONS_KEY = "firebase_sessions_enabled"
private const val PERFORMANCE_DEACTIVATED = "firebase_performance_collection_deactivated"
private const val PERFORMANCE_ENABLED = "firebase_performance_collection_enabled"
private const val BOOLEAN_TYPE = "Ljava/lang/Boolean;"

private fun Instruction.stringValue(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/** Every (class, method) whose body holds a const-string accepted by [matches]. */
private fun List<ClassDef>.holders(matches: (String) -> Boolean): List<Pair<ClassDef, Method>> =
    flatMap { classDef ->
        classDef.methods
            .filter { method -> method.instructions().any { it.stringValue()?.let(matches) == true } }
            .map { classDef to it }
    }

/** The method starts with sget-object Boolean.FALSE and returns that register. */
private fun assertReturnsBooleanFalse(method: Method, label: String) {
    val insns = method.instructions()
    val load = insns.getOrNull(0)
    val field = (load as? ReferenceInstruction)?.reference as? FieldReference
    check(
        load?.opcode == Opcode.SGET_OBJECT && field?.definingClass == BOOLEAN_TYPE && field.name == "FALSE" &&
            insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
            (insns[1] as OneRegisterInstruction).registerA == (load as OneRegisterInstruction).registerA,
    ) { "$label does not return Boolean.FALSE first; got ${insns.take(2).map { it.opcode }}" }
}

/** Every read of [key] keeps its move-result-object only to overwrite it with Boolean.[value]. */
private fun assertConfigReadsForced(classes: List<ClassDef>, key: String, value: String) {
    val readers = classes.holders { it == key }
    check(readers.isNotEmpty()) { "no \"$key\" reader in the emitted dexes" }
    var forced = 0
    for ((_, method) in readers) {
        val insns = method.instructions()
        for (at in insns.indices.filter { insns[it].stringValue() == key }) {
            val result = (at + 1 until insns.size).first { insns[it].opcode == Opcode.MOVE_RESULT_OBJECT }
            val overwrite = insns.getOrNull(result + 1)
            val field = (overwrite as? ReferenceInstruction)?.reference as? FieldReference
            check(
                overwrite?.opcode == Opcode.SGET_OBJECT && field?.definingClass == BOOLEAN_TYPE &&
                    field.name == value &&
                    (overwrite as OneRegisterInstruction).registerA == (insns[result] as OneRegisterInstruction).registerA,
            ) { "${method.definingClass}->${method.name}: the \"$key\" read is not forced to Boolean.$value" }
            forced++
        }
    }
    check(forced >= 1) { "no \"$key\" read was forced" }
}

private fun Method.references(type: String) = instructions().any { insn ->
    when (val reference = (insn as? ReferenceInstruction)?.reference) {
        is TypeReference -> reference.type == type
        is FieldReference -> reference.definingClass == type
        is MethodReference -> reference.definingClass == type
        else -> false
    }
}

/**
 * Asserts each switch the app's Disable telemetry applies through forceFirebaseManifestSwitches,
 * and that an SDK configured as absent really has no key in the emitted dexes.
 */
fun assertFirebaseSwitchesForced(
    classes: List<ClassDef>,
    analytics: Boolean,
    crashlytics: Boolean,
    sessions: Boolean,
    performance: Boolean,
) {
    fun absent(key: String) =
        check(classes.holders { it == key }.isEmpty()) { "\"$key\" is in the dex but its SDK was configured as absent" }

    // Analytics: deactivated reads TRUE, ad ID reads FALSE.
    if (analytics) {
        assertConfigReadsForced(classes, ANALYTICS_DEACTIVATED, "TRUE")
        assertConfigReadsForced(classes, ANALYTICS_ADID, "FALSE")
    } else {
        absent(ANALYTICS_DEACTIVATED)
        absent(ANALYTICS_ADID)
    }

    // Crashlytics: the arbiter's synchronized no-arg boolean getter answers false.
    if (crashlytics) {
        val arbiterTypes = classes.holders { it == CRASHLYTICS_KEY || it.startsWith(CRASHLYTICS_LOG) }
            .map { it.first.type }
            .toSet()
        val getters = classes.filter { it.type in arbiterTypes }.flatMap { classDef ->
            classDef.methods.filter { method ->
                AccessFlags.DECLARED_SYNCHRONIZED.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.returnType == "Z" && method.parameterTypes.isEmpty()
            }
        }
        check(getters.size == 1) { "Crashlytics getters in $arbiterTypes: ${getters.map { it.name }}" }
        assertForcedBoolean(getters.single(), expected = false, label = "Crashlytics data collection getter")
    } else {
        absent(CRASHLYTICS_KEY)
    }

    // Sessions: the local override answers Boolean.FALSE.
    if (sessions) {
        val overrides = classes.holders { it == SESSIONS_KEY }
            .map { it.second }
            .filter { it.returnType == BOOLEAN_TYPE && it.parameterTypes.isEmpty() }
        check(overrides.size == 1) { "Sessions overrides: ${overrides.map { "${it.definingClass}->${it.name}" }}" }
        assertReturnsBooleanFalse(overrides.single(), "Sessions local override")
    } else {
        absent(SESSIONS_KEY)
    }

    // Performance: the collection-enabled reader that consults both flags answers Boolean.FALSE.
    if (performance) {
        fun flagType(key: String): String {
            val flags = classes.holders { it == key }.filter { (_, method) ->
                val insns = method.instructions()
                method.returnType == "Ljava/lang/String;" && insns.size == 2 && insns[1].opcode == Opcode.RETURN_OBJECT
            }
            check(flags.size == 1) { "\"$key\" flag classes: ${flags.map { it.first.type }}" }
            return flags.single().first.type
        }
        val deactivated = flagType(PERFORMANCE_DEACTIVATED)
        val enabled = flagType(PERFORMANCE_ENABLED)
        val readers = classes.flatMap { it.methods }.filter { method ->
            method.returnType == BOOLEAN_TYPE && method.parameterTypes.isEmpty() &&
                method.references(deactivated) && method.references(enabled)
        }
        check(readers.size == 1) { "Performance readers: ${readers.map { "${it.definingClass}->${it.name}" }}" }
        assertReturnsBooleanFalse(readers.single(), "Performance collection reader")
    } else {
        absent(PERFORMANCE_DEACTIVATED)
    }
}
