/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.paste

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origType

/** The Mention by ID hook on the real pinned web and Play builds. */
class MentionByIdFixtureTest {
    @Test fun `the entities method hands its list over before its last return only when asked, and keeps its stock body`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val site = context.resolveMentionById()
            // Both 13.2 builds only fall into their last return. A copy with an early exit that
            // jumps onto it, the way 13.1.1's web build did, shows a jump lands on the hook too.
            val early = MutableMethod(ImmutableMethod.of(site.method)).apply {
                addInstructionsWithLabels(site.index, "if-eqz v${site.gate}, :hush_return\nnop",
                    ExternalLabel("hush_return", getInstruction(site.index)))
            }
            assertTrue("$name: the stock return is only fallen into", !hooked(name, site))
            assertTrue("$name: the early exit jumps onto the return",
                hooked("$name with an early exit", MentionSite(early, site.index + 2, site.register, site.controller, site.text, site.gate)))
        }
    }

    /** Checks [site] once hooked, and answers whether anything but the instruction before it jumped onto the stock return. */
    private fun hooked(name: String, site: MentionSite): Boolean {
        val stock = ImmutableMethod.of(site.method)
        val before = stock.controlBody()
        val stockFlow = ControlFlow.of(stock)
        val last = before.lastIndex
        assertEquals(Opcode.RETURN_OBJECT, before[last].opcode)
        assertEquals("$name: the hook goes at the last return", last, site.index)
        val arrivals = stockFlow.normal.indices.filter { last in stockFlow.normal[it] }
        assertTrue("$name: something reaches the stock return", arrivals.isNotEmpty())
        site.insert()

        val after = site.method.controlBody()
        val flow = ControlFlow.of(site.method)
        assertEquals("$name: the stock body is whole", before.dropLast(1).map { it.shape() }, after.take(last).map { it.shape() })
        // The jumps that went to the return now land on the hook's check.
        for (from in arrivals) assertTrue("$name: $from", last in flow.normal[from])
        val gate = after[last]
        assertEquals(Opcode.IF_EQZ, gate.opcode)
        assertEquals(listOf(site.gate), gate.namedRegisters())
        val hook = after.subList(last + 1, after.size - 2).filter { it.opcode != Opcode.NOP }
        val moves = hook.dropLast(2).associate { it.namedRegisters().let { (to, from) -> to to from } }
        assertTrue("$name: $moves", hook.dropLast(2).all { it.opcode == Opcode.MOVE_OBJECT_FROM16 })
        assertEquals("$name: the controller, the text and the list", mapOf(0 to site.controller, 1 to site.text) +
            if (site.register == 2) emptyMap() else mapOf(2 to site.register), moves)
        val call = hook[hook.size - 2]
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(ADD_MENTIONS, call.controlRef())
        assertEquals(listOf(0, 1, 2), call.namedRegisters())
        assertEquals(Opcode.MOVE_RESULT_OBJECT, hook.last().opcode)
        assertEquals(listOf(site.register), hook.last().namedRegisters())
        // A false last argument skips straight to the stock return, with the list untouched.
        val skip = flow.normal[last].single { it != last + 1 }
        assertEquals(Opcode.NOP, after[skip].opcode)
        assertEquals(listOf(after.lastIndex), flow.normal[skip])
        assertEquals(Opcode.RETURN_OBJECT, after.last().opcode)
        assertEquals(listOf(site.register), after.last().namedRegisters())
        assertTrue("$name: the arguments stay as the caller passed them", before.none { instruction ->
            instruction.opcode.setsRegister() && instruction.namedRegisters().firstOrNull() in setOf(site.controller, site.text, site.gate) })
        return arrivals.any { it != last - 1 }
    }

    private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.shape() =
        Triple(opcode.let { if (it == Opcode.GOTO_16 || it == Opcode.GOTO_32) Opcode.GOTO else it }, controlRef(), namedRegisters())

    private fun hosts(build: File): List<ClassDef> {
        val found = FixtureDex.classesWhere(build, { true }) { method: Method ->
            method.origDefiningClass == "Lorg/telegram/messenger/MediaDataController;" && method.origName == "getEntities"
        }.associateByTo(linkedMapOf()) { it.type }
        while (true) {
            val ancestors = found.values.flatMap { listOfNotNull(it.superclass) + it.interfaces }
                .filter { it.startsWith("Lorg/telegram/") && it !in found }.toSet()
            if (ancestors.isEmpty()) break
            val more = FixtureDex.classes(build, ancestors)
            assertEquals("${build.name}: declared Telegram ancestor classes", ancestors, more.keys)
            found.putAll(more)
        }
        assertTrue("${build.name}: the media controller", found.values.any { it.origType == "Lorg/telegram/messenger/MediaDataController;" })
        return found.values.map(ImmutableClassDef::of)
    }
}
