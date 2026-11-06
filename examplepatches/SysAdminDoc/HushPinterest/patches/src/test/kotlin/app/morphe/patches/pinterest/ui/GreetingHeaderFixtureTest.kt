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
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** Home's greeting header builder and the ids class naming its buttons, in each declared APK. */
@Category(FixtureTests::class)
class GreetingHeaderFixtureTest {
    private class Build(val name: String, val builder: ClassDef, val ids: ClassDef) {
        val classes get() = listOf(builder, ids)
        val method get() = builder.methods.single { it.isGreetingBuilder() }
    }

    @Test
    fun `each declared original APK hands over the header row right after its bell frame goes in`() {
        for (build in Fixtures.declaredBuilds().map(::read)) {
            val found = PatchContexts.of(ExtensionDex.classes() + build.classes).greetingHeader()
            val body = build.method.implementation!!.instructions.toList()
            val lookup = body.indices.single { loads(body[it], GREETING_ROW) }
            assertEquals(build.name, "findViewById", call(body[lookup + 1])?.name)
            assertEquals(build.name, Opcode.CHECK_CAST, body[lookup + 3].opcode)
            assertEquals("${build.name}: the row is the cast lookup", (body[lookup + 3] as OneRegisterInstruction).registerA, found.row)
            val added = body.indices.filter { at ->
                call(body[at])?.let { it.definingClass == "Landroid/view/ViewGroup;" && it.name == "addView" } == true &&
                    (body[at] as FiveRegisterInstruction).registerC == found.row
            }
            assertEquals("${build.name}: the tuner, Create and the bell frame go into the row", 3, added.size)
            assertEquals(build.name, added.last() + 1, found.hookAt)
            // A missing row skips straight to where the hook goes, so the inserted call never runs then.
            val addresses = body.runningFold(0) { at, instruction -> at + instruction.codeUnits }
            assertTrue("${build.name}: the branch for a missing row lands at the hook", body.indices.any { at ->
                body[at].opcode == Opcode.IF_EQZ && (body[at] as OneRegisterInstruction).registerA == found.row &&
                    addresses[at] + (body[at] as OffsetInstruction).codeOffset == addresses[found.hookAt]
            })
        }
    }

    @Test
    fun `a changed header builder or ids class refuses`() {
        val build = read(Fixtures.declaredBuilds().last())
        val extension = ExtensionDex.classes()
        val body = build.method.implementation!!.instructions.toList()
        val lookup = body.indices.single { loads(body[it], GREETING_ROW) }
        val named = body.indices.single { loads(body[it], GREETING_NEWSHUB) } + 1
        check(call(body[named])?.name == "setId") { "${build.name}: the bell id isn't set straight away" }
        val rowAdds = body.indices.filter { at ->
            call(body[at])?.name == "addView" && (body[at] as FiveRegisterInstruction).registerC ==
                (body[lookup + 3] as OneRegisterInstruction).registerA
        }
        // Create going in last leaves the hook ahead of the bell frame.
        val bellNotLast = replace(build.builder) { instructions ->
            instructions.toMutableList().apply {
                val (create, bell) = rowAdds.takeLast(2)
                set(create, instructions[bell])
                set(bell, instructions[create])
            }
        }
        // Nops keep every address, so only the missing cast is new.
        val uncast = replace(build.builder) { instructions ->
            instructions.take(lookup + 3) + List(2) { ImmutableInstruction10x(Opcode.NOP) } + instructions.drop(lookup + 4)
        }
        val unnamed = replace(build.builder) { instructions ->
            instructions.take(named) + List(3) { ImmutableInstruction10x(Opcode.NOP) } + instructions.drop(named + 1)
        }
        val noCreateId = ImmutableClassDef(build.ids.type, build.ids.accessFlags, build.ids.superclass, build.ids.interfaces,
            build.ids.sourceFile, build.ids.annotations, build.ids.fields.filter { it.name != GREETING_CREATE }, build.ids.methods)
        val secondBuilder = ImmutableClassDef("Lapp/hushpinterest/test/SecondHeader;", build.builder.accessFlags, "Ljava/lang/Object;",
            null, null, null, null, listOf(ImmutableMethod("Lapp/hushpinterest/test/SecondHeader;", build.method.name,
                build.method.parameters, build.method.returnType, build.method.accessFlags, null, null, build.method.implementation)))
        fun with(vararg swaps: ClassDef) = extension + build.classes.map { owner -> swaps.firstOrNull { it.type == owner.type } ?: owner }
        // Each case and the refusal it has to give, so none passes on another check's account.
        val cases = linkedMapOf(
            "missing builder" to (extension + build.ids to "Greeting header builder: expected one exact target, found 0"),
            "two builders" to (extension + build.classes + secondBuilder to "Greeting header builder: expected one exact target, found 2"),
            "the bell frame isn't the last button" to (with(bellNotLast) to "the bell frame is no longer the last button added"),
            "the row lookup isn't cast" to (with(uncast) to "the row lookup's result isn't cast straight away"),
            "the bell frame gets no id" to (with(unnamed) to "Greeting header bell frame id: expected one exact target, found 0"),
            "no Create id" to (with(noCreateId) to "has no $GREETING_CREATE id for Create"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val refusal = assertThrows(reason, PatchException::class.java) { PatchContexts.of(input).greetingHeader() }
            assertTrue("$reason refused for another reason: ${refusal.message}", refusal.message.orEmpty().contains(message))
        }
    }

    private fun call(instruction: Instruction) = (instruction as? ReferenceInstruction)?.reference as? MethodReference

    /** A copy of [owner] whose header builder carries [change]d instructions and no try blocks. */
    private fun replace(owner: ClassDef, change: (List<Instruction>) -> List<Instruction>) =
        ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
            owner.annotations, owner.fields, owner.methods.map { method ->
                if (!method.isGreetingBuilder()) method else ImmutableMethod(method.definingClass, method.name, method.parameters,
                    method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                    ImmutableMethodImplementation(method.implementation!!.registerCount,
                        change(method.implementation!!.instructions.toList()), null, null))
            })

    /** The class whose one void method reads both header ids, and the class the bell's id lives in. */
    private fun read(build: File): Build {
        val builders = mutableListOf<ClassDef>()
        FixtureDex.forEach(build) { dex ->
            for (classDef in dex.classes) if (classDef.methods.any { it.isGreetingBuilder() }) builders += ImmutableClassDef.of(classDef)
        }
        val builder = builders.singleOrNull() ?: error("${build.name}: ${builders.size} greeting header builders")
        val ids = builder.methods.single { it.isGreetingBuilder() }.implementation!!.instructions
            .first { loads(it, GREETING_NEWSHUB) }.let { ((it as ReferenceInstruction).reference as FieldReference).definingClass }
        return Build(build.name, builder, FixtureDex.classes(build, setOf(ids)).getValue(ids))
    }
}

private fun loads(instruction: Instruction, name: String) = instruction.opcode == Opcode.SGET &&
    ((instruction as ReferenceInstruction).reference as FieldReference).name == name

private fun Method.isGreetingBuilder() = returnType == "V" &&
    implementation?.instructions?.let { code -> code.any { loads(it, GREETING_ROW) } && code.any { loads(it, GREETING_NEWSHUB) } } == true
