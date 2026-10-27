import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
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

private const val PKG = "org.mozilla.focus"
private const val GECKO_RUNTIME = "Lorg/mozilla/geckoview/GeckoRuntime;"
private const val GECKO_RUNTIME_SETTINGS = "Lorg/mozilla/geckoview/GeckoRuntimeSettings;"
private const val USAGE_REPORTING_API = "Lorg/mozilla/focus/telemetry/GleanUsageReportingApi;"
private const val SETTINGS = "Lorg/mozilla/focus/utils/Settings;"
private const val BOOLEAN_PREFERENCE = "Lmozilla/components/support/ktx/android/content/BooleanPreference;"
private const val ONBOARDING = "Lorg/mozilla/focus/nimbus/Onboarding;"
private const val NIMBUS = "Lorg/mozilla/experiments/nimbus/Nimbus;"

class FirefoxFocusSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun Instruction.fieldRef(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
    private fun Instruction.stringRef(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
    private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)
    private fun Method.label(): String = "$definingClass->$name(${params().joinToString("")})"

    /**
     * Every read of [owner]->[field] in the app's code (found like the patch: iget-object, first
     * call = getValue on it, move-result-object r) is followed by sget-object r, Boolean.FALSE.
     * Returns the methods holding the reads.
     */
    private fun assertDelegateReadsForcedFalse(classes: List<ClassDef>, owner: String, field: String): List<Method> {
        val readers = classes.filter { it.type.startsWith("Lorg/mozilla/focus/") }.flatMap { it.methods }.filter { method ->
            method.instructions().any { it.opcode == Opcode.IGET_OBJECT && it.fieldRef()?.let { f -> f.definingClass == owner && f.name == field } == true }
        }
        assertTrue(readers.isNotEmpty(), "no read of $owner->$field")
        for (method in readers) {
            val insns = method.instructions()
            insns.indices.filter { i ->
                insns[i].opcode == Opcode.IGET_OBJECT && insns[i].fieldRef()?.let { it.definingClass == owner && it.name == field } == true
            }.forEach { read ->
                val call = (read + 1 until insns.size).first { insns[it].methodRef() != null }
                assertEquals("getValue", insns[call].methodRef()!!.name, "${method.label()}: first call after the $field read")
                val moveResult = insns[call + 1]
                assertEquals(Opcode.MOVE_RESULT_OBJECT, moveResult.opcode, "${method.label()}: $field getValue result")
                val forced = insns[call + 2]
                val ref = forced.fieldRef()
                assertTrue(
                    forced.opcode == Opcode.SGET_OBJECT && ref?.definingClass == "Ljava/lang/Boolean;" && ref.name == "FALSE" &&
                        (forced as OneRegisterInstruction).registerA == (moveResult as OneRegisterInstruction).registerA,
                    "${method.label()}: the $field read is not forced to Boolean.FALSE (next: ${forced.opcode} $ref)",
                )
            }
        }
        return readers
    }

    @Test
    fun `Firefox Focus patches enable about config, stop the usage ping, Nimbus fetches, the rating prompt and promotions`() {
        val root = repoRoot()
        val apk = File(root, "apks/firefox-focus/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "158.0.2",
            patchNames = setOf("Enable about:config", "Disable telemetry", "Disable rating prompts", "Hide promotional prompts"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun classDef(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes")

        // Enable about:config: GeckoRuntime.create(Context, GeckoRuntimeSettings) starts with
        // settings.setAboutConfigEnabled(true).
        val create = classDef(GECKO_RUNTIME).method("create", listOf("Landroid/content/Context;", GECKO_RUNTIME_SETTINGS))
        val createInsns = create.instructions()
        val literal = createInsns[0]
        assertTrue(
            literal.opcode == Opcode.CONST_4 && (literal as NarrowLiteralInstruction).narrowLiteral == 1,
            "GeckoRuntime.create does not start with const/4 1: ${literal.opcode}",
        )
        val setter = createInsns[1].methodRef()
        assertTrue(
            createInsns[1].opcode == Opcode.INVOKE_VIRTUAL && setter?.definingClass == GECKO_RUNTIME_SETTINGS &&
                setter.name == "setAboutConfigEnabled" && setter.parameterTypes.map(CharSequence::toString) == listOf("Z"),
            "GeckoRuntime.create does not call setAboutConfigEnabled(Z) second: $setter",
        )
        val invoke = createInsns[1] as FiveRegisterInstruction
        val p1 = create.implementation!!.registerCount - 1
        assertEquals(listOf(p1, (literal as OneRegisterInstruction).registerA), listOf(invoke.registerC, invoke.registerD), "setAboutConfigEnabled registers")
        assertTrue(
            classDef(GECKO_RUNTIME_SETTINGS).methods.any { it.name == "setAboutConfigEnabled" && it.implementation != null },
            "GeckoRuntimeSettings.setAboutConfigEnabled is missing",
        )

        // Disable telemetry 1: the usage reporting service never starts.
        assertReturnsEarlyVoid(
            classDef("Lorg/mozilla/focus/telemetry/GleanUsageReportingMetricsService;").method("start", listOf()),
            "GleanUsageReportingMetricsService.start",
        )

        // Disable telemetry 2: every usage reporting API implementation drops submitPing and
        // requestDataDeletion.
        val implementations = classes.filter { USAGE_REPORTING_API in it.interfaces }
        assertTrue(implementations.isNotEmpty(), "no $USAGE_REPORTING_API implementation")
        for (implementation in implementations) {
            for (name in listOf("submitPing", "requestDataDeletion")) {
                assertReturnsEarlyVoid(implementation.method(name, listOf()), "${implementation.type}.$name")
            }
        }

        // Disable telemetry 3: in the Settings constructor the "Daily usage ping" delegate's default
        // lambda is created with a false right before its <init>(Z).
        val settingsInit = classDef(SETTINGS).method("<init>", listOf("Landroid/content/Context;"))
        val initInsns = settingsInit.instructions()
        val store = initInsns.indexOfFirst {
            it.opcode == Opcode.IPUT_OBJECT && it.fieldRef()?.let { f -> f.definingClass == SETTINGS && f.name == "isDailyUsagePingEnabled\$delegate" } == true
        }
        assertTrue(store >= 0, "Settings.<init> does not store the daily usage ping delegate")
        val preferenceInit = (store - 1 downTo 0).first {
            initInsns[it].methodRef()?.let { ref -> ref.definingClass == BOOLEAN_PREFERENCE && ref.name == "<init>" } == true
        }
        val defaultLambda = (initInsns[preferenceInit] as FiveRegisterInstruction).registerE
        val lambdaInit = (preferenceInit - 1 downTo 0).first {
            initInsns[it].opcode == Opcode.INVOKE_DIRECT && initInsns[it].methodRef()?.name == "<init>" &&
                (initInsns[it] as FiveRegisterInstruction).registerC == defaultLambda
        }
        val defaultRegister = (initInsns[lambdaInit] as FiveRegisterInstruction).registerD
        val forcedDefault = initInsns[lambdaInit - 1]
        assertTrue(
            forcedDefault.opcode == Opcode.CONST_4 && (forcedDefault as NarrowLiteralInstruction).narrowLiteral == 0 &&
                (forcedDefault as OneRegisterInstruction).registerA == defaultRegister,
            "the daily usage ping default (v$defaultRegister) is not forced to false: ${forcedDefault.opcode}",
        )

        // Disable telemetry 4: Nimbus never fetches; the AC subclass does not override the fetch.
        assertReturnsEarlyVoid(classDef(NIMBUS).method("fetchExperiments", listOf()), "Nimbus.fetchExperiments")
        val acNimbus = classDef("Lmozilla/components/service/nimbus/Nimbus;")
        assertEquals(NIMBUS, acNimbus.superclass, "AC Nimbus superclass")
        assertTrue(acNimbus.methods.none { it.name == "fetchExperiments" }, "AC Nimbus overrides fetchExperiments")

        // Disable rating prompts: the review check (found by its step names, like the patch) reads
        // the stored step as "Pending".
        val reviewChecks = classes.flatMap { it.methods }.filter { method ->
            val strings = method.instructions().mapNotNull { it.stringRef() }
            "ReviewNeeded" in strings && "Reviewed" in strings
        }
        val reviewCheck = reviewChecks.singleOrNull() ?: error("expected one review check, found ${reviewChecks.map { it.label() }}")
        val reviewInsns = reviewCheck.instructions()
        val pending = reviewInsns.indices.single { i ->
            reviewInsns[i].stringRef() == "Pending" && reviewInsns.getOrNull(i + 1)?.methodRef()?.name == "getString"
        }
        val stepRead = reviewInsns[pending + 2]
        assertEquals(Opcode.MOVE_RESULT_OBJECT, stepRead.opcode, "review step read result")
        val forcedStep = reviewInsns[pending + 3]
        assertTrue(
            forcedStep.opcode == Opcode.CONST_STRING && forcedStep.stringRef() == "Pending" &&
                (forcedStep as OneRegisterInstruction).registerA == (stepRead as OneRegisterInstruction).registerA,
            "${reviewCheck.label()}: the review step is not forced to \"Pending\" (next: ${forcedStep.opcode})",
        )

        // Hide promotional prompts: both onboarding flags read false everywhere, including the
        // feature's isCfrEnabled() getter and the erase handler that shows the widget dialog.
        val cfrReaders = assertDelegateReadsForcedFalse(classes, ONBOARDING, "isCfrEnabled\$delegate")
        assertTrue(
            cfrReaders.any { it.definingClass == ONBOARDING && it.name == "isCfrEnabled" && it.returnType == "Z" },
            "Onboarding.isCfrEnabled() does not read the flag: ${cfrReaders.map { it.label() }}",
        )
        val promoReaders = assertDelegateReadsForcedFalse(classes, ONBOARDING, "isPromoteSearchWidgetDialogEnabled\$delegate")
        assertTrue(
            promoReaders.any { method ->
                method.instructions().any { it.methodRef()?.let { ref -> ref.definingClass == "Landroid/app/Dialog;" && ref.name == "show" } == true }
            },
            "no method that shows the search widget dialog reads the flag: ${promoReaders.map { it.label() }}",
        )
    }
}
