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
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** #48: the board picker's request for your boards, and the signed-in user the profile's board order is read from. */
@Category(FixtureTests::class)
class BoardOrderFixtureTest {
    /** Every class that asks for boards with the picker's fields, the profile's board order class, and the user getter's class. */
    private fun read(build: File): List<ClassDef> {
        val found = FixtureDex.classesWhere(build, { true }) { method ->
            (DEFAULT_BOARD_SORT in method.strings() && method.fields().any { it.name == BOARD_PICKER_FIELDS }) ||
                BOARD_SORT_UTILS in method.strings()
        }
        val user = PatchContexts.of(found).profileBoardSort().user.definingClass
        return (found + FixtureDex.classes(build, setOf(user)).values).distinctBy { it.type }
    }

    private fun mutableOf(context: app.morphe.patcher.patch.BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameters() == method.parameters() && it.returnType == method.returnType
        } as MutableMethod

    @Test
    fun `each declared APK asks the extension for the board picker's sort and tells it the profile's`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val clean = PatchContexts.of(classes)
            val request = clean.boardPickerRequest()
            val profile = clean.profileBoardSort()
            val getter = classes.single { it.type == profile.user.definingClass }.methods.single {
                it.name == profile.user.name && it.parameters().isEmpty() && it.returnType == profile.user.returnType
            }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            boardOrderWhenSavingPatch.execute(context)
            for (flag in listOf("boardOrderWhenSaving", "boardPickerSort")) assertEquals("${build.name}: $flag", 1, PinPageKit.flag(context, flag))

            // The request: its sort goes to the extension and comes back in the same register, right in front of the call.
            val before = request.method.instructions()
            val after = PinPageKit.patched(context, request.method)
            assertEquals(build.name, BOARD_PICKER_SORT_HOOK, PinPageKit.target(after[request.call]))
            assertEquals("${build.name}: the sort goes in", listOf(request.sort), after[request.call].passed())
            assertEquals(build.name, Opcode.MOVE_RESULT_OBJECT, after[request.call + 1].opcode)
            assertEquals("${build.name}: and comes back", request.sort, (after[request.call + 1] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: the request follows", PinPageKit.target(before[request.call]), PinPageKit.target(after[request.call + 2]))
            assertEquals("${build.name}: Pinterest's own code is kept", PinPageKit.kinds(before),
                PinPageKit.kinds(after.take(request.call) + after.drop(request.call + 2)))
            val picker = mutableOf(context, request.method).implementation!!.instructions
            assertTrue("${build.name}: a branch skips the hook", picker.filterIsInstance<BuilderOffsetInstruction>()
                .none { it.target.location.index == request.call + 1 || it.target.location.index == request.call + 2 })

            // The user getter: each return tells the extension the user's board order key, and no user returns at once.
            val got = getter.instructions()
            val tells = PinPageKit.patched(context, getter)
            val returns = got.indices.filter { got[it].opcode == Opcode.RETURN_OBJECT }
            assertTrue("${build.name}: the getter returns", returns.isNotEmpty())
            val branches = mutableOf(context, getter).implementation!!.instructions
            val injected = mutableSetOf<Int>()
            for ((count, at) in returns.withIndex()) {
                val start = at + 4 * count
                val answer = (got[at] as OneRegisterInstruction).registerA
                assertEquals(build.name, Opcode.IF_EQZ, tells[start].opcode)
                assertEquals(build.name, answer, (tells[start] as OneRegisterInstruction).registerA)
                assertEquals("${build.name}: no user returns at once", start + 4,
                    (branches[start] as BuilderOffsetInstruction).target.location.index)
                assertEquals(build.name, profile.sortKey.toString(), PinPageKit.target(tells[start + 1]))
                assertEquals("${build.name}: the key is read off the user returned", listOf(answer), tells[start + 1].passed())
                assertEquals(build.name, Opcode.MOVE_RESULT_OBJECT, tells[start + 2].opcode)
                val key = (tells[start + 2] as OneRegisterInstruction).registerA
                assertTrue("${build.name}: the key's register v$key holds the answer", key != answer)
                assertEquals(build.name, PROFILE_BOARD_SORT_HOOK, PinPageKit.target(tells[start + 3]))
                assertEquals(build.name, listOf(key), tells[start + 3].passed())
                assertEquals(build.name, Opcode.RETURN_OBJECT, tells[start + 4].opcode)
                assertEquals(build.name, answer, (tells[start + 4] as OneRegisterInstruction).registerA)
                injected += start until start + 4
            }
            assertEquals("${build.name}: the getter is otherwise Pinterest's", PinPageKit.kinds(got),
                PinPageKit.kinds(tells.filterIndexed { index, _ -> index !in injected }))
        }
    }

    @Test
    fun `a missing stub, request or board order reader refuses with Pinterest's code untouched`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val requestOwner = PatchContexts.of(classes).boardPickerRequest().method.definingClass
        val utils = classes.single { owner -> owner.methods.any { BOARD_SORT_UTILS in it.strings() } }.type
        val cases = linkedMapOf(
            "no boardOrderWhenSaving stub" to (PinPageKit.extensionWithout("boardOrderWhenSaving") + classes to "boardOrderWhenSaving"),
            "no boardPickerSort stub" to (PinPageKit.extensionWithout("boardPickerSort") + classes to "boardPickerSort"),
            "no board picker request" to (ExtensionDex.classes() + classes.filter { it.type != requestOwner } to "request for your boards"),
            "no board order reader" to (ExtensionDex.classes() + classes.filter { it.type != utils } to "board order class"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val thrown = assertThrows(reason, PatchException::class.java) { boardOrderWhenSavingPatch.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(message))
            for (flag in listOf("boardOrderWhenSaving", "boardPickerSort")) {
                assertEquals("$reason: $flag", 0, PinPageKit.flagOrZero(context, flag))
            }
            val present = input.map { it.type }.toSet()
            for (method in classes.filter { it.type in present }.flatMap { it.methods }.filter { it.implementation != null }) {
                assertEquals("$reason changed ${method.definingClass}->${method.name}",
                    method.instructions().map { it.opcode }, PinPageKit.patched(context, method).map { it.opcode })
            }
        }
    }
}
