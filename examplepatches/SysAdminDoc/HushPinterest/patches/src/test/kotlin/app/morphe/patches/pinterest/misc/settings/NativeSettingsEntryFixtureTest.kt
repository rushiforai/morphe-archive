/*
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.misc.settings

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.ui.instructions
import app.morphe.util.namedRegisters
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.*
import org.junit.Test
import org.junit.experimental.categories.Category

@Category(FixtureTests::class)
class NativeSettingsEntryFixtureTest {
    private val model = "Lcom/pinterest/feature/settings/menu/model/"
    private val builder = "Lcom/pinterest/feature/profile/pymk/sba/r1;"
    private val click = "Lus0/j;"
    private val external = "${model}l1;"
    private val types = setOf(builder, click, external) + listOf("z", "s1", "t1", "g1").map { "$model$it;" }

    private fun classes(build: java.io.File): List<ClassDef> {
        val stock = FixtureDex.classes(build, types)
        assertEquals("every declared host is present", types, stock.keys)
        return stock.values + listOf(ExtensionDex.classDef(NATIVE_SETTINGS_ITEM), ExtensionDex.classDef(ENTRY))
    }

    @Test fun `each declared build receives one owned row and only its click opens Hush`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = classes(build)
            val context = PatchContexts.of(classes)
            context.hookNativeSettingsEntry()
            assertEquals("${model}z;", context.classDefBy(NATIVE_SETTINGS_ITEM).superclass)
            assertEquals("the native list's marker interface must survive code generation",
                classes.single { it.type == external }.interfaces,
                context.classDefBy(NATIVE_SETTINGS_ITEM).interfaces)
            val built = context.classDefBy(builder).methods.single { it.name == "invoke" }.instructions()
            assertEquals(1, built.count { it.opcode == Opcode.NEW_INSTANCE &&
                (it as ReferenceInstruction).reference.toString() == NATIVE_SETTINGS_ITEM })
            val clicked = context.classDefBy(click).methods.single { it.name == "invoke" }.instructions()
            assertEquals(1, clicked.count { it.opcode == Opcode.INSTANCE_OF &&
                (it as ReferenceInstruction).reference.toString() == NATIVE_SETTINGS_ITEM })
            assertEquals(1, clicked.count { (it as? ReferenceInstruction)?.reference?.toString() ==
                "$ENTRY->open(Landroid/app/Activity;)Z" })

            // Remove exactly the inserted blocks. Every original opcode, operand and reference survives.
            for ((type, first, size) in listOf(Triple(builder, Opcode.NEW_INSTANCE, 3), Triple(click, Opcode.INSTANCE_OF, 8))) {
                val beforeMethod = classes.single { it.type == type }.methods.single { it.name == "invoke" }
                val afterMethod = context.classDefBy(type).methods.single { it.name == "invoke" }
                val after = afterMethod.instructions()
                val at = after.indexOfFirst { it.opcode == first &&
                    (it as? ReferenceInstruction)?.reference?.toString() == NATIVE_SETTINGS_ITEM }
                fun shape(method: Method, removed: IntRange = IntRange.EMPTY): List<List<Any?>> {
                    val instructions = method.instructions()
                    val flow = ControlFlow.of(method)
                    return instructions.withIndex().filterNot { (index, instruction) ->
                        index in removed || (instruction.opcode == Opcode.NOP &&
                            instructions.getOrNull(index + 1)?.opcode == Opcode.PACKED_SWITCH_PAYLOAD &&
                            flow.normal.none { index in it } && flow.exceptional.none { index in it })
                    }.map { (_, instruction) ->
                        listOf(instruction.opcode, instruction.namedRegisters(),
                            (instruction as? ReferenceInstruction)?.reference?.toString(),
                            (instruction as? WideLiteralInstruction)?.wideLiteral)
                    }
                }
                assertEquals("$type: original account and safety behavior survives", shape(beforeMethod),
                    shape(afterMethod, at until at + size))
            }
            val safety = classes.single { it.type == external }
            assertEquals(safety.methods.map { it.instructions().map { instruction -> instruction.opcode } },
                context.classDefBy(safety.type).methods.map { it.instructions().map { instruction -> instruction.opcode } })
            assertThrows("reapplying cannot duplicate a row", PatchException::class.java) { context.hookNativeSettingsEntry() }
        }
    }

    @Test fun `ambiguous builders are refused before any host or owned class changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = classes(build)
            val original = classes.single { it.type == builder }
            val duplicate = ImmutableClassDef("Ltest/SecondSettingsBuilder;", original.accessFlags, original.superclass,
                original.interfaces, original.sourceFile, original.annotations, original.fields, original.methods)
            val context = PatchContexts.of(classes + duplicate)
            assertThrows(PatchException::class.java) { context.hookNativeSettingsEntry() }
            assertEquals("Ljava/lang/Object;", context.classDefBy(NATIVE_SETTINGS_ITEM).superclass)
            assertEquals(original.methods.single { it.name == "invoke" }.instructions().size,
                context.classDefBy(builder).methods.single { it.name == "invoke" }.instructions().size)
        }
    }
}
