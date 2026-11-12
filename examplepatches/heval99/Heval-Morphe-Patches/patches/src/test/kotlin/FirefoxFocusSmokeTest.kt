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
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

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
    fun `Firefox Focus patches enable about config, stop the usage ping, Nimbus fetches, the rating prompt and promotions, and pin DNS`() {
        val root = repoRoot()
        val apk = File(root, "apks/firefox-focus/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "159.0.1",
            patchNames = setOf(
                "Enable about:config", "Disable telemetry", "Disable rating prompts", "Hide promotional prompts",
                "Move address bar to the bottom", DNS_FILTER,
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun classDef(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes")

        // Enable about:config: GeckoRuntime.create(Context, GeckoRuntimeSettings) calls
        // settings.setAboutConfigEnabled(true) before its own code. DNS filter inserts at the same
        // entry, so the call is found by reference.
        val create = classDef(GECKO_RUNTIME).method("create", listOf("Landroid/content/Context;", GECKO_RUNTIME_SETTINGS))
        val createInsns = create.instructions()
        val aboutConfigCall = createInsns.indexOfFirst { it.methodRef()?.name == "setAboutConfigEnabled" }
        assertTrue(
            aboutConfigCall in 1 until createInsns.indexOfFirst { it.methodRef()?.name == "assertOnUiThread" },
            "GeckoRuntime.create does not call setAboutConfigEnabled before assertOnUiThread",
        )
        val literal = createInsns[aboutConfigCall - 1]
        assertTrue(
            literal.opcode == Opcode.CONST_4 && (literal as NarrowLiteralInstruction).narrowLiteral == 1,
            "setAboutConfigEnabled is not preceded by const/4 1: ${literal.opcode}",
        )
        val setter = createInsns[aboutConfigCall].methodRef()
        assertTrue(
            createInsns[aboutConfigCall].opcode == Opcode.INVOKE_VIRTUAL && setter?.definingClass == GECKO_RUNTIME_SETTINGS &&
                setter.name == "setAboutConfigEnabled" && setter.parameterTypes.map(CharSequence::toString) == listOf("Z"),
            "GeckoRuntime.create does not call setAboutConfigEnabled(Z): $setter",
        )
        val invoke = createInsns[aboutConfigCall] as FiveRegisterInstruction
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

        // DNS filter: GeckoView is pinned to the default resolver in TRR-only mode (3), and with
        // the other options to the chosen resolver in TRR-first mode (2).
        assertGeckoViewDnsForced(classes, DEFAULT_DOH_URL, trrMode = 3)
        assertGeckoViewDnsForced(applyDnsFilterFallback(apk, workDir, PKG, "159.0.1"), OTHER_DOH_URL, trrMode = 2)

        // Move address bar to the bottom: the browser toolbar's gravity is bottom in the decoded
        // layout.
        val browserLayout = workDir.walkTopDown()
            .singleOrNull { it.name == "fragment_browser.xml" && it.parentFile.name == "layout" }
            ?: error("fragment_browser.xml was not decoded under $workDir")
        val browserDoc = DocumentBuilderFactory.newInstance().newDocumentBuilder()
            .parse(browserLayout).documentElement
        val toolbars = browserDoc.getElementsByTagName("mozilla.components.browser.toolbar.BrowserToolbar")
            .let { list -> (0 until list.length).map { list.item(it) as Element } }
        assertEquals(1, toolbars.size, "BrowserToolbar elements in fragment_browser.xml")
        assertEquals(
            "bottom", toolbars.single().getAttribute("android:layout_gravity"),
            "the browser toolbar is not pinned to the bottom",
        )

        // The code half: the page is laid out for a bottom bar. enableDynamicBehavior shows the bar
        // fixed, showAsFixed and the fullscreen handler use bottomMargin instead of topMargin.
        val byTypeLayout = classes.associateBy { it.type }
        val toolbarKt = byTypeLayout.getValue("Lorg/mozilla/focus/ext/BrowserToolbarKt;")
        fun margins(method: com.android.tools.smali.dexlib2.iface.Method) = method.implementation!!.instructions
            .filter { it.opcode == Opcode.IPUT }
            .mapNotNull { ((it as ReferenceInstruction).reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference)?.name }
            .filter { it == "topMargin" || it == "bottomMargin" }
        val enable = toolbarKt.methods.single { it.name == "enableDynamicBehavior" && it.parameterTypes.size == 3 }
        val enableInsns = enable.implementation!!.instructions.toList()
        assertTrue(
            enableInsns[0].opcode == Opcode.INVOKE_STATIC &&
                ((enableInsns[0] as ReferenceInstruction).reference as MethodReference).name == "showAsFixed" &&
                enableInsns[1].opcode == Opcode.RETURN_VOID,
            "enableDynamicBehavior does not show the bar fixed",
        )
        val fixed = toolbarKt.methods.single { it.name == "showAsFixed" }
        assertEquals(listOf("bottomMargin"), margins(fixed), "showAsFixed margin writes")
        val fullscreen = byTypeLayout.getValue("Lorg/mozilla/focus/browser/integration/FullScreenIntegration\$feature\$2;")
            .methods.single { it.name == "invoke" }
        assertEquals(listOf("bottomMargin"), margins(fullscreen), "fullscreen margin writes")
    }
}
