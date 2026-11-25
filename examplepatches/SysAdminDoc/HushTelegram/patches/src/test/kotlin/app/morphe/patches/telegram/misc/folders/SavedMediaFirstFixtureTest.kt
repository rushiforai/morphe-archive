/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction30t
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/** Open Saved Messages on its media (#103): the chat list's two reads of View as Chats, on each build's own code. */
class SavedMediaFirstFixtureTest {
    @Test fun `both reads ask the extension right before their test and the stock code runs on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val (found, missing) = context.resolveSavedMediaFirst()
            assertNull("$name: $missing", missing)
            val plan = found!!
            assertEquals("$name: the preload", "onFragmentCreate", plan.preload.method.origName)
            assertTrue("$name: the tap opens the media page", plan.open.method.controlBody().any { it.controlString() == "start_from" })
            val stock = plan.sites.associate { it.method to ImmutableMethod.of(it.method) }
            plan.apply()
            for (site in plan.sites) {
                val case = "$name: ${site.method.origName}"
                val body = site.method.controlBody()
                assertEquals("$case: the read", SAVED_VIEW_AS_CHATS, body[site.read].origRef())
                assertEquals("$case: the read", listOf(site.register), body[site.read].namedRegisters().take(1))
                assertEquals("$case: the ask", listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT), body.subList(site.read + 1, site.read + 3).map { it.opcode })
                assertEquals("$case: the ask", SAVED_MEDIA_HOOK, body[site.read + 1].origRef())
                assertEquals("$case: it hands over Telegram's answer", listOf(site.register), body[site.read + 1].namedRegisters())
                assertEquals("$case: and its own goes back in its place", listOf(site.register), body[site.read + 2].namedRegisters())
                assertTrue("$case: which Telegram's test reads next", body[site.read + 3].opcode == Opcode.IF_EQZ || body[site.read + 3].opcode == Opcode.IF_NEZ)
                assertEquals("$case: which Telegram's test reads next", site.register, body[site.read + 3].namedRegisters().first())
                assertEquals("$case: register count", stock.getValue(site.method).implementation!!.registerCount, site.method.implementation!!.registerCount)
                assertEquals("$case: the stock code", operations(stock.getValue(site.method).controlBody()),
                    operations(body.filterIndexed { at, _ -> at != site.read + 1 && at != site.read + 2 }))
                val flow = ControlFlow.of(site.method)
                assertTrue("$case: only the read runs into the ask", flow.normal.withIndex().none { (at, to) -> at != site.read && site.read + 1 in to } &&
                    flow.exceptional.none { site.read + 1 in it || site.read + 2 in it })
                assertEquals("$case: the ask runs on into the test", listOf(listOf(site.read + 2), listOf(site.read + 3)),
                    listOf(flow.normal[site.read + 1], flow.normal[site.read + 2]))
            }
        }
    }

    @Test fun `a build missing what the hook needs gets no hook and a reason and keeps its code`() {
        val cases: List<Pair<String, (BytecodePatchContext) -> Unit>> = listOf(
            "no boolean method savedMediaFirst()" to { c -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "savedMediaFirst" } },
            "viewAsChats runtime hook" to { c -> c.tgMutableClassDefBy(SAVED_MEDIA).methods.removeAll { it.origName == "viewAsChats" } },
            "no longer opens Saved Messages on its media" to { c -> list(c).methods.single { it.controlBody().any { i -> i.controlString() == "start_from" } }.let { m ->
                val at = m.controlBody().indexOfFirst { it.controlString() == "start_from" }
                m.replaceInstruction(at, "const-string v${m.controlBody()[at].namedRegisters().single()}, \"start_with\"") } },
            "reads View as Chats 1 times, not twice" to { c -> list(c).methods.removeAll { it.origName == "onFragmentCreate" } },
            "no longer tests View as Chats right away" to { c -> list(c).methods.single { it.origName == "onFragmentCreate" }.let { m ->
                val read = m.controlBody().indexOfFirst { it.controlRef() == SAVED_VIEW_AS_CHATS }
                m.replaceInstruction(read + 1, "nop") } },
            "something jumps between" to { c -> jumpTo(c, "onFragmentCreate") { body -> body.indexOfFirst { it.controlRef() == SAVED_VIEW_AS_CHATS } + 1 } },
        )
        for (build in Fixtures.declaredBuilds()) for ((why, change) in cases) {
            val context = context(build)
            change(context)
            val before = state(context)
            val (plan, missing) = context.resolveSavedMediaFirst()
            assertNull("${build.name}: $why", plan)
            assertNotNull("${build.name}: $why", missing)
            assertTrue("${build.name}: expected \"$why\" in \"$missing\"", why in missing!!)
            assertEquals("${build.name}: $why leaves every method as it was", before, state(context))
        }
    }

    private fun context(build: File): BytecodePatchContext {
        // The chat list's tap is the one method that loads both strings; strings need no build names.
        val lists = FixtureDex.classesWhere(build, { true }) { method ->
            method.controlBody().let { body -> body.any { it.controlString() == "dialog_folder_id" } && body.any { it.controlString() == "start_from" } }
        }
        assertEquals("${build.name}: the chat list", 1, lists.size)
        listType = lists.single().type
        return PatchContexts.of(ExtensionDex.classes() + lists)
    }

    /** The build's chat list, as [context] last loaded it. */
    private var listType = ""

    private fun list(c: BytecodePatchContext) = c.tgMutableClassDefBy(listType)

    private fun operations(body: List<Instruction>) = body.filter { it.opcode != Opcode.NOP }.map {
        listOf(kind(it.opcode), it.origRef(), it.namedRegisters(), (it as? WideLiteralInstruction)?.wideLiteral)
    }

    private fun kind(opcode: Opcode) = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode

    /** Swaps the chat list's [name] for a copy that ends with a jump to the instruction [target] picks. */
    private fun jumpTo(c: BytecodePatchContext, name: String, target: (List<Instruction>) -> Int) {
        val type = list(c)
        val method = type.methods.single { it.origName == name }
        val body = method.controlBody()
        val implementation = method.implementation!!
        type.methods.remove(method)
        type.methods.add(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType, method.accessFlags,
            method.annotations, method.hiddenApiRestrictions, ImmutableMethodImplementation(implementation.registerCount,
                body + ImmutableInstruction30t(Opcode.GOTO_32, -body.drop(target(body)).sumOf { it.codeUnits }), implementation.tryBlocks,
                emptyList())).toMutable())
    }

    private fun state(c: BytecodePatchContext) = listOf(listType, SETTINGS_STATUS, SAVED_MEDIA).associateWith { type ->
        c.tgMutableClassDefBy(type).methods.associate { method: Method ->
            "$method" to listOf(method.accessFlags, method.implementation?.registerCount,
                method.controlBody().map { listOf(it.opcode, it.namedRegisters(), it.origRef()) })
        }
    }
}
