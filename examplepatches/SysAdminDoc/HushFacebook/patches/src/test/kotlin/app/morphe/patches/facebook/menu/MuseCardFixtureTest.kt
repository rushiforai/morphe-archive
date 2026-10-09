/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.menu

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The Muse card's anchor on every Facebook build the bundle declares: one Menu bookmark component
 * loading the dismissal state update, whose render makes one dismissal read before it, for the
 * bookmark the component keeps. Then the hook on that render: the answer and the bookmark go to
 * the extension right after the read, the extension's answer goes back to the same register, and
 * the comparison with the card's state comes next, unchanged. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class MuseCardFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    @Test
    fun `each declared build hands the Muse card's dismissal to the extension before the render compares it`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, NT_DISMISSED_UPDATE)
                    .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                val renders = holders.flatMap { holder -> holder.methods.filter(::isBookmarkRender).map { holder to it } }
                assertEquals("$name: bookmark renders loading \"$NT_DISMISSED_UPDATE\"", 1, renders.size)
                val (component, render) = renders.single()
                val read = dismissalRead(component, render)
                assertNotNull("$name: no dismissal read in ${render.definingClass}->${render.name}", read)
                val original = render.code()

                // The read asks about the bookmark the component keeps in a field of its own.
                val call = original[read!!.index - 1] as FiveRegisterInstruction
                val asked = ((call as ReferenceInstruction).reference as MethodReference).parameterTypes[1].toString()
                assertTrue("$name: the dismissal read's bookmark type $asked isn't a field of ${component.type}",
                    component.fields.any { it.type == asked })

                val context = PatchContexts.of(listOf(component))
                val mutable = context.mutableClassDefBy(component.type).methods.single { isBookmarkRender(it) }
                mutable.askAboutDismissal(read)
                val patched = mutable.code()

                assertEquals("$name: two instructions added", original.size + 2, patched.size)
                assertEquals("$name: the read's answer is kept first", Opcode.MOVE_RESULT, patched[read.index].opcode)
                val hook = patched[read.index + 1]
                assertEquals("$name: the added call", Opcode.INVOKE_STATIC, hook.opcode)
                assertEquals("$name: the call", MUSE_DISMISSED, ((hook as ReferenceInstruction).reference as MethodReference).toString())
                assertEquals("$name: the answer goes first", read.answer, (hook as FiveRegisterInstruction).registerC)
                assertEquals("$name: then the bookmark", call.registerE, hook.registerD)
                assertEquals("$name: two registers handed over", 2, hook.registerCount)
                val back = patched[read.index + 2]
                assertEquals("$name: the extension's answer is kept", Opcode.MOVE_RESULT, back.opcode)
                assertEquals("$name: in the answer's register", read.answer, (back as OneRegisterInstruction).registerA)
                assertEquals("$name: the comparison with the card's state follows", original[read.index + 1].opcode,
                    patched[read.index + 3].opcode)
                assertEquals("$name: the rest of the render is untouched",
                    original.drop(read.index + 1).map { it.opcode }, patched.drop(read.index + 3).map { it.opcode })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
