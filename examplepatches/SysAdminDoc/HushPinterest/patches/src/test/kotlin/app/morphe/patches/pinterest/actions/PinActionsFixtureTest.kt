/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.actions

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.ads.pinModel
import app.morphe.patches.pinterest.ads.serializedFields
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
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
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import org.junit.Assert.*
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

private const val SENDABLE_TYPE = "Lcom/pinterest/sendshare/model/SendableObject;"

/** Resolves and applies the real native action targets in each declared build. */
@Category(FixtureTests::class)
class PinActionsFixtureTest {
    // Save list reads a pin's title and source link by these JSON names, through the same lookup as the downloads.
    @Test
    fun `the pin model in each declared build serializes its title and source link as text`() {
        val builds = Fixtures.declaredBuilds()
        assertTrue("no declared build to read", builds.isNotEmpty())
        for (build in builds) {
            val models = mutableMapOf<String, Map<String, String>>()
            FixtureDex.forEach(build) { dex ->
                for (classDef in dex.classes) {
                    if (classDef.type.startsWith("Lcom/pinterest/api/model/")) models[classDef.type] = serializedFields(classDef)
                }
            }
            val pin = pinModel(models)
            assertNotNull("${build.name}: no single pin model", pin)
            for (name in listOf("id", "title", "link")) {
                assertEquals("${build.name}: $pin field $name", "Ljava/lang/String;", models.getValue(pin!!)[name])
            }
        }
    }

    @Test
    fun `all action hooks use the real pin menu Visit dispatcher and chooser in each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            downloadPinsPatch.execute(context)
            externalBrowserPatch.execute(context)
            systemSharePatch.execute(context)
            for (name in listOf("downloadPins", "pinDownloads", "copyImage", "shareImage", "saveAndDownload", "externalBrowser", "visitLinks", "systemShare", "pinShare")) {
                assertFlag(context, name, 1)
            }
            val menu = context.mutableClassDefBy(PIN_MENU)
            assertTrue(build.name, menu.methods.map { it.name }.containsAll(
                listOf("hushDownloadPin", "hushDownloadMenu", "hushDownloadOrigin", "hushDownloadCloseup", "hushDismissDownload"),
            ))
            val create = menu.methods.single { it.name == "createModalView" }
            val instructions = create.implementation!!.instructions.toList()
            val attach = instructions.indexOfFirst {
                (it as? ReferenceInstruction)?.reference?.toString() == "$EXTENSION_PACKAGE/actions/PinDownloads;->attach(Ljava/lang/Object;)V"
            }
            assertTrue("${build.name} menu hook", attach > 0)
            assertEquals("${build.name} hook must follow native layout assignment", Opcode.IPUT_OBJECT, instructions[attach - 1].opcode)
            val layout = context.mutableClassDefBy(menu.fields.single { it.name == "modalView" }.type)
            val built = layout.methods.single { it.name == "<init>" && it.implementation != null }.implementation!!.instructions.toList()
            val marks = built.withIndex().filter { (_, instruction) ->
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                    "$EXTENSION_PACKAGE/actions/PinDownloads;->nativeRow(Landroid/view/View;)V"
            }.map { it.index }
            assertEquals("${build.name} Pinterest's Download image row is marked once", 1, marks.size)
            val mark = marks.single()
            assertEquals("${build.name} mark reads the row result", Opcode.MOVE_RESULT_OBJECT, built[mark - 1].opcode)
            assertTrue("${build.name} mark follows the native row factory",
                ((built[mark - 2] as ReferenceInstruction).reference as MethodReference).returnType == "Landroid/widget/RelativeLayout;")
            assertTrue("${build.name} marked row is the Download image title", references(built.subList(maxOf(0, mark - 9), mark - 2))
                .any { it.endsWith("->$NATIVE_DOWNLOAD_TITLE:I") })
            assertEquals("${build.name} mark passes the row register", (built[mark - 1] as OneRegisterInstruction).registerA,
                (built[mark] as RegisterRangeInstruction).startRegister)
            val downloads = context.mutableClassDefBy("$EXTENSION_PACKAGE/actions/PinDownloads;")
            val closeup = menu.methods.single { it.name == "hushDownloadCloseup" }.implementation!!.instructions.toList()
            assertEquals(listOf(Opcode.IGET_BOOLEAN, Opcode.RETURN), closeup.map { it.opcode })
            assertTrue(references(closeup).any { it.endsWith("->isPinCloseup:Z") })
            val row = downloads.methods.single { it.name == "menuRow" }.implementation!!.instructions.toList()
            assertTrue("${build.name} native Download icon", references(row).any { "->DOWNLOAD:" in it })
            assertTrue("${build.name} native row factory", references(row).any { it.endsWith(")Landroid/widget/RelativeLayout;") })
            val cell = downloads.methods.single { it.name == "cellPin" }.implementation!!.instructions.toList()
            assertEquals("${build.name} typed cell guard", Opcode.INSTANCE_OF, cell.first().opcode)
            assertEquals("${build.name} typed model getters", 2, cell.count { it.opcode == Opcode.INVOKE_INTERFACE })
            assertTrue(references(cell).any { it.contains("->getInternalCell()") })
            assertTrue(references(cell).any { it.endsWith("->getPin()${menu.fields.single { field -> field.name == "pin" }.type}") })
            assertTrue("${build.name} native presenter dismissal", references(menu.methods.single { it.name == "hushDismissDownload" }
                .implementation!!.instructions.toList()).any { "->" in it && it.endsWith("()V") })
            for ((owner, helper, expected) in listOf(
                Triple("ExternalBrowser", "open(Ljava/lang/String;Ljava/lang/Object;)Z", 1),
                Triple("ExternalBrowser", "openProfile(Ljava/lang/String;)Z", 2),
                Triple("SystemShare", "open(Ljava/lang/Object;Ljava/lang/Object;)Z", 1),
                Triple("SystemShare", "openSendable(Ljava/lang/Object;Ljava/lang/Object;)Z", 1),
            )) {
                val calls = classes.flatMap { original -> context.mutableClassDefBy(original.type).methods }.count { method ->
                    method.implementation?.instructions?.any { (it as? ReferenceInstruction)?.reference?.toString() ==
                        "$EXTENSION_PACKAGE/actions/$owner;->$helper" } == true
                }
                assertEquals("${build.name} $owner $helper handler count", expected, calls)
            }
        }
    }

    // #2: with android_overflow_gestalt_sheet on, a closeup's overflow button opens this sheet instead of the menu above.
    @Test
    fun `the overflow sheet a closeup opens gets the download rows and marks its own Download row in each declared build`() {
        val downloads = "$EXTENSION_PACKAGE/actions/PinDownloads;"
        for (build in Fixtures.declaredBuilds()) {
            val classes = (read(build) + sheetClasses(build)).associateBy { it.type }.values.toList()
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            downloadPinsPatch.execute(context)
            val type = sheetType(classes.single { it.type == PIN_SHEET_LOCATION })
            fun built(method: Method) = method.name == "onViewCreated" && method.implementation != null
            val before = classes.single { it.type == type }.methods.single(::built)
            val after = context.mutableClassDefBy(type).methods.single(::built)
            val code = after.implementation!!.instructions.toList()
            val hooks = code.indices.filter {
                (code[it] as? ReferenceInstruction)?.reference?.toString() == "$downloads->attachSheet(Ljava/lang/Object;)V"
            }
            assertEquals("${build.name} one hand-over per return", before.implementation!!.instructions.count { it.opcode == Opcode.RETURN_VOID }, hooks.size)
            val self = after.implementation!!.registerCount - 3
            val flow = app.morphe.util.ControlFlow.of(after)
            for (hook in hooks) {
                assertEquals("${build.name} hand-over at $hook passes the sheet", self, (code[hook] as RegisterRangeInstruction).startRegister)
                assertEquals("${build.name} hand-over at $hook sits on a return", Opcode.RETURN_VOID, code[hook + 1].opcode)
                assertEquals("${build.name} every path to the return at ${hook + 1} runs the hand-over", listOf(hook),
                    flow.normal.indices.filter { hook + 1 in flow.normal[it] })
            }
            val marks = code.indices.filter {
                (code[it] as? ReferenceInstruction)?.reference?.toString() == "$downloads->nativeRow(Landroid/view/View;)V"
            }
            assertEquals("${build.name} the sheet's Download image row is marked once", 1, marks.size)
            val mark = marks.single()
            assertEquals(Opcode.MOVE_RESULT_OBJECT, code[mark - 1].opcode)
            assertEquals("${build.name} mark passes the row register", (code[mark - 1] as OneRegisterInstruction).registerA,
                (code[mark] as RegisterRangeInstruction).startRegister)
            val factory = (code[mark - 2] as ReferenceInstruction).reference as MethodReference
            assertEquals(type, factory.definingClass)
            assertEquals("Landroid/widget/RelativeLayout;", factory.returnType)
            assertTrue("${build.name} marked row is the Download image title",
                references(code.subList(maxOf(0, mark - 9), mark - 2)).any { it.endsWith("->$NATIVE_DOWNLOAD_TITLE:I") })
            // Take the hooks back out and the sheet's own code is what it was. A jump the hooks pushed
            // out of a short goto's reach is assembled as a wider goto.
            val gotos = setOf(Opcode.GOTO_16, Opcode.GOTO_32)
            fun shape(method: Method, removed: Set<Int>) = method.implementation!!.instructions.withIndex()
                .filter { (index, instruction) -> index !in removed && instruction.opcode != Opcode.NOP }
                .map { (_, instruction) -> (if (instruction.opcode in gotos) Opcode.GOTO else instruction.opcode) to
                    (instruction as? ReferenceInstruction)?.reference?.toString() }
            assertEquals("${build.name} the sheet's own rows survive", shape(before, emptySet()), shape(after, (hooks + mark).toSet()))
            val stubs = context.mutableClassDefBy(downloads)
            fun stub(name: String) = references(stubs.methods.single { it.name == name }.implementation!!.instructions.toList())
            val pin = classes.single { it.type == PIN_MENU }.fields.single { it.name == "pin" }.type
            assertTrue("${build.name} sheet pin", stub("sheetPin").any { it.endsWith(":$pin") })
            assertTrue("${build.name} sheet origin", stub("sheetOrigin").any { it.endsWith(":Landroid/view/View;") })
            assertTrue("${build.name} sheet closeup", stub("sheetCloseup").any { it.endsWith(":Z") })
            assertTrue("${build.name} sheet list", stub("sheetView").any { it.startsWith("$type->") && it.endsWith(")Landroid/widget/LinearLayout;") })
            assertTrue("${build.name} sheet Download icon", stub("sheetRow").any { "->DOWNLOAD:" in it })
            assertTrue("${build.name} sheet row factory", stub("sheetRow").any { it.startsWith("$type->") && it.endsWith(")Landroid/widget/RelativeLayout;") })
            assertTrue("${build.name} sheet presenter dismissal", stub("dismissSheet").any { !it.startsWith("$type->") && it.endsWith("()V") })
        }
    }

    @Test
    fun `closeup share closes through the close-screen method its own fragment inherits in each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            systemSharePatch.execute(context)
            val open = "$EXTENSION_PACKAGE/actions/SystemShare;->openSendable(Ljava/lang/Object;Ljava/lang/Object;)Z"
            val (fragment, onCreate) = classes.flatMap { original ->
                context.mutableClassDefBy(original.type).methods.map { original.type to it }
            }.single { (_, method) -> open in references(method.implementation?.instructions?.toList() ?: emptyList()) }
            val instructions = onCreate.implementation!!.instructions.toList()
            val call = instructions.drop(instructions.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == open })
                .first { it.opcode == Opcode.INVOKE_VIRTUAL }
            val close = (call as ReferenceInstruction).reference as MethodReference
            val chain = generateSequence(fragment) { type -> classes.firstOrNull { it.type == type }?.superclass }.toList()
            assertTrue("${build.name} ${close.definingClass} is not above $fragment: $chain", close.definingClass in chain.drop(1))
            val target = classes.single { it.type == close.definingClass }.methods.single {
                it.name == close.name && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
            assertTrue("${build.name} ${close.definingClass}->${close.name} is not the close-screen method", target.closesScreen())
        }
    }

    /**
     * The closeup sheet's sendable names its pin by fields whose accessors move between builds:
     * reading `e()` as the id found the kind in 14.39.0, so Pinterest's sheet stayed. The stubs read
     * the fields the sendable's (String, int) constructor stores instead.
     */
    @Test
    fun `closeup share stubs read the id and kind the sendable's constructor stores in each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            systemSharePatch.execute(context)
            val init = classes.single { it.type == SENDABLE_TYPE }.methods.single {
                it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I")
            }
            // Parameters take the last registers: the String, then the int.
            val registers = init.implementation!!.registerCount
            fun stored(opcode: Opcode, register: Int) = init.implementation!!.instructions.single {
                it.opcode == opcode && (it as TwoRegisterInstruction).registerA == register
            }.let { (it as ReferenceInstruction).reference.toString() }
            val id = stored(Opcode.IPUT_OBJECT, registers - 2)
            val kind = stored(Opcode.IPUT, registers - 1)
            if (build.name.startsWith("pinterest-14.42.0-")) {
                assertEquals("$SENDABLE_TYPE->a:Ljava/lang/String;", id)
                assertEquals("$SENDABLE_TYPE->c:I", kind)
            }
            val share = context.mutableClassDefBy("$EXTENSION_PACKAGE/actions/SystemShare;")
            for ((stub, read, field) in listOf(
                Triple("sendableId", Opcode.IGET_OBJECT, id),
                Triple("sendableType", Opcode.IGET, kind),
            )) {
                val body = share.methods.single { it.name == stub }.implementation!!.instructions.toList()
                assertEquals("${build.name} $stub", listOf(Opcode.CHECK_CAST, read, if (read == Opcode.IGET) Opcode.RETURN else Opcode.RETURN_OBJECT),
                    body.map { it.opcode })
                assertEquals("${build.name} $stub", listOf(SENDABLE_TYPE, field), references(body))
                println("${build.name}: $stub reads $field")
            }
            // The extension makes a pin link only for kind 0, and the patch applied, so the
            // sendable's model constructor gives the overflow menu's pin model that kind.
            val pin = classes.single { it.type == PIN_MENU }.fields.single { it.name == "pin" }.type
            if (build.name.startsWith("pinterest-14.42.0-")) assertEquals("${build.name} pin model", "Lcom/pinterest/api/model/pe;", pin)
            println("${build.name}: a pin ($pin) is sendable kind 0")
        }
    }

    @Test
    fun `a build without the sendable class refuses system share before host changes`() {
        refusesSystemShare("no $SENDABLE_TYPE") { classes -> classes.filterNot { it.type == SENDABLE_TYPE } }
    }

    @Test
    fun `a sendable constructor that doesn't store its kind refuses system share before host changes`() {
        refusesSystemShare("doesn't store parameter 1 in one I field") { classes ->
            classes.map { owner ->
                if (owner.type != SENDABLE_TYPE) owner else replace(owner, { it.isIdAndKind() }) { body ->
                    body.flatMap { if (it.opcode == Opcode.IPUT) List(it.codeUnits) { ImmutableInstruction10x(Opcode.NOP) } else listOf(it) }
                }
            }
        }
    }

    @Test
    fun `a sendable constructor that stores its id twice refuses system share before host changes`() {
        refusesSystemShare("doesn't store parameter 0 in one Ljava/lang/String; field") { classes ->
            classes.map { owner ->
                if (owner.type != SENDABLE_TYPE) owner else replace(owner, { it.isIdAndKind() }) { body ->
                    // The String parameter is the highest register a String store reads from.
                    val id = body.filter { it.opcode == Opcode.IPUT_OBJECT &&
                        ((it as ReferenceInstruction).reference as FieldReference).type == "Ljava/lang/String;" }
                        .maxBy { (it as TwoRegisterInstruction).registerA }
                    // A second String field gets the id parameter too.
                    val other = body.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT && it !== id &&
                        ((it as ReferenceInstruction).reference as FieldReference).type == "Ljava/lang/String;" }
                    body.mapIndexed { at, instruction ->
                        if (at != other) instruction else ImmutableInstruction22c(Opcode.IPUT_OBJECT, (id as TwoRegisterInstruction).registerA,
                            (instruction as TwoRegisterInstruction).registerB, (instruction as ReferenceInstruction).reference)
                    }
                }
            }
        }
    }

    @Test
    fun `a sendable whose pin branch stores another kind refuses system share before host changes`() {
        refusesSystemShare("doesn't give a pin kind 0") { classes ->
            val pin = classes.single { it.type == PIN_MENU }.fields.single { it.name == "pin" }.type
            classes.map { owner ->
                if (owner.type != SENDABLE_TYPE) owner else replace(owner, { it.name == "<init>" && it.parameterTypes.size == 1 }) { body ->
                    // The zero the pin branch stores as its kind becomes a one.
                    val test = body.indexOfFirst { it.opcode == Opcode.INSTANCE_OF && ((it as ReferenceInstruction).reference as TypeReference).type == pin }
                    val store = (test until body.size).first { body[it].opcode == Opcode.IPUT }
                    val value = (body[store] as TwoRegisterInstruction).registerA
                    val zero = (0 until store).last { body[it].opcode == Opcode.CONST_4 && (body[it] as OneRegisterInstruction).registerA == value }
                    body.mapIndexed { at, instruction -> if (at == zero) ImmutableInstruction11n(Opcode.CONST_4, value, 1) else instruction }
                }
            }
        }
    }

    private fun refusesSystemShare(message: String, change: (List<ClassDef>) -> List<ClassDef>) {
        val classes = change(read(Fixtures.declaredBuilds().first()))
        val context = PatchContexts.of(ExtensionDex.classes() + classes)
        val refusal = assertThrows(PatchException::class.java) { systemSharePatch.execute(context) }
        assertTrue(refusal.message, refusal.message.orEmpty().contains(message))
        assertFlag(context, "systemShare", 0)
        assertFlag(context, "pinShare", 0)
        assertFalse(classes.flatMap { context.mutableClassDefByOrNull(it.type)?.methods ?: emptyList() }.any { method ->
            references(method.implementation?.instructions?.toList() ?: emptyList()).any { "/SystemShare;->" in it }
        })
    }

    private fun Method.isIdAndKind() = name == "<init>" && parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I")

    /** A copy of [owner] whose methods matching [which] carry [change]d instructions of the same size. */
    private fun replace(owner: ClassDef, which: (Method) -> Boolean, change: (List<Instruction>) -> List<Instruction>) =
        ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
            owner.annotations, owner.fields, owner.methods.map { method ->
                val implementation = method.implementation
                if (!which(method) || implementation == null) method else ImmutableMethod(method.definingClass, method.name,
                    method.parameters, method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                    ImmutableMethodImplementation(implementation.registerCount, change(implementation.instructions.toList()),
                        implementation.tryBlocks, null))
            })

    @Test
    fun `missing close-screen method refuses system share before host changes`() {
        val classes = read(Fixtures.declaredBuilds().first())
        val context = PatchContexts.of(ExtensionDex.classes() + classes.filterNot { owner -> owner.methods.any { it.closesScreen() } })
        assertThrows(PatchException::class.java) { systemSharePatch.execute(context) }
        assertFlag(context, "systemShare", 0)
        assertFlag(context, "pinShare", 0)
        assertFalse(classes.flatMap { context.mutableClassDefByOrNull(it.type)?.methods ?: emptyList() }.any { method ->
            references(method.implementation?.instructions?.toList() ?: emptyList()).any { "/SystemShare;->" in it }
        })
    }

    @Test
    fun `missing profile website binding refuses browser capability before host changes`() {
        val classes = read(Fixtures.declaredBuilds().first())
        val context = PatchContexts.of(ExtensionDex.classes() + classes.filterNot { owner ->
            owner.methods.any { "websiteUrlView" in it.strings() }
        })
        assertThrows(PatchException::class.java) { externalBrowserPatch.execute(context) }
        assertFlag(context, "externalBrowser", 0)
        assertFlag(context, "visitLinks", 0)
        assertFalse(classes.flatMap { context.mutableClassDefByOrNull(it.type)?.methods ?: emptyList() }.any { method ->
            references(method.implementation?.instructions?.toList() ?: emptyList()).any { "/ExternalBrowser;->" in it }
        })
    }

    @Test
    fun `missing typed grid interface refuses downloads before host changes`() {
        val build = Fixtures.declaredBuilds().first()
        val classes = read(build).filterNot { owner -> owner.methods.any { it.name == "getInternalCell" } }
        val context = PatchContexts.of(ExtensionDex.classes() + classes)
        assertThrows(PatchException::class.java) { downloadPinsPatch.execute(context) }
        assertFalse(context.mutableClassDefBy(PIN_MENU).methods.any { it.name.startsWith("hushDownload") })
        assertFlag(context, "downloadPins", 0)
    }

    @Test
    fun `missing menu row dependency refuses download capability before host changes`() {
        val build = Fixtures.declaredBuilds().first()
        val classes = read(build)
        val menu = classes.single { it.type == PIN_MENU }
        val layout = menu.fields.single { it.name == "modalView" }.type
        val context = PatchContexts.of(ExtensionDex.classes() + classes.filterNot { it.type == layout })
        assertThrows(PatchException::class.java) { downloadPinsPatch.execute(context) }
        assertFalse(context.mutableClassDefBy(PIN_MENU).methods.any { it.name.startsWith("hushDownload") })
        assertFlag(context, "downloadPins", 0)
        assertFlag(context, "pinDownloads", 0)
        assertFlag(context, "copyImage", 0)
        assertFlag(context, "shareImage", 0)
        assertFlag(context, "saveAndDownload", 0)
    }

    // #17: every save goes through one method, and a download needs a quick-save helper to save with.
    @Test
    fun `save and download hooks the one save and hands over each quick save helper in each declared build`() {
        val saving = "$EXTENSION_PACKAGE/actions/SaveAndDownload;->saving(Ljava/lang/Object;)V"
        val saver = "$EXTENSION_PACKAGE/actions/SaveAndDownload;->saver(Ljava/lang/Object;)V"
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            downloadPinsPatch.execute(context)
            assertFlag(context, "saveAndDownload", 1)
            val pin = classes.single { it.type == PIN_MENU }.fields.single { it.name == "pin" }.type
            val presenter = classes.single { it.type == PIN_CLOSEUP_PRESENTER }
            val helper = presenter.fields.single { it.name == "repinUtils" }.type
            val action = presenter.fields.single { it.name == "pinAction" }.type

            val hooked = context.mutableClassDefBy(action).methods.filter { method ->
                method.implementation?.instructions?.any { (it as? ReferenceInstruction)?.reference?.toString() == saving } == true
            }
            val save = hooked.single()
            assertEquals("${build.name} the pin comes first", pin, save.parameterTypes.first().toString())
            val first = save.implementation!!.instructions.first() as RegisterRangeInstruction
            assertEquals("${build.name} hook is the save's first instruction", saving, first.let { (it as ReferenceInstruction).reference.toString() })
            assertEquals("${build.name} hook takes one register", 1, first.registerCount)
            assertEquals("${build.name} hook reads the pin", save.implementation!!.registerCount - save.parameterTypes.size, first.startRegister)

            val init = context.mutableClassDefBy(helper).methods.single { it.name == "<init>" && it.implementation != null }
            val body = init.implementation!!.instructions.toList()
            val hand = body.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == saver }
            assertTrue("${build.name} the helper is handed over", hand > 0)
            assertEquals("${build.name} right before the constructor returns", Opcode.RETURN_VOID, body[hand + 1].opcode)
            assertEquals("${build.name} hand-over takes this", init.implementation!!.registerCount - init.parameterTypes.size - 1,
                (body[hand] as RegisterRangeInstruction).startRegister)

            val stubs = context.mutableClassDefBy("$EXTENSION_PACKAGE/actions/SaveAndDownload;")
            val quick = references(stubs.methods.single { it.name == "savePin" }.implementation!!.instructions.toList())
            assertTrue("${build.name} savePin makes the quick save", quick.any { it.startsWith("$helper->") && it.endsWith(")V") })
            assertTrue("${build.name} savePin passes UNKNOWN", quick.any { "->UNKNOWN:" in it })
            val saved = references(stubs.methods.single { it.name == "alreadySaved" }.implementation!!.instructions.toList())
            assertEquals("${build.name} alreadySaved reads two pin accessors", 2, saved.count { it.startsWith("$pin->") })
        }
    }

    @Test
    fun `a missing quick save class refuses Download pins before host changes`() {
        val build = Fixtures.declaredBuilds().first()
        val classes = read(build)
        val helper = classes.single { it.type == PIN_CLOSEUP_PRESENTER }.fields.single { it.name == "repinUtils" }.type
        val context = PatchContexts.of(ExtensionDex.classes() + classes.filterNot { it.type == helper })
        assertThrows(PatchException::class.java) { downloadPinsPatch.execute(context) }
        assertFalse(context.mutableClassDefBy(PIN_MENU).methods.any { it.name.startsWith("hushDownload") })
        assertFlag(context, "downloadPins", 0)
        assertFlag(context, "saveAndDownload", 0)
    }

    @Test
    fun `a missing pin writer refuses Download pins before host changes`() {
        val build = Fixtures.declaredBuilds().first()
        val classes = read(build)
        val context = PatchContexts.of(ExtensionDex.classes() + classes.filterNot { owner ->
            owner.methods.any { it.returnType == "V" && "pinned_to_profile" in it.strings() }
        })
        assertThrows(PatchException::class.java) { downloadPinsPatch.execute(context) }
        assertFalse(context.mutableClassDefBy(PIN_MENU).methods.any { it.name.startsWith("hushDownload") })
        assertFlag(context, "saveAndDownload", 0)
    }

    @Test
    fun `a build with no closeup presenter keeps its downloads without the two switches`() {
        val build = Fixtures.declaredBuilds().first()
        val classes = read(build).filterNot { it.type == PIN_CLOSEUP_PRESENTER }
        val context = PatchContexts.of(ExtensionDex.classes() + classes)
        downloadPinsPatch.execute(context)
        assertFlag(context, "pinDownloads", 1)
        assertFlag(context, "saveAndDownload", 0)
        assertFalse(classes.any { original ->
            context.mutableClassDefBy(original.type).methods.any { method ->
                method.implementation?.instructions?.any {
                    (it as? ReferenceInstruction)?.reference?.toString()?.startsWith("$EXTENSION_PACKAGE/actions/SaveAndDownload;") == true
                } == true
            }
        })
    }

    private fun references(instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>): List<String> =
        instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }

    // Pinterest's base screen fragment closes itself by comparing its ScreenDescription with the
    // top of the screen stack, then signals back navigation with TRUE or removes itself.
    private fun Method.closesScreen(): Boolean {
        val refs = references(implementation?.instructions?.toList() ?: return false)
        return returnType == "V" && parameterTypes.isEmpty() &&
            refs.count { it.endsWith("()Lcom/pinterest/framework/screens/ScreenDescription;") } == 2 &&
            "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;" in refs && refs.any { it.endsWith("->onNext(Ljava/lang/Object;)V") }
    }

    private fun Method.strings(): Set<String> = implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }?.toSet() ?: emptySet()

    private fun read(build: File): List<ClassDef> {
        val wanted = mutableMapOf<String, ClassDef>()
        val sourceTypes = mutableSetOf<String>()
        val potentialShareFragments = mutableListOf<ClassDef>()
        val superclasses = mutableMapOf<String, String?>()
        var dispatchers = 0
        var choosers = 0
        FixtureDex.forEach(build) { dex ->
            for (owner in dex.classes) {
                superclasses[owner.type] = owner.superclass
                val visit = owner.methods.any { it.strings().containsAll(setOf("_url", "com.pinterest.EXTRA_URL")) }
                val profile = owner.methods.any { method ->
                    "websiteUrlView" in method.strings() || method.name == "onClick" &&
                        method.implementation?.instructions?.any {
                            (it as? ReferenceInstruction)?.reference?.toString()?.startsWith("Lcom/pinterest/navigation/Navigation;->") == true
                        } == true
                }
                val share = owner.methods.any { method ->
                    method.parameterTypes.size == 5 && method.parameterTypes[1].toString() == "I" &&
                        method.parameterTypes[3].toString() == "Z" && method.fields().map { it.name }.toSet().containsAll(
                            setOf("APP_LIST_AND_CONTACT_SUGGESTIONS_FOR_UPSELL", "SCREENSHOT", "DOWNLOAD"),
                        )
                }
                owner.methods.filter { method ->
                    method.parameterTypes.size == 5 && method.parameterTypes[1].toString() == "I" &&
                        method.parameterTypes[3].toString() == "Z" && method.fields().map { it.name }.toSet().containsAll(
                            setOf("APP_LIST_AND_CONTACT_SUGGESTIONS_FOR_UPSELL", "SCREENSHOT", "DOWNLOAD"),
                        )
                }.mapTo(sourceTypes) { it.parameterTypes[2].toString() }
                val shareFragment = owner.methods.any { method ->
                    method.returnType == "V" && method.parameterTypes.map { it.toString() } == listOf("Landroid/os/Bundle;") &&
                        method.strings().contains("context") &&
                        method.implementation?.instructions?.any { (it as? ReferenceInstruction)?.reference?.toString() ==
                            "Lcom/pinterest/sendshare/model/SendableObject;" } == true
                }
                if (visit) dispatchers++
                if (share) choosers++
                if (shareFragment) potentialShareFragments += owner
                val grid = com.android.tools.smali.dexlib2.AccessFlags.INTERFACE.isSet(owner.accessFlags) &&
                    owner.methods.any { it.name == "getInternalCell" || it.name == "getPin" && it.returnType.startsWith("Lcom/pinterest/api/model/") }
                val saveRoute = owner.type == PIN_CLOSEUP_PRESENTER || owner.methods.any { it.returnType == "V" && "pinned_to_profile" in it.strings() }
                if (owner.type == PIN_MENU || visit || share || profile || grid || saveRoute) wanted[owner.type] = ImmutableClassDef.of(owner)
            }
        }
        potentialShareFragments.filter { owner ->
            owner.methods.any { method ->
                method.implementation?.instructions?.any {
                    (it as? ReferenceInstruction)?.reference?.toString() in sourceTypes
                } == true
            }
        }.forEach { wanted[it.type] = ImmutableClassDef.of(it) }
        // The share fragment closes itself through a method it inherits, so its superclasses come too.
        val shareFragments = wanted.keys.filter { type -> potentialShareFragments.any { it.type == type } }
        wanted += FixtureDex.classes(build, shareFragments.flatMap { fragment ->
            generateSequence(superclasses[fragment]) { superclasses[it] }.toList()
        }.toSet() + SENDABLE_TYPE)
        assertEquals("${build.name} Visit owner", 1, dispatchers)
        assertEquals("${build.name} share chooser owner", 1, choosers)
        val menu = wanted.getValue(PIN_MENU)
        val dependencies = FixtureDex.classes(build, menu.fields.filter { it.name in setOf("modalView", "presenter") }.map { it.type }.toSet())
        wanted += dependencies
        val icons = dependencies.values.flatMap { owner -> owner.methods.filter { it.returnType == "Landroid/widget/RelativeLayout;" }
            .flatMap { it.parameterTypes }.map { it.toString() }.filter { it.startsWith('L') && it != "Ljava/lang/String;" } }.toSet()
        wanted += FixtureDex.classes(build, icons)
        val saves = FixtureDex.classes(build, wanted.getValue(PIN_CLOSEUP_PRESENTER).fields
            .filter { it.name in setOf("repinUtils", "pinAction") }.map { it.type }.toSet())
        wanted += saves
        val reasons = saves.values.flatMap { owner -> owner.methods.filter { method ->
            method.returnType == "V" && method.parameterTypes.size == 8 && method.parameterTypes[5].toString() == "Lkotlin/jvm/functions/Function1;"
        } }.map { it.parameterTypes.last().toString() }.toSet()
        wanted += FixtureDex.classes(build, reasons + menu.fields.single { it.name == "pin" }.type)
        return wanted.values.toList()
    }

    private fun sheetType(location: ClassDef): String = location.methods.flatMap { method ->
        method.implementation?.instructions?.filter { it.opcode == Opcode.CONST_CLASS }
            ?.map { ((it as ReferenceInstruction).reference as TypeReference).type }.orEmpty()
    }.distinct().single()

    /** The overflow sheet's location, its fragment, and every class the fragment holds or hands out. */
    private fun sheetClasses(build: File): List<ClassDef> {
        val location = FixtureDex.classes(build, setOf(PIN_SHEET_LOCATION)).values.single()
        val fragment = FixtureDex.classes(build, setOf(sheetType(location))).values.single()
        val held = (fragment.fields.map { it.type } + fragment.methods.filter { it.parameterTypes.isEmpty() }.map { it.returnType })
            .filter { it.startsWith("L") }.toSet()
        return listOf(location, fragment) + FixtureDex.classes(build, held).values
    }

    private fun assertFlag(context: BytecodePatchContext, name: String, expected: Int) {
        val instructions = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.toList()
        assertEquals(Opcode.CONST_4, instructions[0].opcode)
        assertEquals(name, expected, (instructions[0] as NarrowLiteralInstruction).narrowLiteral)
    }
}
