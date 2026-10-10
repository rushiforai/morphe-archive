/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.betalogs

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.value.BooleanEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/** BuildVars' static initializer on both declared builds, where Telegram decides whether it logs. */
class TurnOffBetaLogsFixtureTest {
    private fun context(build: File): BytecodePatchContext {
        val host = FixtureDex.classes(build, setOf(LOG_SWITCHES)).values.map(ImmutableClassDef::of)
        assertEquals("${build.name}: BuildVars", 1, host.size)
        return PatchContexts.of(ExtensionDex.classes() + host)
    }

    private fun switchesStartOn(owner: ClassDef, name: String) =
        (owner.fields.single { it.name == name }.initialValue as? BooleanEncodedValue)?.value ?: false

    private fun ClassDef.status(name: String) = methods.single { it.name == name }.controlBody()

    @Test fun `the beta forces its logs through DEBUG_VERSION and the regular build doesn't`() {
        for (build in Fixtures.declaredBuilds()) {
            val owner = FixtureDex.classes(build, setOf(LOG_SWITCHES)).values.single()
            val beta = build.name.contains("beta")
            // Telegram Beta is built with DEBUG_VERSION on, and LOGS_ENABLED starts as its copy.
            assertEquals(build.name, beta, switchesStartOn(owner, "DEBUG_VERSION"))
            assertEquals(build.name, beta, switchesStartOn(owner, "LOGS_ENABLED"))
        }
    }

    @Test fun `the extension answers for DEBUG_VERSION where the logs are decided and nothing else moves`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val plan = context.resolveBetaLogs()
            val old = ImmutableMethod.of(plan.initializer)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { turnOffBetaLogsPatch.execute(context) })

            val before = old.controlBody()
            val after = plan.initializer.controlBody()
            assertEquals("$name: two instructions", before.size + 2, after.size)
            val read = plan.read
            assertEquals(DEBUG_VERSION, after[read].controlRef())
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_NEZ), after.subList(read + 1, read + 4).map { it.opcode })
            assertEquals("$BETA_LOGS->forceLogs(Z)Z", after[read + 1].controlRef())
            assertEquals(listOf(plan.register), after[read + 1].namedRegisters())
            assertEquals(listOf(plan.register), after[read + 2].namedRegisters())
            assertEquals(listOf(plan.register), after[read + 3].namedRegisters())
            val write = after.indices.single { after[it].opcode == Opcode.SPUT_BOOLEAN && after[it].controlRef() == LOGS_ENABLED }
            // A yes still jumps straight to the write, and a no reads the saved choice with the answer as its default.
            assertEquals("$name: the stock branch", setOf(read + 4, write), ControlFlow.of(plan.initializer).normal[read + 3].toSet())
            val saved = after.indices.single { after[it].controlRef() == SAVED_BOOLEAN }
            assertEquals(plan.register, after[saved].namedRegisters().last())
            for (i in before.indices) {
                val j = if (i <= read) i else i + 2
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), (before[i] as? ReferenceInstruction)?.reference?.toString()),
                    listOf(after[j].opcode, after[j].namedRegisters(), (after[j] as? ReferenceInstruction)?.reference?.toString()))
            }
            val status = context.mutableClassDefBy(SETTINGS_STATUS).status("betaLogsOff")
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a changed initializer refuses before anything is edited`() {
        val build = Fixtures.declaredBuilds().first()
        val shapes = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
            "DEBUG_VERSION no longer turns the logs on by itself" to { context ->
                val plan = context.resolveBetaLogs()
                plan.initializer.replaceInstruction(plan.read + 1, "nop")
            },
            "the DEBUG_VERSION read that decides the logs is missing or ambiguous" to { context ->
                val plan = context.resolveBetaLogs()
                plan.initializer.addInstruction(0, "sget-boolean v0, $DEBUG_VERSION")
            },
            "the saved logsEnabled choice no longer defaults to DEBUG_VERSION" to { context ->
                val plan = context.resolveBetaLogs()
                val saved = plan.initializer.controlBody().indexOfFirst { it.controlRef() == SAVED_BOOLEAN }
                val registers = plan.initializer.controlBody()[saved].namedRegisters()
                plan.initializer.replaceInstruction(saved, "invoke-interface {v${registers[0]}, v${registers[1]}, v${registers[1]}}, $SAVED_BOOLEAN")
            },
        )
        for ((why, change) in shapes) {
            val context = context(build)
            change(context)
            val initializer = context.mutableClassDefBy(LOG_SWITCHES).methods.single { it.name == "<clinit>" }
            val untouched = initializer.controlBody().map { it.opcode to it.namedRegisters() }
            try {
                turnOffBetaLogsPatch.execute(context)
                fail("$why: the patch went ahead")
            } catch (refused: PatchException) {
                assertTrue("$why: ${refused.message}", refused.message!!.contains(why))
            }
            assertEquals(why, untouched, initializer.controlBody().map { it.opcode to it.namedRegisters() })
            assertEquals(why, 0L, (context.mutableClassDefBy(SETTINGS_STATUS).status("betaLogsOff").first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
