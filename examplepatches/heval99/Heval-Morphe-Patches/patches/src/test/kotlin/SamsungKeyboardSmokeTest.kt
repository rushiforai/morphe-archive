import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.HevalRegistryCodec
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "com.samsung.android.honeyboard"
private const val NEW_PKG = "app.heval.honeyboard"
private const val EXT = "Lapp/template/extension/samsungkeyboard/"
private const val EXT_PREFIX = "Lapp/template/extension/"
private const val SERVICE = "Lcom/samsung/android/honeyboard/service/HoneyBoardService;"
private const val SCPM_RECEIVER = "Lcom/samsung/android/honeyboard/base/broadcastreceiver/ScpmReceiver;"
private const val GSIM_LOGGER = "Lcom/samsung/android/sdk/handwriting/GSIMLogger;"
private const val CSC_GIF = "CscFeature_Sip_ConfigWhetherToProvideGif"
private const val STRING = "Ljava/lang/String;"
private const val CLIP = "Lcom/samsung/android/honeyboard/icecone/clipboard/data/entity/Clip;"
private const val CLIPBOARD_VIEW_MODEL = "Lcom/samsung/android/honeyboard/icecone/clipboard/viewmodel/ClipboardViewModel;"
private const val FLOATING_CURSOR = "SEC_FLOATING_FEATURE_SIP_SUPPORT_CURSOR_CONTROL"
private const val FLOATING_ONEHAND = "SEC_FLOATING_FEATURE_COMMON_CONFIG_ONEHAND_MODE_POLICY"

private val ALL_PATCHES = setOf(
    "Change package name",
    "Enable non-One UI ROM support",
    "Change app name",
    "Disable telemetry",
    "Always incognito",
    "Stop remote updates",
    "No GIF tracking",
    "Remove internet permission",
    "Show GIFs in every region",
    "Always use GIPHY",
    "Bigger clipboard history",
    "Clipboard columns",
    "Swipe cursor control",
    "One-handed keyboard",
    "Restore key vibration",
    "Toolbar item count",
    "Autofill in any field",
    "Patch settings",
    "Swipe down to dismiss",
)

private data class Quad<A, B, C, D>(val first: A, val second: B, val third: C, val fourth: D)

private const val CONTROLS = "Lapp/template/extension/samsungkeyboard/controls/"
private const val SETTINGS = "Lapp/template/extension/hevalcontrols/HevalSettings;"
private const val SETTINGS_FRAGMENT = "Lcom/samsung/android/honeyboard/settings/common/HoneyBoardSettingsFragment;"
private const val KEYBOARD_LAYOUT = "Lcom/samsung/android/honeyboard/keyboard/view/HoneyBoardLayout;"

class SamsungKeyboardSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.str() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
    private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun MethodReference.key() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    private fun Method.strings() = instructions().mapNotNull { it.str() }
    private fun Method.params() = parameterTypes.map(CharSequence::toString)

    /** The Patch settings gate at [at]: const-string id, HevalSettings.isEnabled, move-result, then a branch on the answer. */
    private fun assertGate(code: List<Instruction>, at: Int, id: String, label: String, branch: Opcode = Opcode.IF_EQZ) {
        assertTrue(code[at].opcode == Opcode.CONST_STRING || code[at].opcode == Opcode.CONST_STRING_JUMBO, "$label: no const-string at $at")
        assertEquals(id, code[at].str(), "$label: wrong gate id")
        val call = code[at + 1].call()
        assertTrue(call != null && call.definingClass == SETTINGS && call.name == "isEnabled", "$label: no HevalSettings.isEnabled after the id: $call")
        assertEquals(Opcode.MOVE_RESULT, code[at + 2].opcode, "$label: gate answer not kept")
        assertEquals(branch, code[at + 3].opcode, "$label: gate branch")
    }

    /** `invoke-static/range {vR .. vR}, owner->name(desc)` at [at] followed by the move-result into the same register. */
    private fun assertFilterCall(code: List<Instruction>, at: Int, owner: String, name: String, desc: String, label: String, objectResult: Boolean = false): Int {
        val call = code[at].call()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[at].opcode, "$label: not invoke-static/range")
        assertTrue(call != null && call.definingClass == owner && call.name == name && "(${call.parameterTypes.joinToString("")})${call.returnType}" == desc,
            "$label: wrong call ${call?.key()}")
        val register = (code[at] as RegisterRangeInstruction).startRegister
        assertEquals(if (objectResult) Opcode.MOVE_RESULT_OBJECT else Opcode.MOVE_RESULT, code[at + 1].opcode, "$label: result not kept")
        assertEquals(register, (code[at + 1] as OneRegisterInstruction).registerA, "$label: result goes to another register")
        return register
    }

    private fun List<ClassDef>.methodsWhere(predicate: (Method) -> Boolean) =
        flatMap { c -> c.methods.filter { it.implementation != null && predicate(it) } }

    private fun xml(text: String) = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        .parse(text.byteInputStream()).documentElement

    private fun Element.all(tag: String) = getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }

    @Test
    fun `Samsung Keyboard patches emit the ported bytecode, manifest and resources`() {
        val root = repoRoot()
        val apk = File(root, "apks/samsungkeyboard/base.apk")
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "5.9.40.75",
            versionCode = 594075300,
            patchNames = ALL_PATCHES,
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        // The app's own classes: those the stock APK already had (the extension and its stand-ins are new).
        val stock = patchedApkClasses(apk).mapTo(HashSet()) { it.type }
        val app = classes.filter { it.type in stock }

        // --- The extension is merged: its nine logic classes and the One UI stand-ins ---
        for (name in listOf("Downloads", "Fallbacks", "Gifs", "Java21", "LocalClipboard", "OneUi", "Sem", "Services", "SystemAccess")) {
            assertTrue("$EXT$name;" in byType, "extension class $name is missing")
        }
        for (standIn in listOf("Landroid/os/SemSystemProperties;", "Lcom/samsung/android/feature/SemCscFeature;")) {
            assertTrue(standIn in byType && standIn !in stock, "stand-in $standIn is not merged")
        }

        // --- SystemAccess redirects: the app's Settings / Context / Build / WindowManager calls go to the shims ---
        val invokes = app.flatMap { c -> c.methods.flatMap { m -> m.instructions().mapNotNull { it.call() } } }
        val systemAccess = invokes.filter { it.definingClass == "${EXT}SystemAccess;" }
        assertTrue(systemAccess.size >= 300, "only ${systemAccess.size} calls go through SystemAccess")
        assertTrue(systemAccess.any { it.name == "fieldSet" }, "the input-features reflective write does not go through SystemAccess.fieldSet")
        assertTrue(systemAccess.any { it.name.startsWith("secure") } && systemAccess.any { it.name.startsWith("context") },
            "SystemAccess has no Settings.Secure / Context redirect")

        // --- sem* members go to the generated Sem shims, and no direct One UI call is left in the app ---
        val shims = invokes.filter { it.definingClass == "${EXT}Sem;" }
        assertTrue(shims.size >= 100, "only ${shims.size} calls go through the generated Sem shims")
        val directSem = invokes.filter { it.definingClass.startsWith("Landroid/") && Regex("^sem[A-Z]").containsMatchIn(it.name) }
        assertTrue(directSem.isEmpty(), "direct One UI calls left: ${directSem.take(5).map { it.key() }}")
        val sem = byType.getValue("${EXT}Sem;")
        val generated = sem.methods.filter { it.name.matches(Regex("m\\d+")) }
        assertTrue(generated.size >= 50, "Sem has only ${generated.size} generated shims")
        for (shim in generated) {
            val code = shim.instructions()
            assertTrue(
                code.any { it.call()?.definingClass == "${EXT}OneUi;" },
                "Sem.${shim.name} does not call OneUi",
            )
        }
        // Resources.getIdentifier goes through OneUi, and Java 21 list calls through Java21.
        assertTrue(invokes.any { it.definingClass == "${EXT}OneUi;" && it.name == "getIdentifier" }, "getIdentifier lookups are not redirected")
        assertTrue(invokes.none { it.definingClass == "Ljava/util/stream/Stream;" && it.name == "toList" }, "Stream.toList calls are left")
        // The settings colour lookup names the stock package; OneUi.getIdentifier maps it to the renamed one.
        val colorLookup = byType.getValue("Lcom/samsung/android/honeyboard/support/color/OpenThemeColor;")
            .method("getColorWithResourceName", listOf("Landroid/content/Context;", STRING))
        assertTrue(
            colorLookup.instructions().any { it.call()?.let { c -> c.definingClass == "${EXT}OneUi;" && c.name == "getIdentifier" } == true },
            "OpenThemeColor.getColorWithResourceName does not call OneUi.getIdentifier",
        )

        // --- HoneyBoardService.onCreate starts OneUi.keyboardCreated and remembers the service for Swipe down to dismiss ---
        val onCreate = byType.getValue(SERVICE).method("onCreate", emptyList())
        val onCreateStart = onCreate.instructions().take(2).map { it.call() }
        assertTrue(
            onCreateStart.any { it != null && it.definingClass == "${EXT}OneUi;" && it.name == "keyboardCreated" },
            "HoneyBoardService.onCreate does not call OneUi.keyboardCreated at its start: $onCreateStart",
        )
        val setService = onCreate.instructions().take(2).single { it.call()?.name == "set" }
        assertEquals("${CONTROLS}KeyboardService;->set(Landroid/inputmethodservice/InputMethodService;)V",
            setService.call()!!.let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" })
        assertEquals(
            onCreate.implementation!!.registerCount - 1, (setService as FiveRegisterInstruction).registerC,
            "KeyboardService.set does not get p0",
        )

        // --- Patch settings: the entry hooks sit at index 0 of the settings fragment's menu methods ---
        for (name in listOf("HevalControlsEntry", "SwipeDismiss", "KeyboardService", "Choices")) {
            assertTrue("$CONTROLS$name;" in byType, "extension class $name is missing")
        }
        for (name in listOf("HevalSettings", "Registry", "InitProvider")) {
            assertTrue("Lapp/template/extension/hevalcontrols/$name;" in byType, "Patch settings class $name is missing")
        }
        val fragment = byType.getValue(SETTINGS_FRAGMENT)
        val menuBuild = fragment.method("onCreateOptionsMenu", listOf("Landroid/view/Menu;", "Landroid/view/MenuInflater;")).instructions()
        assertEquals("getContext", menuBuild[0].call()?.name, "menu builder does not start by reading the fragment's context")
        assertEquals(Opcode.MOVE_RESULT_OBJECT, menuBuild[1].opcode)
        val addItem = menuBuild[2].call()
        assertTrue(
            addItem != null && addItem.definingClass == "${CONTROLS}HevalControlsEntry;" && addItem.name == "addItem" &&
                addItem.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Landroid/view/Menu;"),
            "menu builder does not call HevalControlsEntry.addItem(Context, Menu) at index 2: $addItem",
        )
        assertEquals("menu", menuBuild[3].str(), "the stock menu builder does not follow the hook")
        val menuClickMethod = fragment.method("onOptionsItemSelected", listOf("Landroid/view/MenuItem;"))
        val menuClick = menuClickMethod.instructions()
        assertEquals("getContext", menuClick[0].call()?.name)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, menuClick[1].opcode)
        val handles = menuClick[2].call()
        assertTrue(
            handles != null && handles.definingClass == "${CONTROLS}HevalControlsEntry;" && handles.name == "handles" &&
                handles.returnType == "Z",
            "click handler does not call HevalControlsEntry.handles at index 2: $handles",
        )
        assertEquals(Opcode.MOVE_RESULT, menuClick[3].opcode)
        assertEquals(Opcode.IF_EQZ, menuClick[4].opcode)
        assertEquals(4, (menuClick[4] as OffsetInstruction).codeOffset, "the branch does not skip exactly const/4 + return")
        assertEquals(Opcode.CONST_4, menuClick[5].opcode)
        assertEquals(1, (menuClick[5] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, menuClick[6].opcode)
        assertEquals("item", menuClick[7].str(), "the stock click handler does not follow the labelled branch")

        // --- Swipe down to dismiss: the layout's intercept hook at index 0 ---
        val intercept = byType.getValue(KEYBOARD_LAYOUT).method("onInterceptTouchEvent", listOf("Landroid/view/MotionEvent;")).instructions()
        val swipe = intercept[0].call()
        assertTrue(
            swipe != null && swipe.definingClass == "${CONTROLS}SwipeDismiss;" && swipe.name == "intercept" &&
                swipe.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;", "Landroid/view/MotionEvent;"),
            "HoneyBoardLayout.onInterceptTouchEvent does not call SwipeDismiss.intercept first: $swipe",
        )
        assertEquals(Opcode.MOVE_RESULT, intercept[1].opcode)
        assertEquals(Opcode.IF_EQZ, intercept[2].opcode)
        assertEquals(4, (intercept[2] as OffsetInstruction).codeOffset, "the intercept branch does not skip exactly const/4 + return")
        assertEquals(Opcode.CONST_4, intercept[3].opcode)
        assertEquals(1, (intercept[3] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, intercept[4].opcode)
        assertEquals("ev", intercept[5].str(), "the stock onInterceptTouchEvent does not follow the injected return")

        // --- Patch settings registry: every feature, its id, category, runtime default and restart flag ---
        fun choice(prefix: String, title: String, category: String, icon: String, values: List<Int>, selected: Int, restart: Boolean,
                   name: (Int) -> String, description: (Int) -> String) = values.map {
            HevalFeature(
                id = "$prefix$it", name = name(it), description = description(it), category = category,
                default = it == selected, restartRequired = restart, icon = icon, choice = title,
            )
        }
        val expectedFeatures = listOf(
            HevalFeature(
                id = "samsungkeyboard.swipe_dismiss", name = "Swipe down to dismiss",
                description = "Swipe down on the suggestion strip or toolbar to hide the keyboard.",
                category = "Typing & gestures", default = true,
            ),
            HevalFeature(
                id = "samsungkeyboard.swipe_cursor", name = "Swipe cursor control",
                description = "Offers moving the cursor by swiping on the space bar, for non-Samsung phones.",
                category = "Typing & gestures", default = true, restartRequired = true,
            ),
            HevalFeature(
                id = "samsungkeyboard.one_handed", name = "One-handed keyboard",
                description = "Offers the one-handed keyboard, for non-Samsung phones.",
                category = "Typing & gestures", default = true, restartRequired = true,
            ),
            HevalFeature(
                id = "samsungkeyboard.key_vibration", name = "Restore key vibration",
                description = "Brings back the vibration on key taps, for non-Samsung phones.",
                category = "Typing & gestures", default = true, restartRequired = true,
            ),
            HevalFeature(
                id = "samsungkeyboard.autofill_any_field", name = "Autofill in any field",
                description = "Shows password and autofill suggestions even when the field already has text.",
                category = "Typing & gestures", default = true,
            ),
            HevalFeature(
                id = "samsungkeyboard.always_incognito", name = "Always use incognito mode",
                description = "Makes the keyboard's own incognito check always say yes, so it never learns from what you type.",
                category = "Privacy", default = true, icon = "eye_off",
            ),
            HevalFeature(
                id = "samsungkeyboard.no_gif_tracking", name = "No GIF tracking",
                description = "Stops GIPHY and Tenor view and share pings.",
                category = "Privacy", default = true, icon = "shield",
            ),
            HevalFeature(
                id = "samsungkeyboard.always_giphy", name = "Always use GIPHY",
                description = "Shows GIPHY GIFs in every language.",
                category = "Appearance", default = true,
            ),
            HevalFeature(
                id = "samsungkeyboard.gifs_every_region", name = "Show GIFs in every region",
                description = "Shows the GIF board where the phone's region turns it off.",
                category = "Appearance", default = true, restartRequired = true,
            ),
        ) + choice(
            "samsungkeyboard.clipboard_size_", "Clipboard history size", "Clipboard", "list", listOf(100, 200, 500, 1000), 200, true,
            { "$it items" }, { "Keeps up to $it items in the clipboard history." },
        ) + choice(
            "samsungkeyboard.clipboard_columns_", "Clipboard columns", "Clipboard", "list", (1..6).toList(), 3, false,
            { if (it == 1) "1 column" else "$it columns" }, { "Shows the clipboard panel in $it ${if (it == 1) "column" else "columns"}." },
        ) + choice(
            "samsungkeyboard.toolbar_items_", "Toolbar items in the top row", "Toolbar", "sliders", (8..12).toList(), 8, true,
            { "$it items" }, { "Lets the toolbar's top row hold $it items." },
        )
        val registryCode = byType.getValue("Lapp/template/extension/hevalcontrols/Registry;").methods.single { it.name == "encoded" }.instructions()
        assertTrue(
            registryCode.getOrNull(0)?.opcode == Opcode.CONST_STRING_JUMBO && registryCode.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT,
            "Registry.encoded() was not rewritten",
        )
        val encodedRegistry = registryCode[0].str()!!.split('\n')
        val wantedRegistry = HevalRegistryCodec.encode(expectedFeatures).split('\n')
        assertTrue(
            encodedRegistry.first() == wantedRegistry.first() && encodedRegistry.size == wantedRegistry.size &&
                encodedRegistry.toSet() == wantedRegistry.toSet(),
            "Registry.encoded() is\n${encodedRegistry.joinToString("\n")}\nexpected (any record order)\n${wantedRegistry.joinToString("\n")}",
        )

        // --- Galaxy Store sticker link: the click handler found by its URL and shape goes through the safe starter ---
        val stickerClicks = app.methodsWhere { m ->
            m.name == "onClick" && m.params() == listOf("Landroid/view/View;") &&
                "samsungapps://CategoryList/0000005276" in m.strings()
        }
        assertEquals(1, stickerClicks.size, "expected one sticker store click handler, got ${stickerClicks.size}")
        val stickerCalls = stickerClicks.single().instructions().mapNotNull { it.call() }
        assertTrue(stickerCalls.any { it.definingClass == "${EXT}SystemAccess;" && it.name == "startActivitySafely" },
            "the sticker store click does not call SystemAccess.startActivitySafely")
        assertTrue(stickerCalls.none { it.name == "startActivity" }, "the sticker store click still calls startActivity directly")

        // --- Clipboard caller check and provider signature checks return early for the keyboard itself ---
        fun assertEarlySelfCheck(method: Method, helper: String, label: String) {
            val code = method.instructions()
            val call = code[0].call()
            assertTrue(
                call != null && call.definingClass == "${EXT}LocalClipboard;" && call.name == helper,
                "$label does not call LocalClipboard.$helper first: $call",
            )
            assertEquals(Opcode.MOVE_RESULT, code[1].opcode, "$label does not keep the helper's answer")
            assertEquals(Opcode.IF_EQZ, code[2].opcode, "$label has no branch on the helper's answer")
            assertEquals(Opcode.RETURN, code[3].opcode, "$label does not return early when the helper says yes")
            assertEquals(
                (code[1] as OneRegisterInstruction).registerA, (code[3] as OneRegisterInstruction).registerA,
                "$label returns a different register than the helper's answer",
            )
        }
        val callerChecks = app.methodsWhere {
            it.returnType == "Z" && it.params() == listOf(STRING) && ") can't access to clipboard." in it.strings()
        }
        assertTrue(callerChecks.isNotEmpty(), "clipboard caller check not found")
        callerChecks.forEach { assertEarlySelfCheck(it, "isSelfPackage", "clipboard caller check ${it.definingClass}.${it.name}") }
        val signatureChecks = app.methodsWhere {
            it.returnType == "Z" && it.params() == listOf("Landroid/content/Context;", STRING) &&
                "certification failed" in it.strings() && "valid signature : " in it.strings()
        }
        assertTrue(signatureChecks.isNotEmpty(), "provider signature check not found")
        signatureChecks.forEach { assertEarlySelfCheck(it, "isSelf", "signature check ${it.definingClass}.${it.name}") }

        // --- Disable telemetry ---
        val analytics = app.methodsWhere { it.returnType == "Z" && "Tracker is not initialized, status : " in it.strings() }
        assertTrue(analytics.isNotEmpty(), "Samsung Analytics readiness check not found")
        analytics.forEach { assertForcedBoolean(it, false, "Samsung Analytics check ${it.definingClass}.${it.name}") }
        val consent = app.methodsWhere {
            it.returnType == "Z" && it.params().isEmpty() && "canSyncNow=false isSamsungAccountLoggedIn=" in it.strings()
        }
        consent.forEach { assertForcedBoolean(it, false, "Galaxy AI consent sync ${it.definingClass}.${it.name}") }
        val typedText = app.methodsWhere {
            it.returnType == "V" && "[[AiWriter]_DATA_COLLECTION]" in it.strings() && "send data : " in it.strings()
        }
        typedText.forEach { assertReturnsEarlyVoid(it, "typed-text collection ${it.definingClass}.${it.name}") }
        assertReturnsEarlyVoid(byType.getValue(GSIM_LOGGER).method("insertLogData"), "GSIMLogger.insertLogData")
        val versionChecks = app.methodsWhere {
            it.returnType == "I" && it.params() == listOf("Landroid/content/Context;") && "DMA Client is not exist" in it.strings()
        }
        versionChecks.forEach { assertReturnsInt(it, 0, "DiagMon version check ${it.definingClass}.${it.name}") }
        // No lookup of the diagnostics agent's package is left: its name is blanked before getPackageInfo.
        for (method in app.methodsWhere { m -> m.instructions().any { it.str() == "com.sec.android.diagmonagent" } }) {
            val code = method.instructions()
            for (index in code.indices.filter { code[it].str() == "com.sec.android.diagmonagent" }) {
                val next = code.drop(index + 1).firstNotNullOfOrNull { it.call() }
                assertFalse(
                    next?.definingClass == "Landroid/content/pm/PackageManager;" && next.name == "getPackageInfo",
                    "${method.definingClass}.${method.name} still looks up the diagnostics agent",
                )
            }
        }

        // --- Stop remote updates ---
        assertReturnsEarlyVoid(byType.getValue(SCPM_RECEIVER).method("onReceive"), "ScpmReceiver.onReceive")

        // --- No GIF tracking: GIPHY pingbacks and Tenor register return at once while the switch is on ---
        fun assertReturnsNothing(method: Method, label: String) {
            val code = method.instructions()
            assertGate(code, 0, "samsungkeyboard.no_gif_tracking", label)
            assertTrue(
                code[4].opcode == Opcode.RETURN_VOID ||
                    (code[4].opcode in setOf(Opcode.CONST_4, Opcode.CONST_WIDE_16) &&
                        code[5].opcode in setOf(Opcode.RETURN, Opcode.RETURN_OBJECT, Opcode.RETURN_WIDE)),
                "$label does not return at once behind the gate; it continues with ${code[4].opcode}, ${code[5].opcode}",
            )
        }
        val giphyPingbacks = app.methodsWhere { "api_key" in it.strings() && "pingback_id" in it.strings() }
        assertTrue(giphyPingbacks.isNotEmpty(), "GIPHY pingback sender not found")
        giphyPingbacks.forEach { assertReturnsNothing(it, "GIPHY pingback ${it.definingClass}.${it.name}") }
        val tenor = app.methodsWhere { "GRS_TenorRegisterManager" in it.strings() && "url is null" in it.strings() }
        assertTrue(tenor.isNotEmpty(), "Tenor register not found")
        tenor.forEach { assertReturnsNothing(it, "Tenor register ${it.definingClass}.${it.name}") }

        // --- Always incognito: exactly one boolean getter starts with the always_incognito gate, then `return true` ---
        fun Method.returnsTrueBehindGate(): Boolean {
            val code = instructions()
            val literal = code.getOrNull(4) as? com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
            return returnType == "Z" && params().isEmpty() && code.getOrNull(0)?.str() == "samsungkeyboard.always_incognito" &&
                literal != null && literal.opcode == Opcode.CONST_4 && literal.narrowLiteral == 1 && code.getOrNull(5)?.opcode == Opcode.RETURN
        }
        val incognito = app.methodsWhere { m -> m.returnsTrueBehindGate() }
        assertEquals(1, incognito.size, "incognito check candidates: ${incognito.map { "${it.definingClass}.${it.name}" }}")
        assertGate(incognito.single().instructions(), 0, "samsungkeyboard.always_incognito", "Always incognito")
        val flagTests = incognito.single().let { m ->
            m.instructions().any { (it as? WideLiteralInstruction)?.wideLiteral == 0x1000000L } ||
                m.instructions().any { it.call()?.returnType == "Z" }
        }
        assertTrue(flagTests, "the incognito check no longer reads the no-personalized-learning flag or a boolean test")
        // --- Always use GIPHY: every int return of the provider choice goes through Gifs.giphyFirst ---
        val choices = app.methodsWhere { it.returnType == "I" && it.params() == listOf(STRING) && "getGifCp " in it.strings() }
        assertEquals(1, choices.size, "GIF provider choice candidates: ${choices.map { it.name }}")
        val choice = choices.single().instructions()
        val returns = choice.indices.filter { choice[it].opcode == Opcode.RETURN }
        assertTrue(returns.isNotEmpty(), "provider choice has no int return")
        for (index in returns) {
            val register = (choice[index] as OneRegisterInstruction).registerA
            val call = choice[index - 2].call()
            assertTrue(
                call != null && call.definingClass == "${EXT}Gifs;" && call.name == "giphyFirst" &&
                    choice[index - 1].opcode == Opcode.MOVE_RESULT && (choice[index - 1] as OneRegisterInstruction).registerA == register,
                "int return at $index of the provider choice does not go through Gifs.giphyFirst",
            )
        }
        // The copies R8 made (notices) name both providers: their language goes through Gifs.noticeLanguage (English while the Always use GIPHY switch is on) after the cut.
        val notices = app.methodsWhere { m -> "getGifCp " in m.strings() && !(m.returnType == "I" && m.params() == listOf(STRING)) }
        for (notice in notices) {
            val code = notice.instructions()
            val cut = code.indices.single { code[it].call()?.name == "substring" && code[it].call()?.definingClass == STRING }
            assertFilterCall(code, cut + 2, "${EXT}Gifs;", "noticeLanguage", "(Ljava/lang/String;)Ljava/lang/String;",
                "notice ${notice.definingClass}.${notice.name} language", objectResult = true)
        }

        // --- Show GIFs in every region: the CSC switch read goes through Gifs.gifRegion ("enable" while the switch is on) ---
        val cscReaders = app.methodsWhere { CSC_GIF in it.strings() }
        assertTrue(cscReaders.isNotEmpty(), "the GIF region switch reader not found")
        for (reader in cscReaders) {
            val code = reader.instructions()
            for (key in code.indices.filter { code[it].str() == CSC_GIF }) {
                val read = (key + 1 until code.size).first { code[it].call()?.name == "getString" }
                assertEquals(Opcode.MOVE_RESULT_OBJECT, code[read + 1].opcode, "CSC answer is not kept")
                val answer = (code[read + 1] as OneRegisterInstruction).registerA
                val register = assertFilterCall(code, read + 2, "${EXT}Gifs;", "gifRegion", "(Ljava/lang/String;)Ljava/lang/String;",
                    "CSC GIF switch ${reader.definingClass}.${reader.name}", objectResult = true)
                assertEquals(answer, register, "the CSC GIF helper filters another register than the answer")
            }
        }

        // --- Bigger clipboard history: the cap is stored as 200, and an empty unpinned list leaves the enforcer ---
        fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
        val enforcers = app.methodsWhere { m ->
            m.returnType == "V" && m.params().let { it.size == 2 && it[0].startsWith("L") && it[1] == CLIP } && m.name != "<clinit>" && run {
                val names = m.instructions().mapNotNull { it.call() }.filter { it.definingClass == CLIP }.map { it.name }
                names.containsAll(listOf("getOrigin", "getUserId", "getPinned"))
            }
        }
        assertEquals(1, enforcers.size, "clipboard enforcer candidates: ${enforcers.map { "${it.definingClass}.${it.name}" }}")
        val enforcer = enforcers.single()
        val enforcerCode = enforcer.instructions()
        val capField = enforcerCode.firstNotNullOf { ins ->
            ins.field()?.takeIf { ins.opcode == Opcode.SGET && it.type == "I" && it.definingClass != enforcer.definingClass }
        }
        val capClinit = byType.getValue(capField.definingClass).method("<clinit>", emptyList()).instructions()
        val capStores = capClinit.indices.filter { capClinit[it].opcode == Opcode.SPUT && capClinit[it].field()?.name == capField.name }
        assertEquals(1, capStores.size, "stores to the history cap")
        // The stored value goes through Choices.clipboardCap(I)I (the keyboard's own value while no size is chosen).
        // The call goes to a helper in the cap's own class, which passes the Manager's extra size (0 for a preset, here 200)
        // to Choices.clipboardCap(II)I.
        val capRegister = assertFilterCall(capClinit, capStores.single() - 2, capField.definingClass, "morpheHevalClipboardCap", "(I)I", "history cap")
        val capHelper = byType.getValue(capField.definingClass).method("morpheHevalClipboardCap", listOf("I")).instructions()
        assertEquals(Opcode.CONST, capHelper[0].opcode)
        assertEquals(0, (capHelper[0] as NarrowLiteralInstruction).narrowLiteral, "the preset size must pass extra 0")
        assertEquals("${CONTROLS}Choices;->clipboardCap(II)I", capHelper[1].call()!!.key(), "the cap helper does not call Choices.clipboardCap(II)I")
        assertEquals(
            (capClinit[capStores.single()] as OneRegisterInstruction).registerA, capRegister,
            "the cap helper filters another register than the store",
        )
        val getAt = enforcerCode.indexOfFirst { it.call()?.let { c -> c.definingClass == "Ljava/util/ArrayList;" && c.name == "get" } == true }
        val isEmptyCall = enforcerCode[getAt - 3].call()
        assertTrue(
            isEmptyCall != null && isEmptyCall.definingClass == "Ljava/util/ArrayList;" && isEmptyCall.name == "isEmpty",
            "no isEmpty guard before ArrayList.get in the enforcer: $isEmptyCall",
        )
        assertEquals(Opcode.MOVE_RESULT, enforcerCode[getAt - 2].opcode)
        assertEquals(Opcode.IF_NEZ, enforcerCode[getAt - 1].opcode)
        assertEquals(
            (enforcerCode[getAt] as? FiveRegisterInstruction)?.registerC,
            (enforcerCode[getAt - 3] as? RegisterRangeInstruction)?.startRegister,
            "the guard tests another list than ArrayList.get reads",
        )

        // --- Clipboard columns (enabled in this test; default 3 is the switch that starts on): the getter asks Choices first, -1 goes on ---
        val colCounts = app.methodsWhere { it.definingClass == CLIPBOARD_VIEW_MODEL && it.name == "getColCount" }
        assertEquals(1, colCounts.size)
        val colCode = colCounts.single().instructions()
        assertEquals(Opcode.INVOKE_STATIC, colCode[0].opcode)
        assertEquals("${CONTROLS}Choices;->clipboardColumns()I", colCode[0].call()!!.let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" })
        assertEquals(Opcode.MOVE_RESULT, colCode[1].opcode)
        assertEquals(Opcode.IF_LTZ, colCode[2].opcode, "no negative-means-stock branch in getColCount")
        assertEquals(Opcode.RETURN, colCode[3].opcode)
        assertEquals((colCode[1] as OneRegisterInstruction).registerA, (colCode[3] as OneRegisterInstruction).registerA)
        assertEquals(2, (colCode[2] as OffsetInstruction).codeOffset - 1, "the branch does not skip exactly the return")

        // --- Swipe cursor control, one-handed keyboard, key vibration: each flag store goes through a gated (Z)Z helper ---
        val featuresClinits = app.methodsWhere { m ->
            m.name == "<clinit>" && FLOATING_CURSOR in m.strings() && FLOATING_ONEHAND in m.strings()
        }
        assertEquals(1, featuresClinits.size, "floating features initializer candidates")
        val features = featuresClinits.single()
        val featureCode = features.instructions()
        // Each store goes through a (Z)Z helper of the features class; the helper returns its argument while the switch is
        // off (the gate at its start jumps to `return p0`) and true while it is on.
        val featuresClass = byType.getValue(features.definingClass)
        fun assertGatedTrueStore(store: Int, helperName: String, id: String, label: String) {
            assertEquals(Opcode.SPUT_BOOLEAN, featureCode[store].opcode, "$label is not a boolean store")
            val register = assertFilterCall(featureCode, store - 2, features.definingClass, helperName, "(Z)Z", label)
            assertEquals(
                (featureCode[store] as OneRegisterInstruction).registerA, register,
                "$label helper filters another register than the store",
            )
            val helper = featuresClass.methods.single { it.name == helperName }
            assertEquals(listOf("Z"), helper.params(), "$label helper parameters")
            val helperCode = helper.instructions()
            assertGate(helperCode, 0, id, "$label helper")
            assertEquals(Opcode.CONST_4, helperCode[4].opcode, "$label helper does not load true")
            assertEquals(1, (helperCode[4] as NarrowLiteralInstruction).narrowLiteral, "$label helper does not load true")
            assertEquals(Opcode.RETURN, helperCode[5].opcode)
            assertEquals(Opcode.RETURN, helperCode[6].opcode, "$label helper has no `return p0` stock path")
            assertEquals(helper.implementation!!.registerCount - 1, (helperCode[6] as OneRegisterInstruction).registerA, "$label helper stock path is not p0")
        }
        for ((key, window, helper, id) in listOf(
            Quad(FLOATING_CURSOR, 8, "morpheHevalSwipeCursor", "samsungkeyboard.swipe_cursor"),
            Quad(FLOATING_ONEHAND, 16, "morpheHevalOneHanded", "samsungkeyboard.one_handed"),
        )) {
            val at = featureCode.indexOfFirst { it.str() == key }
            val store = (at + 1..at + window + 2).first { featureCode[it].opcode == Opcode.SPUT_BOOLEAN }
            assertGatedTrueStore(store, helper, id, key)
        }
        val gates = app.methodsWhere { it.returnType == "V" && it.params() == listOf("I") && "vib is off" in it.strings() }
        assertEquals(1, gates.size, "key vibration gate candidates")
        val vibFlag = gates.single().instructions().firstNotNullOf { ins -> ins.field()?.takeIf { ins.opcode == Opcode.SGET_BOOLEAN } }
        assertEquals(features.definingClass, vibFlag.definingClass, "the vibration flag is not set by the features initializer")
        val vibStores = featureCode.indices.filter { featureCode[it].opcode == Opcode.SPUT_BOOLEAN && featureCode[it].field()?.name == vibFlag.name }
        assertEquals(1, vibStores.size, "stores to the vibration flag")
        assertGatedTrueStore(vibStores.single(), "morpheHevalKeyVibration", "samsungkeyboard.key_vibration", "key vibration flag")

        // --- Toolbar item count (enabled in this test; default 8): the 7/8 constants stay, every int return goes through Choices.toolbarItems ---
        val toolbarLoader = app.methodsWhere { "loadUserSet" in it.strings() && "edit_toolbar" in it.strings() && it.returnType == "V" }
        assertEquals(1, toolbarLoader.size, "toolbar loader candidates")
        val loaderCode = toolbarLoader.single().instructions()
        val loaderTypes = loaderCode.mapNotNull { it.field() }.filter { it.definingClass == toolbarLoader.single().definingClass }.map { it.type }.toSet()
        val loaderCalls = loaderCode.mapNotNull { it.call() }.filter { it.returnType == "I" && it.parameterTypes.isEmpty() }.map { it.name }.toSet()
        val caps = app.methodsWhere { m ->
            m.definingClass in loaderTypes && m.name in loaderCalls &&
                m.returnType == "I" && m.params().isEmpty() && (m.accessFlags and 0x11) == 0x11 &&
                m.instructions().let { code ->
                    code.any { it.opcode == Opcode.PACKED_SWITCH } &&
                        code.any { it.opcode == Opcode.CONST_16 && (it as NarrowLiteralInstruction).narrowLiteral == 8 } &&
                        code.any { it.opcode == Opcode.CONST_4 && (it as NarrowLiteralInstruction).narrowLiteral == 4 }
                }
        }
        assertEquals(1, caps.size, "toolbar cap candidates: ${caps.map { "${it.definingClass}.${it.name}" }}")
        val capCode = caps.single().instructions()
        val smallConsts = capCode.filter { it.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) }
            .map { it as NarrowLiteralInstruction }
        assertTrue(smallConsts.count { it.narrowLiteral == 7 || it.narrowLiteral == 8 } >= 5, "the keyboard's own 7/8 constants are gone from the toolbar cap")
        assertTrue(smallConsts.any { it.opcode == Opcode.CONST_4 && it.narrowLiteral == 4 }, "the small-mode 4 is gone from the toolbar cap")
        // Every int return of the cap is preceded by Choices.toolbarItems on the returned register.
        val capReturns = capCode.indices.filter { capCode[it].opcode == Opcode.RETURN }
        assertTrue(capReturns.isNotEmpty(), "the toolbar cap has no int return")
        for (index in capReturns) {
            val register = assertFilterCall(capCode, index - 2, "${CONTROLS}Choices;", "toolbarItems", "(I)I", "toolbar cap return at $index")
            assertEquals((capCode[index] as OneRegisterInstruction).registerA, register, "toolbar helper filters another register than the return at $index")
        }
        // The loader that reads the cap through the interface still finds a method of that name.
        assertTrue(
            loaderCode.any { it.opcode == Opcode.INVOKE_INTERFACE && it.call()?.name == caps.single().name && it.call()?.returnType == "I" },
            "the toolbar loader does not call the cap by name",
        )

        // --- Autofill in any field: the text length reads 0 right after its move-result, and the branch tests that register ---
        val inlineSuggestions = app.methodsWhere {
            it.returnType == "V" && it.params() == listOf("Landroid/view/inputmethod/InlineSuggestionsResponse;") &&
                "Cursor is not at first position, skipping suggestions" in it.strings()
        }
        assertEquals(1, inlineSuggestions.size, "inline suggestions candidates")
        val inlineCode = inlineSuggestions.single().instructions()
        val lengthAt = inlineCode.indexOfFirst { it.call()?.let { c -> c.definingClass == "Ljava/lang/CharSequence;" && c.name == "length" } == true }
        assertTrue(lengthAt >= 0, "no CharSequence.length() in the inline suggestions method")
        assertEquals(Opcode.MOVE_RESULT, inlineCode[lengthAt + 1].opcode)
        val lengthRegister = (inlineCode[lengthAt + 1] as OneRegisterInstruction).registerA
        // The length goes through an (I)I helper of the method's class: it returns the length while the switch is off, 0 while on.
        val autofillClass = inlineSuggestions.single().definingClass
        val filtered = assertFilterCall(inlineCode, lengthAt + 2, autofillClass, "morpheHevalAutofillLength", "(I)I", "autofill length")
        assertEquals(lengthRegister, filtered, "the length helper filters another register than the length")
        val lez = inlineCode[lengthAt + 4]
        assertEquals(Opcode.IF_LEZ, lez.opcode, "the length branch does not follow the helper")
        assertEquals(lengthRegister, (lez as OneRegisterInstruction).registerA, "the branch tests another register than the length")
        assertTrue((lengthAt + 5..lengthAt + 7).any { inlineCode[it].str() == "Cursor is not at first position, skipping suggestions" }, "the skip log does not follow the branch")
        val lengthHelper = byType.getValue(autofillClass).methods.single { it.name == "morpheHevalAutofillLength" }
        val lengthHelperCode = lengthHelper.instructions()
        assertGate(lengthHelperCode, 0, "samsungkeyboard.autofill_any_field", "autofill length helper")
        assertEquals(Opcode.CONST_4, lengthHelperCode[4].opcode)
        assertEquals(0, (lengthHelperCode[4] as NarrowLiteralInstruction).narrowLiteral, "the autofill helper does not load 0")
        assertEquals(Opcode.RETURN, lengthHelperCode[5].opcode)
        assertEquals(Opcode.RETURN, lengthHelperCode[6].opcode, "the autofill helper has no `return p0` stock path")

        // --- Change package name: the authority and permission literals follow the manifest ---
        val manifestText = workDir.walkTopDown().filter { it.isFile && it.name == "AndroidManifest.xml" }
            .map { it.readText() }.firstOrNull { it.contains("package=\"$NEW_PKG\"") }
            ?: error("no decoded AndroidManifest.xml of the renamed package under $workDir")
        val manifest = xml(manifestText)
        assertEquals(NEW_PKG, manifest.getAttribute("package"))
        assertFalse(manifest.hasAttribute("android:sharedUserId"), "sharedUserId is still in the manifest")
        assertFalse(manifest.hasAttribute("coreApp"), "coreApp is still in the manifest")
        val application = manifest.all("application").single()
        val authorities = manifest.all("provider").filter { it.parentNode == application }
            .flatMap { it.getAttribute("android:authorities").split(';') }
        assertTrue(authorities.size >= 17, "only ${authorities.size} provider authorities")
        assertTrue(authorities.all { it.contains(NEW_PKG) },
            "an authority was not moved: ${authorities.filterNot { it.contains(NEW_PKG) }}")
        val permissions = manifest.all("permission").map { it.getAttribute("android:name") }
        assertTrue(permissions.size >= 11 && permissions.all { it.contains(NEW_PKG) }, "permissions not moved: $permissions")
        val literals = app.flatMap { c -> c.methods.flatMap { m -> m.instructions().mapNotNull { it.str() } } }.toSet()
        assertTrue(authorities.count { it in literals } >= 3, "few bare authority literals follow the manifest: ${authorities.filter { it in literals }}")
        val movedUris = literals.filter { it.startsWith("content://$NEW_PKG.") }
        assertTrue(movedUris.size >= 15, "few content:// literals follow the manifest: $movedUris")
        val oldAuthorities = authorities.filter { it.startsWith("$NEW_PKG.") }.map { PKG + it.removePrefix(NEW_PKG) }
        assertTrue(oldAuthorities.none { it in literals }, "old authority literals left: ${oldAuthorities.filter { it in literals }}")
        assertTrue(literals.none { it.startsWith("content://$PKG.") }, "old content:// authority literals left")

        // --- Patch settings manifest: the provider's authority moved with the package, the activity is not exported ---
        val hevalProvider = manifest.all("provider").single { it.getAttribute("android:name") == "app.template.extension.hevalcontrols.InitProvider" }
        assertEquals("$NEW_PKG.hevalcontrols", hevalProvider.getAttribute("android:authorities"), "Patch settings authority not moved with the package")
        assertEquals("false", hevalProvider.getAttribute("android:exported"))
        assertEquals("1000", hevalProvider.getAttribute("android:initOrder"))
        assertTrue(hevalProvider.parentNode == application, "the Patch settings provider is not under <application>")
        val hevalActivity = manifest.all("activity").single { it.getAttribute("android:name") == "app.template.extension.hevalcontrols.ui.HevalControlsActivity" }
        assertEquals("false", hevalActivity.getAttribute("android:exported"))
        assertTrue("$PKG.hevalcontrols" !in authorities, "the stock-package authority is left in the manifest")

        // --- Remove internet permission, optional libraries, app name ---
        assertTrue(
            manifest.all("uses-permission").none { it.getAttribute("android:name") == "android.permission.INTERNET" },
            "INTERNET permission is still declared",
        )
        val libraries = manifest.all("uses-library") + manifest.all("uses-native-library")
        assertTrue(libraries.isNotEmpty() && libraries.all { it.getAttribute("android:required") == "false" }, "a library is still required")
        val labels = manifest.all("*").map { it.getAttribute("android:label") }.filter { it.isNotEmpty() }
        assertTrue("@string/app_name" !in labels && "@string/patched_keyboard_name" in labels, "manifest labels not repointed: $labels")
        val strings = workDir.walkTopDown().filter { it.isFile && it.name == "strings.xml" && it.parentFile.name == "values" }
            .map { it.readText() }.firstOrNull { it.contains("patched_keyboard_name") }
            ?: error("no decoded res/values/strings.xml with patched_keyboard_name under $workDir")
        assertTrue(strings.contains(">Samsung Keyboard (Heval)<"), "app name string is not the default")

        // --- SPR icons are converted: no SPR file is left in the decoded drawables ---
        val drawables = workDir.walkTopDown().filter { it.isFile && it.parentFile.name.startsWith("drawable") }.toList()
        assertTrue(drawables.any { it.name.endsWith(".xml") && it.readText().contains("<vector") }, "no converted vector drawable found")
        val spr = byteArrayOf('S'.code.toByte(), 'P'.code.toByte(), 'R'.code.toByte(), 0)
        assertTrue(drawables.none { f -> f.length() >= 4 && f.inputStream().use { it.readNBytes(4) }.contentEquals(spr) }, "an SPR drawable is left")
    }
}
