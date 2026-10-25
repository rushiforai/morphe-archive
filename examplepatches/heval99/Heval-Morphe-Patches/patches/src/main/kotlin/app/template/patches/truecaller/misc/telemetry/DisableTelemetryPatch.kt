package app.template.patches.truecaller.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val CLEVERTAP_PUSH_OVERLOADS = setOf(
    listOf("Ljava/lang/String;"),
    listOf("Ljava/lang/String;", "Ljava/util/Map;"),
)

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** The argument registers of an invoke, in order, or null for other instructions. */
private fun Instruction.arguments(): List<Int>? = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> null
}

/**
 * In every method [fingerprint] matches (outside [skipPrefix]), finds each const-string [key] whose
 * register is next used by a call [isRead] accepts as the key argument at [keyArgument], and
 * overwrites the call's result right after its move-result with [force] (given the result
 * register). Returns how many reads were forced. Straight-line code only: a branch target between
 * the key and the call, or right after the move-result, fails the patch.
 */
private fun BytecodePatchContext.forceReadsOf(
    fingerprint: Fingerprint,
    key: String,
    keyArgument: Int,
    moveResult: Opcode,
    isRead: (MethodReference) -> Boolean,
    skipPrefix: String? = null,
    force: (Int) -> String,
): Int {
    var forced = 0
    for (match in fingerprint.matchAllOrNull().orEmpty()) {
        if (skipPrefix != null && match.classDef.type.startsWith(skipPrefix)) continue
        val method = match.method
        val label = "${match.classDef.type}->${method.name}"
        val insns = method.implementation!!.instructions.toList()
        val reads = insns.indices.filter { insns[it].string() == key }.mapNotNull { constString ->
            val register = (insns[constString] as OneRegisterInstruction).registerA
            // The first instruction after the const-string that uses or replaces the register.
            val use = (constString + 1 until insns.size).firstOrNull { index ->
                insns[index].arguments()?.contains(register) == true ||
                    (insns[index].opcode.setsRegister() && (insns[index] as? OneRegisterInstruction)?.registerA == register)
            } ?: return@mapNotNull null
            val call = insns[use].call()
            if (call == null || !isRead(call) || insns[use].arguments()?.getOrNull(keyArgument) != register) {
                return@mapNotNull null // Not a read of the key (a writer, a key list, ...).
            }
            if ((constString + 1..use).any { insns[it].location.labels.isNotEmpty() }) {
                throw PatchException("Disable telemetry: $label has a branch target between \"$key\" and its read")
            }
            if (insns.getOrNull(use + 1)?.opcode != moveResult) {
                throw PatchException("Disable telemetry: $label does not keep the \"$key\" value")
            }
            use + 1
        }
        // From the last read backwards, so the earlier indices stay valid.
        for (result in reads.sortedDescending()) {
            if (insns.getOrNull(result + 1)?.location?.labels?.isNotEmpty() != false) {
                throw PatchException("Disable telemetry: the \"$key\" read in $label is followed by a branch target")
            }
            method.addInstructionChecked(result + 1, force((insns[result] as OneRegisterInstruction).registerA))
            forced++
        }
    }
    if (forced == 0) throw PatchException("Disable telemetry: no \"$key\" read found")
    return forced
}

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics, tracking and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // 1. App start tracker.
        AppStartTrackerEnableTrackingFingerprint.method.returnEarly()

        // Collect first: mutating classes while iterating them is not allowed.
        val cleverTapManagers = mutableListOf<ClassDef>()
        val appsFlyerImplementations = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (CLEVERTAP_MANAGER in classDef.interfaces) cleverTapManagers += classDef
            if (classDef.superclass == APPSFLYER_LIB) appsFlyerImplementations += classDef
        }

        // 2. CleverTap: both event push overloads of every CleverTapManager implementation.
        // Profile updates and push registration are left alone.
        if (cleverTapManagers.isEmpty()) throw PatchException("No $CLEVERTAP_MANAGER implementation found")
        for (classDef in cleverTapManagers) {
            val pushes = mutableClassDefBy(classDef).methods.filter { method ->
                method.name == "push" && method.returnType == "V" && method.implementation != null &&
                    method.parameterTypes.map(CharSequence::toString) in CLEVERTAP_PUSH_OVERLOADS
            }
            if (pushes.size != CLEVERTAP_PUSH_OVERLOADS.size) {
                throw PatchException("${classDef.type} implements ${pushes.size} of the CleverTap push overloads")
            }
            pushes.forEach { it.returnEarly() }
        }

        // 3. AppsFlyer: every concrete start(Context, ...) overload, so the SDK never starts
        // sending. The abstract AppsFlyerLib declarations have no body and are skipped.
        if (appsFlyerImplementations.isEmpty()) throw PatchException("No $APPSFLYER_LIB subclass found")
        for (classDef in appsFlyerImplementations) {
            val starts = mutableClassDefBy(classDef).methods.filter { method ->
                method.name == "start" && method.returnType == "V" && method.implementation != null &&
                    method.parameterTypes.firstOrNull()?.toString() == "Landroid/content/Context;"
            }
            if (starts.none { it.parameterTypes.size == 1 }) {
                throw PatchException("${classDef.type} has no concrete start(Context)")
            }
            starts.forEach { it.returnEarly() }
        }

        // 4. CleverTap's master pref "featureCleverTap" reads as false at every getBoolean read:
        // the SDK init and its second gate skip CleverTap, the CRM push handler drops CleverTap
        // ("wzrk_") pushes, and the CleverTapRefreshWorkAction does nothing. The result register
        // is zeroed right after its move-result. Reads in the QA menu are left alone.
        forceReadsOf(
            CleverTapFeatureReadFingerprint,
            CLEVERTAP_FEATURE_KEY,
            keyArgument = 1, // getBoolean(key, default) on the prefs instance
            moveResult = Opcode.MOVE_RESULT,
            isRead = { it.definingClass == "Landroid/content/SharedPreferences;" && it.name == "getBoolean" },
            skipPrefix = QA_PACKAGE_PREFIX,
        ) { register -> if (register < 16) "const/4 v$register, 0x0" else "const/16 v$register, 0x0" }

        // The Firebase switches below are applied in the bytecode, as the value each reader gets
        // from the manifest, rather than in AndroidManifest.xml, so this patch needs no resource
        // patch: a manifest edit re-encodes the whole resource table, which strips the quotes of
        // five strings and renames two case-clashing string entries in 26.40.5 (AGENTS.md rule 12).
        // Builds without GmsCore support then keep the stock resources.

        // 5. Firebase Analytics: the measurement config reads "firebase_analytics_collection_deactivated"
        // as true, so measurement never starts (no automatic first_open / session_start /
        // screen_view events either), and "google_analytics_adid_collection_enabled" as false.
        // Remote Config and FCM do not depend on Analytics.
        val isConfigRead: (MethodReference) -> Boolean = {
            it.returnType == "Ljava/lang/Boolean;" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
        }
        // Instance call: the key follows the config object.
        forceReadsOf(AnalyticsDeactivatedReadFingerprint, ANALYTICS_DEACTIVATED_KEY, 1, Opcode.MOVE_RESULT_OBJECT, isConfigRead) {
            "sget-object v$it, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"
        }
        forceReadsOf(AnalyticsAdidReadFingerprint, ANALYTICS_ADID_KEY, 1, Opcode.MOVE_RESULT_OBJECT, isConfigRead) {
            "sget-object v$it, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"
        }

        // 6. Crashlytics: the data collection arbiter reports automatic collection as off, the
        // stock manifest's firebase_crashlytics_collection_enabled=true notwithstanding (nothing in
        // the app calls setCrashlyticsCollectionEnabled), so no crash report is sent.
        var collectionGetters = 0
        for (classDef in classDefByStrings(CRASHLYTICS_COLLECTION_KEY)) {
            val arbiter = mutableClassDefBy(classDef)
            val logs = arbiter.methods.any { method ->
                method.implementation?.instructions?.any { it.string() == CRASHLYTICS_ARBITER_LOG } == true
            }
            if (!logs) continue
            arbiter.methods
                .filter { it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null }
                .forEach {
                    it.returnEarly(false)
                    collectionGetters++
                }
        }
        if (collectionGetters == 0) {
            throw PatchException("Disable telemetry: no Crashlytics data collection arbiter getter found")
        }

        // 7. Firebase Sessions: the local (manifest) override reads as disabled, which wins over
        // the remote session settings, so no session events are sent.
        SessionsEnabledOverrideFingerprint.method.addInstructionsChecked(
            0,
            """
                sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object p0
            """,
        )
    }
}
