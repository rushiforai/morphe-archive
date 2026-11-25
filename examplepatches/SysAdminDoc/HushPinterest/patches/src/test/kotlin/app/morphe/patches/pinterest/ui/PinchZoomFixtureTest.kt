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
import app.morphe.patches.pinterest.actions.PIN_CLOSEUP_PRESENTER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** #48: the pin page's pinch handler, which now asks the extension first when the jump came from a pinch. */
@Category(FixtureTests::class)
class PinchZoomFixtureTest {
    private val flags = listOf("pinchToZoomOnly", "pinchZoomViewer")

    /** The organic pin page presenter and the type of every field of the pinch's context its handler reads. */
    private fun read(build: File): List<ClassDef> {
        val found = FixtureDex.classesWhere(build, { true }) { it.definingClass == PIN_CLOSEUP_PRESENTER }
        val handler = found.single { it.type == PIN_CLOSEUP_PRESENTER }.methods.single { it.name == PINCH_HANDLER }
        val types = handler.fields().filter { it.definingClass == PINCH_CONTEXT }.map { it.type }.toSet()
        return (found + FixtureDex.classes(build, types).values).distinctBy { it.type }
    }

    @Test
    fun `each declared APK checks for a pinch and asks the extension before the pin page loads anything`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val handler = PatchContexts.of(classes).pinchHandler()
            val self = handler.method.implementation!!.registerCount - 2
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            pinchToZoomOnlyPatch.execute(context)
            for (flag in flags) assertEquals("${build.name}: $flag", 1, PinPageKit.flag(context, flag))

            val before = handler.method.instructions()
            val after = PinPageKit.patched(context, handler.method)
            val jumps = (context.mutableClassDefBy(PIN_CLOSEUP_PRESENTER).methods.single { it.name == PINCH_HANDLER } as MutableMethod)
                .implementation!!.instructions
            assertEquals(build.name, Opcode.MOVE_OBJECT_FROM16, after[0].opcode)
            val value = (after[0] as OneRegisterInstruction).registerA
            assertEquals("${build.name}: the context comes in", self + 1, (after[0] as TwoRegisterInstruction).registerB)
            assertEquals(build.name, Opcode.IGET_OBJECT, after[1].opcode)
            assertEquals(build.name, handler.source.toString(), PinPageKit.target(after[1]))
            assertEquals(build.name, listOf(value, value), (after[1] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
            assertEquals(build.name, Opcode.SGET_OBJECT, after[2].opcode)
            assertEquals(build.name, handler.pinch, PinPageKit.target(after[2]))
            val pinch = (after[2] as OneRegisterInstruction).registerA
            assertTrue("${build.name}: v$value and v$pinch are two locals below v16", value != pinch && value <= 15 && pinch <= 15 && value < self && pinch < self)
            assertEquals(build.name, Opcode.IF_NE, after[3].opcode)
            assertEquals(build.name, listOf(value, pinch), (after[3] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
            assertEquals("${build.name}: anything but a pinch goes on as before", 10, (jumps[3] as BuilderOffsetInstruction).target.location.index)
            assertEquals(build.name, Opcode.MOVE_OBJECT_FROM16, after[4].opcode)
            assertEquals(build.name, value, (after[4] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: the presenter comes in", self, (after[4] as TwoRegisterInstruction).registerB)
            assertEquals(build.name, Opcode.IGET_OBJECT, after[5].opcode)
            assertEquals(build.name, handler.pin, PinPageKit.target(after[5]))
            assertEquals(build.name, PINCH_ZOOM_HOOK, PinPageKit.target(after[6]))
            assertEquals("${build.name}: the pin goes in", listOf(value), after[6].passed())
            assertEquals(build.name, Opcode.MOVE_RESULT, after[7].opcode)
            assertEquals(build.name, value, (after[7] as OneRegisterInstruction).registerA)
            assertEquals(build.name, Opcode.IF_EQZ, after[8].opcode)
            assertEquals(build.name, value, (after[8] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: no goes on as before", 10, (jumps[8] as BuilderOffsetInstruction).target.location.index)
            assertEquals("${build.name}: yes ends the handler", Opcode.RETURN_VOID, after[9].opcode)
            assertEquals("${build.name}: the handler is otherwise Pinterest's", PinPageKit.kinds(before), PinPageKit.kinds(after.drop(10)))
            assertTrue("${build.name}: nothing jumps into the check", jumps.filterIsInstance<BuilderOffsetInstruction>()
                .none { it.target.location.index in 1..9 })
        }
    }

    @Test
    fun `a missing stub, handler or pinch source refuses with Pinterest's code untouched`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val source = PatchContexts.of(classes).pinchHandler().source.type
        val cases = linkedMapOf(
            "no pinchToZoomOnly stub" to (PinPageKit.extensionWithout("pinchToZoomOnly") + classes to "pinchToZoomOnly"),
            "no pinchZoomViewer stub" to (PinPageKit.extensionWithout("pinchZoomViewer") + classes to "pinchZoomViewer"),
            "no pin page presenter" to (ExtensionDex.classes() + classes.filter { it.type != PIN_CLOSEUP_PRESENTER } to "pin page presenter"),
            "no pinch source" to (ExtensionDex.classes() + classes.filter { it.type != source } to "pinch's source"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val thrown = assertThrows(reason, PatchException::class.java) { pinchToZoomOnlyPatch.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(message))
            for (flag in flags) assertEquals("$reason: $flag", 0, PinPageKit.flagOrZero(context, flag))
            val present = input.map { it.type }.toSet()
            for (method in classes.filter { it.type in present }.flatMap { it.methods }.filter { it.implementation != null }) {
                assertEquals("$reason changed ${method.definingClass}->${method.name}",
                    method.instructions().map { it.opcode }, PinPageKit.patched(context, method).map { it.opcode })
            }
        }
    }
}
