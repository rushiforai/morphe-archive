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
private const val AD_PLAYBACK_STATE = "Landroidx/media3/common/AdPlaybackState;"
private const val AD_PLAYBACK_STATE_UPDATER =
    "Landroidx/media3/exoplayer/source/ads/ServerSideAdInsertionMediaSource\$AdPlaybackStateUpdater;"

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

    // The SSAI updater, found like the patch: the onAdPlaybackStateUpdateRequested(Timeline)Z of
    // the class implementing Media3's AdPlaybackStateUpdater.
    private fun List<ClassDef>.adPlaybackStateUpdaters() = filter { AD_PLAYBACK_STATE_UPDATER in it.interfaces }
        .flatMap { it.methods }
        .filter {
            it.name == "onAdPlaybackStateUpdateRequested" && it.returnType == "Z" &&
                it.params() == listOf("Landroidx/media3/common/Timeline;") && it.implementation != null
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
            version = "26.42.1",
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

        // The withSkippedAd(0, 0) guard in the SSAI updater now tests the state's adGroupCount
        // instead of Set.contains: an iget of AdPlaybackState.adGroupCount into the guard's
        // register sits right before the if-eqz, read from the same state withSkippedAd is called
        // on. Empty states (content and live periods) keep jumping over the call. Nothing else in
        // the method changed.
        val updater = classes.adPlaybackStateUpdaters().single("AdPlaybackStateUpdater implementations") { true }
        val stockUpdater = stockClasses.adPlaybackStateUpdaters().single("stock AdPlaybackStateUpdater implementations") { true }
        val insns = updater.instructions()
        val skips = insns.indices.filter { insns[it].methodRef()?.let { r -> r.definingClass == AD_PLAYBACK_STATE && r.name == "withSkippedAd" } == true }
        assertEquals(1, skips.size, "${updater.label()}: withSkippedAd calls at $skips")
        val skip = skips.single()
        val guard = insns[skip - 1]
        val count = insns[skip - 2]
        val countField = (count as? ReferenceInstruction)?.reference as? FieldReference
        assertTrue(
            guard.opcode == Opcode.IF_EQZ &&
                count.opcode == Opcode.IGET &&
                countField?.definingClass == AD_PLAYBACK_STATE && countField.name == "adGroupCount" && countField.type == "I" &&
                (count as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerA ==
                (guard as OneRegisterInstruction).registerA &&
                count.registerB == (insns[skip] as FiveRegisterInstruction).registerC &&
                insns[skip - 3].opcode == Opcode.MOVE_RESULT &&
                insns[skip - 4].methodRef()?.let { it.definingClass == "Ljava/util/Set;" && it.name == "contains" } == true,
            "${updater.label()}: withSkippedAd is not guarded by adGroupCount; before it: ${insns.subList(skip - 4, skip).map { it.opcode }}\n$diagnostics",
        )
        val stockInsns = stockUpdater.instructions()
        val stockSkip = skip - 1
        assertEquals(Opcode.IF_EQZ, stockInsns[stockSkip - 1].opcode, "stock ${stockUpdater.label()}: no if-eqz before withSkippedAd")
        assertEquals(
            stockInsns.map { it.opcode }.toMutableList().apply { add(stockSkip - 1, Opcode.IGET) },
            insns.map { it.opcode },
            "${updater.label()} changed beyond the inserted adGroupCount read",
        )
    }
}
