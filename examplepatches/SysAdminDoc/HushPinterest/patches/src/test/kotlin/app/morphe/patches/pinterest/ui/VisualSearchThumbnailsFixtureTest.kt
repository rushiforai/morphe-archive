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
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
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

/** The lens button, its stack of crops and the two pin pages that set it up. */
@Category(FixtureTests::class)
class VisualSearchThumbnailsFixtureTest {
    /** The stack, the button that builds it, and every class calling the button with one argument. */
    private fun read(build: File): List<ClassDef> {
        val stacks = mutableListOf<ClassDef>()
        FixtureDex.forEach(build) { dex -> dex.classes.filterTo(stacks) { it.superclass == IMAGE_STACK } }
        val stack = stacks.map { ImmutableClassDef.of(it) }.single()
        val buttons = mutableListOf<ClassDef>()
        FixtureDex.forEach(build) { dex ->
            for (owner in dex.classes) {
                val builds = owner.methods.any { method ->
                    method.instructions().any {
                        it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == stack.type
                    }
                }
                if (builds) buttons += ImmutableClassDef.of(owner)
            }
        }
        val button = buttons.single()
        val pages = FixtureDex.classesWhere(build, { true }) { method ->
            method.parameterTypes.size == 1 && method.calls().any { it.definingClass == button.type && it.returnType == "V" }
        }
        return (listOf(stack, button) + pages).distinctBy { it.type }
    }

    private fun readsCrops(method: Method) = method.instructions().indices.filter { at ->
        val body = method.instructions()
        val call = (body[at] as? ReferenceInstruction)?.reference as? MethodReference
        call != null && (body[at].opcode == Opcode.INVOKE_STATIC || body[at].opcode == Opcode.INVOKE_STATIC_RANGE) &&
            call.returnType == "Ljava/util/ArrayList;" && call.parameters() == method.parameters() &&
            body.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    }

    @Test
    fun `each declared APK runs every crop read on both pin pages through the hook`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val reads = context.visualSearchCropReads()
            assertEquals("${build.name}: both pin pages", 2, reads.map { it.method.definingClass + it.method.name }.toSet().size)
            hideVisualSearchThumbnailsPatch.execute(context)
            for (flag in listOf("hideVisualSearchThumbnails", "visualSearchThumbnails")) {
                assertEquals("${build.name}: $flag", 1, PinPageKit.flag(context, flag))
            }
            for (stock in reads.map { it.method }.distinctBy { it.definingClass + it.name }) {
                val was = stock.instructions()
                val sites = readsCrops(stock)
                assertTrue("${build.name}: ${stock.definingClass} reads crops", sites.isNotEmpty())
                val body = PinPageKit.patched(context, stock)
                val rebuilt = body.toMutableList()
                for (at in sites.indices) {
                    val result = sites[at] + 1 + 2 * at
                    val register = (body[result] as OneRegisterInstruction).registerA
                    val hook = body[result + 1]
                    assertEquals(build.name, VISUAL_SEARCH_THUMBNAILS_HOOK, PinPageKit.target(hook))
                    assertEquals(build.name, Opcode.INVOKE_STATIC_RANGE, hook.opcode)
                    assertEquals(build.name, register, (hook as RegisterRangeInstruction).startRegister)
                    assertEquals(build.name, 1, hook.registerCount)
                    assertEquals(build.name, Opcode.MOVE_RESULT_OBJECT, body[result + 2].opcode)
                    assertEquals(build.name, register, (body[result + 2] as OneRegisterInstruction).registerA)
                }
                for (at in sites.indices.reversed()) {
                    val result = sites[at] + 1 + 2 * at
                    rebuilt.removeAt(result + 2)
                    rebuilt.removeAt(result + 1)
                }
                assertEquals("${build.name}: the rest stays Pinterest's", PinPageKit.kinds(was), PinPageKit.kinds(rebuilt))
            }
        }
    }

    @Test
    fun `a missing stack or status stub refuses with nothing changed`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val pages = classes.filter { it.superclass != IMAGE_STACK }
        val inputs = linkedMapOf(
            "no stack" to (ExtensionDex.classes() + pages),
            "no hideVisualSearchThumbnails stub" to (PinPageKit.extensionWithout("hideVisualSearchThumbnails") + classes),
            "no visualSearchThumbnails stub" to (PinPageKit.extensionWithout("visualSearchThumbnails") + classes),
        )
        for ((reason, input) in inputs) {
            val context = PatchContexts.of(input)
            assertThrows(reason, PatchException::class.java) { hideVisualSearchThumbnailsPatch.execute(context) }
            assertEquals(reason, 0, PinPageKit.flagOrZero(context, "hideVisualSearchThumbnails"))
            assertEquals(reason, 0, PinPageKit.flagOrZero(context, "visualSearchThumbnails"))
            for (owner in pages) for (method in owner.methods.filter { readsCrops(it).isNotEmpty() }) {
                assertEquals(reason, method.instructions().map { it.opcode }, PinPageKit.patched(context, method).map { it.opcode })
            }
        }
    }
}
