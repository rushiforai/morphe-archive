/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.api

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origRef
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/**
 * Sign-in help on each declared build: exactly one method is Telegram's general error handler, the
 * patch puts the extension's question in front of it with the error, screen and request, and the
 * handler's own code follows unchanged.
 */
class SignInHelpFixtureTest {
    @Test
    fun `the general error handler asks the extension first on each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { isProcessError(it) || it.googleFailures().isNotEmpty() }
            assertEquals("$name: one general error handler", 1, hosts.sumOf { host -> host.methods.count { isProcessError(it) } })
            val host = hosts.single { candidate -> candidate.methods.any { isProcessError(it) } }
            val before = host.methods.single { isProcessError(it) }.controlBody()

            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            assertEquals("$name: no warning", emptyList<String>(), PatchLogCapture.warnings { signInHelpPatch.execute(context) })

            val handler = context.tgMutableClassDefBy(host.type).methods.single { isProcessError(it) }
            val after = handler.controlBody()
            assertEquals("$name: five instructions", before.size + 5, after.size)
            assertEquals(
                listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN_OBJECT),
                after.take(5).map { it.opcode },
            )
            assertEquals(SIGN_IN_EXPLAIN, after[0].controlRef())
            // p1 to p3: the error, the screen and the request, past the locals.
            val call = after[0] as RegisterRangeInstruction
            val locals = handler.implementation!!.registerCount - 5
            assertEquals("$name: the error, screen and request", listOf(locals + 1, 3), listOf(call.startRegister, call.registerCount))
            for (i in before.indices) {
                assertEquals(
                    "$name: stock $i",
                    listOf(before[i].opcode, before[i].origRef()),
                    listOf(after[i + 5].opcode, after[i + 5].origRef()),
                )
            }
        }
    }

    @Test
    fun `a failed Google sign-in reaches the extension from both login email screens`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { it.googleFailures().isNotEmpty() }
            // 13.2's R8 merged the two screens' observers into one class, so the two handlers share one method.
            assertEquals(name, 2, hosts.sumOf { host -> host.methods.sumOf { it.googleFailures().size } })
            val operand = { op: Instruction -> op.opcode to op.origRef() }
            val stock = hosts.associate { host -> host.type to host.methods.single { it.googleFailures().isNotEmpty() }.controlBody().map(operand) }

            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            assertTrue(name, context.sayWhenGoogleFails())

            for (host in hosts) {
                val after = context.tgMutableClassDefBy(host.type).methods.single { it.origName == "didReceivedNotification" }.controlBody()
                val caught = after.indices.filter { after[it].opcode == Opcode.MOVE_EXCEPTION }
                assertEquals(name, host.methods.single { it.googleFailures().isNotEmpty() }.googleFailures().size, caught.size)
                for (at in caught) {
                    assertEquals(name, SIGN_IN_GOOGLE_FAILED, after[at + 1].controlRef())
                    val call = after[at + 1] as RegisterRangeInstruction
                    assertEquals(name, 1, call.registerCount)
                    assertEquals(name, (after[at] as OneRegisterInstruction).registerA, call.startRegister)
                }
                val hooks = caught.map { it + 1 }.toSet()
                assertEquals("$name: stock code stays", stock.getValue(host.type), after.filterIndexed { i, _ -> i !in hooks }.map(operand))
            }
        }
    }

    @Test
    fun `a build without the handler patches on and says each message is missing`() {
        val context = PatchContexts.of(ExtensionDex.classes())
        val warnings = PatchLogCapture.warnings { signInHelpPatch.execute(context) }
        assertEquals(warnings.toString(), 2, warnings.size)
        assertTrue(warnings.toString(), warnings.all { it.startsWith("Sign-in help:") })
    }
}
