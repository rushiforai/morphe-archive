/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.privacy

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import java.io.File

/**
 * Tumblr's launch setup turns Crashlytics collection on every launch, over the manifest flag. In
 * each declared build the value it passes goes to the extension first and comes back in the same
 * register.
 */
@Category(FixtureTests::class)
class CrashReportsFixtureTest {
    private val crashlytics = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"
    private val setter = "$crashlytics->setCrashlyticsCollectionEnabled(Z)V"

    private fun Instruction.called() =
        methodRef()?.let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }

    private fun setupClasses(build: File): List<ClassDef> =
        FixtureDex.classesWhere(build, { true }) { CRASHLYTICS_SETUP_KEY in it.strings() }

    private fun BytecodePatchContext.setup(classes: List<ClassDef>): Method = classes.flatMap { mutableClassDefBy(it.type).methods }
        .single { it.isStatic() && CRASHLYTICS_SETUP_KEY in it.strings() && it.instructionList().any { step -> step.called() == setter } }

    @Test
    fun `each declared build hands the value Tumblr turns Crashlytics on with to the extension first`() {
        for (build in Fixtures.declaredBuilds()) {
            val setupClasses = setupClasses(build)
            val sdk = FixtureDex.classes(build, setOf(crashlytics))
            assertEquals("${build.name}: Crashlytics is in the build", setOf(crashlytics), sdk.keys)
            val context = PatchContexts.of(ExtensionDex.classes() + setupClasses + sdk.values)
            val before = context.setup(setupClasses).instructionList().map { it.opcode }

            assertTrue(build.name, context.hookCrashReports())

            val method = context.setup(setupClasses)
            val body = method.instructionList()
            val at = body.indexOfFirst { it.called() == setter }
            val call = body[at] as FiveRegisterInstruction
            val asked = body[at - 2] as FiveRegisterInstruction
            assertEquals("${build.name}: two instructions added", before.size + 2, body.size)
            assertEquals("${build.name}: the extension is asked right before", CRASH_REPORTS_HOOK, body[at - 2].called())
            assertEquals("${build.name}: with the application", method.parameterRegisterNumber(0), asked.registerC)
            assertEquals("${build.name}: and the value Tumblr passes", call.registerD, asked.registerD)
            assertEquals(build.name, Opcode.MOVE_RESULT, body[at - 1].opcode)
            assertEquals("${build.name}: its answer is what Crashlytics gets", call.registerD, (body[at - 1] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: the rest is Tumblr's own code", before, body.filterIndexed { i, _ -> i != at - 2 && i != at - 1 }.map { it.opcode })
        }
    }

    @Test
    fun `a setup the hook can't take safely is left as Tumblr wrote it`() {
        val build = Fixtures.declaredBuilds().first()
        val setupClasses = setupClasses(build)
        val sdk = FixtureDex.classes(build, setOf(crashlytics)).values
        // Each change to the real setup breaks one thing the hook relies on.
        val changes = mapOf<String, (Int, Int, Int) -> Pair<Int, String>>(
            "the value is read again after the call" to { at, _, value -> at + 1 to "move v3, v$value" },
            "the application is overwritten before the call" to { at, application, _ -> at to "const/4 v$application, 0x0" },
            "Crashlytics is turned on twice" to { at, _, value -> at + 1 to "invoke-virtual { v1, v$value }, $setter" },
        )
        for ((what, change) in changes) {
            val context = PatchContexts.of(ExtensionDex.classes() + setupClasses + sdk)
            val method = context.setup(setupClasses)
            val at = method.instructionList().indexOfFirst { it.called() == setter }
            val (index, smali) = change(at, method.parameterRegisterNumber(0), (method.instructionList()[at] as FiveRegisterInstruction).registerD)
            (method as MutableMethod).addInstructions(index, smali)
            val before = method.instructionList().map { it.opcode }

            assertFalse(what, context.hookCrashReports())

            assertEquals(what, before, method.instructionList().map { it.opcode })
        }
    }

    @Test
    fun `a build without Crashlytics has nothing to keep off and stays as it was`() {
        val build = Fixtures.declaredBuilds().first()
        val setupClasses = setupClasses(build)
        val context = PatchContexts.of(ExtensionDex.classes() + setupClasses)
        val before = context.setup(setupClasses).instructionList().map { it.opcode }

        assertTrue(context.hookCrashReports())

        assertEquals(before, context.setup(setupClasses).instructionList().map { it.opcode })
    }
}
