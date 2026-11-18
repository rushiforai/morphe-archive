/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** The pin page presenters, the related pins list they share, and the closeup module. */
@Category(FixtureTests::class)
class FoldRelatedPinsFixtureTest {
    private fun presenters(classes: List<ClassDef>) = classes.filter { owner ->
        owner.methods.any { it.name == CLOSEUP_ADD_SECTIONS && it.implementation != null } &&
            owner.methods.any { it.name == "getRelatedPinsPagedList" && it.implementation != null }
    }

    private fun read(build: File): List<ClassDef> {
        val found = linkedMapOf<String, ClassDef>()
        FixtureDex.classesWhere(build, { true }) { it.name == "getRelatedPinsPagedList" && it.implementation != null }
            .forEach { found[it.type] = it }
        var wanted = presenters(found.values.toList())
            .flatMap { owner -> owner.methods.filter { it.name == "getRelatedPinsPagedList" }.map { it.returnType } }.toSet()
        while (wanted.isNotEmpty()) {
            val next = FixtureDex.classes(build, wanted)
            found += next
            wanted = next.values.mapNotNull { it.superclass }.filterTo(mutableSetOf()) { it !in found && it != "Ljava/lang/Object;" }
        }
        found += FixtureDex.classes(build, setOf(CLOSEUP_MODULE))
        return found.values.toList()
    }

    private fun update(classes: List<ClassDef>): Method = classes.single { it.type == CLOSEUP_MODULE }.methods.single {
        it.name == "updatePin" && it.parameterTypes.size == 1
    }

    /** The stock answer the gate goes in front of, found in the unpatched classes. */
    private fun stockGate(classes: List<ClassDef>, gate: Method): Method = classes.single { it.type == gate.definingClass }
        .methods.single { it.name == gate.name && it.returnType == "Z" && it.parameterTypes.isEmpty() }

    @Test
    fun `each declared APK gates the list's answer and hands over the presenter and each section`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val stock = stockGate(classes, context.relatedPinsFoldTargets().gate)
            assertTrue("${build.name}: both pin page presenters", presenters(classes).size >= 2)
            foldRelatedPinsPatch.execute(context)
            for (flag in listOf("foldRelatedPins", "relatedPinsFold")) assertEquals("${build.name}: $flag", 1, PinPageKit.flag(context, flag))

            val gate = PinPageKit.patched(context, stock)
            assertEquals(build.name, RELATED_FOLDED_HOOK, PinPageKit.target(gate[0]))
            assertEquals(build.name, Opcode.MOVE_RESULT, gate[1].opcode)
            assertEquals(build.name, Opcode.IF_EQZ, gate[2].opcode)
            assertEquals(build.name, Opcode.CONST_4, gate[3].opcode)
            assertEquals(build.name, Opcode.RETURN, gate[4].opcode)
            val answer = (gate[1] as OneRegisterInstruction).registerA
            for (at in 2..4) assertEquals(build.name, answer, (gate[at] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: Pinterest's answer follows", PinPageKit.kinds(stock.instructions()), PinPageKit.kinds(gate.drop(5)))

            for (owner in presenters(classes)) {
                val add = owner.methods.single { it.name == CLOSEUP_ADD_SECTIONS }
                val body = PinPageKit.patched(context, add)
                assertEquals(build.name, RELATED_FOLD_BIND_HOOK, PinPageKit.target(body[0]))
                assertEquals(build.name, Opcode.INVOKE_STATIC_RANGE, body[0].opcode)
                assertEquals("${build.name}: the presenter itself", add.implementation!!.registerCount - 2, (body[0] as RegisterRangeInstruction).startRegister)
                assertEquals(build.name, PinPageKit.kinds(add.instructions()), PinPageKit.kinds(body.drop(1)))
            }

            val module = update(classes)
            val was = module.instructions()
            val ask = was.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == CLOSEUP_SHOULD_SHOW }
            val body = PinPageKit.patched(context, module)
            assertEquals(build.name, RELATED_FOLD_MODULE_HOOK, PinPageKit.target(body[ask + 2]))
            assertEquals(build.name, PinPageKit.kinds(was), PinPageKit.kinds(body.take(ask + 2) + body.drop(ask + 4)))
        }
    }

    @Test
    fun `a missing presenter, module or status stub refuses with nothing changed`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val stock = stockGate(classes, PatchContexts.of(ExtensionDex.classes() + classes).relatedPinsFoldTargets().gate)
        val presenterTypes = presenters(classes).map { it.type }.toSet()
        val inputs = linkedMapOf(
            "no presenter" to (ExtensionDex.classes() + classes.filter { it.type !in presenterTypes }),
            "no closeup module" to (ExtensionDex.classes() + classes.filter { it.type != CLOSEUP_MODULE }),
            "no foldRelatedPins stub" to (PinPageKit.extensionWithout("foldRelatedPins") + classes),
            "no relatedPinsFold stub" to (PinPageKit.extensionWithout("relatedPinsFold") + classes),
        )
        for ((reason, input) in inputs) {
            val context = PatchContexts.of(input)
            assertThrows(reason, PatchException::class.java) { foldRelatedPinsPatch.execute(context) }
            assertEquals(reason, 0, PinPageKit.flagOrZero(context, "foldRelatedPins"))
            assertEquals(reason, 0, PinPageKit.flagOrZero(context, "relatedPinsFold"))
            val present = input.map { it.type }.toSet()
            val untouched = buildList {
                add(stock)
                if (CLOSEUP_MODULE in present) add(update(classes))
                presenters(classes).filter { it.type in present }.forEach { owner -> add(owner.methods.single { it.name == CLOSEUP_ADD_SECTIONS }) }
            }
            for (method in untouched) {
                assertEquals(reason, method.instructions().map { it.opcode }, PinPageKit.patched(context, method).map { it.opcode })
            }
        }
    }
}
