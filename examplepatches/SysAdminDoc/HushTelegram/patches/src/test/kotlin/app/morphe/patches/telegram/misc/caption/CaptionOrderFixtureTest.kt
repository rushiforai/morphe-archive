/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.caption

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The attach menu gallery's addToSelectedPhotos and the preview's write back of its order. */
class CaptionOrderFixtureTest {
    @Test fun `a change of first photo reloads the comment field with that photo's caption`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val layout = FixtureDex.classes(build, setOf(CAPTION_LAYOUT)).values
            val readers = FixtureDex.classesWhere(build, { true }) { m -> m.readsTheGalleryStatics() }
            val hosts = (layout + readers).distinctBy { it.type }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val sites = context.resolveCaptionOrder()
            val stock = listOf(sites.add, sites.update).map { ImmutableMethod.of(it.method) }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { captionOrderPatch.execute(context) })

            assertEquals("$name: the gallery's own statics", listOf("u1", "t1"),
                listOf(sites.order, sites.selected).map { it.substringAfter("->").substringBefore(":") })
            assertTrue("$name: per-photo captions asked of the gallery", sites.captionForAll.startsWith("$CAPTION_LAYOUT->"))
            // Registers from the dex: addToSelectedPhotos has 12 registers and 3 ins, so this is v9; the
            // preview's method has 25 and 3, this then the gallery, so the gallery is v23.
            for ((site, expected) in listOf(sites.add to 9, sites.update to 23)) {
                assertEquals("$name ${site.method.name}: gallery register", expected, site.layout)
            }
            assertEquals("$name: returns", listOf(2, 1), listOf(sites.add, sites.update).map { it.returns.size })

            for ((site, before) in listOf(sites.add, sites.update).zip(stock)) {
                val method = site.method
                val label = "$name ${method.name}"
                val after = method.controlBody()
                assertEquals("$label: start", listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC,
                    Opcode.MOVE_RESULT, Opcode.SGET_OBJECT, Opcode.INVOKE_STATIC), after.take(6).map { it.opcode })
                assertEquals("$label: start registers",
                    listOf(listOf(0, site.layout), listOf(1, 0), emptyList<Int>(), listOf(2), listOf(0), listOf(0, 2, 1)),
                    after.take(6).map { it.namedRegisters() })
                assertEquals("$label: start refs", listOf(sites.provider, sites.captionForAll, sites.order, CAPTION_ORDER_BEFORE),
                    listOf(1, 2, 4, 5).map { after[it].controlRef() })
                assertEquals("$label: one before", 1, after.count { it.controlRef() == CAPTION_ORDER_BEFORE })

                // Each return asks first, with captionForAllMedia's answer then and two registers the return doesn't read.
                val stockBody = before.controlBody()
                val stockReturns = stockBody.indices.filter { stockBody[it].opcode in RETURNS }
                val asks = after.indices.filter { after[it].controlRef() == CAPTION_ORDER_AFTER }.map { it - 3 }
                assertEquals("$label: one ask per return", stockReturns.size, asks.size)
                val flow = ControlFlow.of(method).normal
                for (at in asks) {
                    assertEquals("$label: ask $at", ASK_SHAPE, after.subList(at, at + ASK_SHAPE.size).map { it.opcode })
                    assertTrue("$label: ask $at ends on a return", after[at + ASK_SHAPE.size].opcode in RETURNS)
                    val (answer, nothing) = listOf(after[at + 2].namedRegisters().single(), after[at + 1].namedRegisters().single())
                    assertTrue("$label: ask $at keeps the returned value", after[at + ASK_SHAPE.size].namedRegisters().none { it == answer || it == nothing })
                    assertTrue("$label: ask $at registers", answer != nothing && answer < 16 && nothing < 16 &&
                        answer < method.implementation!!.registerCount - method.parameterTypes.size - 1)
                    assertEquals("$label: ask $at registers",
                        listOf(emptyList<Int>(), listOf(nothing), listOf(answer), listOf(answer, nothing), listOf(answer), listOf(answer),
                            listOf(answer), listOf(nothing), listOf(answer, nothing)),
                        after.subList(at, at + 9).map { it.namedRegisters() })
                    assertEquals(listOf(sites.captionForAll, sites.order, CAPTION_ORDER_AFTER, sites.providerType, sites.apply),
                        listOf(0, 2, 3, 6, 8).map { after[at + it].controlRef() })
                    assertEquals(0L, (after[at + 7] as WideLiteralInstruction).wideLiteral)
                    assertEquals("$label: same first photo skips the reload", setOf(at + 6, at + 9), flow[at + 5].toSet())
                }

                val added = (0 until 6).toSet() + asks.flatMap { it until it + ASK_SHAPE.size }
                assertKept(label, before, method, added, landsOn = stockReturns.zip(asks.sorted()).toMap())
            }

            val befores = hosts.sumOf { host ->
                context.tgMutableClassDefBy(host).methods.sumOf { m -> m.controlBody().count { it.controlRef() == CAPTION_ORDER_BEFORE } }
            }
            assertEquals("$name: only the two changes ask", 2, befores)

            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "captionOrder" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    /**
     * Every stock instruction is still there, in order and unchanged, and goes where it went: a jump
     * or fall to a stock target in [landsOn] now lands on the code put in front of it.
     */
    private fun assertKept(name: String, stock: Method, patched: Method, added: Set<Int>, landsOn: Map<Int, Int>) {
        val before = stock.controlBody()
        val after = patched.controlBody()
        val old = before.indices.filter { before[it].opcode != Opcode.NOP }
        val new = after.indices.filter { it !in added && after[it].opcode != Opcode.NOP }
        assertEquals("$name: stock count", old.size, new.size)
        val at = old.zip(new).toMap()
        for ((o, n) in at) {
            assertEquals("$name: stock $o", listOf(kind(before[o]), before[o].namedRegisters(), before[o].origRef()),
                listOf(kind(after[n]), after[n].namedRegisters(), after[n].origRef()))
        }
        val was = ControlFlow.of(stock).normal
        val now = ControlFlow.of(patched).normal
        for ((o, n) in at) {
            val expected = was[o].map { t -> landsOn[t] ?: at.getValue(t) }.toSet()
            assertEquals("$name: where stock $o goes", expected, now[n].toSet())
        }
    }

    private fun kind(instruction: Instruction) = when (instruction.opcode) {
        Opcode.GOTO_16, Opcode.GOTO_32 -> Opcode.GOTO
        else -> instruction.opcode
    }

    private fun Method.readsTheGalleryStatics(): Boolean = implementation?.instructions?.any { instruction ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.SGET_OBJECT && field?.definingClass == CAPTION_LAYOUT &&
            field.type in setOf("Ljava/util/HashMap;", "Ljava/util/ArrayList;")
    } == true

    private companion object {
        val RETURNS = setOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT)
        val ASK_SHAPE = listOf(
            Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.SGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
            Opcode.IF_EQZ, Opcode.CHECK_CAST, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.NOP,
        )
    }
}
