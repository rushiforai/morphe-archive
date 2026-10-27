import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "org.mozilla.focus"
private const val EXTENSION = "Lapp/template/extension/firefoxfocus/FocusAddons;"
private const val EXTENSION_PACKAGE = "Lapp/template/extension/firefoxfocus/"
private const val CONTROLLER = "Lorg/mozilla/geckoview/WebExtensionController;"
private const val PROMPT_DELEGATE = "Lorg/mozilla/geckoview/WebExtensionController\$PromptDelegate;"
private const val ACTION = "Lorg/mozilla/geckoview/WebExtension\$Action;"
private const val GECKO_RESULT = "Lorg/mozilla/geckoview/GeckoResult;"
private const val FOCUS_APPLICATION = "Lorg/mozilla/focus/FocusApplication;"
private const val MENU_BUILDER = "Lmozilla/components/browser/menu/WebExtensionBrowserMenuBuilder;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val ADD_TAB_USE_CASE = "Lmozilla/components/feature/tabs/TabsUseCases\$AddNewTabUseCase;"

class FirefoxFocusAddonsSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun Instruction.fieldRef(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
    private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)
    private fun MethodReference.params(): List<String> = parameterTypes.map(CharSequence::toString)

    /** First instruction is invoke-static/range {p[first] .. p[first + count - 1]} EXTENSION->name. */
    private fun assertRangeHookAtEntry(method: Method, name: String, firstParam: Int, count: Int, label: String): List<Instruction> {
        val insns = method.instructions()
        val implementation = method.implementation!!
        val ins = method.params().sumOf { if (it == "J" || it == "D") 2L else 1L }.toInt() +
            if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
        val p0 = implementation.registerCount - ins
        val call = insns.firstOrNull()?.methodRef()
        assertTrue(
            insns.firstOrNull()?.opcode == Opcode.INVOKE_STATIC_RANGE && call?.definingClass == EXTENSION && call.name == name,
            "$label does not start with invoke-static/range $EXTENSION->$name: ${insns.firstOrNull()?.opcode} $call",
        )
        val range = insns.first() as RegisterRangeInstruction
        assertEquals(p0 + firstParam, range.startRegister, "$label: $name does not start at p$firstParam (v${p0 + firstParam})")
        assertEquals(count, range.registerCount, "$label: $name register count")
        return insns
    }

    @Test
    fun `Add-on support wraps the prompt delegate, tracks activities, forces the Extensions menu and hosts popups`() {
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
            patchNames = setOf("Add-on support"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun classDef(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes")

        // The extension is merged: the four public static entry points and its helper classes.
        val extension = classDef(EXTENSION)
        val entryPoints = mapOf(
            "onApplicationCreate" to (listOf("Landroid/app/Application;") to "V"),
            "wrapPromptDelegate" to (listOf(CONTROLLER, PROMPT_DELEGATE) to PROMPT_DELEGATE),
            "managerCallback" to (emptyList<String>() to FUNCTION0),
            "onOpenPopup" to (listOf(GECKO_RESULT) to "V"),
        )
        for ((name, signature) in entryPoints) {
            val method = extension.methods.singleOrNull { it.name == name } ?: error("$EXTENSION has no single $name")
            assertTrue(
                AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                    method.params() == signature.first && method.returnType == signature.second,
                "$EXTENSION->$name is not public static ${signature.second}(${signature.first.joinToString("")})",
            )
        }
        val promptDelegate = classDef("${EXTENSION_PACKAGE}AddonPromptDelegate;")
        assertTrue(PROMPT_DELEGATE in promptDelegate.interfaces, "AddonPromptDelegate does not implement PromptDelegate")
        for (name in listOf("onInstallPromptRequest", "onUpdatePrompt", "onOptionalPrompt")) {
            assertTrue(promptDelegate.methods.any { it.name == name && it.implementation != null }, "AddonPromptDelegate has no $name")
        }
        val callback = classDef("${EXTENSION_PACKAGE}FocusAddons\$ManagerCallback;")
        assertTrue(FUNCTION0 in callback.interfaces, "ManagerCallback does not implement Function0")
        assertTrue(
            callback.methods.any { it.name == "invoke" && it.params().isEmpty() && it.returnType == "Ljava/lang/Object;" },
            "ManagerCallback has no invoke()Ljava/lang/Object;",
        )
        for (helper in listOf("AddonsManager;", "GeckoViewDialog;")) classDef("$EXTENSION_PACKAGE$helper")
        // The compile-only stubs are not merged over Focus's own classes.
        val unit = classDef("Lkotlin/Unit;")
        assertTrue(unit.methods.count() > 1, "kotlin.Unit looks like the extension stub")

        // 1. setPromptDelegate(p1): p1 = wrapPromptDelegate(p0, p1) before the original body.
        val setPromptDelegate = classDef(CONTROLLER).method("setPromptDelegate", listOf(PROMPT_DELEGATE))
        val prompt = assertRangeHookAtEntry(setPromptDelegate, "wrapPromptDelegate", 0, 2, "setPromptDelegate")
        val p1 = setPromptDelegate.implementation!!.registerCount - 1
        assertTrue(
            prompt[1].opcode == Opcode.MOVE_RESULT_OBJECT && (prompt[1] as OneRegisterInstruction).registerA == p1,
            "setPromptDelegate: the wrapped delegate is not moved into p1 (v$p1)",
        )
        assertTrue(
            prompt.drop(2).any { it.opcode == Opcode.IPUT_OBJECT && it.fieldRef()?.name == "mPromptDelegate" },
            "setPromptDelegate no longer stores mPromptDelegate",
        )

        // 2. FocusApplication.onCreate() starts with onApplicationCreate(this).
        val onCreate = classDef(FOCUS_APPLICATION).method("onCreate", emptyList())
        assertRangeHookAtEntry(onCreate, "onApplicationCreate", 0, 1, "FocusApplication.onCreate")

        // 3. Every WebExtensionBrowserMenuBuilder constructor writing showAddonsInMenu or
        // onAddonsManagerTapped rewrites it right after: true, and the extension's callback.
        val constructors = classDef(MENU_BUILDER).methods.filter { it.name == "<init>" && it.implementation != null }
        var patchedShow = 0
        var patchedCallback = 0
        for (constructor in constructors) {
            val insns = constructor.instructions()
            val label = "$MENU_BUILDER-><init>(${constructor.params().joinToString("")})"
            for ((field, opcode) in listOf("showAddonsInMenu" to Opcode.IPUT_BOOLEAN, "onAddonsManagerTapped" to Opcode.IPUT_OBJECT)) {
                val writes = insns.indices.filter {
                    insns[it].opcode == opcode && insns[it].fieldRef()?.let { ref ->
                        ref.definingClass == MENU_BUILDER && ref.name == field
                    } == true
                }
                if (writes.isEmpty()) continue
                assertEquals(0, writes.size % 2, "$label: $field writes are not original + forced pairs: $writes")
                for (pair in writes.chunked(2)) {
                    val (original, forced) = pair
                    val value = (insns[forced] as TwoRegisterInstruction).registerA
                    if (field == "showAddonsInMenu") {
                        assertEquals(original + 2, forced, "$label: forced showAddonsInMenu does not follow the original write")
                        val const = insns[original + 1]
                        assertTrue(
                            const.opcode == Opcode.CONST_4 && (const as OneRegisterInstruction).registerA == value &&
                                (const as NarrowLiteralInstruction).narrowLiteral == 1,
                            "$label: showAddonsInMenu is not forced to true",
                        )
                        patchedShow++
                    } else {
                        assertEquals(original + 3, forced, "$label: forced onAddonsManagerTapped does not follow the original write")
                        val call = insns[original + 1].methodRef()
                        val move = insns[original + 2]
                        assertTrue(
                            insns[original + 1].opcode == Opcode.INVOKE_STATIC && call?.definingClass == EXTENSION &&
                                call.name == "managerCallback" && call.returnType == FUNCTION0 &&
                                move.opcode == Opcode.MOVE_RESULT_OBJECT && (move as OneRegisterInstruction).registerA == value,
                            "$label: onAddonsManagerTapped is not replaced with managerCallback()",
                        )
                        patchedCallback++
                    }
                }
            }
        }
        assertTrue(patchedShow > 0 && patchedCallback > 0, "no menu builder constructor was patched ($patchedShow, $patchedCallback)")
        // 158.0: R8 merged the call sites into <init>(List, BrowserStore, I).
        assertTrue(
            constructors.any {
                it.params() == listOf("Ljava/util/List;", "Lmozilla/components/browser/state/store/BrowserStore;", "I")
            },
            "the 158.0 <init>(List, BrowserStore, I) constructor is gone",
        )

        // 4. WebExtension$Action.openPopup(GeckoResult, String) hands p1 to onOpenPopup first and
        // keeps its body (the popup flag + loadUri listener).
        val openPopup = classDef(ACTION).method("openPopup", listOf(GECKO_RESULT, "Ljava/lang/String;"))
        val popup = assertRangeHookAtEntry(openPopup, "onOpenPopup", 1, 1, "Action.openPopup")
        assertTrue(
            popup.drop(1).any { it.methodRef()?.let { ref -> ref.definingClass == GECKO_RESULT && ref.name == "accept" } == true },
            "Action.openPopup no longer attaches its own listener",
        )

        // The extension reaches these by reflection and degrades gracefully when they are gone;
        // check them here so an app update that moves them is noticed.
        val addTabDefault = classDef(ADD_TAB_USE_CASE).methods.singleOrNull { it.name == "invoke\$default" }
            ?: error("$ADD_TAB_USE_CASE has no single invoke\$default")
        assertEquals(
            listOf(
                ADD_TAB_USE_CASE, "Ljava/lang/String;", "Z", "Ljava/lang/String;",
                "Lmozilla/components/concept/engine/EngineSession\$LoadUrlFlags;", "Ljava/lang/String;",
                "Lmozilla/components/concept/engine/EngineSession;",
                "Lmozilla/components/browser/state/state/SessionState\$Source;", "Ljava/lang/String;", "Z",
                "Ljava/lang/String;", "Ljava/lang/String;", "I",
            ),
            addTabDefault.params(),
            "AddNewTabUseCase.invoke\$default signature",
        )
        assertEquals("Ljava/lang/String;", addTabDefault.returnType, "AddNewTabUseCase.invoke\$default return type")
        classDef(FOCUS_APPLICATION).method("getComponents", emptyList())
        classDef("Lorg/mozilla/focus/Components;").method("getTabsUseCases", emptyList())
        classDef("Lorg/mozilla/focus/Components;").method("getAppStore", emptyList())
        classDef("Lmozilla/components/feature/tabs/TabsUseCases;").method("getAddTab", emptyList())
        classDef("Lorg/mozilla/focus/state/AppAction\$OpenTab;").method("<init>", listOf("Ljava/lang/String;"))
        classDef("Lmozilla/components/lib/state/Store;").method("dispatch", listOf("Lmozilla/components/lib/state/Action;"))
        assertTrue(
            classDef(CONTROLLER).fields.any { it.name == "mDebuggerDelegate" },
            "WebExtensionController.mDebuggerDelegate is gone",
        )
        assertTrue(
            classDef("Lorg/mozilla/geckoview/GeckoRuntime;").fields.any {
                it.name == "sRuntime" && AccessFlags.STATIC.isSet(it.accessFlags)
            },
            "GeckoRuntime.sRuntime is gone",
        )
        val geckoView = classDef("Lorg/mozilla/geckoview/GeckoView;")
        geckoView.method("<init>", listOf("Landroid/content/Context;"))
        geckoView.method("setSession", listOf("Lorg/mozilla/geckoview/GeckoSession;"))
        geckoView.method("releaseSession", emptyList())

        // The extension is compiled against stubs of GeckoView and kotlin. Every member it names
        // directly must exist in Focus with that exact descriptor (declared on the class or a
        // supertype), or the call fails at runtime with NoSuchMethodError / NoSuchFieldError.
        fun declares(owner: String, matches: (ClassDef) -> Boolean): Boolean {
            val seen = mutableSetOf<String>()
            val queue = ArrayDeque(listOf(owner))
            while (queue.isNotEmpty()) {
                val def = byType[queue.removeFirst()]?.takeIf { seen.add(it.type) } ?: continue
                if (matches(def)) return true
                def.superclass?.let(queue::add)
                queue.addAll(def.interfaces)
            }
            return false
        }
        fun hasMethod(owner: String, name: String, params: List<String>, returnType: String) =
            declares(owner) { def -> def.methods.any { it.name == name && it.params() == params && it.returnType == returnType } }
        fun MethodReference.descriptor() = "$definingClass->$name(${params().joinToString("")})$returnType"
        val stubbed = listOf("Lorg/mozilla/geckoview/", "Lkotlin/")
        fun isStubbed(type: String) = stubbed.any { type.startsWith(it) }
        val extensionClasses = classes.filter { it.type.startsWith(EXTENSION_PACKAGE) }
        val referencedMethods = mutableSetOf<String>()
        for (def in extensionClasses) {
            for (type in listOfNotNull(def.superclass) + def.interfaces) {
                if (isStubbed(type)) classDef(type)
            }
            for (insn in def.methods.flatMap { it.instructions() }) {
                when (val ref = (insn as? ReferenceInstruction)?.reference) {
                    is MethodReference -> if (isStubbed(ref.definingClass)) {
                        referencedMethods += ref.descriptor()
                        assertTrue(
                            hasMethod(ref.definingClass, ref.name, ref.params(), ref.returnType),
                            "${def.type} calls ${ref.descriptor()}, which Focus does not have",
                        )
                    }
                    is FieldReference -> if (isStubbed(ref.definingClass)) {
                        assertTrue(
                            declares(ref.definingClass) { owner -> owner.fields.any { it.name == ref.name && it.type == ref.type } },
                            "${def.type} reads ${ref.definingClass}->${ref.name}:${ref.type}, which Focus does not have",
                        )
                    }
                    is TypeReference -> if (isStubbed(ref.type)) classDef(ref.type)
                    else -> {}
                }
            }
        }
        // The members named in the review, by exact descriptor: the extension calls them and Focus has them.
        val webExtension = "Lorg/mozilla/geckoview/WebExtension;"
        val promptArgs = listOf(webExtension, "[Ljava/lang/String;", "[Ljava/lang/String;", "[Ljava/lang/String;")
        val required = listOf(
            "$CONTROLLER->install(Ljava/lang/String;Ljava/lang/String;)$GECKO_RESULT",
            "$CONTROLLER->enable(${webExtension}I)$GECKO_RESULT",
            "$CONTROLLER->disable(${webExtension}I)$GECKO_RESULT",
            "Lorg/mozilla/geckoview/WebExtension\$PermissionPromptResponse;-><init>" +
                "(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V",
        )
        for (descriptor in required) {
            assertTrue(descriptor in referencedMethods, "the extension no longer calls $descriptor")
        }
        // GeckoView calls the prompt delegate through the interface: AddonPromptDelegate must
        // override the three 158.0 methods with their exact descriptors.
        val focusPromptDelegate = classDef(PROMPT_DELEGATE)
        for (name in listOf("onInstallPromptRequest", "onUpdatePrompt", "onOptionalPrompt")) {
            assertTrue(
                focusPromptDelegate.methods.any { it.name == name && it.params() == promptArgs && it.returnType == GECKO_RESULT },
                "$PROMPT_DELEGATE has no $name(${promptArgs.joinToString("")})$GECKO_RESULT",
            )
            assertTrue(
                promptDelegate.methods.any {
                    it.name == name && it.params() == promptArgs && it.returnType == GECKO_RESULT && it.implementation != null
                },
                "AddonPromptDelegate does not override $name(${promptArgs.joinToString("")})$GECKO_RESULT",
            )
        }
        // javac inlines the stubs' compile-time constants: they must still have the stub's value.
        fun constant(type: String, name: String) =
            classDef(type).fields.singleOrNull { it.name == name && AccessFlags.STATIC.isSet(it.accessFlags) }?.initialValue
        assertEquals(
            "manager",
            (constant(CONTROLLER, "INSTALLATION_METHOD_MANAGER") as? StringEncodedValue)?.value,
            "WebExtensionController.INSTALLATION_METHOD_MANAGER",
        )
        assertEquals(
            1,
            (constant("Lorg/mozilla/geckoview/WebExtensionController\$EnableSource;", "USER") as? IntEncodedValue)?.value,
            "WebExtensionController.EnableSource.USER",
        )
    }
}
