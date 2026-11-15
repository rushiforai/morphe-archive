/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** The Save to sheet a pin opens when you save it (#32, #33), in each declared APK. */
@Category(FixtureTests::class)
class BoardPickerFixtureTest {
    @Test
    fun `each declared APK hands the suggested board and the sheet's height to the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = boardPickerClasses(build).values.toList()
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val add = context.suggestedBoardAdd("test")
            val height = context.boardPickerHeight("test")
            val addBefore = original(classes, add.method)
            val heightBefore = original(classes, height)
            hideSuggestedBoardsPatch.execute(context)
            expandBoardListPatch.execute(context)
            for (name in listOf("hideSuggestedBoards", "suggestedBoards", "expandBoardList", "boardListHeight")) {
                assertEquals("${build.name}: $name", 1, flag(context, name))
            }

            // The add becomes the hook on the same list and cell, and nothing else in the loader moves.
            val loader = patched(context, addBefore)
            val hook = loader[add.index]
            assertEquals(build.name, Opcode.INVOKE_STATIC, hook.opcode)
            assertEquals(build.name, SUGGESTED_BOARD_HOOK, (hook as ReferenceInstruction).reference.toString())
            assertEquals("${build.name}: the list, then the cell", listOf(add.list, add.board),
                (hook as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
            assertEquals(build.name, 2, hook.registerCount)
            assertEquals("${build.name}: one call swapped for another", addBefore.instructions().map { it.opcode }
                .toMutableList().also { it[add.index] = Opcode.INVOKE_STATIC }, loader.map { it.opcode })
            assertEquals("${build.name}: the cell is built once and added once", 1,
                loader.count { (it as? ReferenceInstruction)?.reference?.toString() == SUGGESTED_BOARD_HOOK })

            // The height goes through the extension right before its only return, and whatever led to
            // the return leads to the hook now.
            val body = patched(context, heightBefore)
            assertEquals(build.name, heightBefore.instructions().size + 2, body.size)
            val returns = body.withIndex().filter { it.value.opcode == Opcode.RETURN }
            assertEquals(build.name, 1, returns.size)
            val at = returns.single().index
            val percent = (body[at] as OneRegisterInstruction).registerA
            val ask = body[at - 2]
            assertEquals(build.name, Opcode.INVOKE_STATIC_RANGE, ask.opcode)
            assertEquals(build.name, SAVE_SHEET_HEIGHT_HOOK, (ask as ReferenceInstruction).reference.toString())
            assertEquals(build.name, percent, (ask as RegisterRangeInstruction).startRegister)
            assertEquals(build.name, 1, ask.registerCount)
            assertEquals(build.name, Opcode.MOVE_RESULT, body[at - 1].opcode)
            assertEquals("${build.name}: the answer goes back where the percentage was", percent, (body[at - 1] as OneRegisterInstruction).registerA)
        }
    }

    @Test
    fun `a missing model, sheet or status stub refuses with the sheet untouched`() {
        val build = Fixtures.declaredBuilds().last()
        val classes = boardPickerClasses(build)
        val extension = ExtensionDex.classes()
        val probe = PatchContexts.of(extension + classes.values)
        val model = probe.suggestedBoardModel("test")
        val picker = probe.boardPicker("test").type
        val loader = probe.suggestedBoardAdd("test").method.definingClass
        fun without(stub: String) = classes.values + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
            ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                owner.annotations, owner.fields, owner.methods.filterNot { it.name == stub }) }
        fun dropping(type: String) = extension + classes.values.filter { it.type != type }
        val noModel = Triple("missing suggested board model", dropping(model), "suggested board model: expected one exact target, found 0")
        val patches = listOf(
            Triple(hideSuggestedBoardsPatch, listOf("hideSuggestedBoards", "suggestedBoards"),
                listOf(noModel, Triple("missing cell loader", dropping(loader), "suggested board add: expected one exact target, found 0"))),
            Triple(expandBoardListPatch, listOf("expandBoardList", "boardListHeight"),
                listOf(noModel, Triple("missing Save to sheet", dropping(picker), "Save to sheet: expected one exact target, found 0"))),
        )
        for ((patch, flags, cases) in patches) {
            val stubCases = flags.map { Triple("missing $it stub", without(it), it) }
            for ((reason, input, message) in cases + stubCases) {
                val context = PatchContexts.of(input)
                val thrown = assertThrows(reason, PatchException::class.java) { patch.execute(context) }
                assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(message))
                for (name in flags) {
                    if (context.mutableClassDefBy(SETTINGS_STATUS).methods.any { it.name == name }) {
                        assertEquals("$reason left $name set", 0, flag(context, name))
                    }
                }
                for (owner in classes.values.filter { kept -> input.any { it.type == kept.type } }) {
                    for (method in owner.methods.filter { it.implementation != null }) {
                        assertEquals("$reason changed ${owner.type}->${method.name}", method.instructions().map { it.opcode },
                            patched(context, method).map { it.opcode })
                    }
                }
            }
        }
    }

    private fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private fun original(classes: List<ClassDef>, method: Method) = classes.single { it.type == method.definingClass }.methods.single {
        it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
    }

    private fun patched(context: BytecodePatchContext, method: Method) = context.mutable(method).implementation!!.instructions.toList()
}

/**
 * The Save to sheet's classes in [build], by type: the suggested board's model and every class that
 * builds one, the heights a sheet opens at, and the lists and the classes those are built on, as far
 * as the APK carries them.
 */
internal fun boardPickerClasses(build: File): Map<String, ClassDef> {
    val found = FixtureDex.classesWhere(build, { true }) { method ->
        method.name == "toString" && method.strings().any { it.startsWith(SUGGESTED_BOARD_STATE) || it.startsWith(SHEET_HEIGHT_STATE) }
    }.associateBy { it.type }.toMutableMap()
    val models = found.values.filter { owner -> owner.methods.any { method -> method.strings().any { it.startsWith(SUGGESTED_BOARD_STATE) } } }
        .map { it.type }.toSet()
    check(models.isNotEmpty()) { "${build.name}: no suggested board model" }
    FixtureDex.classesWhere(build, { true }) { method ->
        method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type in models }
    }.forEach { found[it.type] = it }
    val lists = found.values.flatMap { it.methods }.flatMap { method -> method.instructions() }
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { call -> call.name == "add" }?.definingClass }
        .toSet()
    var wanted = lists - found.keys
    while (wanted.isNotEmpty()) {
        val loaded = FixtureDex.classes(build, wanted)
        found += loaded
        wanted = loaded.values.flatMap { listOfNotNull(it.superclass) + it.interfaces }.toSet() - found.keys
    }
    return found
}
