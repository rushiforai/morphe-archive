import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "dk.dr.webplayer"
private const val NPAW_OPTIONS = "Lcom/npaw/core/options/AnalyticsOptions;"
private const val BINGE_MARKER_UTILITY = "Laxis/android/sdk/common/bingemarkers/BingeMarkerUtility;"

class DrtvSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.label() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    private fun Method.params() = parameterTypes.map(CharSequence::toString)
    private fun Method.strings() = instructions().mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }
    private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun List<ClassDef>.classDef(type: String) =
        singleOrNull { it.type == type } ?: error("$type not emitted")

    private fun List<Method>.single(what: String, predicate: (Method) -> Boolean): Method {
        val found = filter(predicate)
        assertEquals(1, found.size, "$what: ${found.map { it.label() }}")
        return found.single()
    }

    /** Index of the single `invoke` of [name] (with [params]) in [insns]. */
    private fun indexOfCall(insns: List<Instruction>, name: String, params: List<String>, label: String): Int {
        val calls = insns.indices.filter { index ->
            insns[index].methodRef()?.let { it.name == name && it.parameterTypes.map(CharSequence::toString) == params } == true
        }
        assertEquals(1, calls.size, "$label: calls to $name$params at $calls")
        return calls.single()
    }

    private fun Instruction.isConst(register: Int, literal: Int, vararg opcodes: Opcode) =
        opcode in opcodes && (this as OneRegisterInstruction).registerA == register &&
            (this as NarrowLiteralInstruction).narrowLiteral == literal

    @Test
    fun `DRTV patches disable telemetry, skip intros and free the player rotation`() {
        val root = repoRoot()
        val apk = File(root, "apks/drtv/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "4.39.0",
            patchNames = setOf("Disable telemetry", "Auto skip intro", "Allow free rotation"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"
        val methods = classes.flatMap { it.methods }
        val stockMethods = patchedApkClasses(apk).flatMap { it.methods }

        // --- Disable telemetry ---

        // 1-2. Crashlytics automatic collection and Firebase Performance monitoring read as off.
        assertForcedBoolean(
            classes.classDef("Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;")
                .method("isAutomaticDataCollectionEnabled", emptyList()),
            false, "Crashlytics isAutomaticDataCollectionEnabled", diagnostics,
        )
        assertForcedBoolean(
            classes.classDef("Lcom/google/firebase/perf/config/ConfigResolver;")
                .method("isPerformanceMonitoringEnabled", emptyList()),
            false, "Firebase Performance isPerformanceMonitoringEnabled", diagnostics,
        )

        // 3. Segment is never initialised.
        val segmentInit = classes.classDef("Laxis/android/sdk/client/analytics/SegmentAnalyticsProvider;")
            .method("initializeSegmentSDK", listOf("Laxis/android/sdk/client/config/ConfigModel;"))
        assertReturnsEarlyVoid(segmentInit, "Segment initializeSegmentSDK", diagnostics)

        // 4. Nielsen: the "Nielsen_AppSDK" initialiser returns at entry.
        val nielsenInit = methods.single("Nielsen initialisers") {
            it.returnType == "V" && "Nielsen_AppSDK" in it.strings() &&
                it.params() == listOf(
                    "Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;",
                    "Ljava/lang/String;", "Z", "Z",
                )
        }
        assertReturnsEarlyVoid(nielsenInit, "Nielsen initNielsen ${nielsenInit.label()}", diagnostics)

        // 5. NPAW: the "npawEnabled" flag reads false ...
        val npawFlag = methods.single("npawEnabled readers") {
            it.returnType == "Z" && it.parameterTypes.isEmpty() && "npawEnabled" in it.strings()
        }
        assertForcedBoolean(npawFlag, false, "NPAW feature flag ${npawFlag.label()}", diagnostics)

        // ... and initializeNpaw passes false to AnalyticsOptions.setEnabled, with nothing else changed.
        val isNpawInit: (Method) -> Boolean = { method ->
            method.returnType == "Lcom/npaw/NpawPlugin;" && "accountCode" in method.strings() &&
                method.instructions().any { it.methodRef()?.let { r -> r.definingClass == NPAW_OPTIONS && r.name == "setEnabled" } == true }
        }
        val npawInit = methods.single("NPAW initialisers", isNpawInit)
        val stockNpawInit = stockMethods.single("stock NPAW initialisers", isNpawInit)
        val npawInsns = npawInit.instructions()
        val setEnabled = indexOfCall(npawInsns, "setEnabled", listOf("Z"), "initializeNpaw")
        val enabledArg = (npawInsns[setEnabled] as FiveRegisterInstruction).registerD
        assertTrue(
            npawInsns[setEnabled - 1].isConst(enabledArg, 0, Opcode.CONST_4),
            "initializeNpaw does not pass false to setEnabled: ${npawInsns[setEnabled - 1].opcode}\n$diagnostics",
        )
        val stockNpawInsns = stockNpawInit.instructions()
        assertTrue(
            stockNpawInsns[setEnabled - 1].isConst(enabledArg, 1, Opcode.CONST_4),
            "stock initializeNpaw did not pass true to setEnabled",
        )
        assertEquals(stockNpawInsns.map { it.opcode }, npawInsns.map { it.opcode }, "initializeNpaw changed beyond the flag")
        assertEquals(Opcode.RETURN_OBJECT, npawInsns.last().opcode, "initializeNpaw no longer returns the plugin")

        // --- Auto skip intro ---

        // The progress-tick check calls skipButton.callOnClick() right after making it visible.
        val isSkipCheck: (Method) -> Boolean = { method ->
            method.definingClass == "Laxis/android/sdk/app/player/PlayerFragment;" &&
                method.returnType == "V" && method.params() == listOf("J") &&
                method.instructions().any { it.methodRef()?.let { r -> r.definingClass == BINGE_MARKER_UTILITY && r.name == "checkSkipThresholdInRange" } == true }
        }
        val skipCheck = methods.single("skip button checks", isSkipCheck)
        val stockSkipCheck = stockMethods.single("stock skip button checks", isSkipCheck)
        val skipInsns = skipCheck.instructions()
        val click = indexOfCall(skipInsns, "callOnClick", emptyList(), "checkForBingMarkerButton")
        val show = skipInsns[click - 1]
        val showRef = show.methodRef()
        assertTrue(
            show.opcode == Opcode.INVOKE_STATIC && showRef?.name == "setViewVisibility" &&
                skipInsns[click - 2].isConst((show as FiveRegisterInstruction).registerD, 0, Opcode.CONST_4),
            "callOnClick does not follow setViewVisibility(skipButton, 0): ${show.opcode} $showRef\n$diagnostics",
        )
        assertEquals(
            (show as FiveRegisterInstruction).registerC, (skipInsns[click] as FiveRegisterInstruction).registerC,
            "callOnClick is not called on the button that was just shown",
        )
        assertEquals("Landroid/view/View;", skipInsns[click].methodRef()!!.definingClass, "callOnClick owner")
        assertEquals(
            stockSkipCheck.instructions().map { it.opcode },
            skipInsns.map { it.opcode }.filterIndexed { index, _ -> index != click },
            "checkForBingMarkerButton changed beyond the inserted callOnClick",
        )

        // --- Allow free rotation ---

        // PlayerActivity.onResume requests FULL_SENSOR (10) instead of SENSOR_LANDSCAPE (6).
        val onResume = classes.classDef("Laxis/android/sdk/app/player/PlayerActivity;").method("onResume", emptyList())
        val resumeInsns = onResume.instructions()
        val request = indexOfCall(resumeInsns, "setRequestedOrientation", listOf("I"), "PlayerActivity.onResume")
        val orientationArg = (resumeInsns[request] as FiveRegisterInstruction).registerD
        assertTrue(
            resumeInsns[request - 1].isConst(orientationArg, 10, Opcode.CONST_16),
            "PlayerActivity.onResume does not request FULL_SENSOR: ${resumeInsns[request - 1].opcode}\n$diagnostics",
        )
    }
}
