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
import app.morphe.patches.pinterest.ads.feedListHookPatch
import app.morphe.patches.pinterest.ads.feedListHoldersHooked
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** The board screen's menu, the option classes it's built from and the sheet's dismiss event, in each declared build. */
@Category(FixtureTests::class)
class DownloadBoardFixtureTest {
    private class Build(val name: String, val classes: List<ClassDef>) {
        /** The board screen's presenter, found the way the patch finds it. */
        val presenter: ClassDef by lazy {
            val type = PatchContexts.of(ExtensionDex.classes() + classes).boardMenu().presenter
            classes.single { it.type == type }
        }
    }

    @Test
    fun `each declared build hooks the board menu right after it's built and fills every stub`() {
        for (build in Fixtures.declaredBuilds().map(::read)) {
            val context = PatchContexts.of(ExtensionDex.classes() + build.classes)
            feedListHookPatch.execute(context)
            assertEquals(build.name, 3, feedListHoldersHooked)
            val board = context.boardMenu()
            val original = board.method.implementation!!.instructions.toList()
            downloadBoardPatch.execute(context)
            for (flag in listOf("downloadBoard", "boardMenu", "boardPins")) assertEquals("${build.name}: $flag", 1, flag(context, flag))

            val body = patched(context, board.method)
            assertEquals("${build.name}: three instructions go in", original.size + 3, body.size)
            assertEquals("${build.name}: everything else stays", original.map { it.opcode },
                body.filterIndexed { at, _ -> at !in board.insert until board.insert + 3 }.map { it.opcode })
            val built = original[board.insert - 2]
            assertEquals(build.name, board.group, (built as ReferenceInstruction).reference.let { it as MethodReference }.returnType)
            assertEquals(build.name, Opcode.MOVE_RESULT_OBJECT, original[board.insert - 1].opcode)
            assertEquals(build.name, board.menu, (original[board.insert - 1] as OneRegisterInstruction).registerA)
            val hook = body[board.insert]
            assertEquals(build.name, BOARD_MENU_HOOK, (hook as ReferenceInstruction).reference.toString())
            assertEquals("${build.name}: the hook reads the menu and this", listOf(board.menu, board.self), registers(hook))
            assertEquals(build.name, board.method.implementation!!.registerCount - 1, board.self)
            assertEquals(build.name, Opcode.MOVE_RESULT_OBJECT, body[board.insert + 1].opcode)
            assertEquals(build.name, board.menu, (body[board.insert + 1] as OneRegisterInstruction).registerA)
            assertEquals(build.name, Opcode.CHECK_CAST, body[board.insert + 2].opcode)
            assertEquals(build.name, board.menu, (body[board.insert + 2] as OneRegisterInstruction).registerA)
            assertEquals(build.name, board.group, ((body[board.insert + 2] as ReferenceInstruction).reference as TypeReference).type)
            println("${build.name}: ${board.presenter}->${board.method.name} hook at ${board.insert}, " +
                "invoke-static {v${board.menu}, v${board.self}}, borrows nothing")

            val stubs = context.mutableClassDefBy(BOARD_DOWNLOADS).methods.associateBy { it.name }
            fun refs(name: String) = stubs.getValue(name).implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
            assertTrue(build.name, refs("menuItems").any { it.startsWith("${board.group}->") && it.endsWith(":Ljava/util/List;") })
            assertTrue(build.name, refs("menuHandler").any { it.startsWith("${board.group}->") && it.endsWith(":Lkotlin/jvm/functions/Function1;") })
            assertTrue(build.name, refs("menuCopy").any { it.startsWith("${board.group}-><init>(") })
            assertTrue(build.name, refs("menuRow").any { it.startsWith("${board.row}-><init>(") })
            assertTrue(build.name, refs("titleResource").any { it.endsWith("->$PLAIN_TEXT:I") })
            assertTrue(build.name, refs("boardId").any { it.startsWith("${board.presenter}->") && it.endsWith(":Ljava/lang/String;") })
            assertTrue(build.name, refs("dismissMenu").any { it == "${board.dismiss.definingClass}->${board.dismiss.name}(${board.dismiss.parameterTypes.single()})V" })
            assertEquals("${build.name}: row title, index and text", listOf(0, 1, 4), listOf(board.title, board.index, board.text))
        }
    }

    @Test
    fun `a changed presenter, dismiss event, status stub or missing list hook refuses before any change`() {
        val build = read(Fixtures.declaredBuilds().first())
        val extension = ExtensionDex.classes()
        val presenter = build.presenter
        // Another screen holding the board id extra and building the board menu the same way.
        val second = "Lapp/hushpinterest/test/SecondBoardPresenter;"
        val secondPresenter = ImmutableClassDef(second, presenter.accessFlags, presenter.superclass, presenter.interfaces,
            presenter.sourceFile, presenter.annotations, emptyList(), presenter.methods.map { method ->
                ImmutableMethod(second, method.name, method.parameters, method.returnType, method.accessFlags, method.annotations,
                    method.hiddenApiRestrictions, method.implementation)
            })
        val event = build.classes.single { owner -> owner.methods.any { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") } &&
            owner.methods.any { it.name == "<init>" && it.parameterTypes.isEmpty() } && owner.type != presenter.type && isModalEvent(build, owner.type) }
        val noFlagEvent = ImmutableClassDef(event.type, event.accessFlags, event.superclass, event.interfaces, event.sourceFile,
            event.annotations, event.fields, event.methods.filterNot { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") })
        // The board id extra renamed: nothing marks the screen as the board's any more.
        val noIdRead = ImmutableClassDef(presenter.type, presenter.accessFlags, presenter.superclass, presenter.interfaces, presenter.sourceFile,
            presenter.annotations, presenter.fields, presenter.methods.map { method ->
                val implementation = method.implementation
                if (implementation == null || method.texts().none { it == BOARD_ID_EXTRA }) method else ImmutableMethod(
                    method.definingClass, method.name, method.parameters, method.returnType, method.accessFlags, method.annotations,
                    method.hiddenApiRestrictions, ImmutableMethodImplementation(implementation.registerCount, implementation.instructions.map {
                        val text = ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                        if (text != BOARD_ID_EXTRA) it
                        else ImmutableInstruction21c(Opcode.CONST_STRING, (it as OneRegisterInstruction).registerA, ImmutableStringReference("com.pinterest.EXTRA_OTHER"))
                    }, implementation.tryBlocks, implementation.debugItems))
            })
        val noStatus = extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
            ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                owner.annotations, owner.fields, owner.methods.filterNot { it.name == "boardPins" }) }
        fun with(vararg swaps: ClassDef) = extension + build.classes.map { owner -> swaps.firstOrNull { it.type == owner.type } ?: owner }
        val cases = linkedMapOf(
            "two presenters" to (extension + build.classes + secondPresenter to "board screen presenter: expected one exact target, found 2"),
            "no dismiss event" to (with(noFlagEvent) to "sheet dismiss event: expected one exact target, found 0"),
            "no board id extra" to (with(noIdRead) to "board screen presenter: expected one exact target, found 0"),
            "missing status stub" to (noStatus + build.classes to "no boolean method boardPins()"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            feedListHookPatch.execute(context)
            val before = snapshot(context, input)
            val refusal = assertThrows(reason, PatchException::class.java) { downloadBoardPatch.execute(context) }
            assertTrue("$reason refused for another reason: ${refusal.message}", refusal.message.orEmpty().contains(message))
            assertArrayEquals("$reason left retained edits", before, snapshot(context, input))
            assertEquals("$reason left the family flag set", 0, flag(context, "downloadBoard"))
        }

        // No list holder hooked: nothing would keep a board's pins, so the menu row isn't added either.
        runCatching { feedListHookPatch.execute(PatchContexts.of(extension)) }
        assertEquals(0, feedListHoldersHooked)
        val input = extension + build.classes
        val context = PatchContexts.of(input)
        val before = snapshot(context, input)
        val refusal = assertThrows(PatchException::class.java) { downloadBoardPatch.execute(context) }
        assertTrue(refusal.message, refusal.message.orEmpty().contains("no list holder was hooked"))
        assertArrayEquals("no hooked holder left retained edits", before, snapshot(context, input))
    }

    private fun isModalEvent(build: Build, type: String) = build.classes.single { it.type == MODAL_CONTAINER }.methods.any { method ->
        method.parameterTypes.map(CharSequence::toString) == listOf(type)
    }

    private fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first()
            as NarrowLiteralInstruction).narrowLiteral

    private fun patched(context: BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
        }.implementation!!.instructions.toList()

    private fun registers(instruction: Instruction): List<Int> {
        val call = instruction as FiveRegisterInstruction
        return listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount)
    }

    private fun snapshot(context: BytecodePatchContext, classes: List<ClassDef>): ByteArray {
        val pool = DexPool(Opcodes.getDefault())
        classes.forEach { pool.internClass(context.mutableClassDefBy(it.type)) }
        val store = MemoryDataStore()
        try {
            pool.writeTo(store)
            return store.data
        } finally {
            store.close()
        }
    }

    /**
     * The classes the patch reads: the list holders, every screen holding the board id extra, the
     * option classes, the plain text resource, ModalContainer and its events, the static helpers that
     * post a new event, and the builders and enum the board menu comes from.
     */
    private fun read(build: File): Build {
        val wanted = mutableMapOf<String, ClassDef>()
        FixtureDex.forEach(build) { dex ->
            for (owner in dex.classes) {
                val texts = owner.methods.filter { it.name == "toString" }.flatMap { it.texts() }
                val keep = owner.type == MODAL_CONTAINER ||
                    texts.any { it in HOLDER_TEXT || it == GROUP_TEXT || it == "OptionItem(titleRes=" } ||
                    owner.fields.any { it.name == PLAIN_TEXT } ||
                    (owner.superclass == "Ljava/lang/Enum;" && owner.fields.any { it.name == "PreviewBoard" }) ||
                    owner.methods.any { it.postsShape() || BOARD_ID_EXTRA in it.texts() }
                if (keep && owner.type !in wanted) wanted[owner.type] = ImmutableClassDef.of(owner)
            }
        }
        val group = wanted.values.single { owner -> owner.methods.any { it.name == "toString" && GROUP_TEXT in it.texts() } }.type
        // Whatever an id holder calls for an option group from a list of options and a handler.
        val builders = wanted.values.filter { owner -> owner.methods.any { BOARD_ID_EXTRA in it.texts() } }.flatMap { owner ->
            owner.methods.flatMap { method -> method.implementation?.instructions?.toList().orEmpty() }
        }.mapNotNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { call ->
                (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                    call.returnType == group && call.parameterTypes.size >= 2 &&
                    call.parameterTypes[0].toString() == "Ljava/util/List;" &&
                    call.parameterTypes[1].toString() == "Lkotlin/jvm/functions/Function1;"
            }?.definingClass
        }
        val events = wanted.getValue(MODAL_CONTAINER).methods.flatMap { it.parameterTypes.map(CharSequence::toString) }
        wanted += FixtureDex.classes(build, (builders + events).toSet() - wanted.keys)
        return Build(build.name, wanted.values.toList())
    }

    private companion object {
        val HOLDER_TEXT = setOf(", _items count:", "PagedResponse(bookmark=", "ModelListWithBookmark(models=")
        const val GROUP_TEXT = "OptionGroup(label="

        fun Method.texts() = implementation?.instructions?.toList().orEmpty().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

        /** A static helper of four instructions that starts by making something and takes one object. */
        fun Method.postsShape() = AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" && parameterTypes.size == 1 &&
            implementation?.instructions?.toList()?.let { it.size == 4 && it[0].opcode == Opcode.NEW_INSTANCE && it[2].opcode == Opcode.INVOKE_VIRTUAL &&
                ((it[2] as ReferenceInstruction).reference as MethodReference).parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") } == true
    }
}
