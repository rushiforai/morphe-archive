/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.proxymenu

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.call
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
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/** The chat list's menu, where Proxy shows only with a proxy on or where Telegram is blocked. */
class ProxyMenuFixtureTest {
    @Test fun `the menu asks before the blocked country and a yes adds Proxy`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
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
            // Do Not Disturb's one call goes in where the menu shows, which the next test reads.
            assertEquals(name, DND_MENU_HOOK, after[site.show + 4].controlRef())
            assertStock("$name tail", before.drop(at), after.drop(at + 4).filterIndexed { i, _ -> i != site.show - at })

            assertEquals(1L, status(context, "proxyMenu"))
        }
    }

    /**
     * Do Not Disturb (#79): showOrUpdateNotification asks right after it has resumed the network
     * to post or update a message notification, on the one way in to that, so a yes returns before
     * anything is posted while every way to Telegram's dismiss stays as it was. The in-chat sound
     * read passes through the extension, and the menu gets its item where it shows.
     */
    @Test fun `do not disturb holds the post after the resume, the chat sound, and adds its item`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val site = context.resolveProxyMenu()
            val sites = context.resolveDoNotDisturb(site)
            val notifyBefore = ImmutableMethod.of(sites.notify).controlBody()
            val soundBefore = ImmutableMethod.of(sites.sound).controlBody()
            val menuBefore = ImmutableMethod.of(site.method).controlBody()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { proxyMenuPatch.execute(context) })

            // The notification gate.
            val post = sites.post
            val shows = sites.notify.controlBody()
            val flow = ControlFlow.of(sites.notify)
            assertEquals("$name: the stock network resume comes right before", RESUME_NETWORK, shows[post - 1].controlRef())
            assertEquals(name, listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
                shows.subList(post, post + 4).map { it.opcode })
            assertEquals(name, DND_QUIET, shows[post].controlRef())
            assertEquals(name, listOf(sites.free), shows[post + 1].namedRegisters())
            assertEquals(name, listOf(sites.free), shows[post + 2].namedRegisters())
            assertEquals("$name: the resume goes on to the question", listOf(post), flow.normal[post - 1])
            assertEquals("$name: a no goes on to Telegram's own post, a yes returns", setOf(post + 3, post + 4), flow.normal[post + 2].toSet())
            assertEquals("$name: Telegram's post is reached only through the question",
                listOf(post + 2), shows.indices.filter { post + 4 in flow.normal[it] })
            assertStock("$name notify head", notifyBefore.take(post), shows.take(post))
            assertStock("$name notify tail", notifyBefore.drop(post), shows.drop(post + 4))
            // With nothing to show, Telegram still clears its notifications without asking.
            val clear = reachedAvoiding(flow, post)
            assertTrue("$name: dismissNotification is reached without the question",
                clear.any { shows[it].controlRef() == DISMISS_NOTIFICATION })
            assertFalse("$name: the post is not", (post + 4) in clear)

            // The in-chat sound.
            val code = sites.sound.controlBody()
            val held = sites.soundRegister
            val at = sites.soundIf
            assertEquals(name, IN_CHAT_SOUND, code[at - 1].controlRef())
            assertEquals(name, listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ), code.subList(at, at + 3).map { it.opcode })
            assertEquals(name, DND_CHAT_SOUND, code[at].controlRef())
            assertTrue("$name: one register throughout", (at..at + 2).all { code[it].namedRegisters() == listOf(held) })
            assertStock("$name sound head", soundBefore.take(at), code.take(at))
            assertStock("$name sound tail", soundBefore.drop(at), code.drop(at + 2))

            // The menu item, where the Proxy checks and their skip arrive.
            val menu = site.method.controlBody()
            val show = site.show + 4
            assertEquals(name, Opcode.INVOKE_STATIC_RANGE, menu[show].opcode)
            assertEquals(name, DND_MENU_HOOK, menu[show].controlRef())
            assertEquals("$name: with the menu that shows next", menu[show + 1].namedRegisters(), menu[show].namedRegisters())
            assertEquals(name, menuBefore[site.show].origRef(), menu[show + 1].origRef())
            val skip = site.row + 4 - 1
            assertEquals("$name: no saved proxy skips to the item", setOf(site.row + 4, show),
                ControlFlow.of(site.method).normal[skip].toSet())

            // The stub adds through the menu's own add, its red text false.
            val stub = context.tgMutableClassDefBy(DO_NOT_DISTURB).methods.single { it.name == "addItem" }.controlBody()
            assertEquals(name, listOf(Opcode.CHECK_CAST, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID), stub.map { it.opcode })
            assertEquals(name, 0, (stub[1] as NarrowLiteralInstruction).narrowLiteral)
            val add = stub[2].call()!!
            assertEquals(name, sites.add.toString(), add.toString())
            val flag = add.parameterTypes.map(CharSequence::toString).indexOf("Z")
            assertEquals("$name: the red text flag is the false", stub[1].namedRegisters(), listOf(stub[2].namedRegisters()[flag + 1]))

            assertEquals(1L, status(context, "doNotDisturb"))
            assertEquals(1L, status(context, "proxyMenu"))
        }
    }

    /** Without NotificationsController, Proxy still goes in and Do Not Disturb stays out entirely. */
    @Test fun `a build without the notification site keeps Proxy and leaves Do Not Disturb out`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build, notifications = false)
            val site = context.resolveProxyMenu()
            val before = ImmutableMethod.of(site.method).controlBody()
            val stubBefore = context.tgMutableClassDefBy(DO_NOT_DISTURB).methods.single { it.name == "addItem" }.controlBody().map { it.opcode }
            val warnings = PatchLogCapture.warnings { proxyMenuPatch.execute(context) }
            assertEquals(name, 1, warnings.size)
            assertTrue("$name: ${warnings.single()}", warnings.single().contains("NotificationsController is missing") &&
                warnings.single().contains("Proxy goes on without Do Not Disturb"))
            val after = site.method.controlBody()
            assertEquals("$name: only Proxy's four went in", before.size + 4, after.size)
            assertEquals(name, PROXY_MENU_SHOW, after[site.read + 1].controlRef())
            assertTrue(name, after.none { it.controlRef() == DND_MENU_HOOK })
            assertEquals(name, stubBefore, context.tgMutableClassDefBy(DO_NOT_DISTURB).methods.single { it.name == "addItem" }.controlBody().map { it.opcode })
            assertEquals(0L, status(context, "doNotDisturb"))
            assertEquals(1L, status(context, "proxyMenu"))
        }
    }

    /**
     * The menu's classes, the NotificationsController unless left out, and the class the menu
     * shows through, which the stub calls into.
     */
    private fun context(build: File, notifications: Boolean = true): BytecodePatchContext {
        val types = setOf(BLOCKED_COUNTRY, PROXY_LIST).map { it.substringBefore("->") }.toSet() +
            if (notifications) setOf(NOTIFICATIONS_CONTROLLER) else emptySet()
        val kept = FixtureDex.classes(build, types).values
        val menus = FixtureDex.classesWhere(build, { true }) { m ->
            m.controlBody().let { body -> body.any { it.controlString() == "proxy_enabled" } && body.any { it.controlRef() == BLOCKED_COUNTRY } }
        }
        val probe = PatchContexts.of(ExtensionDex.classes() + (kept + menus).distinctBy { it.type }.map(ImmutableClassDef::of))
        val site = probe.resolveProxyMenu()
        val options = FixtureDex.classes(build, setOf(site.method.controlBody()[site.show].call()!!.definingClass)).values
        assertEquals("the menu's own class", 1, options.size)
        return PatchContexts.of(ExtensionDex.classes() + (kept + menus + options).distinctBy { it.type }.map(ImmutableClassDef::of))
    }

    private fun status(context: BytecodePatchContext, method: String): Long {
        val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == method }.controlBody()
        return (body.first() as WideLiteralInstruction).wideLiteral
    }

    /** Every index reached from the start without passing [avoid]. */
    private fun reachedAvoiding(flow: ControlFlow, avoid: Int): Set<Int> {
        val seen = mutableSetOf(0)
        val queue = ArrayDeque(listOf(0))
        while (queue.isNotEmpty()) {
            for (next in flow.normal[queue.removeFirst()]) {
                if (next != avoid && seen.add(next)) queue.addLast(next)
            }
        }
        return seen
    }

    /** Alignment nops before a payload come and go as code goes in above it, so neither side counts them. */
    private fun assertStock(what: String, stock: List<Instruction>, patched: List<Instruction>) {
        val before = stock.filter { it.opcode != Opcode.NOP }
        val after = patched.filter { it.opcode != Opcode.NOP }
        assertEquals("$what: length", before.size, after.size)
        for (i in before.indices) {
            assertEquals("$what: stock $i", listOf(kind(before[i].opcode), before[i].namedRegisters(), before[i].origRef()),
                listOf(kind(after[i].opcode), after[i].namedRegisters(), after[i].origRef()))
        }
    }

    /** A hook can push a branch past a plain goto's reach, and dexlib2 widens it. */
    private fun kind(opcode: Opcode) = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode
}
