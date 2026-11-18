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
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** The closeup title module, which the image size shares with the posted date. */
@Category(FixtureTests::class)
class ShowImageSizeFixtureTest {
    private fun read(build: File): List<ClassDef> {
        val found = mutableListOf<ClassDef>()
        FixtureDex.forEach(build) { dex ->
            for (owner in dex.classes) {
                if (owner.superclass == CLOSEUP_MODULE ||
                    owner.methods.any { it.name == "<init>" && it.instructions().any { read -> read.readsId(TITLE_CHEVRON_ID) } }
                ) found += ImmutableClassDef.of(owner)
            }
        }
        return found
    }

    private fun titleUpdates(classes: List<ClassDef>): List<Method> = classes.filter { it.superclass == CLOSEUP_MODULE }
        .flatMap { owner -> owner.methods.filter { it.name == "updatePin" && HOLISTIC_METADATA in it.strings() } }

    @Test
    fun `each declared APK hands the title module and its pin over, alone or beside the posted date`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            showImageSizePatch.execute(context)
            showPostedDatePatch.execute(context)
            for (flag in listOf("showImageSize", "imageSize")) assertEquals("${build.name}: $flag", 1, PinPageKit.flag(context, flag))

            val hooked = titleUpdates(classes).filter { update ->
                PinPageKit.patched(context, update).take(2).any { PinPageKit.target(it) == IMAGE_SIZE_HOOK }
            }
            val title = hooked.singleOrNull() ?: error("${build.name}: ${hooked.size} title modules hooked")
            val body = PinPageKit.patched(context, title)
            assertEquals(build.name, setOf(IMAGE_SIZE_HOOK, POSTED_DATE_HOOK), body.take(2).map(PinPageKit::target).toSet())
            val registers = title.implementation!!.registerCount
            for (hook in body.take(2)) {
                assertEquals(build.name, Opcode.INVOKE_STATIC_RANGE, hook.opcode)
                assertEquals("${build.name}: the module, then the pin", registers - 2, (hook as RegisterRangeInstruction).startRegister)
                assertEquals(build.name, 2, hook.registerCount)
            }
            assertEquals("${build.name}: Pinterest's own update follows", PinPageKit.kinds(title.instructions()), PinPageKit.kinds(body.drop(2)))
        }
    }

    @Test
    fun `a missing title module or status stub refuses with nothing changed`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val inputs = linkedMapOf(
            "no title module" to (ExtensionDex.classes() to "closeup title module"),
            "no showImageSize stub" to (PinPageKit.extensionWithout("showImageSize") + classes to "showImageSize"),
            "no imageSize stub" to (PinPageKit.extensionWithout("imageSize") + classes to "imageSize"),
        )
        for ((reason, case) in inputs) {
            val context = PatchContexts.of(case.first)
            val thrown = assertThrows(reason, PatchException::class.java) { showImageSizePatch.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(case.second))
            assertEquals(reason, 0, PinPageKit.flagOrZero(context, "showImageSize"))
            assertEquals(reason, 0, PinPageKit.flagOrZero(context, "imageSize"))
            if (case.first.any { it.superclass == CLOSEUP_MODULE }) for (update in titleUpdates(classes)) {
                assertEquals(reason, update.instructions().map { it.opcode }, PinPageKit.patched(context, update).map { it.opcode })
            }
        }
    }
}
