import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.viaplay.android"
private const val ANALYTICS_DEACTIVATED_KEY = "firebase_analytics_collection_deactivated"
private const val VP_TRACKING_EVENT = "Lcom/viaplay/tracking/data/VPTrackingEvent;"
private const val VP_BASE_DATA = "Lcom/viaplay/tracking/network/model/BaseData;"
private const val EXO_TOOLS = "Lcom/viaplay/android/player/players/exo/tools/"

class ViaplaySmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.label() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    private fun Method.params() = parameterTypes.map(CharSequence::toString)
    private fun Method.strings() = instructions().mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }
    private fun Method.calls(definingClass: String, name: String? = null) = instructions().any {
        it.methodRef()?.let { r -> r.definingClass == definingClass && (name == null || r.name == name) } == true
    }
    private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun List<Method>.single(what: String, predicate: (Method) -> Boolean): Method {
        val found = filter(predicate)
        assertEquals(1, found.size, "$what: ${found.map { it.label() }}")
        return found.single()
    }

    // The SSAI source's onChildSourceInfoRefreshed with the app's updater inlined, found like the
    // patch: a (X, Timeline)V that calls the exo/tools period check (Timeline, int)Z and holds a
    // Set.contains + move-result guard (the patched method has the inserted reads before its if-eqz).
    private fun List<ClassDef>.ssaiSourceInfoRefreshers() = flatMap { it.methods }.filter { m ->
        m.returnType == "V" && m.params().size == 2 && m.implementation != null && m.instructions().let { insns ->
            insns.any {
                it.methodRef()?.let { r ->
                    r.definingClass.startsWith(EXO_TOOLS) && r.returnType == "Z" &&
                        r.parameterTypes.map(CharSequence::toString) == listOf(m.params()[1], "I")
                } == true
            } && insns.indices.any { i ->
                insns[i].methodRef()?.let { it.definingClass == "Ljava/util/Set;" && it.name == "contains" } == true &&
                    insns.getOrNull(i + 1)?.opcode == Opcode.MOVE_RESULT
            }
        }
    }

    @Test
    fun `Viaplay patches disable telemetry and skip VOD ad breaks`() {
        val root = repoRoot()
        val apk = File(root, "apks/viaplay/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "26.44.0",
            patchNames = setOf("Disable telemetry", "Skip ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"
        val methods = classes.flatMap { it.methods }
        val stockClasses = patchedApkClasses(apk)

        // --- Disable telemetry ---

        // 1. Crashlytics: the data-collection gate answers false.
        val crashlytics = methods.single("Crashlytics data-collection gates") {
            it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                it.strings().containsAll(
                    listOf("Crashlytics automatic data collection ", "firebase_crashlytics_collection_enabled manifest flag"),
                )
        }
        assertForcedBoolean(crashlytics, false, "Crashlytics gate ${crashlytics.label()}", diagnostics)

        // 2. Firebase Performance: the monitoring check answers false.
        val perf = methods.single("Firebase Performance monitoring checks") {
            it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                it.strings().containsAll(listOf("fpr_enabled", "com.google.firebase.perf.SdkEnabled"))
        }
        assertForcedBoolean(perf, false, "Firebase Performance ${perf.label()}", diagnostics)

        // 3. Firebase Analytics: the single deactivated-flag read is overwritten with Boolean.TRUE
        // right after its move-result.
        val reader = methods.single("$ANALYTICS_DEACTIVATED_KEY readers") { ANALYTICS_DEACTIVATED_KEY in it.strings() }
        val readInsns = reader.instructions()
        val keyIndex = readInsns.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == ANALYTICS_DEACTIVATED_KEY
        }
        val keyRegister = (readInsns[keyIndex] as OneRegisterInstruction).registerA
        val read = readInsns[keyIndex + 1]
        assertTrue(
            read is FiveRegisterInstruction && read.registerCount == 2 && read.registerD == keyRegister &&
                read.methodRef()?.returnType == "Ljava/lang/Boolean;",
            "${reader.label()}: the key is not read through a Boolean get(String); got ${read.opcode} ${read.methodRef()}",
        )
        val move = readInsns[keyIndex + 2]
        val forced = readInsns[keyIndex + 3]
        val forcedField = (forced as? ReferenceInstruction)?.reference as? FieldReference
        assertTrue(
            move.opcode == Opcode.MOVE_RESULT_OBJECT && forced.opcode == Opcode.SGET_OBJECT &&
                forcedField?.definingClass == "Ljava/lang/Boolean;" && forcedField.name == "TRUE" &&
                (forced as OneRegisterInstruction).registerA == (move as OneRegisterInstruction).registerA,
            "${reader.label()}: the read is not overwritten with Boolean.TRUE; got ${readInsns.drop(keyIndex).take(4).map { it.opcode }}",
        )

        // 4. NPAW: the "Viaplay Android Mobile" initializer, the only NpawPluginProvider.initialize
        // caller, returns at entry.
        val npawInit = methods.single("NPAW initializers") {
            it.returnType == "V" && "Viaplay Android Mobile" in it.strings() && it.calls("Lcom/npaw/NpawPluginProvider;")
        }
        assertReturnsEarlyVoid(npawInit, "NPAW initializer ${npawInit.label()}", diagnostics)
        val npawCallers = methods.filter { !it.definingClass.startsWith("Lcom/npaw/") }
            .filter { m -> m.instructions().any { it.methodRef()?.let { r -> r.definingClass == "Lcom/npaw/NpawPluginProvider;" && r.name.startsWith("initialize") } == true } }
        assertEquals(listOf(npawInit.label()), npawCallers.map { it.label() }, "NpawPluginProvider.initialize callers")

        // 5. Nielsen: the AppSdk wrapper returns at entry, before constructing the SDK.
        val nielsenInit = methods.single("Nielsen initializers") {
            it.returnType == "V" && "Failed to initialize Nielsen SDK" in it.strings() &&
                it.calls("Lcom/nielsen/app/sdk/AppSdk;", "<init>")
        }
        assertReturnsEarlyVoid(nielsenInit, "Nielsen initializer ${nielsenInit.label()}", diagnostics)

        // 6. Cronos: the static (VPTrackingEvent, BaseData, List)V dispatcher returns at entry.
        val cronos = methods.single("Cronos dispatchers") {
            it.returnType == "V" && it.name != "<init>" &&
                it.params() == listOf(VP_TRACKING_EVENT, VP_BASE_DATA, "Ljava/util/List;") &&
                it.calls(VP_TRACKING_EVENT, "getEventName")
        }
        assertReturnsEarlyVoid(cronos, "Cronos dispatcher ${cronos.label()}", diagnostics)

        // --- Skip ads ---

        // The inlined withSkippedAd(0, 0) guard in the SSAI source now tests whether the state has
        // an ad group instead of Set.contains: an iget-object of the state's AdGroup[] field and an
        // array-length into the guard's register sit right before the if-eqz, read from the same
        // state the skipped-ad code reads (the int read right behind the guard). Empty states
        // (content and live periods) keep jumping over it. Nothing else in the method changed.
        val updater = classes.ssaiSourceInfoRefreshers().single("SSAI source info refreshers") { true }
        val stockUpdater = stockClasses.ssaiSourceInfoRefreshers().single("stock SSAI source info refreshers") { true }
        val insns = updater.instructions()
        val contains = insns.indices.filter { i ->
            insns[i].methodRef()?.let { it.definingClass == "Ljava/util/Set;" && it.name == "contains" } == true &&
                insns.getOrNull(i + 1)?.opcode == Opcode.MOVE_RESULT
        }.single()
        val arrayGet = insns[contains + 1 + 1]
        val arrayLength = insns[contains + 3]
        val ifGuard = insns[contains + 4]
        val countRead = insns[contains + 5]
        val adGroups = (arrayGet as? ReferenceInstruction)?.reference as? FieldReference
        val state = (arrayGet as? com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction)
        val count = (countRead as? ReferenceInstruction)?.reference as? FieldReference
        assertTrue(
            arrayGet.opcode == Opcode.IGET_OBJECT && arrayLength.opcode == Opcode.ARRAY_LENGTH && ifGuard.opcode == Opcode.IF_EQZ &&
                adGroups?.type?.startsWith("[L") == true && countRead.opcode == Opcode.IGET && count?.type == "I" &&
                adGroups.definingClass == count.definingClass &&
                state!!.registerB == (countRead as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerB &&
                state.registerA == (ifGuard as OneRegisterInstruction).registerA &&
                (arrayLength as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerA == state.registerA &&
                arrayLength.registerB == state.registerA &&
                insns[contains + 1].opcode == Opcode.MOVE_RESULT,
            "${updater.label()}: the Set.contains guard does not test the AdGroup[] length; around it: " +
                "${insns.subList(contains, contains + 6).map { it.opcode }}\n$diagnostics",
        )
        val stockInsns = stockUpdater.instructions()
        assertEquals(
            stockInsns.map { it.opcode }.toMutableList().apply {
                add(contains + 2, Opcode.IGET_OBJECT)
                add(contains + 3, Opcode.ARRAY_LENGTH)
            },
            insns.map { it.opcode },
            "${updater.label()} changed beyond the inserted AdGroup[] length read",
        )
    }
}
