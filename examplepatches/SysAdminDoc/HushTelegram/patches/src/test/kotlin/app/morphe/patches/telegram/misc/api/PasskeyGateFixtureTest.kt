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
import app.morphe.util.injection.assemble
import app.morphe.util.injection.hostClass
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The passkey gate on each declared build: Telegram's five reads of BuildVars.SUPPORTS_PASSKEYS
 * (passkey creation, passkey login, the privacy settings row and its tap, and the sign-in screen's
 * passkey step) and the chat list's SETUP_PASSKEY banner check each hand their answer to the
 * extension, in the same register, and the rest of each method is Telegram's code unchanged.
 */
class PasskeyGateFixtureTest {
    private fun Instruction.shape() = listOf(opcode, (this as? ReferenceInstruction)?.reference?.toString())

    @Test
    fun `every passkey check asks the extension on each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { passkeyGates(it).isNotEmpty() }
            val gated = hosts.flatMap { host -> host.methods.filter { passkeyGates(it).isNotEmpty() }.map { host.type to it } }
            val reads = gated.flatMap { (type, method) ->
                passkeyGates(method).filter { method.controlBody()[it].opcode == Opcode.SGET_BOOLEAN }.map { "$type->${method.name}" }
            }
            assertEquals("$name: five SUPPORTS_PASSKEYS reads", 5, reads.size)
            assertTrue("$name: creation and login read it: $reads", reads.containsAll(listOf(
                "Lorg/telegram/messenger/PasskeysController;->create", "Lorg/telegram/messenger/PasskeysController;->login")))
            assertEquals("$name: the privacy row and its tap: $reads", 2,
                reads.count { it.startsWith("Lorg/telegram/ui/PrivacySettingsActivity;->") })
            assertEquals("$name: one SETUP_PASSKEY banner check", 6, gated.sumOf { passkeyGates(it.second).size })
            assertTrue("$name: BuildVars' own write stays", gated.none { it.first == "Lorg/telegram/messenger/BuildVars;" })

            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            assertEquals("$name: no warning", emptyList<String>(), PatchLogCapture.warnings { passkeyGatePatch.execute(context) })

            for ((type, stock) in gated) {
                val where = "$name: $type->${stock.name}"
                val gates = passkeyGates(stock).toSet()
                val before = stock.controlBody()
                val after = context.mutableClassDefBy(type).methods.single {
                    it.name == stock.name && it.parameterTypes == stock.parameterTypes && it.returnType == stock.returnType
                }.controlBody().filter { it.opcode != Opcode.NOP }
                val expected = mutableListOf<List<Any?>>()
                for ((index, instruction) in before.withIndex()) {
                    if (instruction.opcode == Opcode.NOP) continue
                    expected += instruction.shape()
                    if (index in gates) {
                        expected += listOf(Opcode.INVOKE_STATIC_RANGE, PASSKEYS_WORK)
                        expected += listOf(Opcode.MOVE_RESULT, null)
                    }
                }
                assertEquals("$where: hooked after each gate, stock otherwise", expected, after.map { it.shape() })
                // The hook reads and writes back the gate's own register.
                var at = 0
                for ((index, instruction) in before.withIndex()) {
                    if (instruction.opcode == Opcode.NOP) continue
                    at++
                    if (index !in gates) continue
                    val register = (instruction as OneRegisterInstruction).registerA
                    val call = after[at] as RegisterRangeInstruction
                    assertEquals("$where: the call takes v$register", listOf(register, 1), listOf(call.startRegister, call.registerCount))
                    assertEquals("$where: the answer goes back to v$register", register, (after[at + 1] as OneRegisterInstruction).registerA)
                    assertEquals(PASSKEYS_WORK, call.controlRef())
                    at += 2
                }
            }
        }
    }

    private val read = """
        .method public static plain()Z
            .registers 1
            sget-boolean v0, Lorg/telegram/messenger/BuildVars;->SUPPORTS_PASSKEYS:Z
            return v0
        .end method
    """.trimIndent()

    private val banner = """
        .method public static banner(Ljava/util/Set;)Z
            .registers 2
            const-string v0, "SETUP_PASSKEY"
            invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
            move-result v0
            return v0
        .end method
    """.trimIndent()

    private fun warningsFor(smali: String): List<String> {
        val host = ImmutableClassDef.of(assemble(hostClass("Lcom/example/Host;", smali)))
        return PatchLogCapture.warnings { passkeyGatePatch.execute(PatchContexts.of(ExtensionDex.classes() + host)) }
    }

    @Test
    fun `a check something else jumps onto is left alone and named`() {
        val host = ImmutableClassDef.of(assemble(hostClass("Lcom/example/Host;", read + "\n\n" + banner + "\n\n" + """
            .method public static loop()V
                .registers 1
                sget-boolean v0, Lorg/telegram/messenger/BuildVars;->SUPPORTS_PASSKEYS:Z
                :check
                if-nez v0, :done
                const/4 v0, 0x1
                goto :check
                :done
                return-void
            .end method
        """.trimIndent())))
        val context = PatchContexts.of(ExtensionDex.classes() + host)
        val warnings = PatchLogCapture.warnings { passkeyGatePatch.execute(context) }
        assertEquals(listOf("Passkeys: 1 of 3 passkey checks have another way in, so those still offer passkeys on a " +
            "re-signed install."), warnings)
        val patched = context.mutableClassDefBy("Lcom/example/Host;").methods.associateBy { it.name }
        assertEquals(PASSKEYS_WORK, patched.getValue("plain").controlBody()[1].controlRef())
        assertEquals(PASSKEYS_WORK, patched.getValue("banner").controlBody()[3].controlRef())
        assertEquals(listOf(Opcode.SGET_BOOLEAN, Opcode.IF_NEZ, Opcode.CONST_4, Opcode.GOTO, Opcode.RETURN_VOID),
            patched.getValue("loop").controlBody().map { it.opcode })
    }

    @Test
    fun `a build that lost one kind of check says which`() {
        assertEquals(listOf("Passkeys: the chat list's check for the set up a passkey banner wasn't found, so the " +
            "banner can still show on a re-signed install."), warningsFor(read))
        assertEquals(listOf("Passkeys: Telegram's passkey switch wasn't read anywhere, so a re-signed install still " +
            "offers passkey setup and the passkey step at sign-in."), warningsFor(banner))
        assertEquals(emptyList<String>(), warningsFor(read + "\n\n" + banner))
    }

    @Test
    fun `a build without passkey checks patches on and says so`() {
        val context = PatchContexts.of(ExtensionDex.classes())
        val warnings = PatchLogCapture.warnings { passkeyGatePatch.execute(context) }
        assertEquals(1, warnings.size)
        assertTrue(warnings.single(), warnings.single().startsWith("Passkeys:"))
    }
}
