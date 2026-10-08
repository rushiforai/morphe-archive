/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.comments.summaries

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Hide Meta AI comment summaries on every Facebook build the bundle declares: the comment sheet's
 * top content socket and the socket under a post's buttons, each found by the name it gives
 * itself, its name table by the summary plugins it names, and its check by the plugin numbers it
 * shares with the table. Then the hook on each check: the plugin's name from the table with the
 * check's own number, the extension asked, a yes answering no, a no landing on Facebook's first
 * instruction, and nothing of Facebook's code moved. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class HideMetaAiCommentSummariesFixtureTest {
    private fun bundles(check: (File) -> Unit) {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                check(bundle)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

    private fun holders(bundle: File, string: String) =
        FixtureDex.classesHolding(bundle, string).filterNot { it.type.startsWith(EXTENSION_CLASSES) }

    /** Finds the socket, checks what the hook rests on, and hooks its check in a context of its own. */
    private fun socket(bundle: File, socket: String, plugin: String, alsoNamed: List<String>): PluginSocket {
        val name = bundle.name
        val table = nameTable(holders(bundle, plugin), plugin, alsoNamed)
        val owner = FixtureDex.classes(bundle, setOf(table.definingClass)).values.single()
        val sockets = holders(bundle, socket).flatMap { methodsHolding(it, socket) }
        assertTrue("$name: nothing names \"$socket\"", sockets.isNotEmpty())
        val check = socketCheck(table, owner, sockets)
        val where = "$name: ${check.descriptor()}"
        assertTrue("$where isn't static", AccessFlags.STATIC.isSet(check.accessFlags))
        assertTrue("$where: the table has no plugins", switchKeys(table).single().size > 1)
        // The hook borrows v0, and the plugin's number is the last register.
        assertTrue("$where has no local register for the hook",
            check.implementation!!.registerCount - check.parameterTypes.size >= 1)

        val context = PatchContexts.of(listOf(owner))
        val method = context.mutableClassDefBy(owner.type).methods.single { it.descriptor() == check.descriptor() }
        val original = method.implementation!!.instructions.toList()
        method.holdSummaries(table)
        val patched = method.implementation!!.instructions.toList()
        assertEquals("$where gains seven instructions", original.size + 7, patched.size)
        assertEquals("$where: the plugin's name comes from the table", table.descriptor(), patched[0].reference())
        val range = patched[0] as RegisterRangeInstruction
        assertEquals("$where: with the check's own number", listOf(method.implementation!!.registerCount - 1, 1),
            listOf(range.startRegister, range.registerCount))
        assertEquals("$where: the name is kept", Opcode.MOVE_RESULT_OBJECT, patched[1].opcode)
        val register = (patched[1] as OneRegisterInstruction).registerA
        assertTrue("$where: the hook writes v$register, which isn't a local", register < method.localRegisterCount())
        assertEquals("$where: the extension is asked", HOLDS, patched[2].reference())
        assertEquals("$where: its answer is kept", Opcode.MOVE_RESULT, patched[3].opcode)
        assertEquals("$where: a no goes on to Facebook", Opcode.IF_EQZ, patched[4].opcode)
        assertEquals("$where: a yes answers no", listOf(Opcode.CONST_4, Opcode.RETURN), patched.subList(5, 7).map { it.opcode })
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(7).map { it.opcode })
        assertEquals("$where: a no lands on Facebook's first instruction", setOf(5, 7), ControlFlow.of(method).normal[4].toSet())
        return PluginSocket(table, check)
    }

    @Test
    fun `each declared build holds the comment sheet's summaries and the one under posts`() = bundles { bundle ->
        val sheet = socket(bundle, SHEET_SOCKET, SHEET_DEEP_DIVE, listOf(SHEET_SUMMARY))
        val post = socket(bundle, POST_SOCKET, POST_SUMMARY, emptyList())
        assertNotEquals("${bundle.name}: both sockets lead to one check", sheet.check.descriptor(), post.check.descriptor())
    }
}
