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
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** The calls that hold the screen on, in each declared APK. */
@Category(FixtureTests::class)
class ScreenSleepFixtureTest {
    @Test
    fun `each declared APK hands every screen hold to the extension on the same registers`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val holds = holdsIn(classes)
            fun callsIn(method: Method) = holds.getValue(method).map { method.implementation!!.instructions.toList()[it].screenHoldCall() }
            // The video view's builder holds the screen through the view, and a pin page with a video
            // holds its whole window on through addFlags (#47), which is what kept the screen on.
            val viewHolds = holds.keys.filter { KEEP_SCREEN_ON in callsIn(it) }
            assertTrue("${build.name}: the video view's hold", viewHolds.isNotEmpty())
            assertTrue("${build.name}: only the video view's builder holds a view on", viewHolds.all { it.returnType == VIDEO_VIEW })
            for (page in PIN_PAGES) assertTrue("${build.name}: $page holds its window on",
                holds.keys.any { it.definingClass == page && ADD_WINDOW_FLAGS in callsIn(it) })
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            letScreenSleepPatch.execute(context)
            for (flag in listOf("letScreenSleep", "screenSleep")) assertEquals("${build.name}: $flag", 1, PinPageKit.flag(context, flag))

            for ((method, indexes) in holds) {
                val before = method.implementation!!.instructions.toList()
                val after = PinPageKit.patched(context, method)
                assertEquals("${build.name}: ${method.name} keeps its length", before.size, after.size)
                for (index in indexes) {
                    val hook = SCREEN_HOLD_HOOKS.getValue(before[index].screenHoldCall()!!)
                    val call = after[index]
                    assertTrue("${build.name}: ${call.opcode} in ${method.name}",
                        call.opcode == Opcode.INVOKE_STATIC || call.opcode == Opcode.INVOKE_STATIC_RANGE)
                    assertEquals(build.name, hook, (call as ReferenceInstruction).reference.toString())
                    assertEquals("${build.name}: the registers in ${method.name}", registers(before[index]), registers(call))
                }
                val rest = before.indices.filter { it !in indexes }
                assertEquals("${build.name}: the rest of ${method.name} is unchanged",
                    rest.map { before[it].opcode }, rest.map { after[it].opcode })
                assertTrue("${build.name}: no screen hold is left in ${method.name}", after.none { it.screenHoldCall() != null })
            }
        }
    }

    @Test
    fun `a missing hook, status stub or screen hold refuses with Pinterest's call untouched`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val extension = ExtensionDex.classes()
        fun without(name: String) = extension.map { classDef -> if (classDef.type != UI_HOOKS) classDef else
            ImmutableClassDef(classDef.type, classDef.accessFlags, classDef.superclass, classDef.interfaces, classDef.sourceFile,
                classDef.annotations, classDef.fields, classDef.methods.filterNot { it.name == name }) }
        val cases = linkedMapOf(
            "no letScreenSleep stub" to (PinPageKit.extensionWithout("letScreenSleep") + classes to "letScreenSleep"),
            "no screenSleep stub" to (PinPageKit.extensionWithout("screenSleep") + classes to "screenSleep"),
            "no keepScreenOn hook" to (without("keepScreenOn") + classes to "no keepScreenOn"),
            "no addWindowFlags hook" to (without("addWindowFlags") + classes to "no addWindowFlags"),
            "no setWindowFlags hook" to (without("setWindowFlags") + classes to "no setWindowFlags"),
            "no screen hold" to (extension to "never asks to hold the screen on"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val thrown = assertThrows(reason, PatchException::class.java) { letScreenSleepPatch.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(message))
            assertEquals(reason, 0, PinPageKit.flagOrZero(context, "letScreenSleep"))
            assertEquals(reason, 0, PinPageKit.flagOrZero(context, "screenSleep"))
            val present = input.map { it.type }.toSet()
            for (method in holdsIn(classes).keys.filter { it.definingClass in present }) {
                assertEquals("$reason changed ${method.definingClass}->${method.name}",
                    method.implementation!!.instructions.map { it.opcode }, PinPageKit.patched(context, method).map { it.opcode })
            }
        }
    }

    /** Each method that can hold the screen on, with where, read off the clean dex. */
    private fun holdsIn(classes: List<ClassDef>): Map<Method, List<Int>> =
        classes.flatMap { it.methods }.associateWith { screenHoldIndexes(it) }.filterValues { it.isNotEmpty() }

    /** The registers a call passes, in order. */
    private fun registers(call: Instruction): List<Int> = when (call) {
        is RegisterRangeInstruction -> (call.startRegister until call.startRegister + call.registerCount).toList()
        is FiveRegisterInstruction -> listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG)
            .take(call.registerCount)
        else -> error("not a call: ${call.opcode}")
    }

    /** Every class in the APK that can hold the screen on. */
    private fun read(build: java.io.File): List<ClassDef> {
        val found = FixtureDex.classesWhere(build, { true }) { method -> screenHoldIndexes(method).isNotEmpty() }
        check(found.isNotEmpty()) { "${build.name}: nothing holds the screen on" }
        return found
    }
}

private const val VIDEO_VIEW = "Lcom/pinterest/video/core/view/StyledPinterestVideoView;"

/** The pin pages, which hold their window on while the pin has a video. */
private val PIN_PAGES = listOf(
    "Lcom/pinterest/feature/pin/closeup/view/OrganicPinCloseupFragment;",
    "Lcom/pinterest/feature/pin/closeup/view/PromotedPinCloseupFragment;",
)
