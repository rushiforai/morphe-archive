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
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

/** Images in posts load Tumblr's 640 wide copy even when the post lists a sharper one. */
@Category(FixtureTests::class)
class SharperImagesFixtureTest {
    private val flags = listOf("sharperImages", "imageSizes")

    private fun hosts(build: File): List<ClassDef> = FixtureDex.classesWhere(build, { true }) { method ->
        method.definingClass == PHOTO_SIZE ||
            (method.returnType == PHOTO_SIZE && method.parameterTypes.any { it.toString() == PHOTO_INFO })
    }

    @Test fun `every pick of the size chooser goes through the extension and nothing else moves`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val plan = context.resolveSharperImages()
            val before = plan.chooser.instructionList().toList()
            assertEquals("${build.name}: the sizes come from the image's own list", PHOTO_INFO, before[0].methodRef()?.definingClass)
            assertEquals(build.name, plan.sizes, (before[1] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: the width is the one Tumblr asked for", plan.chooser.parameterRegisterNumber(1), plan.width)
            assertTrue("${build.name}: both of 47.0's picks", plan.returns.size >= 2)
            plan.returns.forEach { assertEquals(build.name, Opcode.RETURN_OBJECT, before[it.at].opcode) }
            val others = classes.flatMap { it.methods }.filter { it.toString() != plan.chooser.toString() }
                .associate { it.toString() to it.instructionList().map { step -> step.opcode } }

            sharperImagesPatch.execute(context)

            val after = plan.chooser.instructionList()
            val inserted = mutableSetOf<Int>()
            plan.returns.sortedBy { it.at }.forEachIndexed { k, site ->
                val at = site.at + 3 * k
                assertEquals(build.name, SHARPER_IMAGES_HOOK, after[at].methodRef().toString())
                assertEquals(build.name, listOf(plan.sizes, site.pick, plan.width), after[at].namedRegisters())
                assertEquals(build.name, Opcode.MOVE_RESULT_OBJECT, after[at + 1].opcode)
                assertEquals(build.name, site.pick, (after[at + 1] as OneRegisterInstruction).registerA)
                assertEquals(build.name, Opcode.CHECK_CAST, after[at + 2].opcode)
                assertEquals(build.name, site.pick, (after[at + 2] as OneRegisterInstruction).registerA)
                assertEquals(build.name, PHOTO_SIZE, ((after[at + 2] as ReferenceInstruction).reference as TypeReference).type)
                assertEquals("${build.name}: Tumblr returns what the extension handed back", before[site.at].namedRegisters(),
                    after[at + 3].namedRegisters())
                inserted += listOf(at, at + 1, at + 2)
            }
            assertEquals("${build.name}: every other step of the chooser", before.map { it.opcode },
                after.filterIndexed { at, _ -> at !in inserted }.map { it.opcode })
            assertTrue(build.name, HUSH_PHOTO_SIZE in context.mutableClassDefBy(PHOTO_SIZE).interfaces)
            for (owner in classes) for (method in context.mutableClassDefBy(owner.type).methods) {
                val key = method.toString()
                if (key != plan.chooser.toString()) {
                    assertEquals("${build.name}: keep $method", others.getValue(key), method.instructionList().map { it.opcode })
                }
            }
            assertFlags(context, 1)
        }
    }

    @Test fun `a chooser that reuses the sizes register refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveSharperImages()
            plan.chooser.addInstructions(plan.returns.last().at, "const/4 v${plan.sizes}, 0x0")
            assertRefused(context, plan, "reuses the register holding the sizes")
        }
    }

    @Test fun `a chooser that overwrites the width before a pick refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveSharperImages()
            plan.chooser.addInstructions(plan.returns.last().at, "const/4 v${plan.width}, 0x0")
            assertRefused(context, plan, "writes over parameter 1 (v${plan.width})")
        }
    }

    @Test fun `an image size without its public url getter refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveSharperImages()
            context.mutableClassDefBy(PHOTO_SIZE).methods.removeAll { it.name == "getUrl" }
            assertRefused(context, plan, "no longer has a public getUrl()")
        }
    }

    @Test fun `an image size already bridged refuses before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveSharperImages()
            context.mutableClassDefBy(PHOTO_SIZE).interfaces.add(HUSH_PHOTO_SIZE)
            assertRefused(context, plan, "already bridged")
        }
    }

    private fun assertRefused(context: BytecodePatchContext, plan: SharperImagesPlan, reason: String) {
        val chooser = plan.chooser.instructionList().map { it.opcode }
        val interfaces = context.mutableClassDefBy(PHOTO_SIZE).interfaces.toList()
        val refusal = assertThrows(PatchException::class.java) { sharperImagesPatch.execute(context) }
        assertTrue(refusal.message, refusal.message.orEmpty().contains(reason))
        assertEquals(chooser, plan.chooser.instructionList().map { it.opcode })
        assertEquals(interfaces, context.mutableClassDefBy(PHOTO_SIZE).interfaces.toList())
        assertFlags(context, 0)
    }

    private fun assertFlags(context: BytecodePatchContext, expected: Int) {
        for (flag in flags) assertEquals(flag, expected, (context.mutableClassDefBy(SETTINGS_STATUS).methods.single {
            it.name == flag }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
