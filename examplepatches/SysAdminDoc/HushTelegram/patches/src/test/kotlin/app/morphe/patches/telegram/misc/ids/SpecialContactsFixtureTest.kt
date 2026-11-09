/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.ids

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
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

/** Special contacts' two hooks, each first in a MessagesController method, on each build's own code. */
class SpecialContactsFixtureTest {
    @Test fun `each hook goes first and hands over only its method's own parameters`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val (found, missing) = context.resolveSpecialContacts()
            assertNull("$name: $missing", missing)
            val hook = found!!
            val stock = listOf(ImmutableMethod.of(hook.putUser), ImmutableMethod.of(hook.updates))
            hook.applyTo()
            // putUser(user, fromCache, force) passes this, the user and fromCache; processUpdateArray passes this and the updates.
            for (hooked in listOf(Hooked(hook.putUser, stock[0], SC_USER_HOOK, 3), Hooked(hook.updates, stock[1], SC_UPDATES_HOOK, 2))) {
                val case = "$name: ${hooked.method.origName}"
                val registers = hooked.method.implementation!!.registerCount
                assertEquals("$case: register count", hooked.stock.implementation!!.registerCount, registers)
                val first = hooked.method.controlBody().first()
                assertEquals("$case: hook", Opcode.INVOKE_STATIC_RANGE, first.opcode)
                assertEquals("$case: hook", hooked.call, first.origRef())
                val p0 = registers - ins(hooked.method)
                assertEquals("$case: the hook reads p0 on", (p0 until p0 + hooked.passed).toList(), first.namedRegisters())
                assertStockKept(case, hooked.stock, hooked.method)
            }
        }
    }

    @Test fun `a build missing what the hooks need gets no hook and a reason`() {
        val cases: List<Pair<String, (BytecodePatchContext) -> Unit>> = listOf(
            "MessagesController.putUser is missing" to { c -> c.tgMutableClassDefBy(SC_CONTROLLER).methods.removeAll { it.origName == "putUser" } },
            "MessagesController.processUpdateArray is missing" to { c ->
                c.tgMutableClassDefBy(SC_CONTROLLER).methods.removeAll { it.origName == "processUpdateArray" } },
            "no boolean method specialContacts()" to { c -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "specialContacts" } },
            "currentAccount" to { c -> c.tgMutableClassDefBy(SC_BASE).fields.removeAll { it.origName == "currentAccount" } },
            "user runtime hook" to { c -> c.tgMutableClassDefBy(SPECIAL_CONTACTS).methods.removeAll { it.origName == "user" } },
            "updates runtime hook" to { c -> c.tgMutableClassDefBy(SPECIAL_CONTACTS).methods.removeAll { it.origName == "updates" } },
            "jumps back to the start of MessagesController.putUser" to { c -> loopBack(c, "putUser", SC_PUT_USER_PARAMETERS) },
            "jumps back to the start of MessagesController.processUpdateArray" to { c -> loopBack(c, "processUpdateArray", SC_UPDATES_PARAMETERS) },
        )
        for (build in Fixtures.declaredBuilds()) for ((why, change) in cases) {
            val context = context(build)
            change(context)
            val before = state(context)
            val (hook, missing) = context.resolveSpecialContacts()
            assertNull("${build.name}: $why", hook)
            assertNotNull("${build.name}: $why", missing)
            assertTrue("${build.name}: expected \"$why\" in \"$missing\"", why in missing!!)
            assertEquals("${build.name}: $why leaves every method as it was", before, state(context))
        }
    }

    private class Hooked(val method: Method, val stock: Method, val call: String, val passed: Int)

    private fun context(build: File): BytecodePatchContext {
        val telegram = FixtureDex.classes(build, setOf(SC_CONTROLLER, SC_BASE, DC_USER))
        assertEquals("${build.name}: every class the hooks read", setOf(SC_CONTROLLER, SC_BASE, DC_USER), telegram.keys)
        return PatchContexts.of(ExtensionDex.classes() + telegram.values)
    }

    /** Registers the method's parameters take, this included. */
    private fun ins(method: Method) = 1 + method.parameterTypes.map { it.toString() }.sumOf { if (it == "J" || it == "D") 2 else 1 }

    /**
     * The stock body after the hook, NOPs left out: operands, branches and handlers, with GOTO_16 and GOTO_32 read as GOTO.
     * A branch onto a NOP (13.2.1's processUpdateArray has one) reads as the kept instruction that NOP runs into.
     */
    private fun assertStockKept(case: String, stock: Method, changed: Method) {
        val before = shape(stock, 0)
        val after = shape(changed, 1)
        assertEquals("$case: stock instructions", before.size, after.size)
        for (i in before.indices) assertEquals("$case: stock instruction $i", before[i], after[i])
        assertEquals("$case: handlers", handlers(stock), handlers(changed))
        val flow = ControlFlow.of(changed)
        assertEquals("$case: the hook runs on into the stock code", listOf(1), flow.normal[0])
        assertEquals("$case: the hook sits outside every try block", emptyList<Int>(), flow.exceptional[0])
        assertTrue("$case: nothing jumps back onto the hook", flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it })
    }

    private fun shape(method: Method, from: Int): List<List<Any?>> {
        val body = method.controlBody()
        val flow = ControlFlow.of(method)
        val kept = body.indices.filter { it >= from && body[it].opcode != Opcode.NOP }
        val place = kept.withIndex().associate { (at, index) -> index to at }
        fun at(target: Int): Any = place[target] ?: if (target < from) "the hook" else
            "a nop before ${kept.firstOrNull { it > target }?.let { place[it] } ?: "the end"}"
        fun places(targets: List<Int>) = targets.map { at(it) }
        return kept.map { i ->
            val instruction = body[i]
            listOf(kind(instruction.opcode), instruction.namedRegisters(), instruction.origRef(), (instruction as? WideLiteralInstruction)?.wideLiteral,
                (instruction as? SwitchPayload)?.switchElements?.map { it.key }, places(flow.normal[i]), places(flow.exceptional[i]))
        }
    }

    private fun handlers(method: Method) = method.implementation!!.tryBlocks.map { block -> block.exceptionHandlers.map { it.exceptionType } }

    private fun kind(opcode: Opcode) = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode

    /** Swaps the method for a copy whose last instruction goes back to its first. */
    private fun loopBack(c: BytecodePatchContext, name: String, parameters: String) {
        val owner = c.tgMutableClassDefBy(SC_CONTROLLER)
        val method = owner.methods.single { it.origName == name && it.origParameterTypes.joinToString("") == parameters }
        val body = method.controlBody()
        val implementation = method.implementation!!
        owner.methods.remove(method)
        owner.methods.add(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType, method.accessFlags,
            method.annotations, method.hiddenApiRestrictions, ImmutableMethodImplementation(implementation.registerCount,
                body + ImmutableInstruction30t(Opcode.GOTO_32, -body.sumOf { it.codeUnits }), implementation.tryBlocks, emptyList())).toMutable())
    }

    private fun state(c: BytecodePatchContext) = listOf(SC_CONTROLLER, SC_BASE, SETTINGS_STATUS, SPECIAL_CONTACTS).associateWith { type ->
        val owner = c.tgMutableClassDefBy(type)
        listOf(owner.fields.map { "$it" }.sorted(), owner.methods.associate { method ->
            "$method" to listOf(method.accessFlags, method.implementation?.registerCount, method.controlBody().map { listOf(it.opcode, it.namedRegisters(), it.origRef()) })
        })
    }
}
