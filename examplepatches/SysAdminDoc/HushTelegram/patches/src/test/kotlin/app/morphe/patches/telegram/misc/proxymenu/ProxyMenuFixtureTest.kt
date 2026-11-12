/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.proxymenu

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The chat list's menu, where Proxy shows only with a proxy on or where Telegram is blocked. */
class ProxyMenuFixtureTest {
    @Test fun `the menu asks before the blocked country and a yes adds Proxy`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val kept = FixtureDex.classes(build, setOf(BLOCKED_COUNTRY, PROXY_LIST).map { it.substringBefore("->") }.toSet()).values
            val menus = FixtureDex.classesWhere(build, { true }) { m ->
                m.controlBody().let { body -> body.any { it.controlString() == "proxy_enabled" } && body.any { it.controlRef() == BLOCKED_COUNTRY } }
            }
            val context = PatchContexts.of(ExtensionDex.classes() + (kept + menus).distinctBy { it.type }.map(ImmutableClassDef::of))
            val site = context.resolveProxyMenu()
            val before = ImmutableMethod.of(site.method).controlBody()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { proxyMenuPatch.execute(context) })

            val at = site.read
            val after = site.method.controlBody()
            assertEquals(name, listOf(Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ), after.subList(at, at + 4).map { it.opcode })
            val free = after[at].namedRegisters().single()
            assertEquals("$name: asks with 1", 1, (after[at] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(name, PROXY_MENU_SHOW, after[at + 1].controlRef())
            assertTrue("$name: one register throughout", (at + 1..at + 3).all { after[it].namedRegisters() == listOf(free) })
            assertEquals("$name: then Telegram's own blocked country read", BLOCKED_COUNTRY, after[at + 4].controlRef())
            val row = site.row + 4
            assertEquals("$name: a yes lands on the Proxy row, a no reads the blocked country",
                setOf(at + 4, row), ControlFlow.of(site.method).normal[at + 3].toSet())
            assertEquals("$name: the row is the add after the saved proxy check", Opcode.IF_NEZ, after[row - 1].opcode)
            assertStock("$name head", before.take(at), after.take(at))
            assertStock("$name tail", before.drop(at), after.drop(at + 4))

            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "proxyMenu" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    private fun assertStock(what: String, before: List<Instruction>, after: List<Instruction>) {
        assertEquals("$what: length", before.size, after.size)
        for (i in before.indices) {
            assertEquals("$what: stock $i", listOf(kind(before[i].opcode), before[i].namedRegisters(), before[i].origRef()),
                listOf(kind(after[i].opcode), after[i].namedRegisters(), after[i].origRef()))
        }
    }

    /** A hook can push a branch past a plain goto's reach, and dexlib2 widens it. */
    private fun kind(opcode: Opcode) = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode
}
