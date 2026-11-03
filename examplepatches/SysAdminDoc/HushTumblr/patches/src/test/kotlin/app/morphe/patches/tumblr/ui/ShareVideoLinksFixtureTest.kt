/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import app.morphe.util.writesRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

/** #11: a long press on a video in a post did nothing, since 46.9's long-press callback for it is empty. */
@Category(FixtureTests::class)
class ShareVideoLinksFixtureTest {
    private val flags = listOf("shareVideoLinks", "videoLinkPress")

    private fun hosts(build: File): List<ClassDef> = FixtureDex.classesWhere(build, { true }) { method ->
        method.instructionList().any { step ->
            step.methodRef()?.let { it.definingClass == VIDEO_DETAILS && it.name == "<init>" } == true ||
                step.fieldRef()?.name == VIDEO_CONTROLLER_LAYOUT
        }
    }

    @Test fun `the video's address and the controls' long press go through the extension and nothing else moves`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val plan = context.resolveVideoLinks()
            val binder = plan.binder.instructionList().toList()
            val controls = plan.controls.instructionList().toList()
            assertEquals("${build.name}: the hook follows the container read", VIDEO_CONTAINER, binder[plan.bindAt - 1].fieldRef()?.type)
            val details = binder.indices.single { binder[it].methodRef()?.definingClass == VIDEO_DETAILS }
            val named = binder.subList(0, details).last { writesRegister(it, plan.address) }
            assertEquals("${build.name}: the address is the video's own text", Opcode.CHECK_CAST, named.opcode)
            assertEquals(build.name, "Ljava/lang/String;", ((named as ReferenceInstruction).reference as TypeReference).type)
            val set = controls[plan.pressAt]
            assertEquals(build.name, "setOnLongClickListener", set.methodRef()?.name)
            val others = classes.flatMap { it.methods }
                .filter { it.toString() != plan.binder.toString() && it.toString() != plan.controls.toString() }
                .associate { it.toString() to it.instructionList().map { step -> step.opcode } }

            shareVideoLinksPatch.execute(context)

            val bound = plan.binder.instructionList()
            assertEquals(build.name, VIDEO_BIND_HOOK, bound[plan.bindAt].methodRef().toString())
            assertEquals(build.name, listOf(plan.container, plan.address), bound[plan.bindAt].namedRegisters())
            assertEquals("${build.name}: every other step of the binder", binder.map { it.opcode },
                bound.filterIndexed { at, _ -> at != plan.bindAt }.map { it.opcode })
            val pressed = plan.controls.instructionList()
            assertEquals(build.name, VIDEO_PRESS_HOOK, pressed[plan.pressAt].methodRef().toString())
            assertEquals(build.name, listOf(plan.listener), pressed[plan.pressAt].namedRegisters())
            assertEquals(build.name, Opcode.MOVE_RESULT_OBJECT, pressed[plan.pressAt + 1].opcode)
            assertEquals(build.name, plan.listener, (pressed[plan.pressAt + 1] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: Tumblr sets the listener the extension handed back", set.namedRegisters(),
                pressed[plan.pressAt + 2].namedRegisters())
            assertEquals("${build.name}: every other step of the controls", controls.map { it.opcode },
                pressed.filterIndexed { at, _ -> at != plan.pressAt && at != plan.pressAt + 1 }.map { it.opcode })
            for (owner in classes) for (method in context.mutableClassDefBy(owner.type).methods) {
                val key = method.toString()
                if (key != plan.binder.toString() && key != plan.controls.toString()) {
                    assertEquals("${build.name}: keep $method", others.getValue(key), method.instructionList().map { it.opcode })
                }
            }
            assertFlags(context, 1)
        }
    }

    @Test fun `controls with no long-press listener refuse before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveVideoLinks()
            plan.controls.replaceInstruction(plan.pressAt, "invoke-virtual { v${plan.listener} }, Ljava/lang/Object;->hashCode()I")
            val binder = plan.binder.instructionList().map { it.opcode }
            val controls = plan.controls.instructionList().map { it.opcode }
            assertThrows(PatchException::class.java) { shareVideoLinksPatch.execute(context) }
            assertEquals(binder, plan.binder.instructionList().map { it.opcode })
            assertEquals(controls, plan.controls.instructionList().map { it.opcode })
            assertFlags(context, 0)
        }
    }

    @Test fun `a binder that changes the address before the container read refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveVideoLinks()
            plan.binder.addInstructions(plan.bindAt - 1, "const-string v${plan.address}, \"\"")
            val binder = plan.binder.instructionList().map { it.opcode }
            val controls = plan.controls.instructionList().map { it.opcode }
            assertThrows(PatchException::class.java) { shareVideoLinksPatch.execute(context) }
            assertEquals(binder, plan.binder.instructionList().map { it.opcode })
            assertEquals(controls, plan.controls.instructionList().map { it.opcode })
            assertFlags(context, 0)
        }
    }

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in flags) assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
