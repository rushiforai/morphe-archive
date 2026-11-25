/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

private const val REMOVE_LABEL = "Lorg/telegram/messenger/R\$string;->DoNotLinkPreview:I"
private const val APPLY_LABEL = "Lorg/telegram/messenger/R\$string;->ApplyChanges:I"
private const val GALLERY_ICON = "Lorg/telegram/messenger/R\$drawable;->msg_gallery:I"
private const val WEB_PAGE_TYPE = "Lorg/telegram/tgnet/TLRPC\$WebPage;"
private const val MENU_BUILT = "$LINK_PREVIEW_PHOTO->menuBuilt(Ljava/lang/Object;Ljava/lang/Object;)V"
private const val ADD_ROW = "(Landroid/view/View;Landroid/widget/LinearLayout\$LayoutParams;)V"
private const val ROW_TITLE = "(Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;)V"
private val REFERENCED_TYPE = Regex("L[\\w/\$]+;")

/** Classes the stubs reach that neither the menu nor its click names. */
private val STUB_TYPES = setOf(
    "Lorg/telegram/ui/Components/ChatActivityEnterView;", "Lorg/telegram/messenger/MediaDataController;",
    "Lorg/telegram/messenger/AndroidUtilities;", "Lorg/telegram/messenger/MessagePreviewParams;",
    "Lorg/telegram/messenger/SendMessageChatArguments;", WEB_PAGE_TYPE,
)

/** The link page's constructor: it takes its menu, a context and a number, and loads both Apply changes and Remove preview. */
internal fun Method.isLinkPreviewMenu() = name == "<init>" &&
    parameterTypes.map { it.toString() }.let { it.size == 3 && it[1] == "Landroid/content/Context;" && it[2] == "I" } &&
    controlBody().map { it.controlRef() }.let { REMOVE_LABEL in it && APPLY_LABEL in it }

/** The menu's click handler: the one that clears the chat's link preview. */
private fun Method.isLinkPreviewClick() = origName == "onClick" && controlBody().any {
    it.opcode == Opcode.IPUT_OBJECT && it.controlField()?.origType == WEB_PAGE_TYPE
}

private fun Instruction.reference() = controlRef()

/** The classes the menu, its click and the stubs need, with every superclass they have in the app. */
internal fun linkPreviewHosts(build: File, base: List<ClassDef>): List<ClassDef> = FixtureDex.namedBy(build) {
    val added = linkedMapOf<String, ClassDef>()
    fun fetch(types: Set<String>): List<ClassDef> {
        val fresh = FixtureDex.classes(build, types).values
            .filter { cls -> cls.type !in added && base.none { it.type == cls.type } }
            .distinctBy { it.type }.map(ImmutableClassDef::of)
        fresh.forEach { added[it.type] = it }
        return fresh
    }
    fun mentioned(methods: List<Method>) = methods.flatMap { it.controlBody() }.mapNotNull { it.reference() }
        .flatMap { reference -> REFERENCED_TYPE.findAll(reference).map { it.value } }
        .filter { it.startsWith("Lorg/telegram/") }.toSet()

    val first = fetch(mentioned(base.flatMap { it.methods }.filter { it.isLinkPreviewMenu() }) + STUB_TYPES)
    fetch(mentioned(first.flatMap { it.methods }.filter { it.isLinkPreviewClick() }))
    var parents = added.values.mapNotNull { it.superclass }.filter { it.startsWith("Lorg/telegram/") }.toSet()
    while (true) {
        val fresh = fetch(parents)
        if (fresh.isEmpty()) break
        parents = fresh.mapNotNull { it.superclass }.filter { it.startsWith("Lorg/telegram/") }.toSet()
    }
    added.values.toList()
}

/** Send photo in the link preview menu: the row after Remove preview's add, and stubs that read what Telegram sends with. */
class LinkPreviewPhotoFixtureTest {
    private fun BytecodePatchContext.stub(name: String) =
        tgMutableClassDefBy(LINK_PREVIEW_PHOTO).methods.single { it.origName == name && it.accessFlags and 0x8 != 0 }

    private fun BytecodePatchContext.flag(name: String) =
        (tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.controlBody().first() as? WideLiteralInstruction)?.wideLiteral

    /** What the code does, with the padding left out and every goto read alike, since an insert can widen one. */
    private fun shapes(body: List<Instruction>) = body.filter { it.opcode != Opcode.NOP }.map {
        listOf(if (it.opcode == Opcode.GOTO_16 || it.opcode == Opcode.GOTO_32) Opcode.GOTO else it.opcode, it.namedRegisters(), it.reference())
    }

    /** The one field a chat stub reads, as the stub names it. */
    private fun BytecodePatchContext.fieldOf(stub: String) =
        stub(stub).controlBody().single { it.controlField() != null }.reference()!!

    @Test fun `the row goes in right after Remove preview is added and nothing else in the menu moves`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = MessageMenuFixtureTest().hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val chat = context.resolveMessageMenu().chat
            val plan = context.resolveLinkPreviewPhoto(chat)
            assertEquals("$name: ${plan.missing}", null, plan.missing)
            val page = hosts.single { cls -> cls.methods.any { it.isLinkPreviewMenu() } }.type
            val constructor = context.tgMutableClassDefBy(page).methods.single { it.isLinkPreviewMenu() }
            val stock = ImmutableMethod.of(constructor).controlBody()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageMenuPatch.execute(context) })

            val patched = constructor.controlBody()
            val hooks = patched.indices.filter { patched[it].reference() == MENU_BUILT }
            assertEquals("$name: one hook", 1, hooks.size)
            val hook = hooks.single()
            assertEquals("$name: an ordinary call", Opcode.INVOKE_STATIC, patched[hook].opcode)
            val add = patched[hook - 1]
            assertEquals(Opcode.INVOKE_VIRTUAL, add.opcode)
            assertTrue("$name: ${add.reference()}", add.reference()!!.endsWith(ADD_ROW))
            val label = patched.indexOfFirst { it.reference() == REMOVE_LABEL }
            assertTrue("$name: the add is Remove preview's", label < hook - 1)
            assertEquals("$name: the first add after the label", hook - 1,
                (label + 1 until patched.size).first { patched[it].reference()?.endsWith(ADD_ROW) == true })

            // The hook gets what the add and the row's click listener were given.
            val listener = patched.subList(label, hook - 1).last { it.opcode == Opcode.INVOKE_DIRECT && it.reference()!!.contains("<init>($page") }
            assertEquals("$name: the page", (listener as FiveRegisterInstruction).registerD, (patched[hook] as FiveRegisterInstruction).registerC)
            assertEquals("$name: the row", (add as FiveRegisterInstruction).registerD, (patched[hook] as FiveRegisterInstruction).registerD)
            assertEquals("$name: stock code stays", shapes(stock), shapes(patched.filterIndexed { i, _ -> i != hook }))

            // The new row is built like Telegram's, with the gallery icon and the given title.
            val row = context.stub("row").controlBody()
            val rowInit = stock.subList(0, label).last { it.opcode == Opcode.INVOKE_DIRECT_RANGE && it.reference()!!.contains("<init>(ILandroid/content/Context;") }
            assertTrue("$name: the row's constructor", row.any { it.reference() == rowInit.reference() })
            val title = stock.subList(label, stock.size).first { it.reference()?.endsWith(ROW_TITLE) == true }
            assertTrue("$name: the row's title", row.any { it.reference() == title.reference() })
            assertTrue("$name: the icon", row.any { it.reference() == GALLERY_ICON })

            for (flag in listOf("linkPreviewPhoto", "messageMenuRepeat")) assertEquals("$name: $flag", 1L, context.flag(flag))
        }
    }

    @Test fun `the send takes the draft's reply, thread, quote, caption and formatting from the right parameters`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + MessageMenuFixtureTest().hosts(build))
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageMenuPatch.execute(context) })
            val stub = context.stub("sendPhoto")
            val body = stub.controlBody()
            val total = stub.implementation!!.registerCount
            val firstParameter = total - 12
            val callAt = body.indexOfFirst { it.opcode == Opcode.INVOKE_STATIC_RANGE && it.call()?.origName == "prepareSendingPhoto" }
            assertTrue("$name: the send", callAt >= 0)
            val types = body[callAt].call()!!.origParameterTypes
            assertEquals("$name: the send's arguments", 23, types.size)
            assertEquals("$name: arguments start at v0", 0, (body[callAt] as RegisterRangeInstruction).startRegister)
            fun argument(index: Int) = wordsBefore(types, index)
            fun lastWrite(register: Int) = body.subList(0, callAt).last { (it as? OneRegisterInstruction)?.registerA == register }
            // Argument of the send, then the stub parameter's register offset.
            for ((index, parameter) in mapOf(1 to 3, 4 to 1, 5 to 6, 6 to 7, 7 to 8, 8 to 5, 17 to 4, 18 to 9, 21 to 10)) {
                val write = lastWrite(argument(index))
                val expected = if (types[index] == "J") Opcode.MOVE_WIDE_FROM16 else Opcode.MOVE_OBJECT_FROM16
                assertEquals("$name: argument $index", expected, write.opcode)
                assertEquals("$name: argument $index", firstParameter + parameter, (write as TwoRegisterInstruction).registerB)
            }
            for (index in listOf(12, 13, 15, 19, 20, 22)) {
                val write = lastWrite(argument(index))
                assertEquals("$name: argument $index stays empty", 0L, (write as WideLiteralInstruction).wideLiteral)
            }
            assertEquals("$name: notify", 1L, (lastWrite(argument(14)) as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `Telegram's own photo send passes the same chat fields the stubs read`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + MessageMenuFixtureTest().hosts(build))
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageMenuPatch.execute(context) })
            val wanted = mapOf(
                5 to context.fieldOf("reply"), 6 to context.fieldOf("thread"), 7 to context.fieldOf("quote"), 12 to context.fieldOf("editing"),
                18 to context.stub("arguments").controlBody().single { it.opcode == Opcode.INVOKE_VIRTUAL }.reference()!!,
                21 to context.stub("monoPeer").controlBody().single { it.opcode == Opcode.INVOKE_VIRTUAL }.reference()!!,
            )
            val callers = FixtureDex.methodsWhere(build, { true }) { m -> m.controlBody().any { it.isPhotoSend() } }
            assertTrue("$name: Telegram sends photos", callers.isNotEmpty())
            val matches = callers.flatMap { caller ->
                val code = caller.controlBody()
                code.indices.filter { code[it].isPhotoSend() }.filter { at ->
                    val types = code[at].call()!!.origParameterTypes
                    val start = (code[at] as RegisterRangeInstruction).startRegister
                    wanted.all { (index, reference) ->
                        origin(code, at, start + wordsBefore(types, index))?.reference() == reference
                    }
                }.map { caller to it }
            }
            assertTrue("$name: no photo send passes $wanted", matches.isNotEmpty())
        }
    }

    @Test fun `the caption and the box go through the chat's own message box`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + MessageMenuFixtureTest().hosts(build))
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageMenuPatch.execute(context) })
            assertTrue("$name: the text", context.stub("text").controlBody().any { it.reference()?.contains("->getFieldText()") == true })
            assertTrue("$name: the clear", context.stub("clearText").controlBody().any { it.reference()?.contains("->setFieldText(") == true })
            val cleared = context.stub("clearReply").controlBody().filter { it.opcode == Opcode.IPUT_OBJECT }.map { it.reference() }
            assertEquals("$name: the reply and its quote", listOf(context.fieldOf("reply"), context.fieldOf("quote")), cleared)
            assertNotNull(context.stub("photoAllowed").controlBody().firstOrNull { it.reference()?.contains("->canSendPhoto(") == true })
        }
    }

    @Test fun `a build whose menu click reads differently leaves Send photo out and the message menu goes on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = MessageMenuFixtureTest().hosts(build)
            val chat = PatchContexts.of(ExtensionDex.classes() + hosts).resolveMessageMenu().chat
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.map { cls ->
                if (cls.methods.any { it.isLinkPreviewClick() }) withoutClick(cls) else cls
            })
            assertTrue("$name: ${context.resolveLinkPreviewPhoto(chat).missing}", context.resolveLinkPreviewPhoto(chat).missing != null)
            val page = hosts.single { cls -> cls.methods.any { it.isLinkPreviewMenu() } }.type
            val constructor = context.tgMutableClassDefBy(page).methods.single { it.isLinkPreviewMenu() }
            val stock = ImmutableMethod.of(constructor).controlBody()
            val warnings = PatchLogCapture.warnings { messageMenuPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "goes on without Send photo" in warnings.single())
            assertTrue("$name: the build flag stays off", context.flag("linkPreviewPhoto") != 1L)
            assertEquals("$name: the menu's own flag", 1L, context.flag("messageMenuRepeat"))
            assertFalse("$name: no hook", constructor.controlBody().any { it.reference() == MENU_BUILT })
            assertEquals("$name: the page is untouched", shapes(stock), shapes(constructor.controlBody()))
        }
    }

    /** The register words the arguments before [index] take up. */
    private fun wordsBefore(types: List<String>, index: Int) = index + types.take(index).count { it == "J" || it == "D" }

    private fun Instruction.isPhotoSend() = opcode == Opcode.INVOKE_STATIC_RANGE &&
        call()?.let { it.origName == "prepareSendingPhoto" && it.parameterTypes.size == 23 } == true

    /** Where the value in [register] at [at] came from, following moves back in code order. */
    private fun origin(code: List<Instruction>, at: Int, register: Int): Instruction? {
        var wanted = register
        var i = at - 1
        while (i >= 0) {
            val instruction = code[i]
            if ((instruction as? OneRegisterInstruction)?.registerA == wanted) {
                when (instruction.opcode) {
                    Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16,
                    Opcode.MOVE_WIDE, Opcode.MOVE_WIDE_FROM16, Opcode.MOVE_WIDE_16 -> wanted = (instruction as TwoRegisterInstruction).registerB
                    Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT_WIDE, Opcode.MOVE_RESULT -> return code[i - 1]
                    else -> return instruction
                }
            }
            i--
        }
        return null
    }

    /** [owner] without the menu's click, still read through its build's name table. */
    private fun withoutClick(owner: ClassDef): ClassDef {
        val copy = ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile, owner.annotations,
            owner.fields, owner.methods.filter { !it.isLinkPreviewClick() })
        return if (owner is FixtureDex.FixtureClassDef) FixtureDex.FixtureClassDef(owner.versionCode, copy) else copy
    }
}
