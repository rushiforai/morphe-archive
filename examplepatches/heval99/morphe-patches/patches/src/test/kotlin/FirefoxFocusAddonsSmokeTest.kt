import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
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
private const val BROWSER_MENU = "Lorg/mozilla/focus/menu/browser/BrowserMenu;"
private const val MENU_MIDDLEWARE = "Lorg/mozilla/focus/menu/MenuMiddleware;"
private const val BROWSER_STATE = "Lmozilla/components/browser/state/state/BrowserState;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val COMPOSE_MENU = "Lmozilla/components/compose/menu/"
private const val TEXT = "Lmozilla/components/compose/base/text/Text;"
private const val FOCUS_MENU_ITEM = "Lorg/mozilla/focus/menu/ToolbarMenu\$FocusMenuItem;"
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
    fun `Add-on support wraps the prompt delegate, tracks activities, adds the menu entries and hosts popups`() {
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
            patchNames = setOf("Add-on support"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun classDef(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes")

        // The extension is merged: the five public static entry points and its helper classes.
        val extension = classDef(EXTENSION)
        val entryPoints = mapOf(
            "onApplicationCreate" to (listOf("Landroid/app/Application;") to "V"),
            "wrapPromptDelegate" to (listOf(CONTROLLER, PROMPT_DELEGATE) to PROMPT_DELEGATE),
            "addMenuItems" to (listOf("Ljava/util/List;", "Ljava/lang/Object;") to "V"),
            "onMenuAction" to (listOf("Ljava/lang/Object;") to "V"),
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
        val tap = classDef("${EXTENSION_PACKAGE}AddonsMenu\$Tap;")
        assertTrue("Ljava/lang/reflect/InvocationHandler;" in tap.interfaces, "AddonsMenu\$Tap is not an InvocationHandler")
        for (helper in listOf("AddonsManager;", "GeckoViewDialog;", "AddonsMenu;", "AddonsMenu\$Api;")) {
            classDef("$EXTENSION_PACKAGE$helper")
        }
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

        // 3. BrowserMenu.menuGroupsFor(BrowserState, Drawable): every return-object vR is preceded by
        // move-object/from16 vS, vR; move-object/from16 vS+1, p1; invoke-static/range {vS .. vS+1}
        // addMenuItems, and the hook carries the return's branch labels (the loop exit jumps there).
        val menuGroupsFor = classDef(BROWSER_MENU).method("menuGroupsFor", listOf(BROWSER_STATE, "Landroid/graphics/drawable/Drawable;"))
        val menuInsns = menuGroupsFor.instructions()
        val stateRegister = menuGroupsFor.implementation!!.registerCount - 2
        val returns = menuInsns.indices.filter { menuInsns[it].opcode == Opcode.RETURN_OBJECT }
        assertTrue(returns.isNotEmpty(), "BrowserMenu.menuGroupsFor has no return-object")
        for (index in returns) {
            val result = (menuInsns[index] as OneRegisterInstruction).registerA
            val call = menuInsns[index - 1]
            val ref = call.methodRef()
            assertTrue(
                call.opcode == Opcode.INVOKE_STATIC_RANGE && ref?.definingClass == EXTENSION && ref.name == "addMenuItems" &&
                    ref.params() == listOf("Ljava/util/List;", "Ljava/lang/Object;"),
                "menuGroupsFor return $index is not preceded by $EXTENSION->addMenuItems(List, Object): ${call.opcode} $ref",
            )
            val range = call as RegisterRangeInstruction
            assertEquals(2, range.registerCount, "menuGroupsFor: addMenuItems register count")
            val scratch = range.startRegister
            for ((offset, source, what) in listOf(Triple(3, result, "the returned list"), Triple(2, stateRegister, "p1 (the BrowserState)"))) {
                val move = menuInsns[index - offset]
                assertTrue(
                    move.opcode == Opcode.MOVE_OBJECT_FROM16 && (move as TwoRegisterInstruction).registerB == source &&
                        move.registerA == scratch + (3 - offset),
                    "menuGroupsFor: addMenuItems does not get $what in v${scratch + 3 - offset}",
                )
            }
        }
        // p1 is still the BrowserState at the return: nothing in the method writes it.
        for (instruction in menuInsns) {
            if (!instruction.opcode.setsRegister() || instruction !is OneRegisterInstruction) continue
            val wide = instruction.opcode.setsWideRegister() && instruction.registerA + 1 == stateRegister
            assertTrue(
                instruction.registerA != stateRegister && !wide,
                "menuGroupsFor writes p1 (v$stateRegister): ${instruction.opcode}",
            )
        }
        // The entries go in front of the "settings" row.
        assertTrue(
            menuInsns.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "settings" },
            "menuGroupsFor no longer names the \"settings\" row",
        )

        // 4. MenuMiddleware.invoke(store, next, action) starts with onMenuAction(p3).
        val middleware = classDef(MENU_MIDDLEWARE).methods.single {
            it.name == "invoke" && it.params().size == 3 && it.implementation != null
        }
        assertRangeHookAtEntry(middleware, "onMenuAction", 3, 1, "MenuMiddleware.invoke")

        // AddonsMenu.Api reaches these by reflection and leaves the menu alone when they are gone;
        // check them here so an app update that moves them is noticed.
        fun publicField(type: String, name: String, static: Boolean = false) = assertTrue(
            classDef(type).fields.any {
                it.name == name && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static
            },
            "$type has no public${if (static) " static" else ""} field $name",
        )
        fun publicMethod(type: String, name: String, params: List<String>) = assertTrue(
            AccessFlags.PUBLIC.isSet(classDef(type).method(name, params).accessFlags),
            "$type->$name(${params.joinToString("")}) is not public",
        )
        val menuEvent = "${COMPOSE_MENU}store/MenuEvent;"
        val menuItemIcon = "${COMPOSE_MENU}ui/MenuItemIcon;"
        val menuItemState = "${COMPOSE_MENU}ui/MenuItemState;"
        assertTrue(
            classDef("${COMPOSE_MENU}data/StandardMenuItem;").methods.any {
                it.name == "<init>" && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
                    it.params().containsAll(listOf(TEXT, menuEvent, menuItemIcon, menuItemState))
            },
            "StandardMenuItem has no public constructor taking Text, MenuEvent, MenuItemIcon and MenuItemState",
        )
        publicMethod("Lmozilla/components/compose/base/text/Text\$String;", "<init>", listOf("Ljava/lang/String;"))
        publicMethod("${COMPOSE_MENU}ui/MenuItemIconDrawable;", "<init>", listOf("Landroid/graphics/drawable/Drawable;"))
        publicField(menuItemState, "DEFAULT", static = true)
        publicField(menuItemState, "DISABLED", static = true)
        publicMethod("${COMPOSE_MENU}data/MenuItemsGroup;", "getId", emptyList())
        publicMethod("${COMPOSE_MENU}data/MenuItemsGroup\$Row;", "<init>", listOf("Ljava/lang/String;", "Ljava/util/List;"))
        assertTrue(AccessFlags.INTERFACE.isSet(classDef(FOCUS_MENU_ITEM).accessFlags), "$FOCUS_MENU_ITEM is not an interface")
        publicMethod("Lorg/mozilla/focus/menu/MenuItemTapped;", "<init>", listOf(FOCUS_MENU_ITEM))
        publicField("Lorg/mozilla/focus/menu/MenuItemTapped;", "item")
        publicField(BROWSER_STATE, "extensions")
        assertTrue(
            classDef("Lmozilla/components/browser/state/selector/SelectorsKt;").method("getSelectedTab", listOf(BROWSER_STATE))
                .accessFlags.let { AccessFlags.PUBLIC.isSet(it) && AccessFlags.STATIC.isSet(it) },
            "SelectorsKt.getSelectedTab(BrowserState) is not public static",
        )
        classDef("Lmozilla/components/browser/state/state/TabSessionState;").method("getExtensionState", emptyList())
        val extensionState = "Lmozilla/components/browser/state/state/WebExtensionState;"
        for (field in listOf("id", "name", "enabled", "isBuiltIn", "browserAction")) publicField(extensionState, field)
        val action = "Lmozilla/components/concept/engine/webextension/Action;"
        for (field in listOf("title", "enabled", "onClick")) publicField(action, field)
        val onClickType = classDef(action).fields.single { it.name == "onClick" }.type
        assertTrue(
            onClickType == FUNCTION0 || FUNCTION0 in classDef(onClickType).interfaces,
            "Action.onClick ($onClickType) is not a Function0",
        )

        // 5. WebExtension$Action.openPopup(GeckoResult, String) hands p1 to onOpenPopup first and
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
        // override the three methods (158.0 and 159.0.1) with their exact descriptors.
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
