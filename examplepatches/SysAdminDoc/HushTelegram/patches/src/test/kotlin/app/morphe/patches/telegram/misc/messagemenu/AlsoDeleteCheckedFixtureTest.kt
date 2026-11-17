/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** Also delete for, checked by default (#83): one hook in Telegram's delete messages dialog, right where it fills the box in. */
class AlsoDeleteCheckedFixtureTest {
    private fun Instruction.kind() = when (opcode) {
        Opcode.GOTO_16, Opcode.GOTO_32 -> Opcode.GOTO
        else -> opcode
    }

    private fun Instruction.shape() = listOf(kind(), namedRegisters(), controlRef())

    private fun status(context: BytecodePatchContext, flag: String) =
        (context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody().first() as? WideLiteralInstruction)?.wideLiteral

    /** Telegram's methods that call the hook, after the patch ran. */
    private fun callers(context: BytecodePatchContext): List<Method> {
        val found = mutableListOf<Method>()
        context.classDefForEach { cls ->
            if (cls.origType.startsWith("Lapp/hushtelegram/")) return@classDefForEach
            cls.methods.filterTo(found) { m -> m.controlBody().any { it.controlRef() == ALSO_DELETE_CHECKED } }
        }
        return found
    }

    @Test fun `the box's start and the dialog's flag both come from the switch, and the rest of the dialog stays Telegram's`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + MessageMenuFixtureTest().hosts(build))
            val plan = context.resolveAlsoDeleteChecked()
            assertEquals("$name: ${plan.missing}", null, plan.missing)
            val method = plan.method!!
            val old = ImmutableMethod.of(method)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageMenuPatch.execute(context) })

            val before = old.controlBody().filter { it.opcode != Opcode.NOP }
            val after = method.controlBody().filter { it.opcode != Opcode.NOP }
            val hooks = after.indices.filter { after[it].controlRef() == ALSO_DELETE_CHECKED }
            assertEquals("$name: one hook", 1, hooks.size)
            val at = hooks.single()
            assertEquals("$name: two instructions", before.size + 2, after.size)
            for (i in 0 until at) assertEquals("$name: stock $i", before[i].shape(), after[i].shape())
            for (i in at until before.size) assertEquals("$name: stock $i", before[i].shape(), after[i + 2].shape())

            // The hook sits right in front of the box's fill, reading the flag its listener is built with.
            val fill = before[at]
            assertEquals("$name: the box's fill follows the hook", listOf("Ljava/lang/CharSequence;", "Ljava/lang/String;", "Z", "Z", "Z"),
                fill.call()!!.origParameterTypes)
            val checked = fill.namedRegisters()[3]
            val made = (at + 1 until before.size).first { i ->
                before[i].call()?.let { it.name == "<init>" && it.parameterTypes.map(Any::toString).contains("[Z") } == true
            }
            val params = before[made].call()!!.parameterTypes.map(Any::toString)
            val slot = params.indexOf("[Z")
            val flag = before[made].namedRegisters()[1 + params.take(slot).sumOf { if (it == "J" || it == "D") 2 else 1 }]
            assertEquals(Opcode.INVOKE_STATIC_RANGE, after[at].opcode)
            assertEquals("$name: the listener's flag", listOf(flag), after[at].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, after[at + 1].opcode)
            assertEquals("$name: the box's start", listOf(checked), after[at + 1].namedRegisters())
            assertEquals("$name: Telegram's own fill follows", fill.shape(), after[at + 2].shape())

            assertEquals("$name: no other method calls the hook", 1, callers(context).size)
            for (flagName in listOf("alsoDeleteChecked", "messageMenuRepeat")) assertEquals("$name: $flagName", 1L, status(context, flagName))
        }
    }

    @Test fun `a dialog whose box no longer flips the flag keeps its unchecked start and the menu goes on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = MessageMenuFixtureTest().hosts(build)
            val listeners = hosts.flatMap { it.methods }.filter { it.isDeleteMessagesDialog() }.flatMap(::flagListeners).toSet()
            assertTrue("$name: the dialog builds its box's listener", listeners.isNotEmpty())
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.filter { it.type !in listeners })
            val plan = context.resolveAlsoDeleteChecked()
            assertTrue("$name: ${plan.missing}", plan.missing != null)
            val warnings = PatchLogCapture.warnings { messageMenuPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "goes on without checking Also delete for by default" in warnings.single())
            assertEquals("$name: no hook anywhere", emptyList<String>(), callers(context).map { it.name })
            assertTrue("$name: the build flag stays off", status(context, "alsoDeleteChecked") != 1L)
            assertEquals(1L, status(context, "messageMenuRepeat"))
        }
    }
}

/** The classes a method builds with a one-slot flag array: the delete dialog's checkbox listeners. */
private fun flagListeners(method: Method): List<String> = method.controlBody().mapNotNull { it.call() }
    .filter { it.name == "<init>" && it.parameterTypes.map(Any::toString).contains("[Z") }.map { it.definingClass }

/** What Also delete for needs beside the menu's own classes: the delete messages dialog and its box listeners. */
internal fun alsoDeleteHosts(build: File, base: List<ClassDef>): List<ClassDef> {
    val dialogs = FixtureDex.classesWhere(build, { true }) { it.isDeleteMessagesDialog() }
    val listeners = dialogs.flatMap { it.methods }.filter { it.isDeleteMessagesDialog() }.flatMap(::flagListeners).toSet()
    val more = FixtureDex.classesWhere(build, { true }) { it.definingClass in listeners }
    return (dialogs + more).filter { cls -> base.none { it.type == cls.type } }.distinctBy { it.type }.map(ImmutableClassDef::of)
}
